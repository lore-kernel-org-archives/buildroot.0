Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D19AC05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 17:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5C1382181;
	Mon, 20 Feb 2023 17:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5C1382181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WFOq28f_zyat; Mon, 20 Feb 2023 17:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1228782131;
	Mon, 20 Feb 2023 17:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1228782131
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECDE71BF2B9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C683482131
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C683482131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkLjIyDh_TRE for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 17:09:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB73E82125
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB73E82125
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 17:09:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9D1CD10000C;
 Mon, 20 Feb 2023 17:09:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pU9f6-007Ug0-HL; Mon, 20 Feb 2023 18:09:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
References: <20230220072513.2336540-1-marcus.folkesson@gmail.com>
Date: Mon, 20 Feb 2023 18:09:12 +0100
In-Reply-To: <20230220072513.2336540-1-marcus.folkesson@gmail.com> (Marcus
 Folkesson's message of "Mon, 20 Feb 2023 08:25:13 +0100")
Message-ID: <874jrg1cxz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2023.1
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

>>>>> "Marcus" == Marcus Folkesson <marcus.folkesson@gmail.com> writes:

 > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
 > ---
 >  package/libostree/libostree.hash | 2 +-
 >  package/libostree/libostree.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
 > index ed31109fdb..3098cdd1fc 100644
 > --- a/package/libostree/libostree.hash
 > +++ b/package/libostree/libostree.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  8be2a9261c94e8b9ec4113380ffc480f8598245fb321a009bad4fae4b822411f  libostree-2022.7.tar.xz
 > +sha256	dd792b167693a1971c9f6e3168013d906ac035100ff6c719a3b322eb44b96f55  libostree-2023.1.tar.xz

NIT: Syntax is sha256<space><space><hash><space><space><filename> as
pointed out by ./utils/check-package:

package/libostree/libostree.hash:2: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
