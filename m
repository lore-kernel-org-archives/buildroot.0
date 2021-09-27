Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A235EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:41:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F0760F46
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62F0760F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 350C681852;
	Mon, 27 Sep 2021 14:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDmJydcF3N7r; Mon, 27 Sep 2021 14:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99C6F8188A;
	Mon, 27 Sep 2021 14:41:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 670691BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6A5580E6E
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HB_i1zMSVBxf for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA26481852
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AB28B8D266; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:34:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ace87cd389efcbc7323ca503a3096e9dcdc6e215
X-Git-Newrev: 29af6acca2a163b56d8cb39bec050e80f610fc23
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.AB28B8D266@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid: bump to version 2.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=29af6acca2a163b56d8cb39bec050e80f610fc23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces on the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-urwid/python-urwid.hash | 8 ++++----
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index 51a6e12ea1..3d7be017a7 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5	c70a7016fa1ad2c2a979dbebd4de78c2  urwid-2.0.1.tar.gz
-sha256	644d3e3900867161a2fc9287a9762753d66bd194754679adb26aede559bcccbc  urwid-2.0.1.tar.gz
-# Locally computed sha256
-sha256	36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
+md5  f7f4e6bed9ba38965dbd619520f39287  urwid-2.1.2.tar.gz
+sha256  588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae  urwid-2.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index f8a370234c..78b369ef86 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 2.0.1
+PYTHON_URWID_VERSION = 2.1.2
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/c7/90/415728875c230fafd13d118512bde3184d810d7bf798a631abc05fac09d0
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/94/3f/e3010f4a11c08a5690540f7ebd0b0d251cc8a456895b7e49be201f73540c
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
