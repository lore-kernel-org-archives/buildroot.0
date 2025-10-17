Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EC3CCD1A7
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 912FD40B8C;
	Fri, 17 Oct 2025 16:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8PgWtrmZMLT; Fri, 17 Oct 2025 16:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C78E40A7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C78E40A7F;
	Fri, 17 Oct 2025 16:33:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68951972
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F1ED40BE0
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G74wlEJ4HCdT for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A1F40B21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A1F40B21
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 729C183933; Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 18:28:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80ccde6308b13d248b0a31ad4037882b98b20394
X-Git-Newrev: 884626ede203c6a055fbbdab0cc0219fc5ae2cbf
X-Patchwork-Hint: ignore
Message-Id: <20251017163329.729C183933@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-automat: bump version to
 25.4.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=884626ede203c6a055fbbdab0cc0219fc5ae2cbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/glyph/automat/releases/tag/25.4.16

Switched setup type to hatch following upstream commit:
https://github.com/glyph/automat/commit/643f7ce4ff0dfbe0269d57e0611b24fd5a149d93

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-automat/python-automat.hash | 4 ++--
 package/python-automat/python-automat.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-automat/python-automat.hash b/package/python-automat/python-automat.hash
index 4edc9f3f09..562c15dc63 100644
--- a/package/python-automat/python-automat.hash
+++ b/package/python-automat/python-automat.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/automat/json
-md5  c023f8848366053a76f99cffba3ea34e  automat-24.8.1.tar.gz
-sha256  b34227cf63f6325b8ad2399ede780675083e439b20c323d376373d8ee6306d88  automat-24.8.1.tar.gz
+md5  a725256be8545c32048eb12239caeebb  automat-25.4.16.tar.gz
+sha256  0017591a5477066e90d26b0e696ddc143baafd87b588cfac8100bc6be9634de0  automat-25.4.16.tar.gz
 # Locally computed sha256 checksums
 sha256  b2201301678d0a937d938543827ca1360712eb34e23de8ee3f3bfffbd4c0e376  LICENSE
diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index 85bc890fc5..807846b4af 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_AUTOMAT_VERSION = 24.8.1
+PYTHON_AUTOMAT_VERSION = 25.4.16
 PYTHON_AUTOMAT_SOURCE = automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
-PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/8d/2d/ede4ad7fc34ab4482389fa3369d304f2fa22e50770af706678f6a332fa82
-PYTHON_AUTOMAT_SETUP_TYPE = setuptools
+PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/e3/0f/d40bbe294bbf004d436a8bcbcfaadca8b5140d39ad0ad3d73d1a8ba15f14
+PYTHON_AUTOMAT_SETUP_TYPE = hatch
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
-PYTHON_AUTOMAT_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_AUTOMAT_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
