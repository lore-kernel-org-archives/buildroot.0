Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD767CCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53B1D60EF2;
	Tue, 14 Oct 2025 22:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVAV3gF5dXuB; Tue, 14 Oct 2025 22:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 512DE60F94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512DE60F94;
	Tue, 14 Oct 2025 22:00:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1249A2748
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D8360EDF
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mxhdw8GUtldX for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 020C560E9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 020C560E9D
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6B3587103; Tue, 14 Oct 2025 22:00:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c75521b3d2e259424ee5f10105172eadcccaa57c
X-Git-Newrev: dbfb4aeefcc29ad330a96859937c2018e7a357c2
X-Patchwork-Hint: ignore
Message-Id: <20251014220000.E6B3587103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pbr: bump version to 7.0.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dbfb4aeefcc29ad330a96859937c2018e7a357c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pbr/python-pbr.hash | 4 ++--
 package/python-pbr/python-pbr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
index 02db9aca02..58503eaf11 100644
--- a/package/python-pbr/python-pbr.hash
+++ b/package/python-pbr/python-pbr.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pbr/json
-md5  06361b83d178fb62dcd1b4ba9a9b418c  pbr-6.1.0.tar.gz
-sha256  788183e382e3d1d7707db08978239965e8b9e4e5ed42669bf4758186734d5f24  pbr-6.1.0.tar.gz
+md5  64cd498740ec05994ef0592c73c351c5  pbr-7.0.1.tar.gz
+sha256  3ecbcb11d2b8551588ec816b3756b1eb4394186c3b689b17e04850dfc20f7e57  pbr-7.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
 sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index 993e748a2b..ec530ded04 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PBR_VERSION = 6.1.0
+PYTHON_PBR_VERSION = 7.0.1
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/b2/35/80cf8f6a4f34017a7fe28242dc45161a1baa55c41563c354d8147e8358b2
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/ad/8d/23253ab92d4731eb34383a69b39568ca63a1685bec1e9946e91a32fc87ad
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
