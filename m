Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E09C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70560428D1;
	Fri, 27 May 2022 09:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3M6ETZ1geDSH; Fri, 27 May 2022 09:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B30D428BE;
	Fri, 27 May 2022 09:41:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACFCF1BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F7DA84A86
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VaUy0MJx09nU for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAA7484819
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A9E528662C; Fri, 27 May 2022 09:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:53:29 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1e777a9f95b9a349c7d8d428b25b548a84aa3159
X-Git-Newrev: 276f15765205d6bd82768d97d22d74634134c7ea
X-Patchwork-Hint: ignore
Message-Id: <20220527092724.A9E528662C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python3: bump to
 version 3.10.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=276f15765205d6bd82768d97d22d74634134c7ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Drop override system locale patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9cf8f4e13424a79ab2af2945e565e1cfb0dd4bf3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...011-Add-importlib-fix-for-PEP-3147-issue.patch} |  0
 ...stem-locale-and-set-to-default-when-addin.patch | 39 ----------------------
 ...h => 0012-Add-an-option-to-disable-pydoc.patch} |  0
 ...=> 0013-Add-an-option-to-disable-lib2to3.patch} |  0
 ...Add-option-to-disable-the-sqlite3-module.patch} |  0
 ...5-Add-an-option-to-disable-the-tk-module.patch} |  0
 ...d-an-option-to-disable-the-curses-module.patch} |  0
 ...h => 0017-Add-an-option-to-disable-expat.patch} |  0
 ...0018-Add-an-option-to-disable-CJK-codecs.patch} |  0
 ...tch => 0019-Add-an-option-to-disable-NIS.patch} |  0
 ...020-Add-an-option-to-disable-unicodedata.patch} |  0
 ...ch => 0021-Add-an-option-to-disable-IDLE.patch} |  0
 ...=> 0022-Add-an-option-to-disable-decimal.patch} |  0
 ...option-to-disable-the-ossaudiodev-module.patch} |  0
 ...Add-an-option-to-disable-openssl-support.patch} |  0
 ...an-option-to-disable-the-readline-module.patch} |  0
 ...ons-to-disable-zlib-bzip2-and-xz-modules.patch} |  0
 ...7-python-config.sh-don-t-reassign-prefix.patch} |  0
 ...0028-Fix-cross-compiling-the-uuid-module.patch} |  0
 ...029-Add-an-option-to-disable-uuid-module.patch} |  0
 ...0030-fix-building-on-older-distributions.patch} |  0
 ...-fixup-CC-print-multiarch-output-for-mus.patch} |  0
 ...-option-to-disable-the-berkeleydb-module.patch} |  0
 ...libc-ng-doesn-t-set-errno-when-encryptio.patch} |  0
 package/python3/python3.hash                       |  6 ++--
 package/python3/python3.mk                         |  2 +-
 26 files changed, 4 insertions(+), 43 deletions(-)

