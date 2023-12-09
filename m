Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5B0C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 15:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335B860E77;
	Sat,  9 Dec 2023 15:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 335B860E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ar7zv_OfH6EN; Sat,  9 Dec 2023 15:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B8F560A81;
	Sat,  9 Dec 2023 15:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B8F560A81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC9C71BF2AB
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 15:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8395740930
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 15:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8395740930
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYEmkwy8ptLz for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 15:03:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A1F04036E
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 15:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A1F04036E
Received: by mail.gandi.net (Postfix) with ESMTPSA id A183920002;
 Sat,  9 Dec 2023 15:03:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rByrs-000B0J-01;
 Sat, 09 Dec 2023 16:03:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
References: <BeznnlTq0vvbpFka026Yd1oSJiN00BCfdSJrIJ5StZU1JXCG4xA25tNDQp7PhX_G1YfZ10xV9k1i4ohYUe6W64UxlEcmcdninKgmLEVMp6A=@protonmail.com>
 <Db9O_yrfPJCilzgeet7a7WTUMEe5k1lE366mkze_f7XgY7RJkKN6rLbxXz_fBNYaTrFFF06yDy8O-49GOs9lLRT6pcCMugsHI-EES3z7Usg=@protonmail.com>
Date: Sat, 09 Dec 2023 16:03:47 +0100
In-Reply-To: <Db9O_yrfPJCilzgeet7a7WTUMEe5k1lE366mkze_f7XgY7RJkKN6rLbxXz_fBNYaTrFFF06yDy8O-49GOs9lLRT6pcCMugsHI-EES3z7Usg=@protonmail.com>
 (Yair Ben-Avraham via buildroot's message of "Wed, 06 Dec 2023
 09:32:47 +0000")
Message-ID: <87h6krpgdo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gloox: bump version to 1.0.28
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
Cc: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yair" == Yair Ben-Avraham via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
 > ---
 > package/gloox/gloox.hash | 2 +-
 > package/gloox/gloox.mk | 2 +-
 > 2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/gloox/gloox.hash b/package/gloox/gloox.hash
 > index 66a3c2d1be..963b798299 100644
 > --- a/package/gloox/gloox.hash
 > +++ b/package/gloox/gloox.hash
 > @@ -1,3 +1,3 @@
 > # Locally calculated
 > -sha256 0b8b7371439bc58d9e51384b616c964b18b7b41b87af1b7855104380eda86ffb gloox-1.0.27.tar.bz2
 > +sha256 591bd12c249ede0b50a1ef6b99ac0de8ef9c1ba4fd2e186f97a740215cc5966c gloox-1.0.28.tar.bz2
 > sha256 40a20c41c8dabb8ba61bea983fa8f2f6989e67fac56bb62c2249053807fd26af LICENSE
 > diff --git a/package/gloox/gloox.mk b/package/gloox/gloox.mk

Something (your mailer?) ate a bunch of white space, so I had to fix
that up manually. Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
