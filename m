Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B45C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CF8C408C8;
	Sat,  3 Feb 2024 18:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CF8C408C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upIEkAe9KiYJ; Sat,  3 Feb 2024 18:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E3F5400A4;
	Sat,  3 Feb 2024 18:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E3F5400A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13B161BF947
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54DF341DA7
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3qZqBqs365r for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:28:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2003B41DE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2003B41DE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2003B41DE7
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E03186813; Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 13:25:20 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: e4207e5cb546e6fb1fae9a02a9a7abf9a641b7f1
X-Git-Newrev: dd361dd6c4cebdaeadee9eea34fcbf575e18cd00
X-Patchwork-Hint: ignore
Message-Id: <20240203122852.5E03186813@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.11.x] package/python-mako: add
 CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd361dd6c4cebdaeadee9eea34fcbf575e18cd00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:sqlalchemy:mako is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/3A26A531-FD34-4F27-ADD5-C0C88FA337B3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d5a20c7f245313ead143b0c30060e49e1f90d40a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-mako/python-mako.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 313fbfcab2..7764f32f62 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -10,6 +10,8 @@ PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/05/5f/2ba6e026d33a0e6
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
+PYTHON_MAKO_CPE_ID_VENDOR = sqlalchemy
+PYTHON_MAKO_CPE_ID_PRODUCT = mako
 
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_MAKO_DEPENDENCIES = host-python-markupsafe
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
