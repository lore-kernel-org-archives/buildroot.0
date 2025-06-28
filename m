Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BEBC7EE32
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 12:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E69D460E41;
	Sat, 28 Jun 2025 12:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOa9SXahw1Qz; Sat, 28 Jun 2025 12:21:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 341D760B93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 341D760B93;
	Sat, 28 Jun 2025 12:21:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B2511C9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 12:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 611F884420
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 12:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMY97SVl7NUG for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 12:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD3508441D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD3508441D
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 12:21:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9A7F846CB; Sat, 28 Jun 2025 12:21:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 14:11:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cda85cb566bfcd9d7a6c5bd701d326a47cb725b
X-Git-Newrev: f1c0986834240b72f11686e27b2a3917ceafe1a1
X-Patchwork-Hint: ignore
Message-Id: <20250628122112.A9A7F846CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx-modsecurity: bump to version
 1.0.4
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
Content-Type: multipart/mixed; boundary="===============3347942643360726714=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3347942643360726714==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f1c0986834240b72f11686e27b2a3917ceafe1a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/owasp-modsecurity/ModSecurity-nginx/blob/v1.0.4/CHANGES

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nginx-modsecurity/nginx-modsecurity.hash | 4 ++--
 package/nginx-modsecurity/nginx-modsecurity.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx-modsecurity/nginx-modsecurity.hash b/package/nginx-modsecurity/nginx-modsecurity.hash
index 34e7b87f41..1d80138b94 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.hash
+++ b/package/nginx-modsecurity/nginx-modsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/owasp-modsecurity/ModSecurity-nginx/releases/download/v1.0.3/modsecurity-nginx-v1.0.3.tar.gz.sha256
-sha256  ae811c7208ac029cb7a99d6f63e03d3971797607517187f47620df39c1f78add  modsecurity-nginx-v1.0.3.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity-nginx/releases/download/v1.0.4/modsecurity-nginx-v1.0.4.tar.gz.sha256
+sha256  6bdc7570911be884c1e43aaf85046137f9fde0cfa0dd4a55b853c81c45a13313  modsecurity-nginx-v1.0.4.tar.gz
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nginx-modsecurity/nginx-modsecurity.mk b/package/nginx-modsecurity/nginx-modsecurity.mk
index 42a50ca39f..c1cd50cf9d 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.mk
+++ b/package/nginx-modsecurity/nginx-modsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_MODSECURITY_VERSION = 1.0.3
+NGINX_MODSECURITY_VERSION = 1.0.4
 NGINX_MODSECURITY_SOURCE = modsecurity-nginx-v$(NGINX_MODSECURITY_VERSION).tar.gz
 NGINX_MODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity-nginx/releases/download/v$(NGINX_MODSECURITY_VERSION)
 NGINX_MODSECURITY_LICENSE = Apache-2.0

--===============3347942643360726714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3347942643360726714==--
