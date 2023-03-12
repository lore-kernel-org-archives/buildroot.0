Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342A2C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 18:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99032606EC;
	Sun, 12 Mar 2023 18:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99032606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_NJPzr9Irx9; Sun, 12 Mar 2023 18:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2F5D6068A;
	Sun, 12 Mar 2023 18:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2F5D6068A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71EAC1BF573
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B5376068A
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B5376068A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpfJsd-kvA8s for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 18:45:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BA8060670
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 18:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BA8060670
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C07686F83; Sun, 12 Mar 2023 18:45:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 19:40:40 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 3f28ad6e0b8c952988855ef8acc2975c634386fc
X-Git-Newrev: 9be3fa0da2c9e8db8bbf64c659ee3bcc73a9516e
X-Patchwork-Hint: ignore
Message-Id: <20230312184513.2C07686F83@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/hawktracer:
 update URL in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=9be3fa0da2c9e8db8bbf64c659ee3bcc73a9516e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Current website is down:
https://github.com/amzn/hawktracer/issues/87

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit edc6350d427bdd47552a276d80c6ad055add86af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hawktracer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hawktracer/Config.in b/package/hawktracer/Config.in
index 7648707404..bee9c27b7d 100644
--- a/package/hawktracer/Config.in
+++ b/package/hawktracer/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HAWKTRACER
 	  profiling tool built in Amazon Video for getting performance
 	  metrics from low-end devices.
 
-	  https://www.hawktracer.org/
+	  https://hawktracer.github.io/
 
 if BR2_PACKAGE_HAWKTRACER
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
