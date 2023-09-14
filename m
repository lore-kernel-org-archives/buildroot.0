Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671D8EDE99C
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D66B61283;
	Thu, 14 Sep 2023 09:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D66B61283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsX5M2-Tsrf5; Thu, 14 Sep 2023 09:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C1F56122C;
	Thu, 14 Sep 2023 09:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C1F56122C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D16C1BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79F618138D
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79F618138D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cedUf_WgF47f for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:53:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC7481350
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BC7481350
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BC8A86F5D; Thu, 14 Sep 2023 09:53:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:46:44 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 816f4ba688dfdfd6370a6da9497246c195e96f91
X-Git-Newrev: 2e346847cf67882e59678d472788ea7217196eee
X-Patchwork-Hint: ignore
Message-Id: <20230914095340.8BC8A86F5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/poppler: bump
 version to latest in 22.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e346847cf67882e59678d472788ea7217196eee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit f3ab33c62fac662b5f0aca9f4342d798a41e2736)
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
