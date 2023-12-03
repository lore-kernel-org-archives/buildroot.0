Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4ABC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E17415CB;
	Sun,  3 Dec 2023 16:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E17415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JALWQ2KzRzfL; Sun,  3 Dec 2023 16:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9116C4154E;
	Sun,  3 Dec 2023 16:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9116C4154E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 932FD1BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C56E414CE
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C56E414CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDs18wKwSjw2 for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:58:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B77E414CD
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B77E414CD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 667AA240002;
 Sun,  3 Dec 2023 16:58:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9pnv-0097HS-1b;
 Sun, 03 Dec 2023 17:58:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
References: <20231202123400.2327151-1-geomatsi@gmail.com>
 <20231202123400.2327151-4-geomatsi@gmail.com>
Date: Sun, 03 Dec 2023 17:58:51 +0100
In-Reply-To: <20231202123400.2327151-4-geomatsi@gmail.com> (Sergey
 Matyukevich's message of "Sat, 2 Dec 2023 15:31:39 +0300")
Message-ID: <87bkb7z0hg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/5] configs/orangepi_one_defconfig: bump
 BSP versions
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

>>>>> "Sergey" == Sergey Matyukevich <geomatsi@gmail.com> writes:

 > Switch to the new Linux LTS release 6.6.3. Swtich to the
 > latest U-Boot 2023.10.

 > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
