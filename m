Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142AEC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE5F940A43;
	Thu,  2 Dec 2021 17:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIi3C4tbtrYp; Thu,  2 Dec 2021 17:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F06440107;
	Thu,  2 Dec 2021 17:15:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69B4D1BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6659483F04
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ee4F7L4rVxom for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C56983EFA
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 38D4792284; Thu,  2 Dec 2021 17:10:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Dec 2021 18:10:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9f0bc279d8c4093fc01f7f9f083a2498b79715d
X-Git-Newrev: b5ee89aa28d75d857f48d39d925a08641ebc3dfe
X-Patchwork-Hint: ignore
Message-Id: <20211202171048.38D4792284@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-web2py: drop spurious spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5ee89aa28d75d857f48d39d925a08641ebc3dfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious spaces added by commit
7c0fab65aae632fc820edbe570c40f93c765dd64

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-web2py/python-web2py.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 910efbe617..5ea46fbfd9 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -70,7 +70,7 @@ endef
 # So, we just need to create the directories used by web2py with the right
 # ownership.
 define PYTHON_WEB2PY_PERMISSIONS
-	/var/www/web2py  r  750  33  33  -  -  -  -  -
+	/var/www/web2py r 750 33 33 - - - - -
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
