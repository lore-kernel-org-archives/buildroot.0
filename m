Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A51AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 14:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E6E64155D;
	Sun, 12 Nov 2023 14:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E6E64155D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mYzoo40mQsnl; Sun, 12 Nov 2023 14:09:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D5024155E;
	Sun, 12 Nov 2023 14:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D5024155E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE19E1BF476
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 14:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97E8D8204D
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 14:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97E8D8204D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdxIpwMJPAcD for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 14:09:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71D7C82012
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 14:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71D7C82012
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FDB7E0005;
 Sun, 12 Nov 2023 14:09:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2B9N-00AIZa-1x;
 Sun, 12 Nov 2023 15:09:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20231111161932.914611-1-thomas@devoogdt.com>
 <20231111161932.914611-2-thomas@devoogdt.com>
Date: Sun, 12 Nov 2023 15:09:21 +0100
In-Reply-To: <20231111161932.914611-2-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Sat, 11 Nov 2023 17:19:32 +0100")
Message-ID: <87zfzjf4ha.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 2/2] package/at-spi2-core: bump to 2.50.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, "Yann
 E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > News:
 >  - https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.4.news
 >  - https://download.gnome.org/sources/at-spi2-core/2.49/at-spi2-core-2.49.1.news
 >  - https://download.gnome.org/sources/at-spi2-core/2.49/at-spi2-core-2.49.90.news
 >  - https://download.gnome.org/sources/at-spi2-core/2.49/at-spi2-core-2.49.91.news
 >  - https://download.gnome.org/sources/at-spi2-core/2.50/at-spi2-core-2.50.0.news

 > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
