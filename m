Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBF4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 23:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A59984162D;
	Tue, 11 Jan 2022 23:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCNw6HJalXDO; Tue, 11 Jan 2022 23:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1251141619;
	Tue, 11 Jan 2022 23:05:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 023A51C115D
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB03083EED
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 23:05:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fc2iikYksDo8 for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 23:05:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F86C83EEC
 for <buildroot@busybox.net>; Tue, 11 Jan 2022 23:05:04 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1n7QCL-0009M9-LG
 for buildroot@busybox.net; Wed, 12 Jan 2022 00:05:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 11 Jan 2022 22:57:32 -0000 (UTC)
Message-ID: <srl20s$16ro$1@ciao.gmane.io>
References: <srka7t$pu1$1@ciao.gmane.io> <20220111211018.4d236002@windsurf>
User-Agent: slrn/1.0.3 (Linux)
Subject: Re: [Buildroot] Diagnosing conflicts due to new Python version
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
Cc: buildroot@uclibc.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>
Message-ID: <20220111225732.AQsxM5n6ASMqocsWwA2agiPYSiTDyXKzjA5_35EEZj0@z>

On 2022-01-11, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I am confused by your e-mail. It seems to be a Gentoo question, but
> you sent it to the Buildroot mailing list.

Doh! That message was indeed intended for the gentoo mailing
list. Sorry about that.  [I was wondering why it hadn't showed up on
that list.]

--
Grant


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
