Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CABD5E379
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 18:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA160605D2;
	Sat,  9 Nov 2024 18:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HCnvNKXX6KB; Sat,  9 Nov 2024 18:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFB75605F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB75605F9;
	Sat,  9 Nov 2024 18:48:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF603D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADF744013B
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Apa6-lneoCHl for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 18:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0E3E40167
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0E3E40167
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:47:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D4F585F28; Sat,  9 Nov 2024 18:47:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 19:29:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e737fb0be1bb4212577358e5c06f2056a4ff33e
X-Git-Newrev: 0df7dfb804457a62c7751eec6555ad75158e3e3d
X-Patchwork-Hint: ignore
Message-Id: <20241109184753.8D4F585F28@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/python-magic-wormhole-transit-relay: bump to version 0.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=0df7dfb804457a62c7751eec6555ad75158e3e3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-magic-wormhole-transit-relay.hash                          | 4 ++--
 .../python-magic-wormhole-transit-relay.mk                            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
index a72907222a..3f038728be 100644
--- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole-transit-relay/json
-md5  99d1a7d2ff78e7de4a2f91698bc061cd  magic-wormhole-transit-relay-0.3.1.tar.gz
-sha256  2ef2efbe4d34f0e624870f842259fd733ba77152ed310af4349774a62884900e  magic-wormhole-transit-relay-0.3.1.tar.gz
+md5  73be034b4a57e9d190cfb658cbaa5fbf  magic-wormhole-transit-relay-0.4.0.tar.gz
+sha256  912d835da21b11266c77111dc9b5e5800263fc0b98f0a179962267df41819e8c  magic-wormhole-transit-relay-0.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d70f6469bb210c2aa4c0dfd74f498ef5f0467a137d8296479088e7243c5884eb  LICENSE
diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
index e557b456ed..03a2d416db 100644
--- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.3.1
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.4.0
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SOURCE = magic-wormhole-transit-relay-$(PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/be/81/c5c19ea32d1d770f2513503fef4589c6958ae9b44c03ea121e9fbc74c704
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/d0/87/cb71073e53ea7e1b6f892c52e4114caea81b887a7d34e665b15dc81d669e
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
