Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CFEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D290D610D9;
	Thu, 27 Jan 2022 18:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KU9SiG0XeQZn; Thu, 27 Jan 2022 18:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C7860B04;
	Thu, 27 Jan 2022 18:32:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D588F1BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C44BE4171E
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6w9m5GgyON0 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D70884182B
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 84F3C82A00; Thu, 27 Jan 2022 18:25:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:31:23 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 11f988730e18fccbf3c865193ae8da929b900b40
X-Git-Newrev: 3da77e6b2555a35ead4807e39c5520822f7142df
X-Patchwork-Hint: ignore
Message-Id: <20220127182510.84F3C82A00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] DEVELOPERS: drop Henrique
 Camargo
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
Content-Type: multipart/mixed; boundary="===============3524950424533841006=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3524950424533841006==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3da77e6b2555a35ead4807e39c5520822f7142df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

He has privately requested to no longer be notified regarding this
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f51be73f25bdc9b370db42996475136098ebd251)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 834419f9c5..e2c0f4d521 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1145,9 +1145,6 @@ F:	package/linuxptp/
 F:	package/netopeer2/
 F:	package/sysrepo/
 
-N:	Henrique Camargo <henrique@henriquecamargo.com>
-F:	package/json-glib/
-
 N:	Hervé Codina <herve.codina@bootlin.com>
 F:	package/dtbocfg/
 F:	package/libdbi/

--===============3524950424533841006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3524950424533841006==--
