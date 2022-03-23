Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980CCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3153983312;
	Wed, 23 Mar 2022 21:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CENBu8RhYpOK; Wed, 23 Mar 2022 21:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9AAE841AF;
	Wed, 23 Mar 2022 21:03:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 696D21BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 584A760AA0
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBnuGDZukRIH for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:03:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DAA460808
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:03:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B6BE920005;
 Wed, 23 Mar 2022 21:03:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nX88l-009pco-AV; Wed, 23 Mar 2022 22:03:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kamel Bouhara via buildroot <buildroot@buildroot.org>
References: <20220310095602.2435745-1-kamel.bouhara@bootlin.com>
 <20220310095602.2435745-4-kamel.bouhara@bootlin.com>
Date: Wed, 23 Mar 2022 22:03:35 +0100
In-Reply-To: <20220310095602.2435745-4-kamel.bouhara@bootlin.com> (Kamel
 Bouhara via buildroot's message of "Thu, 10 Mar 2022 10:56:01 +0100")
Message-ID: <87zglge5zs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/4] package/libodb-boost: add host
 variant
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kamel" == Kamel Bouhara via buildroot <buildroot@buildroot.org> writes:

 > Add host variant of libodb-boost required by the ODB compiler.
 > The libodb-boost headers are needed at compile time, and
 > therefore installed in $(HOST_DIR).

 > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

Committed to 2021.02.x, 2021.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
