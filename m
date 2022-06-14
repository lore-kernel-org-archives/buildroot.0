Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28463C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E631D40A67;
	Tue, 14 Jun 2022 18:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3S30wnO6dW-N; Tue, 14 Jun 2022 18:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2525F40B0B;
	Tue, 14 Jun 2022 18:48:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4777E1BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44AC060A78
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BURERGs93L10 for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F85F6058A
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 80585870E1; Tue, 14 Jun 2022 18:36:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:10:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0eadc83b9f20de6dfd24ae02ddf174e947dbb331
X-Git-Newrev: 78e5a9c40e0754bbe840ef7b8da85efc28eb8b48
X-Patchwork-Hint: ignore
Message-Id: <20220614183634.80585870E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: security bump version to
 2.4.54
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

commit: https://git.buildroot.net/buildroot/commit/?id=78e5a9c40e0754bbe840ef7b8da85efc28eb8b48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.54

Fixes CVE-2022-26377, CVE-2022-28330, CVE-2022-28614, CVE-2022-28615,
CVE-2022-29404, CVE-2022-30522, CVE-2022-30556 and CVE-2022-31813.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 11dcdefe46..2c21a5bab8 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.53.tar.bz2.{sha256,sha512}
-sha256  d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63  httpd-2.4.53.tar.bz2
-sha512  07ef59594251a30a864cc9cc9a58ab788c2d006cef85b728f29533243927c63cb063e0867f2a306f37324c3adb9cf7dcb2402f3516b05c2c6f32469d475dd756  httpd-2.4.53.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.54.tar.bz2.{sha256,sha512}
+sha256  eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340  httpd-2.4.54.tar.bz2
+sha512  228493b2ff32c4142c6e484d304f2ea12e467498605fe12adce2b61388d8efe7b2e96ae2fd0abd1dc88a5f12d625e007d8da0ae5628cff2a5272806754f41e18  httpd-2.4.54.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index a6fb59d26b..315282baac 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.53
+APACHE_VERSION = 2.4.54
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
