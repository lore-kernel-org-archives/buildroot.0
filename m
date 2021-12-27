Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2852EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0513402A6;
	Mon, 27 Dec 2021 21:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPi8OtCKE4Qq; Mon, 27 Dec 2021 21:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39B934027A;
	Mon, 27 Dec 2021 21:27:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26BC91BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 469228124F
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fydiWd-4qRGY for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:27:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5143580DBF
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 21:27:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4367F60006;
 Mon, 27 Dec 2021 21:27:02 +0000 (UTC)
Date: Mon, 27 Dec 2021 22:27:01 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20211227222701.7333d050@windsurf>
In-Reply-To: <20211206184201.2449-1-francois.perrad@gadz.org>
References: <20211206184201.2449-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/lua-argon2: new package
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

On Mon,  6 Dec 2021 19:42:00 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                             |  1 +
>  package/lua-argon2/Config.in                  | 13 ++++++++++
>  package/lua-argon2/lua-argon2.hash            |  2 ++
>  package/lua-argon2/lua-argon2.mk              | 23 +++++++++++++++++
>  .../testing/tests/package/test_lua_argon2.py  | 25 +++++++++++++++++++
>  5 files changed, 64 insertions(+)
>  create mode 100644 package/lua-argon2/Config.in
>  create mode 100644 package/lua-argon2/lua-argon2.hash
>  create mode 100644 package/lua-argon2/lua-argon2.mk
>  create mode 100644 support/testing/tests/package/test_lua_argon2.py

Applied to master, thanks. It would be great for upstream to add a
license file to the repository, though. Perhaps you could ask them
about this?

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
