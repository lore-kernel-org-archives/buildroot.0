Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFF1C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 416B861224;
	Fri, 16 Sep 2022 11:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 416B861224
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2nQPKPqYXijL; Fri, 16 Sep 2022 11:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7329361207;
	Fri, 16 Sep 2022 11:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7329361207
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE6F11BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6B7461220
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6B7461220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFfYibPb8sDq for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1577860F64
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1577860F64
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 013FC83CC0; Fri, 16 Sep 2022 11:46:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:15:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6e3f8e35b83520ae0312c21e9baf9a8b8f0c840d
X-Git-Newrev: c8fd18761d94c2b69ff66644f0486f6cd4b7bd3c
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.013FC83CC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tclap: fix typo
 on help
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8fd18761d94c2b69ff66644f0486f6cd4b7bd3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

libary -> library

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 16c1cdef65351d6f99f37000c4421c74515ae9b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
