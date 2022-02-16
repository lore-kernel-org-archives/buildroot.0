Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E509EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ED3C82B9F;
	Wed, 16 Feb 2022 21:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K14OI3nPFS6F; Wed, 16 Feb 2022 21:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB96782983;
	Wed, 16 Feb 2022 21:00:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC7E11BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB07760B12
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iECmCunM6ey7 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:00:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C101F60B00
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:00:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B5F88FF808;
 Wed, 16 Feb 2022 21:00:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nKRPH-0006XF-46; Wed, 16 Feb 2022 22:00:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
Date: Wed, 16 Feb 2022 22:00:11 +0100
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 4 Feb 2022 16:46:19 +0100")
Message-ID: <87czjmh6hw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 00/12] package/gstreamer1/*: bump version
 to 1.18.6
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > For details see [1] and [2].
 > [1] https://lists.freedesktop.org/archives/gstreamer-devel/2022-February/079533.html
 > [2] https://gstreamer.freedesktop.org/releases/1.18/#1.18.6

 > Peter Seiderer (12):
 >   package/gstreamer1: bump version to 1.18.6
 >   package/gst1-plugins-base: bump version to 1.18.6
 >   package/gst1-plugins-good: bump version to 1.18.6
 >   package/gst1-plugins-bad: bump version to 1.18.6
 >   package/gst1-plugins-ugly: bump version to 1.18.6
 >   package/gst1-devtools: bump version to 1.18.6
 >   package/gst1-libav: bump version to 1.18.6
 >   package/gst1-vaapi: bump version to 1.18.6
 >   package/gst1-rtsp-server: bump version to 1.18.6
 >   package/gstreamer1-editing-services: bump version to 1.18.6
 >   package/gst-omx: bump version to 1.18.6
 >   package/gst1-python: bump version to 1.18.6

Committed series to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
