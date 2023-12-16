Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C287C38147
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 09:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0369E42124;
	Sat, 16 Dec 2023 09:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0369E42124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lI0lK22dkWf0; Sat, 16 Dec 2023 09:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DBE24209D;
	Sat, 16 Dec 2023 09:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DBE24209D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA731BF400
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 225334209D
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 225334209D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id au1AAuo9qa_P for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 09:58:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFF7742029
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 09:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF7742029
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CD14E0005;
 Sat, 16 Dec 2023 09:58:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rERRI-00FPG4-0j;
 Sat, 16 Dec 2023 10:58:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
References: <20231215031019.3481048-1-xiangyu.chen@eng.windriver.com>
Date: Sat, 16 Dec 2023 10:58:32 +0100
In-Reply-To: <20231215031019.3481048-1-xiangyu.chen@eng.windriver.com>
 (Xiangyu Chen's message of "Fri, 15 Dec 2023 11:10:19 +0800")
Message-ID: <87y1dua2pj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: bump to version 1.12
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
Cc: christian@aperture.us, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Xiangyu" == Xiangyu Chen <xiangyu.chen@eng.windriver.com> writes:

 > From: Xiangyu Chen <xiangyu.chen@windriver.com>
 > Changes:
 > https://github.com/containers/crun/releases/tag/1.12

 > Also add a patch to fix crun compile without libseccomp libcap issue

 > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
