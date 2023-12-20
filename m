Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0098C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 10:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A4CC81B60;
	Wed, 20 Dec 2023 10:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A4CC81B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pH2FP6M1c_sI; Wed, 20 Dec 2023 10:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E24E6819F6;
	Wed, 20 Dec 2023 10:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E24E6819F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F6541BF2B3
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2906941BB3
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2906941BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCgqe6tcSbQy for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 10:45:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D86B041933
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 10:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D86B041933
Received: by mail.gandi.net (Postfix) with ESMTPSA id D145E4000C;
 Wed, 20 Dec 2023 10:44:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rFu4Q-00HTL0-24;
 Wed, 20 Dec 2023 11:44:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
References: <20231220102750.2717274-1-xiangyu.chen@eng.windriver.com>
Date: Wed, 20 Dec 2023 11:44:58 +0100
In-Reply-To: <20231220102750.2717274-1-xiangyu.chen@eng.windriver.com>
 (Xiangyu Chen's message of "Wed, 20 Dec 2023 18:27:50 +0800")
Message-ID: <87il4t885x.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gawk: bump to version 5.3.0
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

>>>>> "Xiangyu" == Xiangyu Chen <xiangyu.chen@eng.windriver.com> writes:

 > From: Xiangyu Chen <xiangyu.chen@windriver.com>
 > Changes:
 > https://git.savannah.gnu.org/cgit/gawk.git/tree/ChangeLog?h=gawk-5.3.0

 > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
