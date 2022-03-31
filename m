Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EBCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 06:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F1EA8134C;
	Thu, 31 Mar 2022 06:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68nmjYOP6vdP; Thu, 31 Mar 2022 06:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B6EB81347;
	Thu, 31 Mar 2022 06:43:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 415321BF321
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2973141D4A
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkreR1ce4GbV for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 06:43:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9498C41D48
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 06:43:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71B1720007;
 Thu, 31 Mar 2022 06:43:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZoX6-000Yvx-H3; Thu, 31 Mar 2022 08:43:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220321192947.20712-1-ps.report@gmx.net>
 <b9b50da2-453b-bd4c-97c0-24a861ad7210@mind.be>
Date: Thu, 31 Mar 2022 08:43:48 +0200
In-Reply-To: <b9b50da2-453b-bd4c-97c0-24a861ad7210@mind.be> (Arnout
 Vandecappelle's message of "Sun, 27 Mar 2022 18:08:01 +0200")
Message-ID: <87pmm262qj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/wget: bump version to 1.21.3
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 21/03/2022 20:29, Peter Seiderer wrote:
 >> - bump version to 1.21.3 (for details see [1])
 >> - remove legacy --with-libidn option (see [2]), replace with
 >> --enable-iri option in case locale support and libidn2 are available
 >> [1]
 >> https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00017.html
 >> [2] https://git.savannah.gnu.org/cgit/wget.git/commit/configure.ac?id=a24e67e239ef949cc77a4c4e5a0beb703026a296
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 >  Applied to master, thanks.

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
