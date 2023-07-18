Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC398EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6149161025;
	Tue, 18 Jul 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6149161025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEoHUbiMXX1f; Tue, 18 Jul 2023 20:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96EE06102C;
	Tue, 18 Jul 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96EE06102C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DE281BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77FA960D58
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77FA960D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eK3XjZ5bFUxb for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A311960C09
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A311960C09
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9358E873EC; Tue, 18 Jul 2023 20:52:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 22:51:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76f20b728fa703bfb493482e065445da77f68893
X-Git-Newrev: 0c606acfbe77968f6a6684e35c49cd7b75002eec
X-Patchwork-Hint: ignore
Message-Id: <20230718205257.9358E873EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: bump version to
 LTS_01_2023_Ref02
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c606acfbe77968f6a6684e35c49cd7b75002eec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/Azure/azure-iot-sdk-c/releases

Version LTS_07_2022_Ref02 added compatibility with OpenSSL 3.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash | 2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 187b90a35a..b960c0e571 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  7c23506e5acd6f400982f6f7a053d494c83b8a709c449bb9ded07aff9cfada78  azure-iot-sdk-c-LTS_07_2022_Ref01-br1.tar.gz
+sha256  7b52b9886a3aff20a55a0d5bc5e140c212f85fd06af18c31291c15d363743a77  azure-iot-sdk-c-LTS_01_2023_Ref02-br1.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 42fdd56b48..123b4cc930 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_07_2022_Ref01
+AZURE_IOT_SDK_C_VERSION = LTS_01_2023_Ref02
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
