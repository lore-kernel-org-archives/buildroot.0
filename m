Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07985C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:21:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0AA60EE2
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A0AA60EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E22E402DF;
	Mon, 11 Oct 2021 21:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rl3cw4CAGiE1; Mon, 11 Oct 2021 21:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58B8C4037E;
	Mon, 11 Oct 2021 21:21:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E0401BF989
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B123404DC
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iboqmtztuUZB for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:20:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F8C4404BE
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:20:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5BFAE95482; Mon, 11 Oct 2021 21:18:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 23:20:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e47832c8609ef88b949c5a93ed1810cece7342d1
X-Git-Newrev: 8a9e6e6272a30e6664fb9389d66e9f161909a688
X-Patchwork-Hint: ignore
Message-Id: <20211011211803.5BFAE95482@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/supervisor: bump to version 4.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a9e6e6272a30e6664fb9389d66e9f161909a688
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/Supervisor/supervisor/blob/4.2.2/CHANGES.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/supervisor/supervisor.hash | 6 +++---
 package/supervisor/supervisor.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
index 98a03aa1be..f6e9cf97b1 100644
--- a/package/supervisor/supervisor.hash
+++ b/package/supervisor/supervisor.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383  supervisor-4.1.0.tar.gz
-sha256 7b8dbd54ab1543b07b2fc5f6f5ab50d89d26c1c4952af93a579d8c52c56b8de4  COPYRIGHT.txt
-sha256 4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
+sha256  5b2b8882ec8a3c3733cce6965cc098b6d80b417f21229ab90b18fe551d619f90  supervisor-4.2.2.tar.gz
+sha256  7b8dbd54ab1543b07b2fc5f6f5ab50d89d26c1c4952af93a579d8c52c56b8de4  COPYRIGHT.txt
+sha256  4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 92e8323080..ad34c031e4 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUPERVISOR_VERSION = 4.1.0
-SUPERVISOR_SITE = https://files.pythonhosted.org/packages/de/87/ee1ad8fa533a4b5f2c7623f4a2b585d3c1947af7bed8e65bc7772274320e
+SUPERVISOR_VERSION = 4.2.2
+SUPERVISOR_SITE = https://files.pythonhosted.org/packages/d3/7f/c780b7471ba0ff4548967a9f7a8b0bfce222c3a496c3dfad0164172222b0
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa)
 SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
 SUPERVISOR_CPE_ID_VENDOR = supervisord
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
