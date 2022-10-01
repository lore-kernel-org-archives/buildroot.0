Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E8BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 19:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92B36409BE;
	Sat,  1 Oct 2022 19:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92B36409BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cko7y10lgl68; Sat,  1 Oct 2022 19:54:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66508408BA;
	Sat,  1 Oct 2022 19:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66508408BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C69FD1BF3BA
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAE9340526
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE9340526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTOGOaacTw1t for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 19:53:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7B8540179
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 19:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7B8540179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D33FD86708; Sat,  1 Oct 2022 19:53:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 21:51:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22d6788619b17ebbe90eeccf7d754a45ab10c05a
X-Git-Newrev: 43a40036154c16e9448bbbcf41ab3b1e296e949a
X-Patchwork-Hint: ignore
Message-Id: <20221001195349.D33FD86708@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-remi: bump version to
 2022.7.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=43a40036154c16e9448bbbcf41ab3b1e296e949a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-remi/python-remi.hash | 2 +-
 package/python-remi/python-remi.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index 4e1786a952..82234bbe98 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,2 +1,2 @@
 # sha256 from https://pypi.org/pypi/remi/json
-sha256  c8691f007dc30b91013131b6aded3521c17ef8ec9fdd152a0ad481b8cb793f14  remi-2021.3.2.tar.gz
+sha256  542df88e174bbd58fe763c49e5c2116f2c8413c1a934731069ed8c17bb9cd64c  remi-2022.7.27.tar.gz
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 609e127cf0..7e43c09b00 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = 2021.3.2
+PYTHON_REMI_VERSION = 2022.7.27
 PYTHON_REMI_SOURCE = remi-$(PYTHON_REMI_VERSION).tar.gz
-PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/c0/99/94bd825cf8baee369b959f76c802a51ccc69d4d62ec113e26db4835f710c
+PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/b7/5c/fca9d9273fc9d5f4ca0bc2f387ca19f8ba9979dcb75617d094e575dc2337
+
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_SETUP_TYPE = setuptools
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
