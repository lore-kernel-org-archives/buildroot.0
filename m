Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAE6C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E13B860F7A;
	Mon, 15 Aug 2022 09:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E13B860F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWfmGw-41iU5; Mon, 15 Aug 2022 09:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AFC760F76;
	Mon, 15 Aug 2022 09:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AFC760F76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5358F1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6C8340AF9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6C8340AF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5kvoBrwsMT8 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D373B40A96
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D373B40A96
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D7764875A3; Mon, 15 Aug 2022 09:02:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01325361970e39f40b68dd1a2a3ecd988be044ae
X-Git-Newrev: 16c1cdef65351d6f99f37000c4421c74515ae9b4
X-Patchwork-Hint: ignore
Message-Id: <20220815090237.D7764875A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tclap: fix typo on help
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=16c1cdef65351d6f99f37000c4421c74515ae9b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libary -> library

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tclap/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tclap/Config.in b/package/tclap/Config.in
index 560cf33174..64b0b74c8a 100644
--- a/package/tclap/Config.in
+++ b/package/tclap/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_TCLAP
 	  This is a small, flexible library that provides a simple
 	  interface for defining and accessing command line
 	  arguments. It was initially inspired by the user friendly
-	  CLAP libary. The difference is that this library is
+	  CLAP library. The difference is that this library is
 	  templatized, so the argument class is type independent. Type
 	  independence avoids identical-except-for-type objects, such
 	  as IntArg, FloatArg, and StringArg. While the library is not
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
