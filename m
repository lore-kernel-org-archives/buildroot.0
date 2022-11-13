Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC89C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D6D1817B0;
	Sun, 13 Nov 2022 16:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D6D1817B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQlm1-wUKCDD; Sun, 13 Nov 2022 16:02:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61C7B81774;
	Sun, 13 Nov 2022 16:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61C7B81774
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 334951BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1527A81774
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1527A81774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GpXt74DkNPw6 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:02:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A95081756
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A95081756
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:02:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6E9B40006;
 Sun, 13 Nov 2022 16:02:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouFQl-005Qdg-Rz; Sun, 13 Nov 2022 17:01:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Lang Daniel via buildroot <buildroot@buildroot.org>
References: <VI1P190MB04938FB6F9AA6821AA4F67D19F2B9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Date: Sun, 13 Nov 2022 17:01:59 +0100
In-Reply-To: <VI1P190MB04938FB6F9AA6821AA4F67D19F2B9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 (Lang Daniel via buildroot's message of "Wed, 19 Oct 2022 09:14:20
 +0000")
Message-ID: <87k03yq1vs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version
 1.3.11
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
Cc: Lang Daniel <d.lang@abatec.at>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Lang" == Lang Daniel via buildroot <buildroot@buildroot.org> writes:

 > Service release. Issues resolved:
 > https://github.com/eclipse/paho.mqtt.c/milestone/18?closed=1

 > https://github.com/eclipse/paho.mqtt.c/releases/tag/v1.3.11

 > Signed-off-by: Daniel Lang <d.lang@abatec.at>

Committed to 2022.08.x and 2022.02.x given the bugfixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
