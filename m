Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125A3C36000
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 20:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0A58617BD;
	Fri, 21 Mar 2025 20:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wht9wt4wyjbS; Fri, 21 Mar 2025 20:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6709617B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6709617B0;
	Fri, 21 Mar 2025 20:13:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20B731A0
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06DC384779
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQoiKyfEk9dJ for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 20:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A8C28477B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A8C28477B
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:13:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7306A88268; Fri, 21 Mar 2025 20:13:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Mar 2025 21:09:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dc5f39ac9b615be325774c8001fc9c34b5dd9da
X-Git-Newrev: 8bf3bd9fdce7421a73646a6d0d19ff6d369b2972
X-Patchwork-Hint: ignore
Message-Id: <20250321201311.7306A88268@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: bump version to 8.2502.0
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
Content-Type: multipart/mixed; boundary="===============8662245219239273482=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8662245219239273482==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8bf3bd9fdce7421a73646a6d0d19ff6d369b2972
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rsyslog/rsyslog.hash | 2 +-
 package/rsyslog/rsyslog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index bd783a69b6..157cbe30bd 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,5 +1,5 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256  8cdfa5a077cba576bdd6b1841cc2848b774e663b2e44a39512bb820174174802  rsyslog-8.2412.0.tar.gz
+sha256  02fa197d21d519f5a25a928deb9397cd387ba7382b9b449782ba31d8f3118206  rsyslog-8.2502.0.tar.gz
 
 # Locally calculated
 sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index f72e19ee0d..4f86bb68da 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.2412.0
+RSYSLOG_VERSION = 8.2502.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20

--===============8662245219239273482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8662245219239273482==--
