Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BCAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 13:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B035B40177;
	Sat, 22 Jan 2022 13:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNWMuaa5cKUX; Sat, 22 Jan 2022 13:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E15E4020B;
	Sat, 22 Jan 2022 13:43:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 040341BF3D5
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EABDA83E09
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4jhgO1v6k1LE for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 13:43:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCF738277E
 for <buildroot@busybox.net>; Sat, 22 Jan 2022 13:43:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 25436240003;
 Sat, 22 Jan 2022 13:43:16 +0000 (UTC)
Date: Sat, 22 Jan 2022 14:43:15 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220122144315.030cc013@windsurf>
In-Reply-To: <20220117124605.17592-1-guillaume.bressaix@gmail.com>
References: <20220117124605.17592-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libxcrypt: bump to version 4.4.27
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Mon, 17 Jan 2022 13:46:05 +0100
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/libxcrypt/libxcrypt.hash | 2 +-
>  package/libxcrypt/libxcrypt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I have applied to master, but you had forgotten to test "make
legal-info" after this update, and the hash of the license files had
changed. I fixed that up, and explained in the commit log why the hash
changed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
