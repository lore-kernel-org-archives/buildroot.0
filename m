Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E397C7618E
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 21:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80E4041DA0;
	Sat, 22 Apr 2023 21:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80E4041DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ym-FsoBSCSgs; Sat, 22 Apr 2023 21:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0C9A41C60;
	Sat, 22 Apr 2023 21:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0C9A41C60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA7681C2B82
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 21:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1E9D82292
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 21:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E9D82292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yHmRjVrDiM5 for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 21:07:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B863F81F6B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B863F81F6B
 for <buildroot@busybox.net>; Sat, 22 Apr 2023 21:07:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 75CEFC0002;
 Sat, 22 Apr 2023 21:07:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqKRf-002LIY-L6; Sat, 22 Apr 2023 23:06:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20230405081842.244610-1-francois.perrad@gadz.org>
 <20230405081842.244610-2-francois.perrad@gadz.org>
Date: Sat, 22 Apr 2023 23:06:59 +0200
In-Reply-To: <20230405081842.244610-2-francois.perrad@gadz.org> (Francois
 Perrad's message of "Wed, 5 Apr 2023 10:18:42 +0200")
Message-ID: <875y9n8w3w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] configs/olimex_a20_olinuxino_lime*:
 configure eth0 with DHCP
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

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
