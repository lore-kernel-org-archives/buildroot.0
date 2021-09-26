Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F754C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:00:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F6D60F39
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01F6D60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFF6F6071A;
	Sun, 26 Sep 2021 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wi1vGe7xnCel; Sun, 26 Sep 2021 21:00:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36AF60759;
	Sun, 26 Sep 2021 21:00:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACD661BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A97B581A3E
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udo2uIl99BZB for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02639819F3
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 64F038D2AF; Sun, 26 Sep 2021 20:57:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:15:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f364c1d70c8f43975c318d181785f7fe6448d029
X-Git-Newrev: 317e1473a024533ad76b4580f8a78eb1ead711eb
X-Patchwork-Hint: ignore
Message-Id: <20210926205756.64F038D2AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-jinja2: bump to
 version 1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=317e1473a024533ad76b4580f8a78eb1ead711eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash | 4 ++--
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
index 44e2ae463f..fbf244e470 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-jinja2/json
-md5  d474a6440ac906a9d818a03a540830ba  aiohttp-jinja2-1.4.2.tar.gz
-sha256  9c22a0e48e3b277fc145c67dd8c3b8f609dab36bce9eb337f70dfe716663c9a0  aiohttp-jinja2-1.4.2.tar.gz
+md5  50f74689fd60a5bc0b0a74545277e9bc  aiohttp-jinja2-1.5.tar.gz
+sha256  7c3ba5eac060b691f4e50534af2d79fca2a75712ebd2b25e6fcb1295859f910b  aiohttp-jinja2-1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  d9d867affaeac220a60381cc544681dcd37c668ed6ea5ddbf9948617f828889a  LICENSE
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
index 724acdb601..371b4f0b3e 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_JINJA2_VERSION = 1.4.2
+PYTHON_AIOHTTP_JINJA2_VERSION = 1.5
 PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
-PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/da/4f/3b1a0c7177fdb0417308a95bfa8340f19cf84b44f8f2d734cd3052f56644
+PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/15/d7/8bdbdb65e2926de332d3c430839d655db61d30a7b5a4a9b2edafbeb3aa20
 PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
