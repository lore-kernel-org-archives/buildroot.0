Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D900FC54EE9
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 13:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D6461105;
	Thu, 22 Sep 2022 13:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D6461105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyu-IN0SLehs; Thu, 22 Sep 2022 13:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E5BF61102;
	Thu, 22 Sep 2022 13:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E5BF61102
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD021BF2A4
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 13:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 248F541A53
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 13:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 248F541A53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sflUhMiLaf1h for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 13:34:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C20EB419BA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C20EB419BA
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 13:34:16 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 00409780357
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 15:34:10 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1obMLC-0004HY-OC; Thu, 22 Sep 2022 15:34:10 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.95)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1obMLB-003ZY3-S5; Thu, 22 Sep 2022 15:34:09 +0200
Date: Thu, 22 Sep 2022 15:34:09 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220922133409.i3bgl2t7hneye2tb@zenon.in.qult.net>
References: <20220913093235.wdaiq5lsy3mbcc6u@zenon.in.qult.net>
 <20220917151755.6dfaeb1b@windsurf>
 <20220919091607.a3n36rn44ct3iwuq@zenon.in.qult.net>
 <20220919114617.67d80b53@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919114617.67d80b53@windsurf>
Subject: Re: [Buildroot] [PATCH v3] package/chartjs: bump to version 3.9.1
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 19, 2022 at 11:46:17AM +0200, thus spake Thomas Petazzoni:
> So for your next revision of the patch, you can switch back to using
> the pre-generated JS files. Then if you are brave and want to give a
> try at implementing the two points mentioned above, it would be amazing!

Then I'll switch back to pre-generated JS files for now.  For the
moment, I'm too much in a hurry to be brave.

The v2-as-v4 is coming in the next post.

Ignacy

-- =

Ignacy Gaw=EAdzki
R&D Engineer
Green Communications
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
