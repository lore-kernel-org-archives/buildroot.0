Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B6DC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 14:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9654281F86;
	Sat, 15 Jun 2024 14:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZbQu0DPmPp6; Sat, 15 Jun 2024 14:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7DE58220F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7DE58220F;
	Sat, 15 Jun 2024 14:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A21E1BF302
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 568F840569
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4wLCzVwi_6w for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 14:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3867400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3867400D7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3867400D7
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 14:41:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29183240004;
 Sat, 15 Jun 2024 14:41:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sIUag-000fbD-17;
 Sat, 15 Jun 2024 16:41:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
 <Zm1L7ZlBXIV2iowQ@landeda> <20240615144651.5f2e05f5@windsurf>
 <Zm2ldZk5DZ966rGj@landeda>
Date: Sat, 15 Jun 2024 16:41:14 +0200
In-Reply-To: <Zm2ldZk5DZ966rGj@landeda> (Yann E. MORIN's message of "Sat, 15
 Jun 2024 16:30:13 +0200")
Message-ID: <87sexes1yt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] docs,
 package/gcc: switch to Gitlab issue tracker
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2024-06-15 14:46 +0200, Thomas Petazzoni spake thusly:
 >> On Sat, 15 Jun 2024 10:08:13 +0200
 >> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
 >> 
 >> > It would have been nice if you had suggested a plan to deal with the
 >> > existing issues.
 > [--SNIP--]
 >> My plan was to have no plan at all, and simply "ignore" the existing
 >> issues. But alternatively, we could do a massive close of all existing
 >> open issues with a message saying that we moved to Gitlab and that if
 >> the issue still exists, it should be reopened in Gitlab.
 >> To me, this is probably good enough.

 > I am fine with that.

yeah, me too. I don't think we have a lot of very interesting open
issues.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
