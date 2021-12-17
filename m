Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045D2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B89442002;
	Fri, 17 Dec 2021 17:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jEL3l7jSMQHr; Fri, 17 Dec 2021 17:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC02842016;
	Fri, 17 Dec 2021 17:46:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FEBA1BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD75C60E74
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qstjc3cBpJgj for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1585261138
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6A7818251B; Fri, 17 Dec 2021 17:40:24 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 18:42:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6229d390124c4563f9e55da80e9bde67d3eff27
X-Git-Newrev: 9cf314745ad2e4f684aa07566163e46655ffcc5b
X-Patchwork-Hint: ignore
Message-Id: <20211217174024.6A7818251B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcl: bump to version 8.6.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cf314745ad2e4f684aa07566163e46655ffcc5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Refresh patch
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tcl/0001-dont-build-compat.patch | 14 +++++++-------
 package/tcl/tcl.hash                     |  4 ++--
 package/tcl/tcl.mk                       |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/tcl/0001-dont-build-compat.patch b/package/tcl/0001-dont-build-compat.patch
index c0d5d85da7..7a7d959cd2 100644
--- a/package/tcl/0001-dont-build-compat.patch
+++ b/package/tcl/0001-dont-build-compat.patch
@@ -7,7 +7,7 @@ anything buildroot is using as a standard C library will be good enough
 to not have broken behavior.
 
 Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
-[Fabrice: Update for 8.6.9]
+[Fabrice: Update for 8.6.12]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
 
@@ -15,11 +15,11 @@ diff --git a/unix/tcl.m4 b/unix/tcl.m4
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
 @@ -2725,7 +2725,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
-     if test ["$tcl_ok"] = 1; then
- 	AC_CACHE_CHECK([proper ]$1[ implementation], [tcl_cv_]$1[_unbroken],
- 	    AC_TRY_RUN([[int main() {]$2[}]],[tcl_cv_]$1[_unbroken]=ok,
--		[tcl_cv_]$1[_unbroken]=broken,[tcl_cv_]$1[_unbroken]=unknown))
-+		[tcl_cv_]$1[_unbroken]=broken,[tcl_cv_]$1[_unbroken]=ok))
- 	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
+ #include <stdlib.h>
+ #include <string.h>
+ int main() {]$2[}]]])],[tcl_cv_$1_unbroken=ok],
+-		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
++		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
+	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
  	    tcl_ok=1
  	else
diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index 913190b95c..2b82a1938b 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ad0cd2de2c87b9ba8086b43957a0de3eb2eb565c7159d5f53ccbba3feb915f4e  tcl8.6.9-src.tar.gz
-sha256 c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
+sha256  26c995dd0f167e48b11961d891ee555f680c175f7173ff8cb829f4ebcde4c1a6  tcl8.6.12-src.tar.gz
+sha256  c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 7c456e89b3..97754b63d0 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).9
+TCL_VERSION = $(TCL_VERSION_MAJOR).12
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = TCL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
