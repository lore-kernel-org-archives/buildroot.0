Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4A7C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 22:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E2F8400C6;
	Sun,  4 Feb 2024 22:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E2F8400C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id skmnYnuRIzqH; Sun,  4 Feb 2024 22:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B26844013B;
	Sun,  4 Feb 2024 22:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26844013B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDF711BF3A8
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 22:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C074782071
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 22:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C074782071
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zfs2ExegJbE for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 22:33:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88DED8206C
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 22:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88DED8206C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72C4FE0004
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 22:33:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWl2z-00AlqO-18
 for buildroot@buildroot.org; Sun, 04 Feb 2024 23:33:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240125212237.46E4C864CC@busybox.osuosl.org>
Date: Sun, 04 Feb 2024 23:33:09 +0100
In-Reply-To: <20240125212237.46E4C864CC@busybox.osuosl.org> (Peter Korsgaard's
 message of "Thu, 25 Jan 2024 22:13:07 +0100")
Message-ID: <87sf27vp0a.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/gnutls: security bump to 3.8.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=b136bed2fd703548610e2ac3e0d54b33128db716
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > see CVE-2024-0553: Fix more timing side-channel inside RSA-PSK key exchange
 > see CVE-2024-0567: Fix assertion failure when verifying a certificate
 > chain with a cycle of cross signatures

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
