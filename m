Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B555FC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6488884BEF;
	Sat, 23 Jul 2022 17:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6488884BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4oq2B65q1Ed; Sat, 23 Jul 2022 17:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FA484BB1;
	Sat, 23 Jul 2022 17:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69FA484BB1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC44E1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8704A84BB1
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8704A84BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmTAoIwyH8No for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:50:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBDD88499E
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBDD88499E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 76FBC82195; Sat, 23 Jul 2022 17:36:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 19:50:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf178754efbb8cc32f2aacc94327d34484e1d738
X-Git-Newrev: 2c8d95256024c82e788c1cc734fe2b2819d67313
X-Patchwork-Hint: ignore
Message-Id: <20220723173646.76FBC82195@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alembic: bump to version
 1.8.0
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
Content-Type: multipart/mixed; boundary="===============1168471961150540885=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1168471961150540885==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2c8d95256024c82e788c1cc734fe2b2819d67313
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 8f5cbb6fa3..6a6782b397 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  44e82341a6ee0a42f63dc1f51caf91e6  alembic-1.7.7.tar.gz
-sha256  4961248173ead7ce8a21efb3de378f13b8398e6630fab0eb258dc74a8af24c58  alembic-1.7.7.tar.gz
+md5  3d336c248990cafc69ea403d6af18994  alembic-1.8.0.tar.gz
+sha256  a2d4d90da70b30e70352cd9455e35873a255a31402a438fe24815758d7a0e5e1  alembic-1.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f0e3f7a5080879ccae798882d9bee3d48fe335d0bad84ca8eec86fa594375ea0  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 8ba32647ab..d40acef5f7 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.7.7
+PYTHON_ALEMBIC_VERSION = 1.8.0
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/30/b9/5526b43a4c54d177ab14af0af4b5c31d73db33d1ad3e30976d3b023e0594
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/43/f2/f6096d23eb43d436f7c3408a6c83f82a1c704bfb50fb608574b048484480
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE

--===============1168471961150540885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1168471961150540885==--
