Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8F2C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B584560AB0;
	Sat,  5 Nov 2022 22:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B584560AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSBsLQSjBlgW; Sat,  5 Nov 2022 22:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E44A1607E1;
	Sat,  5 Nov 2022 22:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E44A1607E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EA4C1BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E834140355
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E834140355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5w7lKtp430D for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:11:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2C9940350
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C9940350
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1AB387F3D; Sat,  5 Nov 2022 22:11:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:08:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3c79a8ba80d984bfa42b4868dc4cbd474381efd3
X-Git-Newrev: dbd5a684e00e01ceab95b9db00d2915a4d75a1a8
X-Patchwork-Hint: ignore
Message-Id: <20221105221107.D1AB387F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-yatl: bump to
 version 20220907.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbd5a684e00e01ceab95b9db00d2915a4d75a1a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-yatl/python-yatl.hash | 4 ++--
 package/python-yatl/python-yatl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
index 8ce192bf95..61391f6370 100644
--- a/package/python-yatl/python-yatl.hash
+++ b/package/python-yatl/python-yatl.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/yatl/json
-md5  551136eba4c5551c01b051341b190641  yatl-20211217.1.tar.gz
-sha256  d22bf7abe40d9bdd16bd15824d2df65e65e405df6ecb8601fdc7c233bf6b3004  yatl-20211217.1.tar.gz
+md5  f02b367e1c56af94eafd5bd1019c03be  yatl-20220907.1.tar.gz
+sha256  67d43ad79e1f58d8552718018470856a2ad210bdfeec42e978b28b1b21560d00  yatl-20220907.1.tar.gz
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index 12a8039891..0c33971b89 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YATL_VERSION = 20211217.1
+PYTHON_YATL_VERSION = 20220907.1
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/03/05/0be8164e8151fd8c96caeb2560f955dc2dc1a969f0868f48c046cd863fe6
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/09/68/0c9d0a1192fdad5f3d38db096106c5adabb9b26c9ae107897997f56d1788
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
