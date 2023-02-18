Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C98C636CC
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 11:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6887941992;
	Sat, 18 Feb 2023 11:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6887941992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x1tzXf8KuFmh; Sat, 18 Feb 2023 11:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C45F41C96;
	Sat, 18 Feb 2023 11:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C45F41C96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99AEF1BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 732788215C
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 732788215C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_nEvUqktAZW for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 11:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F5F82146
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 11:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F5F82146
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2B268479A; Sat, 18 Feb 2023 11:15:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Feb 2023 12:14:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4336a86a0c414db7fbb3ff61d66e38bd916bb04e
X-Git-Newrev: 41cca5274a8afce269f9b2bdc9e113e073e28abb
X-Patchwork-Hint: ignore
Message-Id: <20230218111540.A2B268479A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-smorest: fix
 formatting in hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=41cca5274a8afce269f9b2bdc9e113e073e28abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/python-flask-smorest/python-flask-smorest.hash:5: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-smorest/python-flask-smorest.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index 5abe0c5033..941535c503 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -2,4 +2,4 @@
 md5  1dad52f26c59ca2dcaf0c5d109879605  flask-smorest-0.40.0.tar.gz
 sha256  9b46b4937ccf78702d99fed8cfd1cd5c37608ddefd65ff16a86d1ad5c7f7d8c0  flask-smorest-0.40.0.tar.gz
 # Locally computed sha256 checksums
-sha256	40999ea1d9c1b8202fa44f8e6849a557e22df892481e067abf999879064b9521  LICENSE
+sha256  40999ea1d9c1b8202fa44f8e6849a557e22df892481e067abf999879064b9521  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
