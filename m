Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7AAC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B94D610E1;
	Tue, 21 Feb 2023 01:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B94D610E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLicXHpF047M; Tue, 21 Feb 2023 01:00:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3628610BE;
	Tue, 21 Feb 2023 01:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3628610BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC77D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3FEF4182D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3FEF4182D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQOTYisl1Fy0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D60841824
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D60841824
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0748E8648F; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Feb 2023 12:15:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 41cca5274a8afce269f9b2bdc9e113e073e28abb
X-Git-Newrev: b6085c00d0feece6f3ba635e7847ea653bc5fac3
X-Patchwork-Hint: ignore
Message-Id: <20230220205302.0748E8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-webargs: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6085c00d0feece6f3ba635e7847ea653bc5fac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:

package/python-webargs/python-webargs.hash:2: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-webargs/python-webargs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-webargs/python-webargs.hash b/package/python-webargs/python-webargs.hash
index 619b584807..10bb3651f0 100644
--- a/package/python-webargs/python-webargs.hash
+++ b/package/python-webargs/python-webargs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webargs/json
-md5   9fff29294a5db748eca791da2b93e370  webargs-8.2.0.tar.gz
+md5  9fff29294a5db748eca791da2b93e370  webargs-8.2.0.tar.gz
 sha256  99d68940c452e07726485a15fef43f12f8ae6c0c5b391bcba76065d4527fb85d  webargs-8.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5973e5dcc20b65e4eb4b4acdf273bb78a18522914ab626f496f1b070f7e6294d  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
