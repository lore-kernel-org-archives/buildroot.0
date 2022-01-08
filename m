Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE994C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FBEE817EB;
	Sat,  8 Jan 2022 09:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVVP3aiju5AQ; Sat,  8 Jan 2022 09:40:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFBDA817B3;
	Sat,  8 Jan 2022 09:39:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 895C21BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C7A941603
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0GDR0Oc3Guw for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:39:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6965A415F7
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:39:56 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout08.t-online.de (Postfix) with SMTP id 3396112410
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:39:54 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n68CX-1kAGkj0; Sat, 8 Jan 2022 10:39:54 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55032)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n68CX-0001ZO-HI
 for buildroot@buildroot.org; Sat, 08 Jan 2022 10:39:53 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 10:39:53 +0100
Message-Id: <20220108093953.1022178-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641634794-0000B7AB-4B8CEF3A/0/0 CLEAN NORMAL
X-TOI-MSGID: eab9dd41-ca50-43b7-a230-bc0383013e1b
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 70-1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which was applied upstream:
https://github.com/unicode-org/icu/commit/2dc5bea9061b4fb05cd03e21b775dd944a0eb81d

Updated license hash due to typo fixes:
https://github.com/unicode-org/icu/commit/73eca0a9c927045a3b5eafdbec9c17d2fcacd5da

Updated project URL as recommended in the release notes:
https://github.com/unicode-org/icu/releases/tag/release-70-1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-ICU-21587-Fix-memory-bug-w-baseName.patch | 112 ------------------
 package/icu/Config.in                         |   2 +-
 package/icu/icu.hash                          |   4 +-
 package/icu/icu.mk                            |   2 +-
 4 files changed, 4 insertions(+), 116 deletions(-)
 delete mode 100644 package/icu/0005-ICU-21587-Fix-memory-bug-w-baseName.patch

