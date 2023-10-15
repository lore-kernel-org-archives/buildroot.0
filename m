Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BA5CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EAFF81AC4;
	Sun, 15 Oct 2023 20:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EAFF81AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wfczkFt9MHC; Sun, 15 Oct 2023 20:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44F1B81E14;
	Sun, 15 Oct 2023 20:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44F1B81E14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4CA1BF2C1
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7377F402D0
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7377F402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Z13SE6GttLI for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:47:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3ED33401ED
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ED33401ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AE5985B30; Sun, 15 Oct 2023 20:47:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:47:00 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0481d1100363c2ae07758d5b43b40edb029105b4
X-Git-Newrev: 1b638d8d337c7e22a4b93d50b972ddc839be47a8
X-Patchwork-Hint: ignore
Message-Id: <20231015204716.2AE5985B30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libhtp: bump to
 version 0.5.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b638d8d337c7e22a4b93d50b972ddc839be47a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Needed by suricata 6.0.14:
http://autobuild.buildroot.net/results/b9d/b9df165b014698e5b4c2d218574947476cf23216/

https://github.com/OISF/libhtp/blob/0.5.45/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d821de0e4632a8016b4eaf8019bf885fb56f3579)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index 8759823e16..c016cb3439 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0afaff837c295c868db8c967b87b1b5e21c0386c15c3b5ead474799724c54ef8  libhtp-0.5.40.tar.gz
+sha256  d4214f94522fa5a1ec1909dbb52831c534788d93bc6b2ca8252de9332b11b606  libhtp-0.5.45.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index bb8aa73b42..8a732d1d5c 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.40
+LIBHTP_VERSION = 0.5.45
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
