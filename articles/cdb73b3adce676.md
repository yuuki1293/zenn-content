---
title: "Forge1.18.2のmodをScalaで開発する"
emoji: "🎃"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: ["scala", "minecraft", "forge"]
published: false
---
1.16.5で開発していたmodを1.18.2にアップデートしたら動かなくなったのを動くようにした話です。

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

## 1. javaとの共通部
1. [ここ](https://files.minecraftforge.net/net/minecraftforge/forge/index_1.18.2.html)から`Mdk`をクリックしてダウンロードしたのち、zipファイルを展開します。
2. IDEAを起動し、`Open`から`1.`で展開したフォルダーを開きます。
3. Java17をインストールしていないまたは別のバージョンのJavaをインストールしている場合、`File->Project Structure`から`SDK`を`17`に変更します。

## 2. 