Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F357C25B74
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D92C0422D8;
	Fri, 10 May 2024 20:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwcKF5lXiXEm; Fri, 10 May 2024 20:09:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B7042239
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B7042239;
	Fri, 10 May 2024 20:09:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4150D1BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A58D42144
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhJrtFk-SNBk for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4582642138
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4582642138
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:08:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9AB186ED9; Fri, 10 May 2024 20:08:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 22:08:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f362a49e53ca2d754fec3961395c294de648956
X-Git-Newrev: a2faf1f90fedef8d8780d5342fe66978837e0f6f
X-Patchwork-Hint: ignore
Message-Id: <20240510200859.A9AB186ED9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-packaging: bump to version
 24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2faf1f90fedef8d8780d5342fe66978837e0f6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/pypa/packaging/blob/main/CHANGELOG.rst#240---2024-03-10

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index df75c3505c..1c15c2e82b 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  d54eeff8c7ca86980528f4132f258d54  packaging-23.2.tar.gz
-sha256  048fb0e9405036518eaaf48a55953c750c11e1a1b68e0dd1a9d62ed0c092cfc5  packaging-23.2.tar.gz
+md5  8e3bc7b152efc9ffadabddc9f8465b02  packaging-24.0.tar.gz
+sha256  eb82c5e3e56209074766e6885bb04b8c38a0c015d0a30036ebe7ece34c9989e9  packaging-24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 3e0f85c00a..e795b61881 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 23.2
+PYTHON_PACKAGING_VERSION = 24.0
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/fb/2b/9b9c33ffed44ee921d0967086d653047286054117d584f1b1a7c22ceaf7b
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/ee/b5/b43a27ac7472e1818c4bafd44430e69605baefe1f34440593e0332ec8b4d
 PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
