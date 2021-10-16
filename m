Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E9EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1B861245
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B1B861245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3D6A83B80;
	Sat, 16 Oct 2021 08:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZ6qN0zgOIQF; Sat, 16 Oct 2021 08:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 593A683B63;
	Sat, 16 Oct 2021 08:30:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12F391BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C66AA404D1
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fpUNbLxK49F for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A907404C1
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9352D95C59; Sat, 16 Oct 2021 08:26:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 10:27:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 740ce99c09b60c70806f99c8b374a628e8d8fe48
X-Git-Newrev: 29b867a534548d5e863173f8239baffda2fe49b9
X-Patchwork-Hint: ignore
Message-Id: <20211016082647.9352D95C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvpx: bump version to 1.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=29b867a534548d5e863173f8239baffda2fe49b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/webmproject/libvpx/blob/master/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvpx/libvpx.hash | 2 +-
 package/libvpx/libvpx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index 5b9568837c..4e9bd91dee 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  85803ccbdbdd7a3b03d930187cb055f1353596969c1f92ebec2db839fa4f834a  libvpx-1.10.0.tar.gz
+sha256  965e51c91ad9851e2337aebcc0f517440c637c506f3a03948062e3d5ea129a83  libvpx-1.11.0.tar.gz
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 6ad558bc99..ece1ad2cb8 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.10.0
+LIBVPX_VERSION = 1.11.0
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
