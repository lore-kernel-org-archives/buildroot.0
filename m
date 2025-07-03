Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3836C83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97A8080DD1;
	Thu,  3 Jul 2025 20:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-nve4UnDm8h; Thu,  3 Jul 2025 20:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C3A80D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C3A80D50;
	Thu,  3 Jul 2025 20:52:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AE31B0A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CA7280D44
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ll7WoykUYdyy for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E76B80CB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E76B80CB4
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:52:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7865485CCB; Thu,  3 Jul 2025 20:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 22:51:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8965024022d6c72a9297b13b08ceb95b959e837e
X-Git-Newrev: de8cc1ae504da1c66b70b5cc29e562f20e34841a
X-Patchwork-Hint: ignore
Message-Id: <20250703205248.7865485CCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multipart: add CPE
 identifier
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=de8cc1ae504da1c66b70b5cc29e562f20e34841a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cpe:2.3:a:fastapiexpert:python-multipart:0.0.20:*:*:*:*:*:*:* is
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/8C38E43A-00AD-4851-9AC9-80408FF89F52

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-multipart/python-multipart.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 8c49e2df9c..8e11f5f6cd 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -10,5 +10,6 @@ PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f3/87/f44d7c9f27
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
+PYTHON_MULTIPART_CPE_ID_VENDOR = fastapiexpert
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
