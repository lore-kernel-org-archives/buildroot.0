Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F31CAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E908284E79;
	Mon,  8 Sep 2025 10:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMdb20Gk8aei; Mon,  8 Sep 2025 10:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CC5A84E48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CC5A84E48;
	Mon,  8 Sep 2025 10:59:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC308234
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06B341F9E
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s55i6zkH4ZMw for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A5F4156C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9A5F4156C
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C309983B4B; Mon,  8 Sep 2025 10:59:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:08:52 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: ba69338ce4ea19fd8f227f80f2fe4fa0298121b2
X-Git-Newrev: 0134713432df78a7c3ab1e9c3850b31f1fd51689
X-Patchwork-Hint: ignore
Message-Id: <20250908105917.C309983B4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/ell: bump version
 to 0.79
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0134713432df78a7c3ab1e9c3850b31f1fd51689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Changelog (see [1]):

  ver 0.79:
    Fix issue with D-Bus client and watch removal handling.
    Fix issue with D-Bus client and service name handling.
    Fix issue with D-Bus proxy and filter rule handling.

  ver 0.78:
    Fix issue with random ECC scalar generation.

  ver 0.77:
    Add support for precheck feature for unit tests.
    Add support for license variable for pkg-config.

  ver 0.76:
    Fix issue with random scalar generation.

  ver 0.75:
    Add support for converting OID octets to strings.
    Add support for NIST P-224 cuve usage with ECDH.
    Add support for NIST P-521 cuve usage with ECDH.
    Add support for SHA-3 series of hashing algorithms.

  ver 0.74:
    Add support for NIST P-192 curve usage with ECDH.
    Add support for SHA-224 based checksums and HMACs.

  ver 0.73:
    Fix issue with parsing hwdb.bin child structures.

  ver 0.72:
    Add support for the Test Anything Protocol.

  ver 0.71:
    Fix issue with GCC 15 and -std=c23 build errors.

  ver 0.70:
    Add support for helper function for safe memcpy.

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.79

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e834d23cd792ee57ea80f37ce01d9d50756dba1d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 4f67cbae21..418d1a9a2a 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  6cfc0888edc94de9f0623798609587b2cc11b92b892945f317e8d199afe7b12e  ell-0.69.tar.xz
+sha256  28dabdb1966fd2e47363c44e041de507e9420411b846947efa01b4cb0cda0d6b  ell-0.79.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 6d4e8a5ae7..a0ae7a68c8 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.69
+ELL_VERSION = 0.79
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
