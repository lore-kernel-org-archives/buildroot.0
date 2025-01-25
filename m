Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3493AC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC8CE41604;
	Fri, 28 Feb 2025 17:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ER8ZDXq9zaAb; Fri, 28 Feb 2025 17:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9829450621
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9829450621;
	Fri, 28 Feb 2025 17:05:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06B5E711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 009954280E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpL7sKrRQJ14 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7080F424FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7080F424FB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 642A3818ED; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 14:21:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 980dbc154956e4511a84f3bf432b518686152ba1
X-Git-Newrev: fb0bd825c90f417819f7eec2d0efeeb449fe6634
X-Patchwork-Hint: ignore
Message-Id: <20250228163019.642A3818ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-legacy-cgi:
 bump to version 2.6.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb0bd825c90f417819f7eec2d0efeeb449fe6634
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-legacy-cgi/python-legacy-cgi.hash | 4 ++--
 package/python-legacy-cgi/python-legacy-cgi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-legacy-cgi/python-legacy-cgi.hash b/package/python-legacy-cgi/python-legacy-cgi.hash
index 063483a1e8..53af4ef691 100644
--- a/package/python-legacy-cgi/python-legacy-cgi.hash
+++ b/package/python-legacy-cgi/python-legacy-cgi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/legacy-cgi/json
-md5  82a61ea4905ec03f07cf24c586623fa7  legacy_cgi-2.6.1.tar.gz
-sha256  f2ada99c747c3d72a473a6aaff6259a61f226b06fe9f3106e495ab83fd8f7a42  legacy_cgi-2.6.1.tar.gz
+md5  5750721070ad829796ef830308e76907  legacy_cgi-2.6.2.tar.gz
+sha256  9952471ceb304043b104c22d00b4f333cac27a6abe446d8a528fc437cf13c85f  legacy_cgi-2.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python-legacy-cgi/python-legacy-cgi.mk b/package/python-legacy-cgi/python-legacy-cgi.mk
index 8e6e3e7bd4..457463d9dd 100644
--- a/package/python-legacy-cgi/python-legacy-cgi.mk
+++ b/package/python-legacy-cgi/python-legacy-cgi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LEGACY_CGI_VERSION = 2.6.1
+PYTHON_LEGACY_CGI_VERSION = 2.6.2
 PYTHON_LEGACY_CGI_SOURCE = legacy_cgi-$(PYTHON_LEGACY_CGI_VERSION).tar.gz
-PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/48/96/ff14ad0f759f2297a2e61db9c5384d248a6b38c6c1d4452c07d7419676a2
+PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/ad/2e/e1860989bc6cfdecba66db37f2f783636b97a1248ac25fbe864b6e931c22
 PYTHON_LEGACY_CGI_SETUP_TYPE = poetry
 PYTHON_LEGACY_CGI_LICENSE = PSF-2.0
 PYTHON_LEGACY_CGI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
