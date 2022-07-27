Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85424C19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B0EB81A73;
	Wed, 27 Jul 2022 08:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B0EB81A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1XPLRUO-LPy; Wed, 27 Jul 2022 08:30:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3664181A65;
	Wed, 27 Jul 2022 08:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3664181A65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9EEB1BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0E564098A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0E564098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQ8dnMcOVrPC for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:30:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 845F340940
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 845F340940
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D4BCB864A0; Wed, 27 Jul 2022 08:17:04 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 10:30:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b6bce65981db6974bffc5bb4860fb44d15efe20
X-Git-Newrev: 1702ddd20cf1b7900151ab322ac26cf71368f010
X-Patchwork-Hint: ignore
Message-Id: <20220727081704.D4BCB864A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/toolchain/test_aarch64_64k.py: fix flake8 errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=1702ddd20cf1b7900151ab322ac26cf71368f010
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

support/testing/tests/toolchain/test_aarch64_64k.py:35:5: E303 too many blank lines (2)
support/testing/tests/toolchain/test_aarch64_64k.py:40:65: W605 invalid escape sequence '\('
support/testing/tests/toolchain/test_aarch64_64k.py:45:1: E302 expected 2 blank lines, found 1
support/testing/tests/toolchain/test_aarch64_64k.py:52:1: E302 expected 2 blank lines, found 1
support/testing/tests/toolchain/test_aarch64_64k.py:59:1: E302 expected 2 blank lines, found 1
support/testing/tests/toolchain/test_aarch64_64k.py:65:1: W391 blank line at end of file

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/toolchain/test_aarch64_64k.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/toolchain/test_aarch64_64k.py b/support/testing/tests/toolchain/test_aarch64_64k.py
index 59c7834360..c038e9960f 100644
--- a/support/testing/tests/toolchain/test_aarch64_64k.py
+++ b/support/testing/tests/toolchain/test_aarch64_64k.py
@@ -31,17 +31,17 @@ class TestAarch64Pages64kBase(infra.basetest.BRTest):
                            options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
         self.emulator.login()
 
-
     def test_run(self):
         self.login()
 
         cmd = "dmesg | grep 'Dentry cache'"
         output, exit_code = self.emulator.run(cmd, 120)
-        r = re.match(".*Dentry cache hash table entries: [0-9]* \(order: ([0-9]*), ([0-9]*) bytes.*", output[0])
+        r = re.match(r".*Dentry cache hash table entries: [0-9]* \(order: ([0-9]*), ([0-9]*) bytes.*", output[0])
         order = int(r.group(1))
         size = int(r.group(2))
         self.assertEqual(2 ** order * 64 * 1024, size)
 
+
 class TestAarch64Pages64kGlibc(TestAarch64Pages64kBase):
     __test__ = True
     config = TestAarch64Pages64kBase.config + \
@@ -49,6 +49,7 @@ class TestAarch64Pages64kGlibc(TestAarch64Pages64kBase):
         BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
         """
 
+
 class TestAarch64Pages64kuClibc(TestAarch64Pages64kBase):
     __test__ = True
     config = TestAarch64Pages64kBase.config + \
@@ -56,10 +57,10 @@ class TestAarch64Pages64kuClibc(TestAarch64Pages64kBase):
         BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
         """
 
+
 class TestAarch64Pages64kMusl(TestAarch64Pages64kBase):
     __test__ = True
     config = TestAarch64Pages64kBase.config + \
         """
         BR2_TOOLCHAIN_BUILDROOT_MUSL=y
         """
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
