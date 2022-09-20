Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7954EC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 19:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13E3440C79;
	Tue, 20 Sep 2022 19:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13E3440C79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-etXzaeZQ67; Tue, 20 Sep 2022 19:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36D7440C63;
	Tue, 20 Sep 2022 19:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36D7440C63
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8C321BF616
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9430C60FA1
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9430C60FA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njHCdyRYdJxM for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 19:20:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5A19606FF
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 19:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A19606FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1CAF85BFC; Tue, 20 Sep 2022 19:20:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 21:15:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 518603e78f859626f999d65a2ce67b8f70a96823
X-Git-Newrev: a582d1ecabda59b9ae5d9a9b6efe7fc4ac461183
X-Patchwork-Hint: ignore
Message-Id: <20220920192022.D1CAF85BFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: bump to version 4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a582d1ecabda59b9ae5d9a9b6efe7fc4ac461183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 7fa67bf040..9c0e11757b 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://download.tuxfamily.org/chrony/chrony-4.2-tar-gz-asc.txt
-sha256  273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a  chrony-4.2.tar.gz
+# https://download.tuxfamily.org/chrony/chrony-4.3-tar-gz-asc.txt
+sha256  9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804  chrony-4.3.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 15b200aeff..379e95a778 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.2
+CHRONY_VERSION = 4.3
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
