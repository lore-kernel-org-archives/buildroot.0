Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C56C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF3C60743;
	Mon, 10 Apr 2023 19:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF3C60743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFSs6z47GNmT; Mon, 10 Apr 2023 19:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B660E613E2;
	Mon, 10 Apr 2023 19:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B660E613E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 788541C3BA7
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E3034193A
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E3034193A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ensOVWASFuim for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32D3740997
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32D3740997
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E4CD83D27; Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 20:57:08 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f0c8f43fee2640789f461d3f58d1ccae77c43109
X-Git-Newrev: 6b675eaf216b332217caf2430fe6c3f6ef6298e4
X-Patchwork-Hint: ignore
Message-Id: <20230410193614.1E4CD83D27@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/snmppp: bump to
 version 3.4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b675eaf216b332217caf2430fe6c3f6ef6298e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Update hash of src/v3.cpp, update in year and "Frank Fock" added:

 -  _##  SNMP++ v3.3
 +  _##  SNMP++ v3.4
 -  _##  Copyright (c) 2001-2013 Jochen Katz, Frank Fock
 +  _##  Copyright (c) 2001-2021 Jochen Katz, Frank Fock
 -  _##  Hewlett-Packard and Jochen Katz make no representations about the
 -  _##  suitability of this software for any purpose. It is provided
 +  _##  Hewlett-Packard, Frank Fock, and Jochen Katz make no representations
 +  _##  about the suitability of this software for any purpose. It is provided

https://www.agentpp.com/download/changes_snmp++v3.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6db3b6d48cae3c3a9ad7c3977b373d4a60d6e787)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snmppp/snmppp.hash | 4 ++--
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 2dcf836fc7..db3a4b5f4f 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a3eb75e2310c315d9b2c2094154c7cd9b46684adb80a4b36b8957dcc09af4041  snmp++-3.4.2.tar.gz
-sha256  f6fd4321c7eb6e51a272f91f964aea7f53039bb2b55f690d5a9d042f3a5d79b9  src/v3.cpp
+sha256  7c0aaf4ea21db082453f880cc2062a86dcbbf0ee6c8d47c72beb8e0c77c26b6c  snmp++-3.4.9.tar.gz
+sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 601e28e207..bc05cad583 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.4.2
+SNMPPP_VERSION = 3.4.9
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
