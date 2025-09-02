Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390E4CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 19:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5563840E4;
	Tue,  2 Sep 2025 19:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s83DLarxnwQh; Tue,  2 Sep 2025 19:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C116384174
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C116384174;
	Tue,  2 Sep 2025 19:27:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B7CD439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 19:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A43E60DFE
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 19:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGNUwK7EJMNO for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 19:27:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61EC360E07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61EC360E07
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 19:27:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F84987C05; Tue,  2 Sep 2025 19:27:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Sep 2025 21:20:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dca62a6365b4172cd8e37e83f87ac8f8c8899eb0
X-Git-Newrev: 4c2cf885d89872bb99e2f6945205b152c194abc5
X-Patchwork-Hint: ignore
Message-Id: <20250902192718.4F84987C05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/harfbuzz: bump to
 version 11.4.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c2cf885d89872bb99e2f6945205b152c194abc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release Notes since 11.4.3:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.4.4
https://github.com/harfbuzz/harfbuzz/releases/tag/11.4.5

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add release note link for 11.4.4]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 463a37d22b..a4978ca134 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6660415ad48fa1a46e4fa75fcdb70ff819c452153f08677d34ffb29eda66415d  harfbuzz-11.4.3.tar.xz
+sha256  0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af343b1d27892e03fa  harfbuzz-11.4.5.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 103ab7a6f5..b1bec26ccb 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.4.3
+HARFBUZZ_VERSION = 11.4.5
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
