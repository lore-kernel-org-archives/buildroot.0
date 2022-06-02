Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB12C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0330407D7;
	Thu,  2 Jun 2022 14:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwUNQuMJLfeu; Thu,  2 Jun 2022 14:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A6A74055D;
	Thu,  2 Jun 2022 14:22:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54E1F1BF5EA
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AA6381A0D
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytv3vr4WPLqO for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:21:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8B74829FE
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:21:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8380586A98; Thu,  2 Jun 2022 14:10:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jun 2022 16:14:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e149215669fd46b4dc7354bcf1c70e58eb8e52bc
X-Git-Newrev: 404663f49647cba935c37b418ed8317bf7d29588
X-Patchwork-Hint: ignore
Message-Id: <20220602141006.8380586A98@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-flask-wtf: bump
 to version 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=404663f49647cba935c37b418ed8317bf7d29588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License moved and hash changed due to rename and removal of authors:
https://github.com/wtforms/flask-wtf/commit/d37c22b42202ccf4c8f96c445ceafe72c4c5ed46

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-wtf/python-flask-wtf.hash | 6 +++---
 package/python-flask-wtf/python-flask-wtf.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-flask-wtf/python-flask-wtf.hash b/package/python-flask-wtf/python-flask-wtf.hash
index 848d6d7783..01e4290950 100644
--- a/package/python-flask-wtf/python-flask-wtf.hash
+++ b/package/python-flask-wtf/python-flask-wtf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-wtf/json
-md5  920a5a476ecfb751952b5048cc05fcf8  Flask-WTF-0.15.1.tar.gz
-sha256  ff177185f891302dc253437fe63081e7a46a4e99aca61dfe086fb23e54fff2dc  Flask-WTF-0.15.1.tar.gz
+md5  d86dbc0befe30fd577a623a51689b900  Flask-WTF-1.0.1.tar.gz
+sha256  34fe5c6fee0f69b50e30f81a3b7ea16aa1492a771fe9ad0974d164610c09a6c9  Flask-WTF-1.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a075f8d98acfdb05dd98716242b9e2c1b3ab98722926b3c4cf6c916ac14e8350  LICENSE
+sha256  d5f19036451578cb36eeef04c99ebf7d7ca2e70dcf043636519bc420e15a7c62  LICENSE.rst
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index e2078103f5..97291e1b26 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FLASK_WTF_VERSION = 0.15.1
+PYTHON_FLASK_WTF_VERSION = 1.0.1
 PYTHON_FLASK_WTF_SOURCE = Flask-WTF-$(PYTHON_FLASK_WTF_VERSION).tar.gz
-PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/9c/b5/4b48cece7b31aac2beab115330c2978ef4deee3aeb0dd1037c9b7a71b8c3
+PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/d9/38/d4798dd05be711d666e1befb08b1d3db57bd146d1a14d15657f60c88b446
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
-PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE
+PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
 PYTHON_FLASK_WTF_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
