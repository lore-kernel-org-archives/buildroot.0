Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDE0CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78E8B409DF;
	Wed,  3 Apr 2024 19:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZJfnjcwe9hW; Wed,  3 Apr 2024 19:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E7C414A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E7C414A1;
	Wed,  3 Apr 2024 19:54:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D696A1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D17E040437
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bn5C5Gdqnjpx for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26F43402E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26F43402E6
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:53:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 107E8846CD; Wed,  3 Apr 2024 19:53:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:53:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eab49e34af17048ca59fcc9ccdc7990fee269ab6
X-Git-Newrev: f12c77442e1184427eee0960646833728a4c47db
X-Patchwork-Hint: ignore
Message-Id: <20240403195358.107E8846CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: fix host-python-setuptools
 typo
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
Content-Type: multipart/mixed; boundary="===============1122855612697011952=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1122855612697011952==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f12c77442e1184427eee0960646833728a4c47db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-python.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index 9953be6639..67f2f6081d 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -92,7 +92,7 @@ Note that:
    dependencies are automatically added as needed by the Python
    package infrastructure.
 
- * Similarly, it is not needed to add +host-setuptools+ to
+ * Similarly, it is not needed to add +host-python-setuptools+ to
    +PYTHON_FOO_DEPENDENCIES+ for setuptools-based packages, since it's
    automatically added by the Python infrastructure as needed.
 

--===============1122855612697011952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1122855612697011952==--
