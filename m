Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2178C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9868C84964;
	Fri, 27 May 2022 08:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzeyfNVTfyBT; Fri, 27 May 2022 08:11:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C121B84959;
	Fri, 27 May 2022 08:11:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE1B81BF302
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACC1361608
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Of4_xd-_buMn for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 08:11:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E3CE615F8
 for <buildroot@buildroot.org>; Fri, 27 May 2022 08:11:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BDB851BF20D;
 Fri, 27 May 2022 08:11:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuV3z-001DKB-So; Fri, 27 May 2022 10:11:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20220425201532.082158448C@busybox.osuosl.org>
Date: Fri, 27 May 2022 10:11:15 +0200
In-Reply-To: <20220425201532.082158448C@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Mon, 25 Apr 2022 22:19:10 +0200")
Message-ID: <87v8trmm3g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/libinput: security bump to
 version 1.20.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e21a7931c7afc6f8740775c03c29a8bc03afa16b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 > - CVE-2022-1215: libinput format string vulnerability

 > For details, see the advisory:
 > https://www.openwall.com/lists/oss-security/2022/04/20/2

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
