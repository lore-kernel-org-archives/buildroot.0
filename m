Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4F9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 17:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4044E60F70;
	Thu, 23 Dec 2021 17:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzMyOKZCrS_s; Thu, 23 Dec 2021 17:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C139260F4C;
	Thu, 23 Dec 2021 17:35:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F7251BF2E5
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEA9B83252
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id splH51rHmPuA for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 17:35:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB9EB815AC
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 17:35:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CAF4A2000B;
 Thu, 23 Dec 2021 17:35:31 +0000 (UTC)
Date: Thu, 23 Dec 2021 18:35:30 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20211223183530.52a85302@windsurf>
In-Reply-To: <20211222171641.306788-1-nolange79@gmail.com>
References: <20211222171641.306788-1-nolange79@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/lttng-libust: bump to version 2.13.1
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Norbert,

On Wed, 22 Dec 2021 18:16:40 +0100
Norbert Lange <nolange79@gmail.com> wrote:
> diff --git a/package/lttng-libust/0001-remove-doc-and-test.patch b/package/lttng-libust/0001-remove-doc-and-test.patch
> new file mode 100644
> index 0000000000..5077138444
> --- /dev/null
> +++ b/package/lttng-libust/0001-remove-doc-and-test.patch
> @@ -0,0 +1,15 @@

We want patches to be generated with git format-patch and have a proper
commit log and Signed-off-by line.

Also, ideally an upstreamable solution should be used, such as
introducing a new ./configure option to disable building the
documentation.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
