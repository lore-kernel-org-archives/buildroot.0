Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8C9C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 08:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 667FD6FC4F;
	Wed,  1 Nov 2023 08:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 667FD6FC4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7h6bZ3f5g0o5; Wed,  1 Nov 2023 08:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DFB16FC53;
	Wed,  1 Nov 2023 08:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DFB16FC53
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80DEF1BF277
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 08:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 671916FC51
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 08:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 671916FC51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndK80LC4JopF for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 08:59:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F8626FC4F
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 08:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F8626FC4F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11AA9C0003;
 Wed,  1 Nov 2023 08:58:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qy73x-004mXD-1T;
 Wed, 01 Nov 2023 09:58:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <b0e4b3f0059d978aaa662b56826d66f737770c96.1698421556.git.stefan@agner.ch>
 <20231029084222.GJ687180@scaer>
Date: Wed, 01 Nov 2023 09:58:57 +0100
In-Reply-To: <20231029084222.GJ687180@scaer> (Yann E. MORIN's message of "Sun, 
 29 Oct 2023 09:42:22 +0100")
Message-ID: <87y1fhzw6m.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: bump version to
 v24.0.7
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
Cc: christian@aperture.us, Stefan Agner <stefan@agner.ch>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Stefan, All,
 > +Peter for backports

 > On 2023-10-27 17:46 +0200, Stefan Agner spake thusly:
 >> The overlay2 layers metadata are now written atomically. Many other
 >> bugfixes and hardening against security issues around the power capping
 >> framework.
 >> 
 >> https://github.com/moby/moby/releases/tag/v24.0.7
 >> 
 >> Signed-off-by: Stefan Agner <stefan@agner.ch>

 > Applied to master, thanks.

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
