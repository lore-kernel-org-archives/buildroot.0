Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087D6C4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 14:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6941E4061C;
	Sun, 12 Nov 2023 14:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6941E4061C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JclqMTj0yWOC; Sun, 12 Nov 2023 14:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ED764155D;
	Sun, 12 Nov 2023 14:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ED764155D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05CB81BF476
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 14:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB89B8204D
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 14:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB89B8204D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8s9VV9VZl8H for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 14:09:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 614CD82012
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 14:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 614CD82012
Received: by mail.gandi.net (Postfix) with ESMTPSA id A079C1BF203;
 Sun, 12 Nov 2023 14:09:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2B9I-00AIZU-2t;
 Sun, 12 Nov 2023 15:09:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20231111161932.914611-1-thomas@devoogdt.com>
Date: Sun, 12 Nov 2023 15:09:16 +0100
In-Reply-To: <20231111161932.914611-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Sat, 11 Nov 2023 17:19:31 +0100")
Message-ID: <874jhrgj1v.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/2] package/libsoup3: bump to 3.4.4
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
 >  - https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.3.news
 >  - https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.4.news

 > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
