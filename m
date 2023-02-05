Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F7EC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 09:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96957409A7;
	Sun,  5 Feb 2023 09:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96957409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ZsF3VElk3un; Sun,  5 Feb 2023 09:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 867324092F;
	Sun,  5 Feb 2023 09:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 867324092F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E78A91BF28B
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 09:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDE178148B
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 09:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDE178148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGGQPeLZzVtx for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 09:01:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40F01813EE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40F01813EE
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 09:01:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2FC721BF208
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 09:01:42 +0000 (UTC)
Message-ID: <d57c991e-a8f5-bad2-e25f-7bfa03fa610d@korsgaard.com>
Date: Sun, 5 Feb 2023 10:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20230205081617.113018-1-bernd.kuhls@t-online.de>
 <20230205081617.113018-3-bernd.kuhls@t-online.de>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20230205081617.113018-3-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 3/3] package/freeswitch: security bump
 version to 1.10.9
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/02/2023 09.16, Bernd Kuhls wrote:
> Release notes:
> https://github.com/signalwire/freeswitch/releases/tag/v1.10.9
> 
> Upstream removed zrtp support:
> https://github.com/signalwire/freeswitch/pull/1848
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Fixed the checkpatch warning and applied, thanks;

package/freeswitch/freeswitch.hash:2: separation does not match 
expectation (http://nightly.buildroot.org/#adding-packages-hash

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
