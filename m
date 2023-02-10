Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B94CC636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 15:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1553841635;
	Fri, 10 Feb 2023 15:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1553841635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6SErdHEn_dx; Fri, 10 Feb 2023 15:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41C314161E;
	Fri, 10 Feb 2023 15:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41C314161E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6554A1BF2B0
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FC1881327
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC1881327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOk06c5JSak9 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 15:53:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37CDF8131B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37CDF8131B
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 15:53:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6AF8510000C;
 Fri, 10 Feb 2023 15:53:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQVii-00039y-N8; Fri, 10 Feb 2023 16:53:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Frank Vanbever <frank.vanbever@mind.be>
References: <20230210110643.449927-1-frank.vanbever@mind.be>
Date: Fri, 10 Feb 2023 16:53:52 +0100
In-Reply-To: <20230210110643.449927-1-frank.vanbever@mind.be> (Frank
 Vanbever's message of "Fri, 10 Feb 2023 12:06:43 +0100")
Message-ID: <87zg9lcy9b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/elixir: drop package
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

>>>>> "Frank" == Frank Vanbever <frank.vanbever@mind.be> writes:

 > Elixir was a dependency of rabbitmq-server which got dropped in
 > 89815bad0a531d01ee2733dd9c17576a7647e1d9. It is a host package with no other
 > users, hence it is no longer required. Additionally, newer versions require
 > Erlang 23+.

 > Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
