Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4447C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 06:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D227404D4;
	Mon, 18 Dec 2023 06:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D227404D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-tzTxxw1ep3; Mon, 18 Dec 2023 06:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 295A440364;
	Mon, 18 Dec 2023 06:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 295A440364
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 555EE1BF3F4
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 06:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B4C281FA6
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 06:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B4C281FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVbCIQ1PXuCa for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 06:53:16 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C1881F92
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 06:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C1881F92
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58921240002;
 Mon, 18 Dec 2023 06:53:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rF7V2-00Fywv-2S;
 Mon, 18 Dec 2023 07:53:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Davis <davikovs@gmail.com>
References: <CAHQn7p+q+ZEpLdDWYG6M-oLP6mSqXtE1M95MKjQQfEBtOmf6xQ@mail.gmail.com>
 <87ttoia2na.fsf@48ers.dk>
 <CAHQn7pLwHQYFpYwzKd=Wzrebs2AY6jEQbJQoQHKPn2pn1BO1cA@mail.gmail.com>
Date: Mon, 18 Dec 2023 07:53:12 +0100
In-Reply-To: <CAHQn7pLwHQYFpYwzKd=Wzrebs2AY6jEQbJQoQHKPn2pn1BO1cA@mail.gmail.com>
 (Davis's message of "Mon, 18 Dec 2023 07:53:00 +0200")
Message-ID: <87jzpc9f3b.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Bluez 5.71 released
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

>>>>> "Davis" == Davis  <davikovs@gmail.com> writes:

 > I can send a patch if somebody else (who understands the legal side)
 > will sign it off.
 > Also it would be good if somebody could test it with a "vanilla" buildroot.

 > Should I send the patch?

Yes please!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
