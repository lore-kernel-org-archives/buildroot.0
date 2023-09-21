Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B187E71064
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 12:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47CDD82ACA;
	Thu, 21 Sep 2023 12:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47CDD82ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JleRiCJ-rWJH; Thu, 21 Sep 2023 12:45:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93D1182909;
	Thu, 21 Sep 2023 12:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D1182909
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCF741BF3AD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A514141F5E
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A514141F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiRp6QJP38QZ for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 12:44:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67B5F41EC3
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67B5F41EC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D6248744D; Thu, 21 Sep 2023 12:44:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 14:28:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45c41098ef50e50c4b0aa426e90e5758bf7bc330
X-Git-Newrev: 40a2d729fd330e671624a587cee4eed1a36b9a9c
X-Patchwork-Hint: ignore
Message-Id: <20230921124457.4D6248744D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: bump version to 3.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=40a2d729fd330e671624a587cee4eed1a36b9a9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.4.0/NEWS

Licenses updates:
- BSD-3-Clause for xsl:
  https://github.com/postgis/postgis/commit/1a525819301c7b715a74cd1549142dede3e34e49

- Update urls and add SFCGAL links and licenses:
  https://github.com/postgis/postgis/commit/0015540bc60b716e169f9d2c928897e997bf8632

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgis/postgis.hash | 4 ++--
 package/postgis/postgis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 8550a57939..812d2dc017 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9a2a219da005a1730a39d1959a1c7cec619b1efb009b65be80ffc25bad299068  postgis-3.3.2.tar.gz
-sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
+sha256  aee9b60a6c884d354164b3096c4657f324454186607f859d1ce05d899798af9d  postgis-3.4.0.tar.gz
+sha256  2a3bde0a77224496ea6d8efa686da7e29ab0dd6b1a8f90ba12beaf7ae28e878a  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 4148180adf..2fb98245a3 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.3.2
+POSTGIS_VERSION = 3.4.0
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-2-Clause, MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
+POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-3-Clause (xsl), GPL-2.0+ or LGPL-3.0+ (SFCGAL), MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
 POSTGIS_LICENSE_FILES = LICENSE.TXT
 POSTGIS_CPE_ID_VENDOR = postgis
 # configure.ac is patched so need to run autoreconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
