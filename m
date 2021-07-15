Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE33C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:31:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9590C60F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9590C60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E3460A51;
	Tue,  3 Aug 2021 23:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkdQbLmwi1Nk; Tue,  3 Aug 2021 23:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDF0F6061A;
	Tue,  3 Aug 2021 23:31:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3641BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 179144069B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3w3Z03DOzgsi for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1589940E69
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 64D2782A39; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jul 2021 23:14:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 98caa3077bf780fc0d2cc0b978214fbf2f7fd2a2
X-Git-Newrev: c2465d52cc1068947e2bd2c8dd081097c581206d
X-Patchwork-Hint: ignore
Message-Id: <20210803211003.64D2782A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/harfbuzz: bump to
 version 2.8.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6860467781184862518=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6860467781184862518==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c2465d52cc1068947e2bd2c8dd081097c581206d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The hash of the COPYING file is updated due to the following changes:

 Copyright © 2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020  Google, Inc.
 Copyright © 2018,2019,2020  Ebrahim Byagowi
-Copyright © 2019,2020  Facebook, Inc.
+Copyright © 2019,2020  Facebook, Inc.
 Copyright © 2012  Mozilla Foundation
 Copyright © 2011  Codethink Limited
 Copyright © 2008,2010  Nokia Corporation and/or its subsidiary(-ies)
 Copyright © 2009  Keith Stribley
 Copyright © 2009  Martin Hosken and SIL International
 Copyright © 2007  Chris Wilson
-Copyright © 2006  Behdad Esfahbod
+Copyright © 2005,2006,2020,2021  Behdad Esfahbod
 Copyright © 2005  David Turner
 Copyright © 2004,2007,2008,2009,2010  Red Hat, Inc.
 Copyright © 1998-2004  David Turner and Werner Lemberg

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index ad81b34fd6..774b3104a5 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4124f663ec4bf4e294d9cf230668370b4249a48ff34deaf0f06e8fc82d891300  harfbuzz-2.8.1.tar.xz
-sha256  beb3f017ceb41387667f78237a7cecf84defa0ed257c505894663d6a9f13211b  COPYING
+sha256  d58461395ce28b9dc03903254374dd70c38c8c28c5046db123c08f7ab9417be7  harfbuzz-2.8.2.tar.xz
+sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 60cc8b7247..f327a95eb6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.8.1
+HARFBUZZ_VERSION = 2.8.2
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

--===============6860467781184862518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6860467781184862518==--
