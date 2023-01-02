Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DCEC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 16:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3032408E0;
	Mon,  2 Jan 2023 16:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3032408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbisEjAGuSOr; Mon,  2 Jan 2023 16:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A1EB408DD;
	Mon,  2 Jan 2023 16:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A1EB408DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F9621BF2EC
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 16:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18E3C4090E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 16:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E3C4090E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1C8IwldYrN0v for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7965840919
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7965840919
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6708C87119; Mon,  2 Jan 2023 16:57:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Jan 2023 17:53:12 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 421787e3ad596cb3d18f56e0114cac7ade0800ba
X-Git-Newrev: 0f93339159b7da0b07831ae47377d39c8aed0d4d
X-Patchwork-Hint: ignore
Message-Id: <20230102165752.6708C87119@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/dbus-cxx: bump to
 version 2.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f93339159b7da0b07831ae47377d39c8aed0d4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f99714d90e08994c697576ca2030cb9392d7b63e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-cxx/dbus-cxx.hash | 2 +-
 package/dbus-cxx/dbus-cxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
index acb059b91d..6a7a634ced 100644
--- a/package/dbus-cxx/dbus-cxx.hash
+++ b/package/dbus-cxx/dbus-cxx.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  45663b6dbc289f133dfdcd8b8de771de3a2d54588954c2eec3f97888b03bd8ad  dbus-cxx-2.3.0.tar.gz
+sha256  88d4bd1d9af8563bda03f24b26ffe4efbc555ca82ac664ced572b053928f739a  dbus-cxx-2.3.1.tar.gz
 sha256  99e5d0ad951d96567a6f9a17f3f17ac000c0582f53357c7f3601851c2dcbb786  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
index 43556195c7..554acaa67d 100644
--- a/package/dbus-cxx/dbus-cxx.mk
+++ b/package/dbus-cxx/dbus-cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_CXX_VERSION = 2.3.0
+DBUS_CXX_VERSION = 2.3.1
 DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
 DBUS_CXX_LICENSE = LGPL-3.0+ or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
 DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
