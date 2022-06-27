Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E99C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2891640603;
	Mon, 27 Jun 2022 20:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2891640603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0IxdlPEUwGd; Mon, 27 Jun 2022 20:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 341EC405A7;
	Mon, 27 Jun 2022 20:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 341EC405A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA0CE1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A481C405A7
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A481C405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99T6iWx3yLq7 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:13:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 941B04036A
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 941B04036A
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6750187592; Mon, 27 Jun 2022 20:01:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 22:11:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0bf8777bf890ff8b70c3153197a4a89c9e46e55
X-Git-Newrev: c660a163198018bb7f2e9f16d9628dab4a3cd01e
X-Patchwork-Hint: ignore
Message-Id: <20220627200109.6750187592@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/slirp: bump to version 4.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c660a163198018bb7f2e9f16d9628dab4a3cd01e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.freedesktop.org/slirp/libslirp/-/blob/v4.7.0/CHANGELOG.md

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/slirp/slirp.hash | 2 +-
 package/slirp/slirp.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
index 326b2ad246..3f7abdee5a 100644
--- a/package/slirp/slirp.hash
+++ b/package/slirp/slirp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b8a22ac4d601ba16122a67827c0f4361785d4d283f21ff8ed48d4aa1e7693477  libslirp-4.6.1.tar.xz
+sha256  358ce8b6ea59ec9deac937cc754f0115b992839e7b0cddf30ffb8f77dc21da82  libslirp-v4.7.0.tar.bz2
 sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 43d2c520e9..10d367587d 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SLIRP_VERSION = 4.6.1
-SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.xz
-SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/uploads/83b199ea6fcdfc0c243dfde8546ee4c9
+SLIRP_VERSION = 4.7.0
+SLIRP_SOURCE = libslirp-v$(SLIRP_VERSION).tar.bz2
+SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$(SLIRP_VERSION)
 SLIRP_LICENSE = BSD-3-Clause
 SLIRP_LICENSE_FILES = COPYRIGHT
 SLIRP_CPE_ID_VENDOR = libslirp_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
