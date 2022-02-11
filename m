Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B60C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 05:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8AF4400FB;
	Fri, 11 Feb 2022 05:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytedgTFBCCA6; Fri, 11 Feb 2022 05:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FFA340338;
	Fri, 11 Feb 2022 05:26:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC8A1BF3EC
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 05:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 972B840338
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 05:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id El07Ui0zW6u8 for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 05:26:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id 102DC400FB
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 05:26:32 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IORynt8AtXmFAIORynTrcJ; Fri, 11 Feb 2022 06:26:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644557190; bh=roQLiF4PMUYoIpVdxAq/Tyvgo37xBu7YkmHYcbBMdyg=;
 h=From:To:Subject:Date:MIME-Version;
 b=nQHwSeJINrYi2BFTE3HdsRoQCFVQM+4O9wzKA/YsSWP7xVmXFEfF/Fsg5dHdLpy81
 DRa3Cx+5d9s72lrkTeEkN5pojMI66j7oOxAfM8IvOswkMewGOipZcNKX2cs8eR4F++
 /jqZkSLxYximFkkZa6jXhM7PjrEWNx0iWqbm5OTmV5zVIsc0ymOjRlYgEo61HDQUE9
 IArGSqyNHNXS7NbC5k7Pw002Z8lJ6/VmG1cbYEPpPvAs9CIdDBJQ/pQUdwGB2Uc1YS
 c/eKLJrLpliwooNuz6ONoIyyutmPdpntTORAVstnGuApyL+YmmW/Nq7TXhKcqFvsjD
 wEcI47GodK48g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 06:26:29 +0100
Message-Id: <20220211052629.2289507-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDykepLNMT7xi1ayCfgF8bswL7lACdpTyvNFZDCrXGd9OGNkJigyes75mEUMEjk/Ajlm/UQ8cRqBhkP12CWI+ZyZFQbHiP8geUaca1XxpOwii9FRJXLw
 pcmBEM6qZxHK30ObwmfQsDnQFWKyhKcVD96wvmqDbN0t9C4dzgEzsuOT8nqgLKBksyO4PMmacSxwi8D/hwBjM2EoQv4yagpFKgpjQgwA7x7D2E1TEd1fQ9OQ
 1JZYZGdP03MniDoDmZhWfurym1TBXDinVawb2fjByrHMiQfGQz9R0EV1LWUu85/U5QJofa/uj5VCvEOUvxjoVg==
Subject: [Buildroot] [PATCH] docs/manual/adding-packages-generic: remove
 useless carriage return
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 docs/manual/adding-packages-generic.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 8723da214a..fbe37f9ca9 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -316,8 +316,7 @@ not and can not work as people would expect it should:
      13:45+01" see "man cvs" for further details).
   ** +git+ for retrieving source code from a Git repository. Used by
      default when +LIBFOO_SITE+ begins with +git://+. The downloaded
-     source code is cached as with the +svn+
-     method.
+     source code is cached as with the +svn+ method.
   ** +hg+ for retrieving source code from a Mercurial repository. One
      'must' specify +LIBFOO_SITE_METHOD=hg+ when +LIBFOO_SITE+
      contains a Mercurial repository URL. The downloaded source code
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
