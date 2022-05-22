Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06F6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 20:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B339416F9;
	Sun, 22 May 2022 20:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLwXBpDXKAzv; Sun, 22 May 2022 20:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DA2B416FA;
	Sun, 22 May 2022 20:19:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 437521BF392
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31E8940A04
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5bs_0PrSnjdf for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 20:19:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B7FB400DD
 for <buildroot@buildroot.org>; Sun, 22 May 2022 20:19:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AE4E620002;
 Sun, 22 May 2022 20:19:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nss2i-00CSdb-IO; Sun, 22 May 2022 22:19:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
References: <20220415025224.1876125-1-tianyuanhao3@163.com>
Date: Sun, 22 May 2022 22:19:12 +0200
In-Reply-To: <20220415025224.1876125-1-tianyuanhao3@163.com> (TIAN Yuanhao's
 message of "Thu, 14 Apr 2022 19:52:24 -0700")
Message-ID: <87v8txxqv3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/network-manager: remove invalid
 dependencies
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

>>>>> "TIAN" == TIAN Yuanhao <tianyuanhao3@163.com> writes:

 > Dependency on libiw has been removed since 0.9.3.990 [1].
 > Dependency on libgcrypt has been removed since 1.2-beta1 [2].
 > Dependency on libuuid has been removed since 1.31.4-dev [3].

 > [1]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/7d0761588c2dde8816c109c38c1c94233fd74afe
 > [2]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/b6f5f030331cc680edbe19ae322e894494d63687
 > [3]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/73b9883c6f30320b727a664ff2c84cc772aac94b

 > Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
