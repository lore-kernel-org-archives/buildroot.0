Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C018DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 14:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4293460BE4;
	Sat,  5 Feb 2022 14:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QX9JnperTt1P; Sat,  5 Feb 2022 14:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A53C60AD3;
	Sat,  5 Feb 2022 14:56:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16F8C1BF33C
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE084824EF
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSZ7M0Vs9KvD for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 14:56:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F167C80893
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 14:56:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 28280FF802;
 Sat,  5 Feb 2022 14:56:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGMUG-0008OD-G6; Sat, 05 Feb 2022 15:56:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
Date: Sat, 05 Feb 2022 15:56:28 +0100
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 4 Feb 2022 16:46:19 +0100")
Message-ID: <87wni9tl9f.fsf@dell.be.48ers.dk>
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

Committed series, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
