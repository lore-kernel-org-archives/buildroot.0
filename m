Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B81C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21C8080D05;
	Wed, 25 Jun 2025 17:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4rYUwLsmoXI; Wed, 25 Jun 2025 17:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A8E080C8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A8E080C8A;
	Wed, 25 Jun 2025 17:12:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E466154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8009380C6C
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uS0yzV8Vpvl for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B31E380C58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B31E380C58
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:12:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A341A843B5; Wed, 25 Jun 2025 17:12:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 19:11:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d9551d303c953aa34bad4ae6bc47e56f830dfe0
X-Git-Newrev: 602fb43d34ba1eb97a975848aca3bb8eed1e8e87
X-Patchwork-Hint: ignore
Message-Id: <20250625171254.A341A843B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modsecurity2: update upstream URLs
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
Content-Type: multipart/mixed; boundary="===============2326587254056106614=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2326587254056106614==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=602fb43d34ba1eb97a975848aca3bb8eed1e8e87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'https://github.com/SpiderLabs/ModSecurity' now redirects to
'https://github.com/owasp-modsecurity/ModSecurity', so update our
URLs accordingly.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/modsecurity2/Config.in         | 2 +-
 package/modsecurity2/modsecurity2.hash | 2 +-
 package/modsecurity2/modsecurity2.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/modsecurity2/Config.in b/package/modsecurity2/Config.in
index fb1bfc960e..df5634bf89 100644
--- a/package/modsecurity2/Config.in
+++ b/package/modsecurity2/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_MODSECURITY2
 	  into HTTP(S) traffic and provides a power rules language and
 	  API to implement advanced protections.
 
-	  https://github.com/SpiderLabs/ModSecurity
+	  https://github.com/owasp-modsecurity/ModSecurity
diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
index 2c77ffd830..fbb7fabb3a 100644
--- a/package/modsecurity2/modsecurity2.hash
+++ b/package/modsecurity2/modsecurity2.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v2.9.7/modsecurity-2.9.7.tar.gz.sha256
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v2.9.7/modsecurity-2.9.7.tar.gz.sha256
 sha256  2a28fcfccfef21581486f98d8d5fe0397499749b8380f60ec7bb1c08478e1839  modsecurity-2.9.7.tar.gz
 
 # Locally computed
diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index 88bbf3bb29..36d6e1a847 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -6,7 +6,7 @@
 
 MODSECURITY2_VERSION = 2.9.7
 MODSECURITY2_SOURCE = modsecurity-$(MODSECURITY2_VERSION).tar.gz
-MODSECURITY2_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
+MODSECURITY2_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
 MODSECURITY2_LICENSE = Apache-2.0
 MODSECURITY2_LICENSE_FILES = LICENSE
 MODSECURITY2_CPE_ID_VENDOR = trustwave

--===============2326587254056106614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2326587254056106614==--
