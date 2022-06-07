Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C33C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 12:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D69E3613FB;
	Tue,  7 Jun 2022 12:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSnL9bnSgvYw; Tue,  7 Jun 2022 12:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F110E6141C;
	Tue,  7 Jun 2022 12:17:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3D411BF33A
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3201843B9
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uhQoNDVL8i5 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 12:17:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63EB4843AF
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 12:17:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69CC660013;
 Tue,  7 Jun 2022 12:17:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyY8y-0001t8-2E; Tue, 07 Jun 2022 14:17:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20220530220141.1445578-1-aperez@igalia.com>
Date: Tue, 07 Jun 2022 14:17:08 +0200
In-Reply-To: <20220530220141.1445578-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 31 May 2022 01:01:41 +0300")
Message-ID: <877d5sy8fv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.36.3
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

 > Bugfix release, mostly with build fixes, media playback improvements,
 > an important fix for when using threaded rendering, and security patches
 > for CVE-2022-26700, CVE-2022-26709, CVE-2022-26717, CVE-2022-26716, and
 > CVE-2022-26719.

 > Release notes:

 >   https://webkitgtk.org/2022/05/28/webkitgtk2.36.3-released.html
 >   https://webkitgtk.org/2022/05/18/webkitgtk2.36.2-released.html

 > Accompanying security advisory:

 >   https://webkitgtk.org/security/WSA-2022-0005.html

 > This also imports a build fix which has not made it into the release.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
