Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C82E6FE48
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12DCF84BBA;
	Fri,  6 Sep 2024 20:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyp56-vWm2qw; Fri,  6 Sep 2024 20:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 977B384BBB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 977B384BBB;
	Fri,  6 Sep 2024 20:07:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 278D41BF980
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 968F5606B4
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1Nmb-UKGWLa for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44CB16112B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44CB16112B
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FAB586B7A; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:05:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f014a44646a1fea37449e3c97073816400e74f04
X-Git-Newrev: 2297dfc0e79d15770c4ee232002d09193fe8a7cd
X-Patchwork-Hint: ignore
Message-Id: <20240906195859.3FAB586B7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-broker: bump to version 36
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2297dfc0e79d15770c4ee232002d09193fe8a7cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff subprojects/libcdvar-1/AUTHORS
    +        Kostadin Shishmanov <kocelfc@tutanota.com>

diff subprojects/libcrbtree-3/README.md
    + * **Documentation**: <https://c-rbtree.readthedocs.io>

diff subprojects/libcstdaux-1/AUTHORS
    +        Copyright (C) 2022-2023 David Rheinsberg
    -        David Rheinsberg <david.rheinsberg@gmail.com>
    +        Adrian Vovk <adrianvovk@gmail.com>
    +        David Rheinsberg <david@readahead.eu>
    +        Nikita Popov <npopov@redhat.com>

diff subprojects/libcutf8-1/AUTHORS
    +        Copyright (C) 2022-2023 David Rheinsberg
    -        David Rheinsberg <david.rheinsberg@gmail.com>
    +        David Rheinsberg <david@readahead.eu>
    +        Jan Engelhardt <jengelh@inai.de>

diff subprojects/libcutf8-1/README.md: minor wordings

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus-broker/dbus-broker.hash | 12 ++++++------
 package/dbus-broker/dbus-broker.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
index 06c8f229b7..fd4f43d16e 100644
--- a/package/dbus-broker/dbus-broker.hash
+++ b/package/dbus-broker/dbus-broker.hash
@@ -1,17 +1,17 @@
 # Locally calculated
-sha256  23713f25624749fdb274907e429080fa2d8f4dbe76acd87bb6d21a3c818c7841  dbus-broker-33.tar.xz
+sha256  d333d99bd2688135b6d6961e7ad1360099d186078781c87102230910ea4e162b  dbus-broker-36.tar.xz
 sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
-sha256  20ea1f96abc15553695c6725bb3dcabff4b43b85b7ca7d675a2b8860e3b01f87  subprojects/libcdvar-1/AUTHORS
+sha256  ce7b8b8fb05126e556b3f9ed97fe21aa654e4ff411c00a9fd219ecbaae26abe0  subprojects/libcdvar-1/AUTHORS
 sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md
 sha256  6d63b1fb794d4c02622595ad30357c90398aa883864e5a275479139c8f03208f  subprojects/libcini-1/AUTHORS
 sha256  fc92d49d69aa9aa91919bac79242abee3eda27a567b4573ed3690b5cef0cf2fd  subprojects/libcini-1/README.md
 sha256  a30deb6dde90366bfaf054bc689a209b974f80c1cceac950c4378c14abaa243a  subprojects/libclist-3/AUTHORS
 sha256  75f4c76441ac69ba9474bb7ad0958389ca0f1f2fc90c5f7b033be3461652f5a6  subprojects/libclist-3/README.md
 sha256  23f24eeaaded5fedd6e7840b6f7b73838f9a4e2112ad6a12fe1ef958f73d0214  subprojects/libcrbtree-3/AUTHORS
-sha256  05113a24aca4c537819dd0d91b95b13edb85bea4b6a77a6d9269becb397ed374  subprojects/libcrbtree-3/README.md
+sha256  a2ab28f3a7b4b29c0a361c96e220555904bfd713c78134e66b7551774749b453  subprojects/libcrbtree-3/README.md
 sha256  6d63b1fb794d4c02622595ad30357c90398aa883864e5a275479139c8f03208f  subprojects/libcshquote-1/AUTHORS
 sha256  cad109dd33062518a437ebee145ba863fe0e047d4e3db9c28b0bf3c6148f10c2  subprojects/libcshquote-1/README.md
-sha256  e796182869fe0892347d069f3f423774124987d6c45d016854fc51530633c177  subprojects/libcstdaux-1/AUTHORS
+sha256  ec71c7ba4dfd282c434a00bde0c17bc347685be9d3df38d3a0df03adceb9d996  subprojects/libcstdaux-1/AUTHORS
 sha256  92006886d7f28894fef08bf97e35ef52147067bd3c4d4d6381da7c59f9901dae  subprojects/libcstdaux-1/README.md
-sha256  7e660796fea0400a1a9a539226c345b3c656a745a334e323e33258de7864e985  subprojects/libcutf8-1/AUTHORS
-sha256  106099cc1c488cbf8911f56da7977a955f6b27a7bb5b815985e59d9fae0e6fe7  subprojects/libcutf8-1/README.md
+sha256  0dcfdbd0298538023ac93ed6be1f5dfd2fa973615b07e3b85d8b1c89970db423  subprojects/libcutf8-1/AUTHORS
+sha256  a8d41713b802ad31c6c69bdcf475aa73f7be942986064e662039351ebb266d13  subprojects/libcutf8-1/README.md
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 4266441ac9..0bbdd304af 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_BROKER_VERSION = 33
+DBUS_BROKER_VERSION = 36
 DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
 DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