diff --git a/package/icu/0005-ICU-21587-Fix-memory-bug-w-baseName.patch b/package/icu/0005-ICU-21587-Fix-memory-bug-w-baseName.patch
deleted file mode 100644
index 15af976e49..0000000000
--- a/package/icu/0005-ICU-21587-Fix-memory-bug-w-baseName.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 2dc5bea9061b4fb05cd03e21b775dd944a0eb81d Mon Sep 17 00:00:00 2001
-From: Frank Tang <ftang@chromium.org>
-Date: Tue, 13 Apr 2021 15:16:50 -0700
-Subject: [PATCH] ICU-21587 Fix memory bug w/ baseName
-
-Edge cases not fixed in assign and move assign operator
-while the locale is long and call setKeywordValue with incorrect
-keyword/values.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Peter: Fixes CVE-2021-30535, adjust paths for tarball]
----
- source/common/locid.cpp          | 11 +++++++++--
- source/test/intltest/loctest.cpp | 26 ++++++++++++++++++++++++++
- source/test/intltest/loctest.h   |  2 ++
- 3 files changed, 37 insertions(+), 2 deletions(-)
-
-diff --git a/source/common/locid.cpp b/source/common/locid.cpp
-index 02cd82a7b8..3c6e5b0669 100644
---- a/source/common/locid.cpp
-+++ b/source/common/locid.cpp
-@@ -469,14 +469,18 @@ Locale& Locale::operator=(Locale&& other) U_NOEXCEPT {
-     if ((baseName != fullName) && (baseName != fullNameBuffer)) uprv_free(baseName);
-     if (fullName != fullNameBuffer) uprv_free(fullName);
- 
--    if (other.fullName == other.fullNameBuffer) {
-+    if (other.fullName == other.fullNameBuffer || other.baseName == other.fullNameBuffer) {
-         uprv_strcpy(fullNameBuffer, other.fullNameBuffer);
-+    }
-+    if (other.fullName == other.fullNameBuffer) {
-         fullName = fullNameBuffer;
-     } else {
-         fullName = other.fullName;
-     }
- 
--    if (other.baseName == other.fullName) {
-+    if (other.baseName == other.fullNameBuffer) {
-+        baseName = fullNameBuffer;
-+    } else if (other.baseName == other.fullName) {
-         baseName = fullName;
-     } else {
-         baseName = other.baseName;
-@@ -2681,6 +2685,9 @@ Locale::setKeywordValue(const char* keywordName, const char* keywordValue, UErro
-         if (fullName != fullNameBuffer) {
-             // if full Name is already on the heap, need to free it.
-             uprv_free(fullName);
-+            if (baseName == fullName) {
-+                baseName = newFullName; // baseName should not point to freed memory.
-+            }
-         }
-         fullName = newFullName;
-         status = U_ZERO_ERROR;
-diff --git a/source/test/intltest/loctest.cpp b/source/test/intltest/loctest.cpp
-index ce41a4c00e..5503b008b0 100644
---- a/source/test/intltest/loctest.cpp
-+++ b/source/test/intltest/loctest.cpp
-@@ -284,6 +284,8 @@ void LocaleTest::runIndexedTest( int32_t index, UBool exec, const char* &name, c
-     TESTCASE_AUTO(TestSetUnicodeKeywordValueNullInLongLocale);
-     TESTCASE_AUTO(TestCanonicalize);
-     TESTCASE_AUTO(TestLeak21419);
-+    TESTCASE_AUTO(TestLongLocaleSetKeywordAssign);
-+    TESTCASE_AUTO(TestLongLocaleSetKeywordMoveAssign);
-     TESTCASE_AUTO_END;
- }
- 
-@@ -6520,6 +6522,30 @@ void LocaleTest::TestSetUnicodeKeywordValueInLongLocale() {
-     }
- }
- 
-+void LocaleTest::TestLongLocaleSetKeywordAssign() {
-+    IcuTestErrorCode status(*this, "TestLongLocaleSetKeywordAssign");
-+    // A long base name, with an illegal keyword and copy constructor
-+    icu::Locale l("de_AAAAAAA1_AAAAAAA2_AAAAAAA3_AAAAAAA4_AAAAAAA5_AAAAAAA6_"
-+                  "AAAAAAA7_AAAAAAA8_AAAAAAA9_AAAAAA10_AAAAAA11_AAAAAA12_"
-+                  "AAAAAA13_AAAAAA14_AAAAAA15_AAAAAA16_AAAAAA17_AAAAAA18");
-+    Locale l2;
-+    l.setUnicodeKeywordValue("co", "12", status); // Cause an error
-+    status.reset();
-+    l2 = l; // copy operator on such bogus locale.
-+}
-+
-+void LocaleTest::TestLongLocaleSetKeywordMoveAssign() {
-+    IcuTestErrorCode status(*this, "TestLongLocaleSetKeywordMoveAssign");
-+    // A long base name, with an illegal keyword and copy constructor
-+    icu::Locale l("de_AAAAAAA1_AAAAAAA2_AAAAAAA3_AAAAAAA4_AAAAAAA5_AAAAAAA6_"
-+                  "AAAAAAA7_AAAAAAA8_AAAAAAA9_AAAAAA10_AAAAAA11_AAAAAA12_"
-+                  "AAAAAA13_AAAAAA14_AAAAAA15_AAAAAA16_AAAAAA17");
-+    Locale l2;
-+    l.setUnicodeKeywordValue("co", "12", status); // Cause an error
-+    status.reset();
-+    Locale l3 = std::move(l); // move assign
-+}
-+
- void LocaleTest::TestSetUnicodeKeywordValueNullInLongLocale() {
-     IcuTestErrorCode status(*this, "TestSetUnicodeKeywordValueNullInLongLocale");
-     const char *exts[] = {"cf", "cu", "em", "kk", "kr", "ks", "kv", "lb", "lw",
-diff --git a/source/test/intltest/loctest.h b/source/test/intltest/loctest.h
-index 05be4037bd..12a93bde53 100644
---- a/source/test/intltest/loctest.h
-+++ b/source/test/intltest/loctest.h
-@@ -156,6 +156,8 @@ class LocaleTest: public IntlTest {
-     void TestSetUnicodeKeywordValueInLongLocale();
-     void TestSetUnicodeKeywordValueNullInLongLocale();
-     void TestLeak21419();
-+    void TestLongLocaleSetKeywordAssign();
-+    void TestLongLocaleSetKeywordMoveAssign();
- 
- private:
-     void _checklocs(const char* label,
--- 
-2.20.1
-
diff --git a/package/icu/Config.in b/package/icu/Config.in
index b0c9eac83d..8b410bfdb6 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_ICU
 	help
 	  International Components for Unicode.
 
-	  http://site.icu-project.org/
+	  https://icu.unicode.org/
 
 if BR2_PACKAGE_ICU
 
diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 5ed7cc4217..56a0a5dd53 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4cba7b7acd1d3c42c44bb0c14be6637098c7faf2b330ce876bc5f3b915d09745  icu4c-69_1-src.tgz
-sha256  7915b19db903070778581ae05d8bf4ea241b34a05deb51ca4f5cbb15ea1cbba3  LICENSE
+sha256  8d205428c17bf13bb535300669ed28b338a157b1c01ae66d31d0d3e2d47c3fd5  icu4c-70_1-src.tgz
+sha256  861671f8c712aa046f8f5ac89239e6c33821636516c5d0cc8c4e1973085f27a6  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index c5d0c3eefb..7e0c96e43a 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 69-1
+ICU_VERSION = 70-1
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
