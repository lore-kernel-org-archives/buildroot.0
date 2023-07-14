Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198D5EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 16:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9898C60E1A;
	Fri, 14 Jul 2023 16:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9898C60E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGYFUr6Y7otP; Fri, 14 Jul 2023 16:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D4D60B8E;
	Fri, 14 Jul 2023 16:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3D4D60B8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F6B61BF369
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 796C3401D8
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 796C3401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xrSWVcAIcaf for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 16:55:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD4934016B
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD4934016B
 for <buildroot@uclibc.org>; Fri, 14 Jul 2023 16:55:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qKM4P-0003yI-9N
 for buildroot@uclibc.org; Fri, 14 Jul 2023 18:55:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 14 Jul 2023 18:54:48 +0200
Message-ID: <pan$31a0$65270736$e06dfba7$5d75a16a@ID-313208.user.individual.net>
References: <20230325175815.24876-1-raphael.pavlidis@gmail.com>
 <20230326141805.310d6e67@windsurf>
 <826757ff-529e-c01f-cf4e-63c109ff8e5c@gmail.com>
 <eb8cf642-62ed-3f32-a32e-f7d28fd6998f__26834.4457073667$1685128600$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH v1 1/1] package/shadow: only yescrypt build
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

Am Fri, 26 May 2023 21:16:11 +0200 schrieb Raphael Pavlidis:

> It seems that shadow is hosted on GitHub. Currently, I do not have a
> GitHub account and do not want one. Feel free (and everybody else) to
> take the patch and make a PR.

Hi Raphael,

sorry, i did not see your patch when I created mine.

Upstream in the meantime committed my patch 
https://github.com/shadow-maint/shadow/commit/
29da702491eea314b915ea9c7a83c9af80cf5797

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
