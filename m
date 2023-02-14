Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884D9C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B9F6109E;
	Tue, 21 Feb 2023 00:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B9F6109E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7vpP2ORT88-H; Tue, 21 Feb 2023 00:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A3BD6100B;
	Tue, 21 Feb 2023 00:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A3BD6100B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2241BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDB384180E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDB384180E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNMh4UVR98XA for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13CA3415A7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13CA3415A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1187C86495; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 18:15:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 910aae1e23806fff74b16088c8975827e6664c2e
X-Git-Newrev: df50979e7bf0ff7f0b8a2461ed7ae9dbd103d836
X-Patchwork-Hint: ignore
Message-Id: <20230220205300.1187C86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnuplot: bump version
 to 5.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=df50979e7bf0ff7f0b8a2461ed7ae9dbd103d836
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 1ee6b53694..de0741d609 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.5/
-md5  c10cf81faa69d77e255a1dcfc625ba78  gnuplot-5.4.5.tar.gz
-sha1  1179a768fd5f585a5dcb6aedea76cfa7a8dd5dfe  gnuplot-5.4.5.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.6/
+md5  da719235bb2f46830f9d2101d04b14a5  gnuplot-5.4.6.tar.gz
+sha1  31ea0c00af5c156e5d068e3b1cc2fb1847f471ab  gnuplot-5.4.6.tar.gz
 # Locally computed
-sha256  66f679115dd30559e110498fc94d926949d4d370b4999a042e724b8e910ee478  gnuplot-5.4.5.tar.gz
+sha256  02fc27918200ed64d8f0c3b84fe81b95b59cd47ad99f270939ae497c19f27419  gnuplot-5.4.6.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 1ee49cb6ce..c49fbc497d 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.5
+GNUPLOT_VERSION = 5.4.6
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
