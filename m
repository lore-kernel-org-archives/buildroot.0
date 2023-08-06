Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B186C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2061281746;
	Sun,  6 Aug 2023 12:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2061281746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qhVTXXxOFgb; Sun,  6 Aug 2023 12:06:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F94181E3B;
	Sun,  6 Aug 2023 12:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F94181E3B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 078111BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91A0781E11
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91A0781E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8ITPAfOYqan for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:05:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF5AC81A24
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF5AC81A24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C2DC84329; Sun,  6 Aug 2023 12:05:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 13:55:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 727584320785aca15990b2a03d4ff7b541b4c210
X-Git-Newrev: 05adefbafd532d901f8476e9dc59eb416108c4d4
X-Patchwork-Hint: ignore
Message-Id: <20230806120520.9C2DC84329@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-lxml: bump
 version to 4.9.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=05adefbafd532d901f8476e9dc59eb416108c4d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: https://github.com/lxml/lxml/blob/master/CHANGES.txt

Added sha256 hash provided by upstream.
This release includes fixes for upcoming Python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lxml/python-lxml.hash | 3 ++-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 72df6d0278..e34cb193f4 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,6 @@
+# From https://pypi.org/project/lxml/
+sha256  48628bd53a426c9eb9bc066a923acaa0878d1e86129fd5359aee99285f4eed9c  lxml-4.9.3.tar.gz
 # Locally computed
-sha256  2455cfaeb7ac70338b3257f41e21f0724f4b5b0c0e7702da67ee6c3640835b67  lxml-4.9.2.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 657622a962..3ef3aabdbc 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.9.2
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/06/5a/e11cad7b79f2cf3dd2ff8f81fa8ca667e7591d3d8451768589996b65dec1
+PYTHON_LXML_VERSION = 4.9.3
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/30/39/7305428d1c4f28282a4f5bdbef24e0f905d351f34cf351ceb131f5cddf78
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
