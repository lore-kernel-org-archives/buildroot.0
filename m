Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C5ACF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A7A5840F8;
	Sun, 22 Sep 2024 10:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBcn950DqUbt; Sun, 22 Sep 2024 10:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34DEA8410C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34DEA8410C;
	Sun, 22 Sep 2024 10:37:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E47CF1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44E56402A7
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpDe5PWHnxz4 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C71F54028F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C71F54028F
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1F7A811F3; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9c45b374eb9dbfdc9a949a247997c0f4ce1bdec
X-Git-Newrev: 97833e5381321bce457a08867e3d76a791987755
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.C1F7A811F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-python-dateutil: bump
 to version 2.9.0.20240906
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

commit: https://git.buildroot.net/buildroot/commit/?id=97833e5381321bce457a08867e3d76a791987755
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../python-types-python-dateutil/python-types-python-dateutil.hash    | 4 ++--
 package/python-types-python-dateutil/python-types-python-dateutil.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index ef5e9380cf..4a2dcec502 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  58072922ac0c740121e311e970f003bf  types-python-dateutil-2.8.19.14.tar.gz
-sha256  1f4f10ac98bb8b16ade9dbee3518d9ace017821d94b057a425b069f834737f4b  types-python-dateutil-2.8.19.14.tar.gz
+md5  0d91422e92000e77d633a8adff3039e7  types-python-dateutil-2.9.0.20240906.tar.gz
+sha256  9706c3b68284c25adffc47319ecc7947e5bb86b3773f843c73906fd598bc176e  types-python-dateutil-2.9.0.20240906.tar.gz
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index b230394120..c210d71b0c 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.8.19.14
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20240906
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types-python-dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/1b/2d/f189e5c03c22700c4ce5aece4b51bb73fa8adcfd7848629de0fb78af5f6f
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/3e/d9/9c9ec2d870af7aa9b722ce4fd5890bb55b1d18898df7f1d069cab194bb2a
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
