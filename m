Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1DBC636CC
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 11:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECBEC41C92;
	Sat, 18 Feb 2023 11:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECBEC41C92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1mi4ev0wvy9; Sat, 18 Feb 2023 11:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F247941CA1;
	Sat, 18 Feb 2023 11:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F247941CA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 075A71BF2F0
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C3C41992
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 11:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C3C41992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMEutnBN63Yx for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 11:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C07EB415FD
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 11:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C07EB415FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC8E7847AF; Sat, 18 Feb 2023 11:15:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Feb 2023 12:15:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41cca5274a8afce269f9b2bdc9e113e073e28abb
X-Git-Newrev: b6085c00d0feece6f3ba635e7847ea653bc5fac3
X-Patchwork-Hint: ignore
Message-Id: <20230218111540.AC8E7847AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-webargs: fix formatting in
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6085c00d0feece6f3ba635e7847ea653bc5fac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
