Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC646E95A80
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 19:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89A9C600CB;
	Sun,  8 Oct 2023 19:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89A9C600CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdmRe9cpZvBA; Sun,  8 Oct 2023 19:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFAA460FFB;
	Sun,  8 Oct 2023 19:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFAA460FFB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF0CA1BF42C
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 19:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5F0D60FFB
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 19:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F0D60FFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GiOwCbBEtSZ2 for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 19:33:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CEC4600CB
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 19:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CEC4600CB
Received: by mail.gandi.net (Postfix) with ESMTPSA id B01BE40007;
 Sun,  8 Oct 2023 19:33:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qpZWb-00DGRm-Pg; Sun, 08 Oct 2023 21:33:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20231006095142.2051641-1-peter@korsgaard.com>
 <87cyxpdrg8.fsf@48ers.dk>
 <CA+h8R2oqA6TCVbVbJZoCDiJ_hHA2iKbcsw8HKEBp6xmbsABJ9Q@mail.gmail.com>
Date: Sun, 08 Oct 2023 21:33:13 +0200
In-Reply-To: <CA+h8R2oqA6TCVbVbJZoCDiJ_hHA2iKbcsw8HKEBp6xmbsABJ9Q@mail.gmail.com>
 (Christian Stewart's message of "Sun, 8 Oct 2023 12:23:36 -0700")
Message-ID: <874jj0ewp2.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH-2023.08.x] package/go: security bump to
 version 1.20.9
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
Cc: Anisse Astier <anisse@astier.eu>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:

Hello,

 >> I'll also bump 2023.02.x to this as 1.19.x no longer is getting updates.
 >> 

 > Please also note that the bump from 1.19 to 1.20 requires the additional
 > bootstrap packages.

Thanks, but yes - Indeed. A bit unfortunate, but that's just how it is.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
