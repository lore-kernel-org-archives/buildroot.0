Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E274C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F51F817C0;
	Sat,  8 Jan 2022 09:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3bySy2uVXx9; Sat,  8 Jan 2022 09:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8801D8177C;
	Sat,  8 Jan 2022 09:55:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3442D1BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2280F41604
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKPhsPKNEjMG for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:55:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19CF9410AB
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:55:31 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout10.t-online.de (Postfix) with SMTP id 5419511A92
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:54:52 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n68R2-3f3ioT0; Sat, 8 Jan 2022 10:54:52 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55040)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n68R1-00046X-R9
 for buildroot@buildroot.org; Sat, 08 Jan 2022 10:54:51 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 10:54:51 +0100
Message-Id: <20220108095451.1078507-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641635692-00001674-EE039626/0/0 CLEAN NORMAL
X-TOI-MSGID: 1e500e65-291a-4652-b5f5-28a754b358c4
Subject: [Buildroot] [PATCH 1/1] package/libldns: bump version to 1.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reformatted hashes.

Changelog: https://github.com/NLnetLabs/ldns/blob/develop/Changelog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libldns/libldns.hash | 10 +++++-----
 package/libldns/libldns.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index c8fb39d478..cab8b7dbdf 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -1,7 +1,7 @@
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.1.tar.gz.sha1
-sha1 d075a08972c0f573101fb4a6250471daaa53cb3e  ldns-1.7.1.tar.gz
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.1.tar.gz.sha256
-sha256 8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229  ldns-1.7.1.tar.gz
+# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.1.tar.gz.sha1
+sha1  df19a0404a608821b571525214a18988bc88bb46  ldns-1.8.1.tar.gz
+# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.1.tar.gz.sha256
+sha256  958229abce4d3aaa19a75c0d127666564b17216902186e952ca4aef47c6d7fa3  ldns-1.8.1.tar.gz
 
 # Hash for license file:
-sha256 9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
+sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 9c248bbc19..7deca978da 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLDNS_VERSION = 1.7.1
+LIBLDNS_VERSION = 1.8.1
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
