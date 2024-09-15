Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B8FC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 867BC84763;
	Sun, 15 Sep 2024 21:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id You_xtI17qM7; Sun, 15 Sep 2024 21:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F5F847EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F5F847EF;
	Sun, 15 Sep 2024 21:40:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9462F1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 923E960D7B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfCUfh_9a3BC for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C88C660894
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C88C660894
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5B6A83682; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d2cdad61ab3e26fe09b31f024df157c126ca13f
X-Git-Newrev: 64560dec8a536498a2f16361eca0063c484ae287
X-Patchwork-Hint: ignore
Message-Id: <20240915213638.C5B6A83682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-channels: bump to verison
 4.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=64560dec8a536498a2f16361eca0063c484ae287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-channels/python-channels.hash | 4 ++--
 package/python-channels/python-channels.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels/python-channels.hash b/package/python-channels/python-channels.hash
index ea643f1589..8f0a529460 100644
--- a/package/python-channels/python-channels.hash
+++ b/package/python-channels/python-channels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels/json
-md5  b145f0623bf1bad8ceb534c306ad2f2a  channels-4.0.0.tar.gz
-sha256  0ce53507a7da7b148eaa454526e0e05f7da5e5d1c23440e4886cf146981d8420  channels-4.0.0.tar.gz
+md5  bfbc466f2e0a06a8834a4be10856ce8c  channels-4.1.0.tar.gz
+sha256  e0ed375719f5c1851861f05ed4ce78b0166f9245ca0ecd836cb77d4bb531489d  channels-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels/python-channels.mk b/package/python-channels/python-channels.mk
index 40f17cb114..0e00e7ea4e 100644
--- a/package/python-channels/python-channels.mk
+++ b/package/python-channels/python-channels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_VERSION = 4.0.0
+PYTHON_CHANNELS_VERSION = 4.1.0
 PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
-PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/8e/cb/6fedd9df5972b893a04c8e5d7748873d6480a813e74b0797945bee1f4282
+PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/7d/73/da9e496657b242308d68cf79c937be125fcca4af61a620d98adfdde66fab
 PYTHON_CHANNELS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
