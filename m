Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12537C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:43:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCE7661041
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCE7661041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A069440469;
	Thu, 14 Oct 2021 21:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9guF8o9BR4Bg; Thu, 14 Oct 2021 21:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8B504058B;
	Thu, 14 Oct 2021 21:43:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D23331BF9D1
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD9A540255
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 350hImKEcuVP for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:42:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E677A40114
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:42:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ABC789525D; Thu, 14 Oct 2021 21:39:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:12:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6df212931bafadf439a78c89dba067f15163fb64
X-Git-Newrev: d1c0d89df1e16d43af0651360b68948a8d40be26
X-Patchwork-Hint: ignore
Message-Id: <20211014213946.ABC789525D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-python: bump to version 1.2.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1c0d89df1e16d43af0651360b68948a8d40be26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dbus-python/dbus-python.hash | 2 +-
 package/dbus-python/dbus-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-python/dbus-python.hash b/package/dbus-python/dbus-python.hash
index e65695d616..8d1609dec7 100644
--- a/package/dbus-python/dbus-python.hash
+++ b/package/dbus-python/dbus-python.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  11238f1d86c995d8aed2e22f04a1e3779f0d70e587caffeab4857f3c662ed5a4  dbus-python-1.2.16.tar.gz
+sha256  92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120acf7260  dbus-python-1.2.18.tar.gz
 
 # Locally calculated
 sha256  1e4562245383fdb5203b1769789e5b28bba21af4923aea7e8b2614f7f93623c0  COPYING
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index f4b8996d76..3e28aed25c 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_PYTHON_VERSION = 1.2.16
+DBUS_PYTHON_VERSION = 1.2.18
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT (dbus-python), AFL-2.1 or GPL-2.0+ (dbus-gmain)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
