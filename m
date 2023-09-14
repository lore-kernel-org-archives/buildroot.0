Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5879BEEAA61
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 18:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86CA841F68;
	Thu, 14 Sep 2023 18:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86CA841F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1tJP7YudX42; Thu, 14 Sep 2023 18:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 819D441FB1;
	Thu, 14 Sep 2023 18:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 819D441FB1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA731BF316
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 18:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09D394183A
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 18:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09D394183A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08-8wMTOYYWp for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 18:24:35 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4429402E0
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 18:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4429402E0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21A9A40006;
 Thu, 14 Sep 2023 18:24:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgr0w-008bcC-4c; Thu, 14 Sep 2023 20:24:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Stefan Agner <stefan@agner.ch>
References: <0a92454be5519ae93ca3c07770bc9cf8c0b6c19d.1694078576.git.stefan@agner.ch>
 <d913f7da2bb9720535c0e1826960d01fb1c53e3f.1694078576.git.stefan@agner.ch>
Date: Thu, 14 Sep 2023 20:24:30 +0200
In-Reply-To: <d913f7da2bb9720535c0e1826960d01fb1c53e3f.1694078576.git.stefan@agner.ch>
 (Stefan Agner's message of "Thu, 7 Sep 2023 11:23:25 +0200")
Message-ID: <877coswr35.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/docker-cli: bump version to v24.0.6
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
Cc: christian@aperture.us, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:

 > Bug fixes in containerd storage backend and Docker itself and a single
 > new warning about old Docker image format deprecation.

 > https://github.com/moby/moby/releases/tag/v24.0.6

 > Signed-off-by: Stefan Agner <stefan@agner.ch>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
