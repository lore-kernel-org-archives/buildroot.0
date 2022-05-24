Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F977C433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 12:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D3A083F6F;
	Tue, 24 May 2022 12:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-5BgKgYH7K1; Tue, 24 May 2022 12:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B98F83F48;
	Tue, 24 May 2022 12:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 051681BF349
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 12:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7FF560C23
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 12:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zIIp2b-7nRg for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 12:57:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 772E160B95
 for <buildroot@buildroot.org>; Tue, 24 May 2022 12:57:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0D2F5240009;
 Tue, 24 May 2022 12:57:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ntU6a-00EyjN-W8; Tue, 24 May 2022 14:57:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Andy Yan" <andyshrk@163.com>
References: <5868454e.114f.18036cf775d.Coremail.andyshrk@163.com>
Date: Tue, 24 May 2022 14:57:44 +0200
In-Reply-To: <5868454e.114f.18036cf775d.Coremail.andyshrk@163.com> (Andy Yan's
 message of "Sun, 17 Apr 2022 17:16:47 +0800 (CST)")
Message-ID: <87a6b7ulyv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Is there any plan for supporting Qt6
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
Cc: ps.report@gmx.net, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andy" == Andy Yan <andyshrk@163.com> writes:

 > Hello:
 >       Buildroot is a great project, it gave me many convince for building embedded rootfs. 
 >       I found Peter has submitted Qt6 support at the early of 2021[0], but it seems this series has
 > not bee merged yet. May i Know if there is any further plan for Qt6 support in buildroot?

 > [0]https://patchwork.ozlabs.org/project/buildroot/cover/20210213174013.32584-1-ps.report@gmx.net/

I am not aware of any recent development related to this, but now that
2022.02 has been released it would be a good moment to get it included.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
