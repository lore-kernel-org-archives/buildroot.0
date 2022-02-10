Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FB8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0417660EAE;
	Thu, 10 Feb 2022 21:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67l9M1gDphhq; Thu, 10 Feb 2022 21:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 484D160B65;
	Thu, 10 Feb 2022 21:49:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3F661BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D187E81D19
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-5itDkn8HnK for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:49:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DB8181990
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:49:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A9E020007;
 Thu, 10 Feb 2022 21:49:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nIHJb-00014Q-9D; Thu, 10 Feb 2022 22:49:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
 <20220210192905.4500-10-ps.report@gmx.net>
Date: Thu, 10 Feb 2022 22:49:23 +0100
In-Reply-To: <20220210192905.4500-10-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 10 Feb 2022 20:29:01 +0100")
Message-ID: <87czjutmsc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 09/13] package/gst1-rtsp-server: bump
 version to 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - removed 0001-gst-rtsp-server-meson.build-add-gst_dep.patch
 >   (upstream accepted [1])

 > - update COPYING/COPYING.LIB hash (license text update from LGPL-2.0+ to
 >   LGPL-2.1+, see [2]) and adjust GST1_RTSP_SERVER_LICENSE accordingly

 > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/e637aae629f5b95b748a6f23abecc2b502272822.patch
 > [2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/cc5cdab0165e3bdf5f4f748b3ba2a3493d304e70.patch

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
