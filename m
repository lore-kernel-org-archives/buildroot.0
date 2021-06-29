Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470EAC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:43:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1357E61050
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1357E61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E13C740476;
	Tue,  3 Aug 2021 21:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJ_PX5ZEg2B1; Tue,  3 Aug 2021 21:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4379C4045A;
	Tue,  3 Aug 2021 21:43:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A06E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3BB183AB5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-2Bo_eOaVsh for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A44383A9F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 54EBA860D3; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 21:40:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4c9bc44534f6739ade2f55fe04a96f1024f76681
X-Git-Newrev: d3bc7f9e661986ec4a150890028173e40d2c79eb
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.54EBA860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-markdown: Bump
 version to 3.3.4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d3bc7f9e661986ec4a150890028173e40d2c79eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 4d54ce9243..b64ac77be0 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  7a894dc55992b37cdbcba5c4049455fc  Markdown-3.2.1.tar.gz
-sha256  90fee683eeabe1a92e149f7ba74e5ccdc81cd397bd6c516d93a8da0ef90b6902  Markdown-3.2.1.tar.gz
+md5  b6833c6326e9164ee0c662218a75e7f0  Markdown-3.3.4.tar.gz
+sha256  31b5b491868dcc87d6c24b7e3d19a0d730d59d3e46f4eea6430a321bed387a49  Markdown-3.3.4.tar.gz
 # Locally computed sha256
 sha256  6f1193cb634718e65c3a537d6e25ebd614820ec0ef693cfc12248112638d64da  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 1f352fd7f1..801360d778 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.2.1
+PYTHON_MARKDOWN_VERSION = 3.3.4
 PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/98/79/ce6984767cb9478e6818bd0994283db55c423d733cc62a88a3ffb8581e11
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/49/02/37bd82ae255bb4dfef97a4b32d95906187b7a7a74970761fca1360c4ba22
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
