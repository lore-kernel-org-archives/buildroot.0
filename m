Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E20EC71153
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 19:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD8DE4149F;
	Sun,  3 Sep 2023 19:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8DE4149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PduaNYAV7bFJ; Sun,  3 Sep 2023 19:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BED841517;
	Sun,  3 Sep 2023 19:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BED841517
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E58401BF3C8
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFC4140503
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFC4140503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ERCVK2Gt62j8 for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 19:34:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDB1D40423
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 19:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDB1D40423
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 868488692D; Sun,  3 Sep 2023 19:34:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Sep 2023 21:31:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fea8852c681c26a785557353caea4a669dcc35be
X-Git-Newrev: f3ab33c62fac662b5f0aca9f4342d798a41e2736
X-Patchwork-Hint: ignore
Message-Id: <20230903193434.868488692D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poppler: bump version to latest in
 22.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3ab33c62fac662b5f0aca9f4342d798a41e2736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit updates poppler to the latest version in the 22.x series,
with only has bug fixes. Here is the list of commits between 22.10.0
and 22.12.0:

df568263c51950ceed6f1fb42f80e99a2614c275 (tag: poppler-22.12.0) poppler 22.12.0
198dc1d0674c0a462668e6868c35b1ee0e731005 Form::addFontToDefaultResources: Be stubborn in finding a font we can use
a5952ab70716a2d4f792a943c2dcf3068f1d6885 Revert "CI: Fix Debian brokenness"
8fcaa7c622d24761a9ecb3922f95d072077d6f34 CI: Fix Debian brokenness
cc665f757af6b87dd245d36e079dd44d8d2d2182 (tag: poppler-22.11.0) poppler 22.11.0
a296982e1d5b4968b2bd044d80647ae6f9267526 Do not include a poppler/ file from a splash/ header
bc4a0d9a2abfcd75d9b0ee4be3f7600905fe6001 Form: Provide Unicode marker when ensuring fonts
111f38a722eedddd94faa52dda8c5e0da561fb41 Cairo: Update font after restore
907d05a6a141284aee22fbd16ab0a2fb4e0f2724 Fix crash in file that wants to do huge transparency group
e53f5aae3bce7d09788f2ad62be998895fb9807b PSOutputDev::setupResources: Fix stack overflow in malformed doc
a4ca3a96a6b1f65b335a1ea362e6c202e46ae055 topIdx can't be negative
e471f8e09bf2e38df0cf5df1acecbcca70685573 Init all the fields of JPXStreamPrivate
5190c0d4369bd9f501922585140be4ec736e24f2 No need to store smaskInData in priv
6263bb90b09326103b10e4c4edfbc5b84c884921 Page label ranges can't start in < 0

Note: this version bump does not include the fix for CVE-2023-34872,
so we still need the backported patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 93681e04af..bb07b2ee6a 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  04e40fad924a6de62e63017a6fd4c04696c1f526dedc2ba5ef275cedf646292a  poppler-22.10.0.tar.xz
+sha256  d9aa9cacdfbd0f8e98fc2b3bb008e645597ed480685757c3e7bc74b4278d15c0  poppler-22.12.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 4c6017a5f5..776fb4d566 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 22.10.0
+POPPLER_VERSION = 22.12.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = https://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
