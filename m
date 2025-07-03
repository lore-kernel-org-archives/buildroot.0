Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF57C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA96F82030;
	Fri,  4 Jul 2025 06:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVhKF3vuUOrN; Fri,  4 Jul 2025 06:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D54D981FEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54D981FEB;
	Fri,  4 Jul 2025 06:24:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3270A7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18BB181BFA
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnTxyBtU6eUT for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6208981A8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6208981A8E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F79E85E0C; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 10:53:34 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 1341786226cc6c2a31d2f45eb59d48cbb188d40a
X-Git-Newrev: 01c2d423443f6a1ef9b97f8cc4446a3f643803cb
X-Patchwork-Hint: ignore
Message-Id: <20250704062432.5F79E85E0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/modsecurity2:
 update upstream URLs
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8539358881592343303=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8539358881592343303==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=01c2d423443f6a1ef9b97f8cc4446a3f643803cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

'https://github.com/SpiderLabs/ModSecurity' now redirects to
'https://github.com/owasp-modsecurity/ModSecurity', so update our
URLs accordingly.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 602fb43d34ba1eb97a975848aca3bb8eed1e8e87)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============8539358881592343303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8539358881592343303==--