diff --git a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0011-Add-importlib-fix-for-PEP-3147-issue.patch
similarity index 100%
rename from package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
rename to package/python3/0011-Add-importlib-fix-for-PEP-3147-issue.patch
diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
deleted file mode 100644
index 4d021d86a4..0000000000
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e4ae670e3489544a49dabd1618c32fe73504a7ba Mon Sep 17 00:00:00 2001
-From: Samuel Cabrero <samuelcabrero@gmail.com>
-Date: Wed, 23 Dec 2015 11:45:48 +0100
-Subject: [PATCH] Override system locale and set to default when adding gcc
- paths
-
-Forces the use of the default locale in the function
-add_gcc_paths, which is called when cross compiling to add the
-include and library paths. This is necessary because otherwise
-the gcc output is localized and the output parsing fails, which
-results in no paths added and detect_modules not able to find
-any system library (eg. libz, libssl, etc.)
-
-[Thomas: patch taken from https://bugs.python.org/issue23767.]
-
-Signed-off-by: Samuel Cabrero <samuelcabrero@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[james.hilliard1@gmail.com: adapt to python 3.9]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index d3f0e663f2..926c16f58f 100644
---- a/setup.py
-+++ b/setup.py
-@@ -761,7 +761,7 @@ class PyBuildExt(build_ext):
-         tmpfile = os.path.join(self.build_temp, 'ccpaths')
-         if not os.path.exists(self.build_temp):
-             os.makedirs(self.build_temp)
--        ret = run_command('%s -E -v - </dev/null 2>%s 1>/dev/null' % (CC, tmpfile))
-+        ret = run_command('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (CC, tmpfile))
-         is_gcc = False
-         is_clang = False
-         in_incdirs = False
--- 
-2.25.1
-
diff --git a/package/python3/0013-Add-an-option-to-disable-pydoc.patch b/package/python3/0012-Add-an-option-to-disable-pydoc.patch
similarity index 100%
rename from package/python3/0013-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0012-Add-an-option-to-disable-pydoc.patch
diff --git a/package/python3/0014-Add-an-option-to-disable-lib2to3.patch b/package/python3/0013-Add-an-option-to-disable-lib2to3.patch
similarity index 100%
rename from package/python3/0014-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0013-Add-an-option-to-disable-lib2to3.patch
diff --git a/package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0014-Add-option-to-disable-the-sqlite3-module.patch
similarity index 100%
rename from package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
rename to package/python3/0014-Add-option-to-disable-the-sqlite3-module.patch
diff --git a/package/python3/0016-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0015-Add-an-option-to-disable-the-tk-module.patch
similarity index 100%
rename from package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
rename to package/python3/0015-Add-an-option-to-disable-the-tk-module.patch
diff --git a/package/python3/0017-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0016-Add-an-option-to-disable-the-curses-module.patch
similarity index 100%
rename from package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
rename to package/python3/0016-Add-an-option-to-disable-the-curses-module.patch
diff --git a/package/python3/0018-Add-an-option-to-disable-expat.patch b/package/python3/0017-Add-an-option-to-disable-expat.patch
similarity index 100%
rename from package/python3/0018-Add-an-option-to-disable-expat.patch
rename to package/python3/0017-Add-an-option-to-disable-expat.patch
diff --git a/package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0018-Add-an-option-to-disable-CJK-codecs.patch
similarity index 100%
rename from package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
rename to package/python3/0018-Add-an-option-to-disable-CJK-codecs.patch
diff --git a/package/python3/0020-Add-an-option-to-disable-NIS.patch b/package/python3/0019-Add-an-option-to-disable-NIS.patch
similarity index 100%
rename from package/python3/0020-Add-an-option-to-disable-NIS.patch
rename to package/python3/0019-Add-an-option-to-disable-NIS.patch
diff --git a/package/python3/0021-Add-an-option-to-disable-unicodedata.patch b/package/python3/0020-Add-an-option-to-disable-unicodedata.patch
similarity index 100%
rename from package/python3/0021-Add-an-option-to-disable-unicodedata.patch
rename to package/python3/0020-Add-an-option-to-disable-unicodedata.patch
diff --git a/package/python3/0022-Add-an-option-to-disable-IDLE.patch b/package/python3/0021-Add-an-option-to-disable-IDLE.patch
similarity index 100%
rename from package/python3/0022-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0021-Add-an-option-to-disable-IDLE.patch
diff --git a/package/python3/0023-Add-an-option-to-disable-decimal.patch b/package/python3/0022-Add-an-option-to-disable-decimal.patch
similarity index 100%
rename from package/python3/0023-Add-an-option-to-disable-decimal.patch
rename to package/python3/0022-Add-an-option-to-disable-decimal.patch
diff --git a/package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0023-Add-an-option-to-disable-the-ossaudiodev-module.patch
similarity index 100%
rename from package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch
rename to package/python3/0023-Add-an-option-to-disable-the-ossaudiodev-module.patch
diff --git a/package/python3/0025-Add-an-option-to-disable-openssl-support.patch b/package/python3/0024-Add-an-option-to-disable-openssl-support.patch
similarity index 100%
rename from package/python3/0025-Add-an-option-to-disable-openssl-support.patch
rename to package/python3/0024-Add-an-option-to-disable-openssl-support.patch
diff --git a/package/python3/0026-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0025-Add-an-option-to-disable-the-readline-module.patch
similarity index 100%
rename from package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
rename to package/python3/0025-Add-an-option-to-disable-the-readline-module.patch
diff --git a/package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0026-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
similarity index 100%
rename from package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
rename to package/python3/0026-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
diff --git a/package/python3/0028-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0027-python-config.sh-don-t-reassign-prefix.patch
similarity index 100%
rename from package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
rename to package/python3/0027-python-config.sh-don-t-reassign-prefix.patch
diff --git a/package/python3/0029-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0028-Fix-cross-compiling-the-uuid-module.patch
similarity index 100%
rename from package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
rename to package/python3/0028-Fix-cross-compiling-the-uuid-module.patch
diff --git a/package/python3/0030-Add-an-option-to-disable-uuid-module.patch b/package/python3/0029-Add-an-option-to-disable-uuid-module.patch
similarity index 100%
rename from package/python3/0030-Add-an-option-to-disable-uuid-module.patch
rename to package/python3/0029-Add-an-option-to-disable-uuid-module.patch
diff --git a/package/python3/0031-fix-building-on-older-distributions.patch b/package/python3/0030-fix-building-on-older-distributions.patch
similarity index 100%
rename from package/python3/0031-fix-building-on-older-distributions.patch
rename to package/python3/0030-fix-building-on-older-distributions.patch
diff --git a/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0031-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 100%
rename from package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0031-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
diff --git a/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0032-Add-an-option-to-disable-the-berkeleydb-module.patch
similarity index 100%
rename from package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
rename to package/python3/0032-Add-an-option-to-disable-the-berkeleydb-module.patch
diff --git a/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0033-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 100%
rename from package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0033-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 97f4653490..5ae0add789 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3102/
-md5  14e8c22458ed7779a1957b26cde01db9  Python-3.10.2.tar.xz
+# From https://www.python.org/downloads/release/python-3104/
+md5  21f2e113e087083a1e8cf10553d93599  Python-3.10.4.tar.xz
 # Locally computed
-sha256  17de3ac7da9f2519aa9d64378c603a73a0e9ad58dffa8812e45160c086de64c7  Python-3.10.2.tar.xz
+sha256  80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19  Python-3.10.4.tar.xz
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3a334fb28d..cffb34e264 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.10
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
