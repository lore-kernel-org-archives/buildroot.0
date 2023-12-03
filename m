Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C16C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BD14149D;
	Sun,  3 Dec 2023 16:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70BD14149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbGxMHdS5fTt; Sun,  3 Dec 2023 16:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3A08415CB;
	Sun,  3 Dec 2023 16:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3A08415CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C49C41BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D2514013D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D2514013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aygxh1oqnwQ3 for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:58:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C208400D8
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C208400D8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CB7C40002;
 Sun,  3 Dec 2023 16:58:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9pnz-0097Hq-1t;
 Sun, 03 Dec 2023 17:58:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
References: <20231202123400.2327151-1-geomatsi@gmail.com>
 <20231202123400.2327151-5-geomatsi@gmail.com>
Date: Sun, 03 Dec 2023 17:58:55 +0100
In-Reply-To: <20231202123400.2327151-5-geomatsi@gmail.com> (Sergey
 Matyukevich's message of "Sat, 2 Dec 2023 15:31:40 +0300")
Message-ID: <877clvz0hc.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 4/5] configs/orangepi_zero: bump BSP versions
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
