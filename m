Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8486C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7236F41575;
	Sun,  3 Dec 2023 16:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7236F41575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xd4QvPTG59Ce; Sun,  3 Dec 2023 16:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E931541514;
	Sun,  3 Dec 2023 16:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E931541514
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B381E1BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F5A81B70
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99F5A81B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVZkauBSE8bz for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:44:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FFB081A92
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FFB081A92
Received: by mail.gandi.net (Postfix) with ESMTPSA id C82061BF203;
 Sun,  3 Dec 2023 16:44:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9paO-0096IN-0M;
 Sun, 03 Dec 2023 17:44:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231201221717.1137821-1-fontaine.fabrice@gmail.com>
Date: Sun, 03 Dec 2023 17:44:52 +0100
In-Reply-To: <20231201221717.1137821-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Dec 2023 23:17:15 +0100")
Message-ID: <871qc31bi3.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH/next 1/1] package/duma: bump to version
 2.5.21
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch site to get latest release
 > - Drop all patches (already in version)
 > - Update hash of COPYING-LGPL, empty lines removed with
 >   https://github.com/johnsonjh/duma/commit/cceb1b2d808c36f02dfbfd774bcee0967fcc9392
 > - Pass $(TARGET_CONFIGURE_OPTS) to install targets to avoid using wrong
 >   values since
 >   https://github.com/johnsonjh/duma/commit/abdf4074c3dc506308283f5d463b17b4f58521f1

 > https://github.com/johnsonjh/duma/blob/VERSION_2_5_21/CHANGELOG

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
