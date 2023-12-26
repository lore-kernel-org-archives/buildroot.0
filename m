Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A45C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E06384038E;
	Tue, 26 Dec 2023 13:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06384038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FY5ryjhg1lMB; Tue, 26 Dec 2023 13:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8107408F1;
	Tue, 26 Dec 2023 13:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8107408F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B11A1BF489
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3134B408A9
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3134B408A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7GUuSUz05wx for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DFBE40858
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DFBE40858
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 476C3835AC; Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 14:12:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 814e7fcacfed75c2bbaa83dba160bba7f36dd9ac
X-Git-Newrev: 7f7a7c34e5747c122815d407a70be0d1eca512d8
X-Patchwork-Hint: ignore
Message-Id: <20231226131330.476C3835AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asyncssh: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f7a7c34e5747c122815d407a70be0d1eca512d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:asyncssh_project:asyncssh is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/55866328-B495-4FDC-B9EF-C014E6885187

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asyncssh/python-asyncssh.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 91e0d9d419..51e2e1973c 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -10,5 +10,7 @@ PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/5f/86/59278fefc49
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
+PYTHON_ASYNCSSH_CPE_ID_VENDOR = asyncssh_project
+PYTHON_ASYNCSSH_CPE_ID_PRODUCT = asyncssh
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
