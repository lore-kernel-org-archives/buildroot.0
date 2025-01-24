Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E99C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 115134F195;
	Fri, 28 Feb 2025 16:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8EoR6-Dn7k0; Fri, 28 Feb 2025 16:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29C02424F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29C02424F8;
	Fri, 28 Feb 2025 16:35:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 247AE1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4ADF6FB1E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atzE_RAZ2w0U for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 878C76FB73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 878C76FB73
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 738EC83AB0; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 15:53:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6e9197130696f448e5e37799076b905d9dd07390
X-Git-Newrev: bfd91965dde86cf348c1c79ce045f2320d4e1e46
X-Patchwork-Hint: ignore
Message-Id: <20250228163017.738EC83AB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rsyslog: bump version
 to 8.2412.0
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
Content-Type: multipart/mixed; boundary="===============0367186130197643732=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0367186130197643732==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bfd91965dde86cf348c1c79ce045f2320d4e1e46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.hash | 2 +-
 package/rsyslog/rsyslog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index 9c523c5881..bd783a69b6 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,5 +1,5 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256  b6be03c766df4cde314972c1c01cb74f3eacf8aec57066c0c12be0e079726eba  rsyslog-8.2410.0.tar.gz
+sha256  8cdfa5a077cba576bdd6b1841cc2848b774e663b2e44a39512bb820174174802  rsyslog-8.2412.0.tar.gz
 
 # Locally calculated
 sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 69b32076f8..f72e19ee0d 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.2410.0
+RSYSLOG_VERSION = 8.2412.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20

--===============0367186130197643732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0367186130197643732==--
