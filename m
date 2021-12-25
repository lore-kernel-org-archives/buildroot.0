Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A075EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 10:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46C88828DF;
	Sat, 25 Dec 2021 10:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4FC74DN1CnW; Sat, 25 Dec 2021 10:54:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A222D81431;
	Sat, 25 Dec 2021 10:54:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66ACF1BF83E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5347C81431
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3jy7IFpDr7I for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 10:54:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E2248142F
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 10:54:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 10C61240002;
 Sat, 25 Dec 2021 10:54:05 +0000 (UTC)
Date: Sat, 25 Dec 2021 11:54:05 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211225115405.40db065b@windsurf>
In-Reply-To: <20211220124116.2177752-1-fontaine.fabrice@gmail.com>
References: <20211220124116.2177752-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: bump to version 0.46
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

On Mon, 20 Dec 2021 13:41:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - boost is not needed since
>   https://github.com/MusicPlayerDaemon/ncmpc/commit/6eb958602091752c20e8dbb32041bedc637d24ee
> - pcre has been replaced by pcre2 since
>   https://github.com/MusicPlayerDaemon/ncmpc/commit/f2ea0d39a3d0ed20a958f7e7dd902de7ea2875b7
> 
> https://raw.githubusercontent.com/MusicPlayerDaemon/ncmpc/v0.46/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ncmpc/Config.in  |  9 +++------
>  package/ncmpc/ncmpc.hash |  2 +-
>  package/ncmpc/ncmpc.mk   | 10 +++++-----
>  3 files changed, 9 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
