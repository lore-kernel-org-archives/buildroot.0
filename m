Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30FBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8055780F00;
	Tue, 30 Nov 2021 16:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2AsxeHz4-7k; Tue, 30 Nov 2021 16:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7AF18308D;
	Tue, 30 Nov 2021 16:13:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FC431BF2F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D34F615FC
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NckweQK8AGMe for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:11:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6B6C61BAD
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:11:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 75725920DE; Tue, 30 Nov 2021 16:07:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:06:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75dd127b029752e6fe784f04865eae0503437c60
X-Git-Newrev: 2bc1cfa2a37715ee9746c50fd5809e63595785f6
X-Patchwork-Hint: ignore
Message-Id: <20211130160702.75725920DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/datatables-fixedcolumns: drop
 spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bc1cfa2a37715ee9746c50fd5809e63595785f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
c0a0e9b710aff7d1fce1b277fd9c614a9892d9e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/datatables-fixedcolumns/datatables-fixedcolumns.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/datatables-fixedcolumns/datatables-fixedcolumns.mk b/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
index 3c744990ca..33174e106f 100644
--- a/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
+++ b/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
@@ -6,7 +6,7 @@
 
 DATATABLES_FIXEDCOLUMNS_VERSION = 3.3.0
 DATATABLES_FIXEDCOLUMNS_SITE = https://datatables.net/releases
-DATATABLES_FIXEDCOLUMNS_SOURCE =  FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION).zip
+DATATABLES_FIXEDCOLUMNS_SOURCE = FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION).zip
 DATATABLES_FIXEDCOLUMNS_LICENSE = MIT
 DATATABLES_FIXEDCOLUMNS_LICENSE_FILES = License.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
