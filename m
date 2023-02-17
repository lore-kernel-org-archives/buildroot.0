Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C06C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 11:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF9DC41C85;
	Sat, 18 Feb 2023 11:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF9DC41C85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NsPWFrtf9Ous; Sat, 18 Feb 2023 11:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1EAC41992;
	Sat, 18 Feb 2023 11:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1EAC41992
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE8F1BF2F0
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 727CA60E45
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 727CA60E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcEwjGVPjoIE for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 11:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A897C60BDF
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 11:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A897C60BDF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98FF68477C; Sat, 18 Feb 2023 11:15:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 16:25:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c674014c1744dd6db3dd8717efca51fe7ceb1038
X-Git-Newrev: 4336a86a0c414db7fbb3ff61d66e38bd916bb04e
X-Patchwork-Hint: ignore
Message-Id: <20230218111540.98FF68477C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apispec: fix formatting in
 hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=4336a86a0c414db7fbb3ff61d66e38bd916bb04e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/python-apispec/python-apispec.hash:2: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-apispec/python-apispec.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index 9d653cc8e8..f2861f920a 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5   b4e90006a26215e2e0a6fe2629d12c10 apispec-6.0.2.tar.gz
+md5  b4e90006a26215e2e0a6fe2629d12c10  apispec-6.0.2.tar.gz
 sha256  e76d80b739edef4be213092a6384ad7fd933ba7d64f6d5a0aff8d4da1bef7887  apispec-6.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a452afcef750956a8396f7e7a6f913a117d28ef99a13170c29dc74c3b7a95f29  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
