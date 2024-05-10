Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8DDC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0362142138;
	Fri, 10 May 2024 20:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N509Rb4O5JDQ; Fri, 10 May 2024 20:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A836A42144
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A836A42144;
	Fri, 10 May 2024 20:09:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93A911BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DBB742BE1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBC_PXZ4zVVx for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4EC440B81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4EC440B81
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:08:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD59D86EDA; Fri, 10 May 2024 20:08:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 22:08:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2faf1f90fedef8d8780d5342fe66978837e0f6f
X-Git-Newrev: c8f356ad1872b54654610ec5a89124e241b5cb6b
X-Patchwork-Hint: ignore
Message-Id: <20240510200859.BD59D86EDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pluggy: bump to version
 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8f356ad1872b54654610ec5a89124e241b5cb6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/pytest-dev/pluggy/blob/main/CHANGELOG.rst#pluggy-140-2024-01-24

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pluggy/python-pluggy.hash | 4 ++--
 package/python-pluggy/python-pluggy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
index 74790a51a0..338b08d0b1 100644
--- a/package/python-pluggy/python-pluggy.hash
+++ b/package/python-pluggy/python-pluggy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pluggy/json
-md5  f31aad77be2f5af8ed3864159b7fd743  pluggy-1.3.0.tar.gz
-sha256  cf61ae8f126ac6f7c451172cf30e3e43d3ca77615509771b3a984a0730651e12  pluggy-1.3.0.tar.gz
+md5  ffb69741271eaeefab3f2ef2435e2d5f  pluggy-1.4.0.tar.gz
+sha256  8c85c2876142a764e5b7548e7d9a0e0ddb46f5185161049a79b7e974454223be  pluggy-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
index 2b7ac04f02..a703a93b9c 100644
--- a/package/python-pluggy/python-pluggy.mk
+++ b/package/python-pluggy/python-pluggy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLUGGY_VERSION = 1.3.0
+PYTHON_PLUGGY_VERSION = 1.4.0
 PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
-PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/36/51/04defc761583568cae5fd533abda3d40164cbdcf22dee5b7126ffef68a40
+PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/54/c6/43f9d44d92aed815e781ca25ba8c174257e27253a94630d21be8725a2b59
 PYTHON_PLUGGY_SETUP_TYPE = setuptools
 PYTHON_PLUGGY_LICENSE = MIT
 PYTHON_PLUGGY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
