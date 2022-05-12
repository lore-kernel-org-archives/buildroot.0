Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55A8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 08:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6578783EB8;
	Thu, 12 May 2022 08:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hnuFRr-1kWxm; Thu, 12 May 2022 08:45:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 675C483EB3;
	Thu, 12 May 2022 08:45:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F01F1BF84C
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D57C419A8
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3R1syLu_D-b for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 08:45:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A8B0419A5
 for <buildroot@buildroot.org>; Thu, 12 May 2022 08:45:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A95FB1BF20B;
 Thu, 12 May 2022 08:44:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1np4RN-007giH-UL; Thu, 12 May 2022 10:44:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
References: <20220511103629.259937-1-egorenar@linux.ibm.com>
Date: Thu, 12 May 2022 10:44:57 +0200
In-Reply-To: <20220511103629.259937-1-egorenar@linux.ibm.com> (Alexander
 Egorenkov's message of "Wed, 11 May 2022 12:36:29 +0200")
Message-ID: <87pmkj9m2e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: drop fuse2 support
 and replace it with fuse3
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

>>>>> "Alexander" == Alexander Egorenkov <egorenar@linux.ibm.com> writes:

 > s390-tools dropped FUSE2 support since v2.20.
 > It has been replaced with FUSE3.

 > Fixes:
 > - http://autobuild.buildroot.net/results/e12bace34870a33b68eb5759cece051aaaf5c1f9

 > References:
 > - https://github.com/ibm-s390-linux/s390-tools/pull/117
 > - https://github.com/ibm-s390-linux/s390-tools/issues/116

 > Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
