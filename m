Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2286C38147
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 10:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8698F421AA;
	Sat, 16 Dec 2023 10:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8698F421AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuDrLda1QfoX; Sat, 16 Dec 2023 09:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D144642170;
	Sat, 16 Dec 2023 09:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D144642170
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59B601BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3391242170
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3391242170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-H7gTkC-Aqp for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 09:59:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3005842124
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 09:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3005842124
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A741E0003;
 Sat, 16 Dec 2023 09:59:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rERSb-00FPNv-2c;
 Sat, 16 Dec 2023 10:59:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Davis <davikovs@gmail.com>
References: <CAHQn7p+q+ZEpLdDWYG6M-oLP6mSqXtE1M95MKjQQfEBtOmf6xQ@mail.gmail.com>
Date: Sat, 16 Dec 2023 10:59:53 +0100
In-Reply-To: <CAHQn7p+q+ZEpLdDWYG6M-oLP6mSqXtE1M95MKjQQfEBtOmf6xQ@mail.gmail.com>
 (Davis's message of "Thu, 14 Dec 2023 08:07:00 +0200")
Message-ID: <87ttoia2na.fsf@48ers.dk>
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

 > Greetings!
 > Looks like Bluez 5.71 has been released.
 > It fixes CVE-2023-45866: https://ubuntu.com/security/CVE-2023-45866

 > Could it be possible to bump Bluez version to 5.71 in buildroot?

Sure, can you send a patch? Thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
