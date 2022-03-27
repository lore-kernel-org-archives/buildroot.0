Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF06C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C77740993;
	Sun, 27 Mar 2022 15:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cCjJxysLFzs; Sun, 27 Mar 2022 15:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F41D4087B;
	Sun, 27 Mar 2022 15:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64DAC1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CE5B409A0
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8uEybKZS09yJ for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E6B1409A7
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4AE9E85D65; Sun, 27 Mar 2022 15:37:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:33:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f5c5703464514e4b3773ac5590556ba301a2754
X-Git-Newrev: 92dfa760ad556e16340305e94fe1ed1e0dbc1798
X-Patchwork-Hint: ignore
Message-Id: <20220327153712.4AE9E85D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pugixml: bump to version 1.12.1
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
Content-Type: multipart/mixed; boundary="===============6352203614110554691=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6352203614110554691==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=92dfa760ad556e16340305e94fe1ed1e0dbc1798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file has updated the copyright year to 2022, therefore
update the hash of the license file as well.

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pugixml/pugixml.hash | 4 ++--
 package/pugixml/pugixml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
index 5c629ac66f..190dfb6a6e 100644
--- a/package/pugixml/pugixml.hash
+++ b/package/pugixml/pugixml.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8ddf57b65fb860416979a3f0640c2ad45ddddbbafa82508ef0a0af3ce7061716  pugixml-1.11.4.tar.gz
-sha256  ee495f34aeff0c578a99f3350a2050d4e5860d27b2004c03c384a594fa2b0a7a  LICENSE.md
+sha256  dcf671a919cc4051210f08ffd3edf9e4247f79ad583c61577a13ee93af33afc7  pugixml-1.12.1.tar.gz
+sha256  206f671b6d342557adcc973088c2c638df0ec0b1dabbcd24e65aadd2191778d2  LICENSE.md
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index bc018180ef..9137f04630 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUGIXML_VERSION = 1.11.4
+PUGIXML_VERSION = 1.12.1
 PUGIXML_SITE = https://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md

--===============6352203614110554691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6352203614110554691==--
