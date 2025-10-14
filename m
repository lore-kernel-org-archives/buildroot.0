Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48729CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EEDC412B8;
	Tue, 14 Oct 2025 22:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khmFESjPLw_N; Tue, 14 Oct 2025 22:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 359A7411E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 359A7411E8;
	Tue, 14 Oct 2025 22:00:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 712764C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59D0E40641
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oo-ByK0hfs6L for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74A5540733
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74A5540733
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72B8587100; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12bee15003e5a19c16f963e7610fc042e729bb0a
X-Git-Newrev: d6bd542dcefe87edc4e21530fae0436371b85203
X-Patchwork-Hint: ignore
Message-Id: <20251014220002.72B8587100@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simplesqlite: bump version
 to 1.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6bd542dcefe87edc4e21530fae0436371b85203
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-simplesqlite/python-simplesqlite.hash | 4 ++--
 package/python-simplesqlite/python-simplesqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplesqlite/python-simplesqlite.hash b/package/python-simplesqlite/python-simplesqlite.hash
index a17f20ff97..71c5fbf0a9 100644
--- a/package/python-simplesqlite/python-simplesqlite.hash
+++ b/package/python-simplesqlite/python-simplesqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplesqlite/json
-md5  a80e1e92454eac4c33c684c9f2a7f4a8  simplesqlite-1.5.3.tar.gz
-sha256  b0841881422107fc1bd26f8393e6a114b0fc54dc9bb74282556dd6e055ed06c5  simplesqlite-1.5.3.tar.gz
+md5  4daaf3678d4d20589d917043881951fb  simplesqlite-1.5.4.tar.gz
+sha256  7007d2abed75f2f9b0f1e544a9af2b6d0bd341d8b5519446708e6595ea092d4c  simplesqlite-1.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  130a35b917df1951aefbf366120491d5124045a87ded123f20ded21521f4e3a2  LICENSE
diff --git a/package/python-simplesqlite/python-simplesqlite.mk b/package/python-simplesqlite/python-simplesqlite.mk
index 81399b9941..bf08426310 100644
--- a/package/python-simplesqlite/python-simplesqlite.mk
+++ b/package/python-simplesqlite/python-simplesqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLESQLITE_VERSION = 1.5.3
+PYTHON_SIMPLESQLITE_VERSION = 1.5.4
 PYTHON_SIMPLESQLITE_SOURCE = simplesqlite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
-PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/59/a8/c8f4af95618dda725d91a081476036656fbf3660bb6f1728d1a5d088d6cc
+PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/1a/73/94ee1a1711ca04c7269f2d32472d10ad8cdc85ebf32c42e1cfc6924d39d8
 PYTHON_SIMPLESQLITE_SETUP_TYPE = setuptools
 PYTHON_SIMPLESQLITE_LICENSE = MIT
 PYTHON_SIMPLESQLITE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
