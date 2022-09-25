Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05D9C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 07:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 755BF83403;
	Sun, 25 Sep 2022 07:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 755BF83403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvVl66V0DAv8; Sun, 25 Sep 2022 07:19:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D68F982C3C;
	Sun, 25 Sep 2022 07:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D68F982C3C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9A411BF97E
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F1741761
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3F1741761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLetqr5mMAG7 for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 07:19:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 774EA41760
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 774EA41760
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 07:19:23 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout12.t-online.de (Postfix) with SMTP id B3FD714FF5;
 Sun, 25 Sep 2022 09:19:20 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.201.33]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ocLus-0J01WD0; Sun, 25 Sep 2022 09:19:06 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:33260)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ocLus-0000iQ-1K;
 Sun, 25 Sep 2022 09:19:06 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 09:19:04 +0200
Message-Id: <20220925071906.95926-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1664090346-154B398D-5479EE39/0/0 CLEAN NORMAL
X-TOI-MSGID: 3f63c603-f5fb-4801-87d5-492ce52153f9
Subject: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to 22.2.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index ef9ac9be8b..9509796850 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  08a378671971a1777ca60f87e39fd7d7cbba94e485a1f5f64fe4840ff9d2ac2d  intel-gmmlib-22.1.7.tar.gz
+sha256  0b2253894c6fc8455b6d7c5e87e6504a76d6f60ea192e1445c2f93164bf529c0  intel-gmmlib-22.2.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index b47d9a064d..6fec276205 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.1.7
+INTEL_GMMLIB_VERSION = 22.2.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
