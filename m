Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE15AC61DD3
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D62280FF4;
	Fri, 28 Aug 2026 14:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ip-hincms6zl; Fri, 28 Aug 2026 14:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927043;
	bh=+VKPPFcxGqU9wj0SKA0QkkpyrO4hQi9w6V6n4gwtTQo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SWhlXuqlhawDOnyK9KPpVBfbysm7LW7EM18KvRA0HhPXHSftT+SY1l955tze+uSD+
	 0PcD8J/PG99gp+NnDC74Q/n0vREzmaSckWbyn8Rr0qL2X9HhtdX3Z5fwhjSZUCafSe
	 NQi4OVszO6cKPC4ZAQvaYdtK5R98mxYnwBvtqIpfTckmpHFY73fOXe/Ei/K9G2uz55
	 QucVh1GTrXMk5zAA2pVgadhLgKg98cur42AezqytYOwGwXABRWByOiSPpKrYQRnLao
	 xHL7qO6VHYQw9uBny3IwXFCpQ6nEaFobTymz/EAhroyttqeij1lI9VrwzWz3l2UXT1
	 ffbWSeK/1LY8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E68880F3A;
	Fri, 28 Aug 2026 14:24:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E9B8D2B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F27C0407A0
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCpikFT9aInf for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E290407FB
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CB0A921F9; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c036875ad68b3986c8a0e27c691dcb5ee4eded38
X-Git-Newrev: 3de60d0aa3f4a574505da0d772e25d47fe8ff6d0
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.3CB0A921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] docs/manual: fix typo
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3de60d0aa3f4a574505da0d772e25d47fe8ff6d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fix significant -> significantly.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b088e5dbe43d1c31add4b99cd05b8ba71228761a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/manual/contribute.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 310fe80585..a0002ce188 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -664,7 +664,7 @@ Creating a basic test case involves:
   advantage of using +infra.basetest.BASIC_TOOLCHAIN_CONFIG+ is that a
   matching Linux kernel image is provided, which allows to boot the
   resulting image in Qemu without having to build a Linux kernel image
-  as part of the test case, therefore significant decreasing the build
+  as part of the test case, therefore significantly decreasing the build
   time required for the test case.
 
 * Implementing a +def test_run(self):+ function to implement the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
