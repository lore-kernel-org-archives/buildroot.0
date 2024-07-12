Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACCCC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77AB841474;
	Fri, 12 Jul 2024 10:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvgfL1HxfZf8; Fri, 12 Jul 2024 10:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43AEF409F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43AEF409F1;
	Fri, 12 Jul 2024 10:54:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80DD41BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EAC76066A
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZxCzYCr9FAX for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA568605AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA568605AA
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:53:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94FC085DA1; Fri, 12 Jul 2024 10:53:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 12:53:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba8e85bc068bfb3f4dc0909036e819ff8682f04e
X-Git-Newrev: 3900807b22835451ddb1b1f78e179d8b472b3554
X-Patchwork-Hint: ignore
Message-Id: <20240712105359.94FC085DA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Roy Kollen Svendsen for a
 number of qt6 packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=3900807b22835451ddb1b1f78e179d8b472b3554
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Roy recently introduced a number of additional qt6 packages, let's
add him to the DEVELOPERS file for those packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0faad55f97..8c0deb9e41 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2798,6 +2798,16 @@ F:	support/testing/tests/package/test_openssh.py
 F:	support/testing/tests/package/test_python_mako.py
 F:	toolchain/
 
+N:	Roy Kollen Svendsen <roykollensvendsen@gmail.com>
+F:	package/qt6/qt6declarative/
+F:	package/qt6/qt6languageserver/
+F:	package/qt6/qt6mqtt/
+F:	package/qt6/qt6shadertools/
+F:	package/qt6/qt6tools/
+F:	package/qt6/qt6virtualkeyboard/
+F:	package/qt6/qt6wayland/
+F:	package/qt6/qt6websockets/
+
 N:	Rufus Segar <rhs@riseup.net>
 F:	package/agent-proxy/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
