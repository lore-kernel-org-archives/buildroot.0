Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54192C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1096E60BAF;
	Sat,  4 Nov 2023 21:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1096E60BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnTbBMSyv1KG; Sat,  4 Nov 2023 21:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4436D60D58;
	Sat,  4 Nov 2023 21:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4436D60D58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 204AF1BF868
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC1D740273
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC1D740273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bfw67nV3YfWR for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:15:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A91F240383
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A91F240383
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8459F86180; Sat,  4 Nov 2023 21:15:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:13:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1dc10b7b8e163ccceca6d0faff27b33517476fd
X-Git-Newrev: 666d29c821abefc65789f8ba2d69cc9a08a39751
X-Patchwork-Hint: ignore
Message-Id: <20231104211523.8459F86180@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iptables: bump version to
 1.0.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=666d29c821abefc65789f8ba2d69cc9a08a39751
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-iptables/python-iptables.hash | 4 ++--
 package/python-iptables/python-iptables.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iptables/python-iptables.hash b/package/python-iptables/python-iptables.hash
index ee5f765fba..1b7c9e9324 100644
--- a/package/python-iptables/python-iptables.hash
+++ b/package/python-iptables/python-iptables.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/python-iptables/json
-md5  3fb27da1107bdb62196850fa70e8b0d4  python-iptables-1.0.0.tar.gz
-sha256  480470adb5f29bf84269b4e53dbad9623af91c79aa666cc0274dec199a555bc5  python-iptables-1.0.0.tar.gz
+md5  bd6950c1ed9c6b48b7d552ff8e6766c5  python-iptables-1.0.1.tar.gz
+sha256  1989f2b48598392c3574052a95f456985cb06fb4287b61bf8794e93ebc37eddb  python-iptables-1.0.1.tar.gz
 
 # Locally calculated
 sha256  b827789c74144d9bb92595ed3bc568aef767a7e8d930fba61c2cdd9f6ec27599  NOTICE
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index 9cb4285ec3..d01545d8b2 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_IPTABLES_VERSION = 1.0.0
-PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/ca/6e/cba9c6f4b5a1963b7f5b015f5ed5e2eec7a94ac460570e3474177c4004d6
+PYTHON_IPTABLES_VERSION = 1.0.1
+PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/35/e4/33e639b9e153c2d798d73342a96715a4edca6f46431d763b275a34b3aeca
 PYTHON_IPTABLES_SETUP_TYPE = setuptools
 PYTHON_IPTABLES_LICENSE = Apache-2.0
 PYTHON_IPTABLES_LICENSE_FILES = NOTICE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
