Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDCBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55A6D8176F;
	Sun, 20 Mar 2022 17:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ms9pFbyUApfB; Sun, 20 Mar 2022 17:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E38A80C26;
	Sun, 20 Mar 2022 17:09:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7113B1BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DCAC402F6
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lByiztpM9OLr for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:07:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C067400D9
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:07:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9890284551; Sun, 20 Mar 2022 16:58:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 18:06:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3398e8e6d4ecb3e06be6e41daf0a7a6542dc5116
X-Git-Newrev: 6db3b6d48cae3c3a9ad7c3977b373d4a60d6e787
X-Patchwork-Hint: ignore
Message-Id: <20220320165813.9890284551@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snmppp: bump to version 3.4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=6db3b6d48cae3c3a9ad7c3977b373d4a60d6e787
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
