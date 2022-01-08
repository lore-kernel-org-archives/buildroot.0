Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E8CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C9881435;
	Sat,  8 Jan 2022 19:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id syk48egdOOM8; Sat,  8 Jan 2022 19:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E74681431;
	Sat,  8 Jan 2022 19:42:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF0BB1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB87381431
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5N6j7vItXW3 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:42:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D50258142E
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 19:42:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 974DE240004;
 Sat,  8 Jan 2022 19:42:24 +0000 (UTC)
Date: Sat, 8 Jan 2022 20:42:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: guillaume.bressaix@gmail.com
Message-ID: <20220108204223.2e904905@windsurf>
In-Reply-To: <20210213102055.24378-1-guillaume.bresaix@gmail.com>
References: <20210213102055.24378-1-guillaume.bresaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyext: new package
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

On Sat, 13 Feb 2021 11:20:55 +0100
guillaume.bressaix@gmail.com wrote:

> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> Python-pyext is a set of scripts to enhance python.
> This includes features such as function overloading,
> the "switch" statement..
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---

We looked at this package, and upstream has not made any release since
2014, and there is apparently no publicly available version control
system. With python moving so fast, a package that hasn't been touched
since 2014 doesn't seem like a good idea.

So I'll mark this patch as Rejected. If you have a reason to think this
is still maintained, could you provide some more details?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
