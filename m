Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286ABC4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 19:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1106409F8;
	Sun, 14 Jan 2024 19:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1106409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tX-vlPlyRgx6; Sun, 14 Jan 2024 19:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2AEA40199;
	Sun, 14 Jan 2024 19:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2AEA40199
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 992411BF574
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 19:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E6C941740
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 19:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E6C941740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlRBBXtezjh6 for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 19:23:13 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B965341705
 for <buildroot@uclibc.org>; Sun, 14 Jan 2024 19:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B965341705
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1rP64c-0008rB-3T
 for buildroot@uclibc.org; Sun, 14 Jan 2024 20:23:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 14 Jan 2024 20:22:59 +0100
Message-ID: <pan$6d8e$a938877b$9cf95995$3f84f70c@ID-313208.user.individual.net>
References: <20230808064107.29318-1-bernd@kuhls.net>
 <ZaO79g0Pj7qf7V2i__30467.7474939794$1705229332$gmane$org@landeda>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH/next v4 1/2] package/onevpl: new package
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

Am Sun, 14 Jan 2024 11:48:22 +0100 schrieb Yann E. MORIN:

> Can you look into that, please (note that you renamed the package to
> libvpl later, so it would be nice to have a fix for master and one for
> the 2023.11.x branch.

Hi Yann,

done:
https://patchwork.ozlabs.org/project/buildroot/patch/
20240114191759.3236753-1-bernd@kuhls.net/
https://patchwork.ozlabs.org/project/buildroot/patch/
20240114192123.3237389-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
