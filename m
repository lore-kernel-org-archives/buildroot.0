Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83445EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 16:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA8A6146C;
	Fri, 14 Jul 2023 16:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AA8A6146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksvBXKqOGtMx; Fri, 14 Jul 2023 16:34:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD7160BA3;
	Fri, 14 Jul 2023 16:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD7160BA3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E9221BF369
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5504B41858
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5504B41858
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AWT9ScKHRsoL for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 16:34:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95E3E4016B
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95E3E4016B
 for <buildroot@uclibc.org>; Fri, 14 Jul 2023 16:34:45 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qKLkg-0007LI-UE
 for buildroot@uclibc.org; Fri, 14 Jul 2023 18:34:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 14 Jul 2023 18:34:19 +0200
Message-ID: <pan$4e5b3$92dac13b$5af1097b$cb35c2af@ID-313208.user.individual.net>
References: <20230714143752.10215-1-tianyuanhao3__11301.4103307918$1689345521$gmane$org@163.com>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: move old
 Mediatek WiFi firmware to mediatek
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

Am Fri, 14 Jul 2023 14:37:52 +0000 schrieb TIAN Yuanhao:

> See:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-
firmware.git/commit/?id=8451c2b1d529dc1a49328ac9235d3cf5bb8a8fcb
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Tested-by: Bernd Kuhls <bernd@kuhls.net>
[build-tested]

Fixes:
http://autobuild.buildroot.net/results/fd2/
fd237455c59686d04a795af8b7e54e9f4678d073//

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
