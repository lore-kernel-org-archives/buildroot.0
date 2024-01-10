Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A91C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 10:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8FC6613EF;
	Wed, 10 Jan 2024 10:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8FC6613EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkkKgrwUh5Im; Wed, 10 Jan 2024 10:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A524613EC;
	Wed, 10 Jan 2024 10:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A524613EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0011BF354
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57B5441C0F
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57B5441C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BM8LazmBzc0i for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 10:21:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F9D4402B2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F9D4402B2
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7A0440009;
 Wed, 10 Jan 2024 10:21:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNViC-008MqV-3C;
 Wed, 10 Jan 2024 11:21:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231227144424.1379160-1-fontaine.fabrice@gmail.com>
 <87wmszpibu.fsf@48ers.dk>
Date: Wed, 10 Jan 2024 11:21:28 +0100
In-Reply-To: <87wmszpibu.fsf@48ers.dk> (Peter Korsgaard's message of "Wed, 27
 Dec 2023 20:16:05 +0100")
Message-ID: <87v881cwuv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mp4v2: security bump to version
 2.1.3
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Fix CVE-2023-1450, CVE-2023-1451 and CVE-2023-29584
 >> https://github.com/enzo1982/mp4v2/releases/tag/v2.1.3
 >> https://github.com/enzo1982/mp4v2/releases/tag/v2.1.2

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
