Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3966CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 08:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C054E81453;
	Mon, 24 Jan 2022 08:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3b1i9OPpd7Wn; Mon, 24 Jan 2022 08:58:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 163FD81425;
	Mon, 24 Jan 2022 08:58:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF1C31BF2AA
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D9FA81425
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCKBdsMUVgzt for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 08:58:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 324D281410
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 08:58:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E2927C0002;
 Mon, 24 Jan 2022 08:58:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nBvBL-0002Hp-HF; Mon, 24 Jan 2022 09:58:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20211124205607.3021277-1-aperez@igalia.com>
Date: Mon, 24 Jan 2022 09:58:35 +0100
In-Reply-To: <20211124205607.3021277-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Wed, 24 Nov 2021 22:56:07 +0200")
Message-ID: <87mtjlwlvo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump version to
 2.34.2
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 > Update to the the next minor release, which fixes an scrolling issue and
 > incorporated a patch that can now be removed from Buildroot. Release
 > notes:

 >   https://wpewebkit.org/release/wpewebkit-2.34.2.html

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

What about webkitgtk? It would also be good to move that to the 2.34.x
series before we release 2022.02.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
