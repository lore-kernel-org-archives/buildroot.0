Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723BAC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 14:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C697460B89;
	Sat,  9 Dec 2023 14:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C697460B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lk59PSAi6CJm; Sat,  9 Dec 2023 14:50:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 277EE60B57;
	Sat,  9 Dec 2023 14:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 277EE60B57
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E53A1BF2AB
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D9B94109F
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D9B94109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDj8U7VQt3AZ for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 14:50:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91C2040923
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 14:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C2040923
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F6D41BF207;
 Sat,  9 Dec 2023 14:50:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rByez-000A1d-2J;
 Sat, 09 Dec 2023 15:50:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231208191344.2432108-1-fontaine.fabrice@gmail.com>
Date: Sat, 09 Dec 2023 15:50:29 +0100
In-Reply-To: <20231208191344.2432108-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 8 Dec 2023 20:13:44 +0100")
Message-ID: <8734wbqvka.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/jack2: bump to version 1.9.22
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patch (already in version)
 > - tools option has been dropped since
 >   https://github.com/jackaudio/jack2/commit/564c710eefc760a5683b88b3ecb8a29100d5274e
 > - sndfile is not a dependency since
 >   https://github.com/jackaudio/jack2/commit/c69d6097c2acc7fa0558a0b0bef509c526719cb1
 > - readline is not a dependency since
 >   https://github.com/jackaudio/jack2/commit/a0b3e3e4dd2fc22c8d3e34b0030edf3d1fab0fd5

 > https://github.com/jackaudio/jack2/blob/v1.9.22/ChangeLog.rst

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
