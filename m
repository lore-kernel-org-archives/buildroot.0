Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7A6C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F03FC40AFA;
	Sat, 20 Jan 2024 23:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F03FC40AFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feTVA470kagB; Sat, 20 Jan 2024 23:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F41C140AA3;
	Sat, 20 Jan 2024 23:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F41C140AA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7C41BF21A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BCFE831A0
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BCFE831A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X73RFf61HxRC for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:03:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4AFB83D34
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4AFB83D34
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D09F98634A; Sat, 20 Jan 2024 23:03:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 23:58:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9899f06170f292bc70a57ac9b364490503c05e42
X-Git-Newrev: d5a20c7f245313ead143b0c30060e49e1f90d40a
X-Patchwork-Hint: ignore
Message-Id: <20240120230317.D09F98634A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mako: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5a20c7f245313ead143b0c30060e49e1f90d40a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:sqlalchemy:mako is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/3A26A531-FD34-4F27-ADD5-C0C88FA337B3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-mako/python-mako.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 1f7a0b0657..2eba772b26 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -10,6 +10,8 @@ PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/a9/6e/6b41e654bbdcef9
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
