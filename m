Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72B3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 14:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74E258133D;
	Sun, 18 Dec 2022 14:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74E258133D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0oDrNbHumkm; Sun, 18 Dec 2022 14:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE13281311;
	Sun, 18 Dec 2022 14:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE13281311
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 655DF1BF3DC
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 14:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40C2660AEE
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 14:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40C2660AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zu48kjBPGsBe for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 14:55:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26DDF60AC4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26DDF60AC4
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 14:55:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA0AA1BF206;
 Sun, 18 Dec 2022 14:55:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p6v47-003wgG-65; Sun, 18 Dec 2022 15:54:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20221216080433.1997432-1-angelo@amarulasolutions.com>
 <20221216080433.1997432-3-angelo@amarulasolutions.com>
Date: Sun, 18 Dec 2022 15:54:59 +0100
In-Reply-To: <20221216080433.1997432-3-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Fri, 16 Dec 2022 09:04:33 +0100")
Message-ID: <87bko0kbi4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 3/3] configs/lichee_rv_dock: new defconfig
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
Cc: indrek.kruusa@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > Lichee RV Dock is a RISC-V Linux development kits with high integration,
 > small size and affordable price designed for opensource developer.

 > https://wiki.sipeed.com/hardware/en/lichee/RV/Dock.html

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
 > ---
 > v6:
 > * Added me to the developers file
 > * Fixing typos in readme (Indrek Kruusa)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
