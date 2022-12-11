Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DADC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06D69813CA;
	Sun, 11 Dec 2022 08:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06D69813CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80GuKR8SDHbT; Sun, 11 Dec 2022 08:58:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A150813A0;
	Sun, 11 Dec 2022 08:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A150813A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF6041BF865
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D14881373
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D14881373
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yg40eQTs9qYX for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8987B81387
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8987B81387
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8564D85FAD; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bf1b6f75b8b2e1f1cfaa99aa62f2818b81534d6
X-Git-Newrev: 0cc120f42d8cd84cbd73e1b55a088627fc755537
X-Patchwork-Hint: ignore
Message-Id: <20221211085515.8564D85FAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jedi: bump to version 0.18.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cc120f42d8cd84cbd73e1b55a088627fc755537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-jedi/python-jedi.hash | 4 ++--
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index d0f083e942..dee8810e89 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  d8dba4a98a35530f7f5b461c20aff180  jedi-0.18.1.tar.gz
-sha256  74137626a64a99c8eb6ae5832d99b3bdd7d29a3850fe2aa80a4126b2a7d949ab  jedi-0.18.1.tar.gz
+md5  47e89a2b8bedcfeb1527fac37b9ba1b3  jedi-0.18.2.tar.gz
+sha256  bae794c30d07f6d910d32a7048af09b5a39ed740918da923c6b780790ebac612  jedi-0.18.2.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index b0508de701..40de61f0e8 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.18.1
+PYTHON_JEDI_VERSION = 0.18.2
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/c2/25/273288df952e07e3190446efbbb30b0e4871a0d63b4246475f3019d4f55e
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/15/02/afd43c5066de05f6b3188f3aa74136a3289e6c30e7a45f351546cab0928c
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
