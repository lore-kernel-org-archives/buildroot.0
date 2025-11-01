Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0524BCCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 19:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F3E84374;
	Sat,  1 Nov 2025 19:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT-wmaORdFSq; Sat,  1 Nov 2025 19:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEBD384428
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEBD384428;
	Sat,  1 Nov 2025 19:48:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C23E293D
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 19:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B472384428
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 19:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBejp480c4IJ for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 19:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA06B84374
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA06B84374
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 19:48:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8BF583882; Sat,  1 Nov 2025 19:48:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Nov 2025 20:46:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f11681ccd19f007b360593105d07a44afaac387d
X-Git-Newrev: 0afdca366fc72a289f7ebcea319ca9976858537a
X-Patchwork-Hint: ignore
Message-Id: <20251101194809.C8BF583882@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: bump version to 8.2510.0
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
Content-Type: multipart/mixed; boundary="===============4381999480556947289=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4381999480556947289==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0afdca366fc72a289f7ebcea319ca9976858537a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release announce:
https://www.rsyslog.com/rsyslog-8-2510-0-2025-10-released/

Changelog:
https://github.com/rsyslog/rsyslog/blob/v8.2510.0/ChangeLog

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rsyslog/rsyslog.hash | 2 +-
 package/rsyslog/rsyslog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index 546682c9f7..13a84b206f 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,5 +1,5 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256  c89b1e74d36d0ca4a95b74a1abe36ed0b1faac8b7c8be471a8415cfa776206fd  rsyslog-8.2508.0.tar.gz
+sha256  a70a9834186859539a6a4d1c7b3f68c23897e805829b764a45e92cb0cc95e66a  rsyslog-8.2510.0.tar.gz
 
 # Locally calculated
 sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 77059c9bb8..69128afbac 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.2508.0
+RSYSLOG_VERSION = 8.2510.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20

--===============4381999480556947289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4381999480556947289==--
