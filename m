Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF98C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:21:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDCBF61050
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDCBF61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B18B783A56;
	Sat,  7 Aug 2021 17:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDNlsogd4RVJ; Sat,  7 Aug 2021 17:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 020F18398E;
	Sat,  7 Aug 2021 17:21:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CE241BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07C3A401D0
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSt_cc_kqcz2 for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:19:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 405B5401E9
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:19:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 930258CA2D; Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:17:25 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b319277b236dc230016c8d285762c1fba00487a7
X-Git-Newrev: df7a1c585a11a5d7674490337ec3492af000adad
X-Patchwork-Hint: ignore
Message-Id: <20210807171927.930258CA2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/fetchmail: bump
 version to 6.4.19
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=df7a1c585a11a5d7674490337ec3492af000adad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Updated license hash due to upstream typo fix:
https://sourceforge.net/p/fetchmail/git/ci/2409d4f0baa90c6303d1e600772e500fc397a561/

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37267719/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9fea6712f5df2e5fe4255f7a6b297aa972bebfc0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fetchmail/fetchmail.hash | 8 ++++----
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 698d83c88b..8f092a3f80 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37249830/
-sha256  302dc9bcdc6927dedf375d2baaead2347557faa70d98b1da83f2409fa6fb259f  fetchmail-6.4.18.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37267719/
+sha256  cd8d11a3d103e50caa2ec64bcda6307eb3d0783a4d4dfd88e668b81aaf9d6b5f  fetchmail-6.4.19.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  1fd3e4f30bd9ba7bdcaed5edfca080dc6f66377e  fetchmail-6.4.18.tar.xz
+sha1  bb6959f0cf1f6d689c2ba3834c5bba72e4f9ec07  fetchmail-6.4.19.tar.xz
 # Locally computed:
-sha256  8e3ec4863456a26fcd1cf84fadd4146efcb2fd8515bcec482e0f2b7060108895  COPYING
+sha256  6346b5aa04e258fa4326272ea92372d796b4382aa963535ae98a3bb5f8cd5aeb  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 6fe9b5b3d7..7233da98a5 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).18
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).19
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
