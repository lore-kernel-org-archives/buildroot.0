Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4E7C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEAF5415A8;
	Tue, 26 Jul 2022 08:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEAF5415A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ifn3hlzZccNu; Tue, 26 Jul 2022 08:24:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D611941054;
	Tue, 26 Jul 2022 08:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D611941054
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC3FF1BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A63B9832B0
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A63B9832B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z8_dmh1qnuRB for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:24:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C61E0831A2
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61E0831A2
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7257485EA0; Tue, 26 Jul 2022 08:10:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 10:24:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a830961a589c793b4350fea5bd17b6210ae7adf2
X-Git-Newrev: c00fda3c59bfa216a8111ed3c281ce214c9f5242
X-Patchwork-Hint: ignore
Message-Id: <20220726081051.7257485EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: Config.in: fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=c00fda3c59bfa216a8111ed3c281ce214c9f5242
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

compatibiltiy -> compatibility

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 56f7299568..f535f9f6eb 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -49,7 +49,7 @@ config BR2_PACKAGE_GLIBC
 	  https://www.gnu.org/software/libc/
 
 config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
-	bool "Enable compatibiltiy shims to run on older kernels"
+	bool "Enable compatibility shims to run on older kernels"
 	help
 	  Say 'y' here if you plan on running your system on a kernel
 	  older than the version used for the toolchain headers.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
