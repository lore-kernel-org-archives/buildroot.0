Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A57C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 15:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46AB4157B;
	Fri, 14 Jan 2022 15:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFlAUV5l0Klv; Fri, 14 Jan 2022 15:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D9D241578;
	Fri, 14 Jan 2022 15:54:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4BFC1BF5A2
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0D1383FB3
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGDBAhxLtqJX for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 15:54:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DDDC84B24
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 15:54:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 808A0100012;
 Fri, 14 Jan 2022 15:54:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8OuI-0008An-7I; Fri, 14 Jan 2022 16:54:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi via buildroot <buildroot@buildroot.org>
References: <20211209082148.22068-1-dariobin@libero.it>
Date: Fri, 14 Jan 2022 16:54:26 +0100
In-Reply-To: <20211209082148.22068-1-dariobin@libero.it> (Dario Binacchi via
 buildroot's message of "Thu, 9 Dec 2021 09:21:48 +0100")
Message-ID: <8735lq8g99.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: fix broken URL
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 yann.morin.1998@free.fr, Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi via buildroot <buildroot@buildroot.org> writes:

 > As stated on www.pcre.org:
 > "Note that the former ftp.pcre.org FTP site is no longer available."

 > Update _SITE URL to Sourceforge.

 > Signed-off-by: Dario Binacchi <dariobin@libero.it>
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
