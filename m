Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F997ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D72EB416EC;
	Sat, 27 Aug 2022 07:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D72EB416EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90hIi5R5g16I; Sat, 27 Aug 2022 07:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F069415F8;
	Sat, 27 Aug 2022 07:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F069415F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F27921BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCFBA82B93
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCFBA82B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60M-Cro3KfPP for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EF6E82779
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EF6E82779
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2A2F7879A7; Sat, 27 Aug 2022 07:36:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:47:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71283535b6aa8187ad7963687ae961f41ca3c0b4
X-Git-Newrev: 0f5b43ba02db6d7c8feffc7ef7cebaa1fc9542c8
X-Patchwork-Hint: ignore
Message-Id: <20220827073608.2A2F7879A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-broker: fix legal-info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f5b43ba02db6d7c8feffc7ef7cebaa1fc9542c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit bd3cf3fb5b0da97e6d4dd9c9321e44c376c1f36a forgot to add all hashes
of license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dbus-broker/dbus-broker.hash | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
index 26ebab7ac1..fc661003b5 100644
--- a/package/dbus-broker/dbus-broker.hash
+++ b/package/dbus-broker/dbus-broker.hash
@@ -1,3 +1,17 @@
 # Locally calculated
 sha256  4eca425db52b7ab1027153e93fea9b3f11759db9e93ffbf88759b73ddfb8026a  dbus-broker-29.tar.xz
 sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
+sha256  70a742f7a88831ad6e7b94bc27058939af182b59578ac829e928094319764442  subprojects/c-dvar/AUTHORS
+sha256  f37eb9b23d99d56070b41d98d211eb9156776717ea332d4895d7cc6d68440cf4  subprojects/c-dvar/README.md
+sha256  17a927565c92aa664a010f2146d539f5df46e38d98030dea607554df7b9e4ad5  subprojects/c-ini/AUTHORS
+sha256  46b75a7e0e2a6cd233f4066bbbf4ee0dee862c040d4d8431bd77aab4c1e1b16b  subprojects/c-ini/README.md
+sha256  0e7d0f64caa88761647ba5ee21e9b173b5fe3210a6eda67ff00a86eb230f6a42  subprojects/c-list/AUTHORS
+sha256  0dd74d40d3994b0c7441b0cd9725fd39bcedc75f9ca7cb4320202572817c64a5  subprojects/c-list/README.md
+sha256  469aa63261a1b92487777989e449f1552f1bdc7df7804955e9652eb47ca7bbbf  subprojects/c-rbtree/AUTHORS
+sha256  fa140044c88f8a6ca0cf554273a4b84a8e1905e7e0a517835b32f2b4882afb92  subprojects/c-rbtree/README.md
+sha256  17a927565c92aa664a010f2146d539f5df46e38d98030dea607554df7b9e4ad5  subprojects/c-shquote/AUTHORS
+sha256  769b71ceb1c4dee816eeb701627d2893299a6c5c090dadddba1ef678e7e28901  subprojects/c-shquote/README.md
+sha256  9c9c40e94ff58884564fbae0cefd9af0eb2c270d5f25f4666560b89c8cb584a8  subprojects/c-stdaux/AUTHORS
+sha256  481e73f260f6fa1073b7bb91f8f7b46b89dd7e6caa9d0922a5c2ed2dd41d65a0  subprojects/c-stdaux/README.md
+sha256  36438bc0796d76828e104d2766e28effe8c6a1a14f90440a2223b1a2fab6c69a  subprojects/c-utf8/AUTHORS
+sha256  f195e6943366a0b0014b65920a5becb7ed64f0a589b7d55ddb7489a0e5893364  subprojects/c-utf8/README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
