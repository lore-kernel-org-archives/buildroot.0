Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0296CC61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF2CB810A5;
	Fri, 28 Aug 2026 14:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKLlbd4HlBWu; Fri, 28 Aug 2026 14:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927158;
	bh=quUFz2NNUQyU74zAZntmaZqS8LtHOgRjcJ3x1nMhO2w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VXaNg+j/tjNqWBucG+12Izpp+pYhlHiZNuIpZOqZR1kPbSRjpW5i/CZMS/aUVKzdV
	 9auMpDGlXoHNRvYlIqGLzZsZFUjntugbgP1nVei0rXqMZm7muXT0z9jCFht65Slrty
	 qjdlLUS4TPwyvlqbx6lhR5eXSYMJwSnH2XhWN6ihrYY6ZxVcjN+gS/xkXV9Bmf8tfm
	 cD6ZDqEqGl9z28B6lKddW5OWa1/+bs1MT20QrJ5SLNE9ClYTkuZWOPx+5mF7okgLbO
	 yNy7aHZR0Bdx4mzDliVA+4LA2x/WmODsNNSTrINZlZ+h8TP3QGgEuTOvvvWpdFhpAB
	 cTG0mlSRqOqog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA74810CC;
	Fri, 28 Aug 2026 14:25:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1181CD2A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8AC060832
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSzhldQ_tW3n for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42F356072C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 415E0921F9; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: b1b2c3f00aaffacd8b9e6239c64314f124345e36
X-Git-Newrev: d16f8597fedd4fabc4e347fcab9cad4bcbce88d5
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.415E0921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] docs/manual: fix typo
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d16f8597fedd4fabc4e347fcab9cad4bcbce88d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
