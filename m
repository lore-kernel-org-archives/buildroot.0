Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E806C5479D
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 15:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10B9C40519;
	Fri,  6 Jan 2023 15:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10B9C40519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8a5z3mcix88; Fri,  6 Jan 2023 15:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64131403A2;
	Fri,  6 Jan 2023 15:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64131403A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A55011BF421
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 15:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 812928209E
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 15:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 812928209E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JCNirfeiPf3U for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 15:11:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A449080C2F
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 15:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A449080C2F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C5F1876BC; Fri,  6 Jan 2023 15:11:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 16:10:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c8eefa6a4e2a40ee9b832d5f1e71bf4ddfd9f1e
X-Git-Newrev: 1b68271287d470f4dfeab074a1222da869328f4e
X-Patchwork-Hint: ignore
Message-Id: <20230106151157.8C5F1876BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmlib: bump to version LSDK-21.08
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b68271287d470f4dfeab074a1222da869328f4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file was updated in commit:
https://github.com/nxp-qoriq/fmlib/commit/22126510006f366981c078a340e012a1e0415429

Notable changes in the license update are:
- GPL-2.0+ option was removed,
- Copyright years updated,
- NXP was added,
- License text was reflowed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fmlib/fmlib.hash | 4 ++--
 package/fmlib/fmlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index d4dcf3be5c..f81b017869 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e9e6bdb42dc2a6a76cfd756a2d4cdfcc2be90925c1f439e8a11eafa871896a6  fmlib-43fa98fdbf0c697167e415c3f060896d5b482791.tar.gz
-sha256  837559e20d83910a005e7883b876cc5c42805fe4abcf7e5c5b3c8d036b7f61c8  COPYING
+sha256  64dc76c0adc3aa58bce6aba470dee7dee001d4964ccb1958e899a59d9917b21d  fmlib-LSDK-21.08.tar.gz
+sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  COPYING
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 9509f3de56..3d185979d5 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FMLIB_VERSION = 43fa98fdbf0c697167e415c3f060896d5b482791
+FMLIB_VERSION = LSDK-21.08
 FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
-FMLIB_LICENSE = BSD-3-Clause, GPL-2.0+
+FMLIB_LICENSE = BSD-3-Clause
 FMLIB_LICENSE_FILES = COPYING
 FMLIB_DEPENDENCIES = linux
 FMLIB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
