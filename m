Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC1BC83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6339141096;
	Thu,  3 Jul 2025 20:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LmyXJSpb1mj; Thu,  3 Jul 2025 20:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 755D341032
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 755D341032;
	Thu,  3 Jul 2025 20:56:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73EC0B0A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65F5640D2A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AD78S8TVxqT8 for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA36F40B1D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA36F40B1D
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:56:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A930885C74; Thu,  3 Jul 2025 20:56:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 22:53:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de8cc1ae504da1c66b70b5cc29e562f20e34841a
X-Git-Newrev: 96899dd6920c451e6cba412da4cb8959f62b10bf
X-Patchwork-Hint: ignore
Message-Id: <20250703205623.A930885C74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-future: add CPE identifier
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96899dd6920c451e6cba412da4cb8959f62b10bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cpe:2.3:a:pythoncharmers:python-future:*:*:*:*:*:*:*:* is
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/6E3F033B-5565-461B-8450-D23E68419313

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-future/python-future.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-future/python-future.mk b/package/python-future/python-future.mk
index 698863a13d..6276440c40 100644
--- a/package/python-future/python-future.mk
+++ b/package/python-future/python-future.mk
@@ -10,5 +10,6 @@ PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/a7/b2/4140c69c6a664
 PYTHON_FUTURE_SETUP_TYPE = setuptools
 PYTHON_FUTURE_LICENSE = MIT
 PYTHON_FUTURE_LICENSE_FILES = LICENSE.txt
+PYTHON_FUTURE_CPE_ID_VENDOR = pythoncharmers
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
