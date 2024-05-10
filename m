Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EDBC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 12:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4597942A4F;
	Fri, 10 May 2024 12:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzLuWDP1PkLA; Fri, 10 May 2024 12:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AD8D42A57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AD8D42A57;
	Fri, 10 May 2024 12:01:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B293A1BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A013742A57
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j89kzxx7Zk7m for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 12:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C4B442A4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C4B442A4F
 for <buildroot@buildroot.org>; Fri, 10 May 2024 12:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86C2C86E8C; Fri, 10 May 2024 12:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 14:00:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35cecc4408482ea58407074bdba6fe09bfca0561
X-Git-Newrev: f1f926adc7f2af1aee3ce018243ee8580471ab8c
X-Patchwork-Hint: ignore
Message-Id: <20240510120129.86C2C86E8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/paho-mqtt-cpp: bump to version
 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1f926adc7f2af1aee3ce018243ee8580471ab8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License updated to EPL-2.0 with
https://github.com/eclipse/paho.mqtt.cpp/commit/a7e9b1204296b16ddf2b5dbe23bc150cb1a04d5e

https://github.com/eclipse/paho.mqtt.cpp/blob/v1.3.2/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash | 4 ++--
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
index d9b86ce207..a35cd102b3 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  435e97e4d5b1da13daa26cadd3e83fe9d154930abaa78b8ff1b8c854b5345d8b  paho-mqtt-cpp-1.2.0.tar.gz
+sha256  c271d521287f417102b447b3d1e8d17be0e0f6a3b0b653334ebcd2ccd20d1e46  paho-mqtt-cpp-1.3.2.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
-sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
+sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
index 827946605a..2e0f409b96 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PAHO_MQTT_CPP_VERSION = 1.2.0
+PAHO_MQTT_CPP_VERSION = 1.3.2
 PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,v$(PAHO_MQTT_CPP_VERSION))
-PAHO_MQTT_CPP_LICENSE = EPL-1.0 or BSD-3-Clause
-PAHO_MQTT_CPP_LICENSE_FILES = epl-v10 edl-v10
+PAHO_MQTT_CPP_LICENSE = EPL-2.0 or BSD-3-Clause
+PAHO_MQTT_CPP_LICENSE_FILES = epl-v20 edl-v10
 PAHO_MQTT_CPP_INSTALL_STAGING = YES
 PAHO_MQTT_CPP_DEPENDENCIES = paho-mqtt-c
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
