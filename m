Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17D0C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A012C6137E;
	Thu,  9 May 2024 21:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqzjSf94YqVQ; Thu,  9 May 2024 21:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 509D961349
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 509D961349;
	Thu,  9 May 2024 21:11:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56A741BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D246835C6
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8svV4MtaKlzb for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DC708354B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DC708354B
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:11:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25E7586DF0; Thu,  9 May 2024 21:11:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 23:10:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 981d25e5bcedee0dee8efcfbaa1dedb466a5445f
X-Git-Newrev: 776dc1ed504421e0a67627eeff147840ff74503d
X-Patchwork-Hint: ignore
Message-Id: <20240509211139.25E7586DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mpmath: add CPE variables
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8671479925681527695=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8671479925681527695==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=776dc1ed504421e0a67627eeff147840ff74503d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:mpmath:mpmath is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/2EF05D03-432D-470D-80AB-1àF50D308BD85

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mpmath/python-mpmath.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
index caa6492961..cd19dd52be 100644
--- a/package/python-mpmath/python-mpmath.mk
+++ b/package/python-mpmath/python-mpmath.mk
@@ -10,5 +10,7 @@ PYTHON_MPMATH_SITE = https://mpmath.org/files
 PYTHON_MPMATH_SETUP_TYPE = setuptools
 PYTHON_MPMATH_LICENSE = BSD-3-Clause
 PYTHON_MPMATH_LICENSE_FILES = LICENSE
+PYTHON_MPMATH_CPE_ID_VENDOR = mpmath
+PYTHON_MPMATH_CPE_ID_PRODUCT = mpmath
 
 $(eval $(python-package))

--===============8671479925681527695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8671479925681527695==--
