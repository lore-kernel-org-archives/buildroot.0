Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E107FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:24:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C2C660EFD
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C2C660EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DE7840534;
	Sat,  9 Oct 2021 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3R5jvHaApIWf; Sat,  9 Oct 2021 11:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86B6F40502;
	Sat,  9 Oct 2021 11:24:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E19FD1BF36E
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE2AB60674
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xskQ1QslgT5H for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 11:24:05 +0000 (UTC)
X-Greylist: delayed 00:09:54 by SQLgrey-1.8.0
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5E5C605EC
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 11:24:04 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7929710282; Sat,  9 Oct 2021 13:13:47 +0200 (CEST)
Date: Sat, 9 Oct 2021 13:13:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <YWF5ZK6he2BR5WjQ@waldemar-brodkorb.de>
References: <YV8+R2DNGs/T5x9O@waldemar-brodkorb.de>
 <87wnmmv6ot.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wnmmv6ot.fsf@dell.be.48ers.dk>
X-Operating-System: Linux 5.10.0-8-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.39
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
Reply-To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
Peter Korsgaard wrote,

> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
> 
>  > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Committed, thanks.
> 
> Your announcement mentions something about a DNS security issue, does
> this mean that this should also be backported to the stable branches?

Could be not bad.

> Is there an advisory or a CVE available?

Not yet as I know.
I asked the reporter on Thursday if they managed to open one.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
