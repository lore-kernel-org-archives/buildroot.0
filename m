Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC27EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 20:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74E1440A94;
	Sat, 24 Jun 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74E1440A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cH5hLOAsPLeK; Sat, 24 Jun 2023 20:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6A87403F8;
	Sat, 24 Jun 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A87403F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD441BF3D8
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 100A2403F8
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 100A2403F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoIzfNkFcMDg for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 20:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C96B40235
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C96B40235
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A48984600; Sat, 24 Jun 2023 20:52:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 22:52:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55d0c96e0a4b8d26a421dd04d874f499af9c2ba8
X-Git-Newrev: c4eb3544a0fb8023678f35556a9a359d806cac4a
X-Patchwork-Hint: ignore
Message-Id: <20230624205257.2A48984600@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ubus: bump version to f787c97
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4eb3544a0fb8023678f35556a9a359d806cac4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  - 66baa44b8dee libubus: introduce new status messages
  - b3cd5ab4c010 cli: use UBUS_STATUS_PARSE_ERROR
  - 584f56a23314 cli: improve error logging for call command
  - 2f793a4eb063 lua: add optional path filter to objects() method
  - 2bebf93cd334 ubusd: handle invoke on event object without data
  - 9913aa61de73 ubusd: add lookup command queuing support
  - f787c97b3489 libubus: add missing uloop_fd_delete call in ubus_shutdown

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ubus/ubus.hash | 2 +-
 package/ubus/ubus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index 2b7181e5d2..faa2e2626e 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  275d184006f2f60c9b0172d8fd0ccc8952f182960c0d3d0945be640873c1bef6  ubus-a72457b61df045d3c499a6211362b751710590d7-br1.tar.gz
+sha256  e3022aa3cf6c38a4d3c0d798d9a9c7069ada063a0a5fe6894b466b71b17ce9cc  ubus-f787c97b34894a38b15599886cacbca01271684f-br1.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index fa856fb36a..1f9891411a 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBUS_VERSION = a72457b61df045d3c499a6211362b751710590d7
+UBUS_VERSION = f787c97b34894a38b15599886cacbca01271684f
 UBUS_SITE = https://git.openwrt.org/project/ubus.git
 UBUS_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
