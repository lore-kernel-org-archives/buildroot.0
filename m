Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BEDC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE7434093A;
	Tue, 23 Aug 2022 19:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE7434093A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeNJz_q6c2EV; Tue, 23 Aug 2022 19:41:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB4DF40922;
	Tue, 23 Aug 2022 19:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB4DF40922
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E44C91BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD2EB4016C
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD2EB4016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Slj7lEviw6IK for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:41:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C4F24011C
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C4F24011C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E255587B33; Tue, 23 Aug 2022 19:26:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 21:41:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ff0bbbb76fe5addbc970449c9627ab864a3c6d43
X-Git-Newrev: dba15762cf9f5fd93b8bf2c37e5b68cfb71872b3
X-Patchwork-Hint: ignore
Message-Id: <20220823192638.E255587B33@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-typing-inspect:
 bump to version 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dba15762cf9f5fd93b8bf2c37e5b68cfb71872b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typing-inspect/python-typing-inspect.hash | 4 ++--
 package/python-typing-inspect/python-typing-inspect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-inspect/python-typing-inspect.hash b/package/python-typing-inspect/python-typing-inspect.hash
index f3ff6b642b..737373d609 100644
--- a/package/python-typing-inspect/python-typing-inspect.hash
+++ b/package/python-typing-inspect/python-typing-inspect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspect/json
-md5  1444feceb8213bd94cfece3c6d4ffc5c  typing_inspect-0.7.1.tar.gz
-sha256  047d4097d9b17f46531bf6f014356111a1b6fb821a24fe7ac909853ca2a782aa  typing_inspect-0.7.1.tar.gz
+md5  d56c8277a55d0bf061275df1ea3785d5  typing_inspect-0.8.0.tar.gz
+sha256  8b1ff0c400943b6145df8119c41c244ca8207f1f10c9c057aeed1560e4806e3d  typing_inspect-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f9d3567d00ca2337f769fb28c553cc590213ecefed4ed599110c10ded2ea0117  LICENSE
diff --git a/package/python-typing-inspect/python-typing-inspect.mk b/package/python-typing-inspect/python-typing-inspect.mk
index eef1f0b586..8573bb1c27 100644
--- a/package/python-typing-inspect/python-typing-inspect.mk
+++ b/package/python-typing-inspect/python-typing-inspect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECT_VERSION = 0.7.1
+PYTHON_TYPING_INSPECT_VERSION = 0.8.0
 PYTHON_TYPING_INSPECT_SOURCE = typing_inspect-$(PYTHON_TYPING_INSPECT_VERSION).tar.gz
-PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/c3/da/864ce66818e308b38209d4b1ef0585921d28eb07621ba7d905a0e96bcc80
+PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/72/23/bed3ea644bcd77ffe9a7f591eb058c00739747e33ab94d80cc4319ddee8e
 PYTHON_TYPING_INSPECT_SETUP_TYPE = setuptools
 PYTHON_TYPING_INSPECT_LICENSE = MIT
 PYTHON_TYPING_INSPECT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
