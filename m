Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053B9C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8ED382061;
	Sat, 25 Mar 2023 21:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8ED382061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7thwIqJZ0eaT; Sat, 25 Mar 2023 21:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E552281FFB;
	Sat, 25 Mar 2023 21:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E552281FFB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C046F1BF86C
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 903CC81E56
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 903CC81E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4SohR9yHyPt for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD4E681E5A
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD4E681E5A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDE4C82AA8; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 22:06:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bc95879f7d61d5e02bb5e90e3ba0eeade8fa166
X-Git-Newrev: 48311b11e0d46b4b8e5ca08da63f4a7d9bc3a55a
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.BDE4C82AA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow-sqlalchemy: fix
 spaces in hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=48311b11e0d46b4b8e5ca08da63f4a7d9bc3a55a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package complains with:
package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash:2: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index db061b623f..d3d1b3876f 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5   e1b2858be2f0ce6dead48e67080631c4 marshmallow-sqlalchemy-0.29.0.tar.gz
+md5  e1b2858be2f0ce6dead48e67080631c4  marshmallow-sqlalchemy-0.29.0.tar.gz
 sha256  3523a774390ef0c1c0f7c708a7519809c5396cf608720f14f55c36f74ff5bbec  marshmallow-sqlalchemy-0.29.0.tar.gz
 # Locally computed sha256 checksums
 sha256  625df8e2758a271b4bc90525c0b6161814e0f72cb3504b03ab5206b7abf50072  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
