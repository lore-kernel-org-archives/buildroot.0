Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDB7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 07:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAC1E84CB9;
	Sat, 28 May 2022 07:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CXIM3HxgqOkQ; Sat, 28 May 2022 07:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E268C84CB2;
	Sat, 28 May 2022 07:09:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3A821BF2C4
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFB4561037
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 07:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uE_zOXfR_saI for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38FF760BED
 for <buildroot@buildroot.org>; Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2932983C67; Sat, 28 May 2022 06:57:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 08:33:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 57296ad4baf7a99f375b26bf122ed8e927d43061
X-Git-Newrev: c7f645976a802f6c730e0af459739923a3060c4f
X-Patchwork-Hint: ignore
Message-Id: <20220528065730.2932983C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/kvm-unit-tests:
 fix license information
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7f645976a802f6c730e0af459739923a3060c4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Some files in kvm-unit-tests are licensed under the GPL v2 nowadays:

 https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/b29b222beb424a00

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
[yann.morin.1998@free.fr: do not replace LGPLGv2, add to the list]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8c05e5a069cf037a9ff314effd6415a433ac40cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index a972602fb9..97511c4f07 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -7,7 +7,7 @@
 KVM_UNIT_TESTS_VERSION = kvm-unit-tests-20171020
 KVM_UNIT_TESTS_SITE = https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
 KVM_UNIT_TESTS_SITE_METHOD = git
-KVM_UNIT_TESTS_LICENSE = LGPL-2.0
+KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
 ifeq ($(BR2_arm),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
