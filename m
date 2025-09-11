Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9066CA1016
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 06:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4518E81248;
	Thu, 11 Sep 2025 06:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysjmpGDh4563; Thu, 11 Sep 2025 06:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA83381185
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA83381185;
	Thu, 11 Sep 2025 06:00:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1667234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 06:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A345241C07
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 06:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yqs1AooIdfeP for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 06:00:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6400641BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6400641BCB
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6400641BCB
 for <buildroot@uclibc.org>; Thu, 11 Sep 2025 06:00:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1uwaLn-0001aI-3x
 for buildroot@uclibc.org; Thu, 11 Sep 2025 08:00:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 11 Sep 2025 07:59:23 +0200
Message-ID: <pan$360d3$f6afddd6$d29d9b4f$a8f10dc0@ID-313208.user.individual.net>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-4-thomas.petazzoni__12012.9963777558$1757540015$gmane$org@bootlin.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 03/23] package/gkrellm: remove package,
 needs libgtk2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hi Thomas,

Am Wed, 10 Sep 2025 23:32:11 +0200 schrieb Thomas Petazzoni via buildroot:

> Since building just the server isn't very useful

using the gkrellm client in Debian trixie I can monitor my server which 
uses the gkrellm server so I think keeping gkrellm as server-only package 
still serves a purpose.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
