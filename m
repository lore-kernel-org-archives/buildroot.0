Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC44C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:11:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A8F260EB9
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A8F260EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB21A83C20;
	Tue,  3 Aug 2021 23:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3pm0eMKwf8k5; Tue,  3 Aug 2021 23:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5709783B33;
	Tue,  3 Aug 2021 23:11:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 673DF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77D5F40643
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bT92Ds5TDW3J for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D86214064D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 392008674F; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 14:42:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d5df29a2444d1c64e590c19c72d435ac146968e2
X-Git-Newrev: db39783b64a4435dc35464d08bc841331794c52d
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.392008674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lualdap: bump to
 version 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=db39783b64a4435dc35464d08bc841331794c52d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lualdap/lualdap.hash | 2 +-
 package/lualdap/lualdap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lualdap/lualdap.hash b/package/lualdap/lualdap.hash
index 488deb4e16..a65260b132 100644
--- a/package/lualdap/lualdap.hash
+++ b/package/lualdap/lualdap.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 0fcd82a77b20f7cee00050b63b4241d462564421bbd464f6fd0c1bebc62bff32  lualdap-1.2.6-1.src.rock
+sha256 49c253f540187c61850c856b8e70e45dca904b81720a760f6a94e4eb474958ad  lualdap-1.3.0-1.src.rock
 sha256 b9b75da18d1e1147ec47bff508ffdce831da07dc371891b9057cf1c422660af4  lualdap/docs/license.md
diff --git a/package/lualdap/lualdap.mk b/package/lualdap/lualdap.mk
index acfcbdfc68..5dfba8b7a4 100644
--- a/package/lualdap/lualdap.mk
+++ b/package/lualdap/lualdap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALDAP_VERSION = 1.2.6-1
+LUALDAP_VERSION = 1.3.0-1
 LUALDAP_SUBDIR = lualdap
 LUALDAP_LICENSE = MIT
 LUALDAP_LICENSE_FILES = $(LUALDAP_SUBDIR)/docs/license.md
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
