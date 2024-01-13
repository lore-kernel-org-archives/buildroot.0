Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D44C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA9260C01;
	Sat, 13 Jan 2024 20:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FA9260C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehMWYBJWwkdx; Sat, 13 Jan 2024 20:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B24360B5D;
	Sat, 13 Jan 2024 20:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B24360B5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D47DF1BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA5EE41C54
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5EE41C54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YA690bOQIk5r for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:42:35 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D99F041C21
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99F041C21
Received: by mail.gandi.net (Postfix) with ESMTPSA id A28FAC0003;
 Sat, 13 Jan 2024 20:42:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOkpr-00DOLd-2Z;
 Sat, 13 Jan 2024 21:42:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20240113162647.3316051-1-bernd@kuhls.net>
 <20240113162647.3316051-3-bernd@kuhls.net>
Date: Sat, 13 Jan 2024 21:42:31 +0100
In-Reply-To: <20240113162647.3316051-3-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 13 Jan 2024 17:26:46 +0100")
Message-ID: <87mst9q820.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/4] linux: bump latest version to 6.7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 >  linux/Config.in | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/linux/Config.in b/linux/Config.in
 > index 9f9cf55d96..78e90b495a 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -28,8 +28,8 @@ choice
 >  	prompt "Kernel version"
 
 >  config BR2_LINUX_KERNEL_LATEST_VERSION
 > -	bool "Latest version (6.6)"
 > -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6 if BR2_KERNEL_HEADERS_AS_KERNEL
 > +	bool "Latest version (6.7)"
 > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7 if BR2_KERNEL_HEADERS_AS_KERNEL

Given how close we are to 2024.02-rc1 and the fact that kernel 6.6 is a
LTS kernel I would prefer to wait with this patch until 2024.02-rc1 is
tagged and then add it to next instead (same for the one for 6.7
headers).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
