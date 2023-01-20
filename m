Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17182C05027
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 07:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8651660F9A;
	Fri, 20 Jan 2023 07:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8651660F9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YdQYKZsuWER; Fri, 20 Jan 2023 07:21:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF19560F72;
	Fri, 20 Jan 2023 07:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF19560F72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE2F11BF2A7
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 07:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9C35822AF
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 07:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9C35822AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwZpcqpPrdZb for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 07:21:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA3782213
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DA3782213
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 07:21:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E013FF806;
 Fri, 20 Jan 2023 07:21:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pIlid-00AK2O-G5; Fri, 20 Jan 2023 08:21:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20230117135943.2893779-1-aperez@igalia.com>
Date: Fri, 20 Jan 2023 08:21:47 +0100
In-Reply-To: <20230117135943.2893779-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 17 Jan 2023 15:59:43 +0200")
Message-ID: <874jslbrhw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.38.3
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

 > Bugfix release, with security fixes for CVE-2022-42852, CVE-2022-42856,
 > CVE-2022-42867, CVE-2022-46691, CVE-2022-46692, CVE-2022-46698,
 > CVE-2022-46699, CVE-2022-46700, CVE-2022-42823, and CVE-2022-42799.

 > Release notes:

 >   https://wpewebkit.org/release/wpewebkit-2.38.3.html
 >   https://wpewebkit.org/release/wpewebkit-2.38.2.html
 >   https://wpewebkit.org/release/wpewebkit-2.38.1.html

 > Accompanying security advisories:

 >   https://wpewebkit.org/security/WSA-2022-0011.html
 >   https://wpewebkit.org/security/WSA-2022-0010.html

 > Additionally, the update brings in important bug fixes for the
 > Bubblewrap sandbox support, scrolling in certain web sites, multimedia
 > playback, and build fixes.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Heh, I missed that you had already sent this - Committed, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
