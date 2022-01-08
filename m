Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4BDC433FE
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136FE60B0A;
	Sat,  8 Jan 2022 13:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlLFf3ZRIB0U; Sat,  8 Jan 2022 13:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73123606E7;
	Sat,  8 Jan 2022 13:20:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61D0E1BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5047D606E7
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yDdgVR3Bk8hT for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:20:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9728660674
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A0ED82897; Sat,  8 Jan 2022 13:13:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 14:19:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c91359697ee19639ea1025940821b0e332e02174
X-Git-Newrev: ced407bde0e45c34f3e464e73642f09a21d79abd
X-Patchwork-Hint: ignore
Message-Id: <20220108131356.4A0ED82897@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: Fix white space in help
 text
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

commit: https://git.buildroot.net/buildroot/commit/?id=ced407bde0e45c34f3e464e73642f09a21d79abd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zabbix/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index f859471b1c..6f8a952936 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -4,9 +4,9 @@ config BR2_PACKAGE_ZABBIX
 	select BR2_PACKAGE_PCRE
 	help
 	  Zabbix is an enterprise-class open source distributed
-	  monitoring solution.Zabbix is free of cost. Zabbix is written
-	  and distributed under the GPL General Public License version
-	  2.
+	  monitoring solution. Zabbix is free of cost. Zabbix is
+	  written and distributed under the GPL General Public License
+	  version 2.
 
 	  https://zabbix.com
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
