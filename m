Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C578AC4708C
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ECC140546;
	Mon,  5 Dec 2022 11:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ECC140546
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwjmCXh7obMA; Mon,  5 Dec 2022 11:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C1424053C;
	Mon,  5 Dec 2022 11:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C1424053C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFEC01BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A94C360AFC
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A94C360AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6N3JGB_ik-p for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B16260A66
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B16260A66
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E80E885BC0; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 21:33:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e708ed1f2e3da30296336249a6b02d287549e63
X-Git-Newrev: 4d47982fa2d1b0ab04a253906944ff3f8ce99340
X-Patchwork-Hint: ignore
Message-Id: <20221205112611.E80E885BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dicttoxml2: fix hash file
 formatting
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d47982fa2d1b0ab04a253906944ff3f8ce99340
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/python-dicttoxml2/python-dicttoxml2.hash:5: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3378478031/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dicttoxml2/python-dicttoxml2.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-dicttoxml2/python-dicttoxml2.hash b/package/python-dicttoxml2/python-dicttoxml2.hash
index 7f584cc000..4cc92d1d37 100644
--- a/package/python-dicttoxml2/python-dicttoxml2.hash
+++ b/package/python-dicttoxml2/python-dicttoxml2.hash
@@ -2,4 +2,4 @@
 md5  787ea4b80cd6234a41c016e8efa7ff40  dicttoxml2-2.1.0.tar.gz
 sha256  67cb729f337dd752808c021b70c8df8a34f84b9e111a5dbaa37e000eeaf4d462  dicttoxml2-2.1.0.tar.gz
 # Locally computed
-sha256 4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
+sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
