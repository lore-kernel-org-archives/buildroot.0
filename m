Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0FFC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6186181346;
	Sun, 18 May 2025 14:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tz0DPWliphuK; Sun, 18 May 2025 14:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F9A18209E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F9A18209E;
	Sun, 18 May 2025 14:47:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0595FDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7400C6064D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pDOEH3fyxSk for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21CD060D74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21CD060D74
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E9CD87141; Sun, 18 May 2025 14:47:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:40:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4c732c3e5c03f710f063c32cbfe8dd2e4470d94e
X-Git-Newrev: 96ece0f85b1ea291fd814704534929a71707a7ba
X-Patchwork-Hint: ignore
Message-Id: <20250518144711.1E9CD87141@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Dario
 Binacchi for inih
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96ece0f85b1ea291fd814704534929a71707a7ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 501018ad6156fad90fd98c63d9de1630cd526acf)
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2be1520e45..521897e9e3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -799,6 +799,7 @@ F:	package/aespipe/
 F:	package/armadillo/
 F:	package/babeld/
 F:	package/iana-assignments/
+F:	package/inih/
 F:	package/sscep/
 F:	package/tinyinit/
 F:	package/uuu/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
