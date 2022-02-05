Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93FCC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 15:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92415404B6;
	Sat,  5 Feb 2022 15:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFmm1JZIZovJ; Sat,  5 Feb 2022 15:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0EFD40474;
	Sat,  5 Feb 2022 15:29:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 204061BF39A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 076A540474
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6Q4WT0JzfQS for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 15:29:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D23B402F6
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 15:29:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E5295FF805;
 Sat,  5 Feb 2022 15:29:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGN00-000178-8a; Sat, 05 Feb 2022 16:29:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
References: <20220131094156.166729-1-thomas.claveirole@green-communications.fr>
Date: Sat, 05 Feb 2022 16:29:16 +0100
In-Reply-To: <20220131094156.166729-1-thomas.claveirole@green-communications.fr>
 (Thomas Claveirole's message of "Mon, 31 Jan 2022 10:41:56 +0100")
Message-ID: <8735kxtjqr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openlayers: bump to version
 6.12.0
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

>>>>> "Thomas" == Thomas Claveirole <thomas.claveirole@green-communications.fr> writes:

 > Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
