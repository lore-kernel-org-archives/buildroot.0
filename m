Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B865AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 15:52:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6197F61050
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 15:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6197F61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D2140512;
	Sun, 12 Sep 2021 15:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUQ-09y80NXg; Sun, 12 Sep 2021 15:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78D4C40513;
	Sun, 12 Sep 2021 15:52:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 999301BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 15:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88052826C8
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 15:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JkBIgmO3n05N for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 15:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9254C82684
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 15:52:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F27078A410; Sun, 12 Sep 2021 15:50:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 17:51:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c90776302c79e33ac2da7f666291c6d7960a96c3
X-Git-Newrev: 08f935ac45589fd1ac022cf295f6db6e3b677974
X-Patchwork-Hint: ignore
Message-Id: <20210912155043.F27078A410@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: anotate patches
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=08f935ac45589fd1ac022cf295f6db6e3b677974
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* add changelog and Signed-off-by to patches
* use correct name for patch 0002

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...definition-of-boost_math_no_atomic_int-on-the-command-line.patch} | 5 +++++
 ...ath-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch b/package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
similarity index 91%
rename from package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
rename to package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
index 121355d71e..063491de06 100644
--- a/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
+++ b/package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
@@ -4,6 +4,11 @@ Date: Wed, 1 Sep 2021 18:54:54 +0100
 Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the command
  line. Allows us to test/emulate platforms with no atomic integers.
 
+[buildroot@heine.tech:
+  - backport from boostorg/math 32bd6197353f6ea8e5bef01f09e25c944141acfc
+  - alter path to match boost release
+]
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 ---
  boost/math/tools/atomic.hpp | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
diff --git a/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch b/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
index 77f1217a3a..7e324e310c 100644
--- a/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
+++ b/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
@@ -6,6 +6,11 @@ Subject: [PATCH] Make no atomics a soft failure in bernoulli_details.hpp.
  bernoulli features are to be used in a no-atomics environment. Fixes
  https://github.com/boostorg/math/issues/673.
 
+[buildroot@heine.tech:
+  - backport from boostorg/math 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b
+  - alter path to match boost release
+]
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 ---
  .../detail/bernoulli_details.hpp                 | 10 +++++++---
  libs/math/test/Jamfile.v2                        |  3 +++
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
