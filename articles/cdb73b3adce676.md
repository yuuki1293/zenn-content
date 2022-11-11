---
title: "Forge1.18.2のmodをScalaで開発する"
emoji: "🎃"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: ["scala", "minecraft", "forge"]
published: false
---
1.16.5で開発していたmodを1.18.2にアップデートしたら動かなくなったのを動くようにした話です。  
(Scalable Cat's Force)[https://github.com/Kotori316/SLP]を使用します。  

# 対象読者
- Scalaが書ける/書きたい
- forgeでmodの開発がしたい

# 環境
Windows 11 
Minecraft 1.18.2  
Forge 1.18.2-40.1.0  
Java 17.0.1  
Scala 2.13.8  
gradle 7.4  
Intellij IDEA Ultimate 2022.2.3  

# セットアップ
エディターはIntellij IDEA（以下IDEA）を使用します。  
[結果だけ見たい人用](https://github.com/yuuki1293/forge1.18.2-scala)  

## javaとの共通部
1. [ここ](https://files.minecraftforge.net/net/minecraftforge/forge/index_1.18.2.html)から`Mdk`をクリックしてダウンロードしたのち、zipファイルを展開します。
2. IDEAを起動し、`Open`から`1.`で展開したフォルダーを開きます。
3. Java17をインストールしていないまたは別のバージョンのJavaをインストールしている場合、`File->Project Structure`から`SDK`を`17`に変更します。

## ファイル変更
### build.gradle
まず以下を追加します。  
```gradle
apply plugin: 'scala'
```
次に`repositories`の中に以下を追加します。  
```gradle
maven {
    name = "Azure-SLP"
    url = uri("https://pkgs.dev.azure.com/Kotori316/minecraft/_packaging/mods/maven/v1")
    content {
        it.includeModule("com.kotori316", "ScalableCatsForce".toLowerCase())
        it.includeModule("org.typelevel", "cats-core_${scala_major}")
        it.includeModule("org.typelevel", "cats-kernel_${scala_major}")
    }
}
```
最後に`dependencies`の中に以下を追加します。  
```gradle
implementation(group: 'org.scala-lang', name: 'scala-library', version: scala_version)
implementation(group: 'org.typelevel', name: "cats-core_${scala_major}", version: '2.8.5-kotori')

runtimeOnly(group: "com.kotori316", name: "ScalableCatsForce".toLowerCase(), version: "2.13.8-build-4", classifier: "with-library") {
    transitive(false)
}
```
### gradle.properties
以下を追記します。  
```properties
scala_version=2.13.10
scala_major=2.13
```
### src/main/resource/META-INF/mods.toml
`modLoader`, `loaderVersion`をそれぞれ以下のように書き換えます。
```toml
modLoader="kotori_scala"
loaderVersion="[2.13.3,2.14.0)"
```
## ソースコード
1. `src/main/java`を`src/main/scala`に名前変更します。
2. ソースコードはすべて`src/main/scala/com/example/examplemod/`に追加します。
3. `ExampleMod.java`を削除します。
4. `examplemod`フォルダーを右クリック→`New`→`Scala Class`から`ExampleMod`という名前でファイルを作成します。
5. `ExampleMod.scala`の内容を以下に書き換えます。
```scala
package com.example.examplemod

import com.mojang.logging.LogUtils
import net.minecraft.world.level.block.{Block, Blocks}
import net.minecraftforge.common.MinecraftForge
import net.minecraftforge.event.RegistryEvent
import net.minecraftforge.event.server.ServerStartingEvent
import net.minecraftforge.eventbus.api.SubscribeEvent
import net.minecraftforge.fml.InterModComms
import net.minecraftforge.fml.common.Mod
import net.minecraftforge.fml.event.lifecycle.{FMLCommonSetupEvent, InterModEnqueueEvent, InterModProcessEvent}
import net.minecraftforge.fml.javafmlmod.FMLJavaModLoadingContext


// The value here should match an entry in the META-INF/mods.toml file
@Mod("examplemod")
object ExampleMod { // Directly reference a slf4j logger
  private val LOGGER = LogUtils.getLogger

  // You can use EventBusSubscriber to automatically subscribe events on the contained class (this is subscribing to the MOD
  // Event bus for receiving Registry Events)
  @Mod.EventBusSubscriber(bus = Mod.EventBusSubscriber.Bus.MOD)
  object RegistryEvents {
    @SubscribeEvent
    def onBlocksRegistry(blockRegistryEvent: RegistryEvent.Register[Block]): Unit = { // Register a new block here
      LOGGER.info("HELLO from Register Block")
    }
  }
}

@Mod("examplemod")
class ExampleMod() { // Register the setup method for modloading
  FMLJavaModLoadingContext.get.getModEventBus.addListener(this.setup)
  // Register the enqueueIMC method for modloading
  FMLJavaModLoadingContext.get.getModEventBus.addListener(this.enqueueIMC)
  // Register the processIMC method for modloading
  FMLJavaModLoadingContext.get.getModEventBus.addListener(this.processIMC)
  // Register ourselves for server and other game events we are interested in
  MinecraftForge.EVENT_BUS.register(this)

  private def setup(event: FMLCommonSetupEvent): Unit = { // some preinit code
    ExampleMod.LOGGER.info("HELLO FROM PREINIT")
    ExampleMod.LOGGER.info("DIRT BLOCK >> {}", Blocks.DIRT.getRegistryName)
  }

  private def enqueueIMC(event: InterModEnqueueEvent): Unit = { // Some example code to dispatch IMC to another mod
    InterModComms.sendTo("examplemod", "helloworld", () => {
      def foo() = {
        ExampleMod.LOGGER.info("Hello world from the MDK")
        "Hello world"
      }

      foo()
    })
  }

  private def processIMC(event: InterModProcessEvent): Unit = { // Some example code to receive and process InterModComms from other mods
    ExampleMod.LOGGER.info("Got IMC {}", event.getIMCStream.map((m: InterModComms.IMCMessage) => m.messageSupplier.get).toList)
  }

  // You can use SubscribeEvent and let the Event Bus discover methods to call
  @SubscribeEvent
  def onServerStarting(event: ServerStartingEvent): Unit = { // Do something when the server starts
    ExampleMod.LOGGER.info("HELLO from server starting")
  }
}
```

# 検証
IDEAの`gradle`タブから`Tasks/forgegradle runs/runClient`をダブルクリックするか、ターミナルから`gradlew runClient`とすると`Minecraft`が起動します。起動後`Mods`に`Example Mod`があれば成功です。  
![成功した画像](https://user-images.githubusercontent.com/71992891/201347389-fae24659-7b07-461c-8a80-32ae1cde7aa3.png)