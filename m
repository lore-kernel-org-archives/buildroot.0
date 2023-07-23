Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB1DC001DF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 17:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22D0A410CA;
	Sun, 23 Jul 2023 17:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22D0A410CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LruNeGdDfzqA; Sun, 23 Jul 2023 17:11:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F0AB409C9;
	Sun, 23 Jul 2023 17:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F0AB409C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16B001BF5B5
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DEFA40477
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DEFA40477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uPIKBLdb5Nk for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 17:00:54 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A40E140363
 for <buildroot@uclibc.org>; Sun, 23 Jul 2023 17:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A40E140363
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qNcRv-0000dp-Lp
 for buildroot@uclibc.org; Sun, 23 Jul 2023 19:00:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 23 Jul 2023 19:00:26 +0200
Message-ID: <pan$de44d$38b4c003$d143c3e1$37c9ffcb@ID-313208.user.individual.net>
References: <20230718221120.1433795-1-bernd@kuhls.net>
 <20230722233110.0351d476__20261.6240990878$1690061497$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/kodi: fix filenames of kodi
 host utils
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

Am Sat, 22 Jul 2023 23:31:10 +0200 schrieb Thomas Petazzoni via buildroot:

> Is this just an improvement, or an actual fix for a build or runtime
> issue?

Hi Thomas.

its an improvement by following upstream's expections and does neither fix 
a build nor a runtime error.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
