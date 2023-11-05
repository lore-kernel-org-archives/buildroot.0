Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6409CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DEB340A8F;
	Sun,  5 Nov 2023 20:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DEB340A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_pRuEtXjXm4; Sun,  5 Nov 2023 20:41:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11DD240A65;
	Sun,  5 Nov 2023 20:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11DD240A65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3EE1BF57F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1264540A65
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1264540A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cb585oHdjGEh for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:41:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCCC140A5F
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCCC140A5F
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0ADBC0003;
 Sun,  5 Nov 2023 20:41:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qzjwB-00G2qy-0M;
 Sun, 05 Nov 2023 21:41:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1698527340.git.yann.morin.1998@free.fr>
 <5d97168a26fda40c66ff51e3b52faeb8d6a8201e.1698527340.git.yann.morin.1998@free.fr>
Date: Sun, 05 Nov 2023 21:41:38 +0100
In-Reply-To: <5d97168a26fda40c66ff51e3b52faeb8d6a8201e.1698527340.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 28 Oct 2023 23:09:04 +0200")
Message-ID: <87sf5kx799.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/4] docs/manual: svn downloads can be
 hash-checked
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since commit 89f5e989323a (support/download/svn: generate reproducible
 > svn archives), we've been able to generate reproducible archives, and
 > thus we have been able to verify the hashes for those archives.

 > However, the manual was not changed, and still falsely hinted that this
 > was not the cae.

 > Fix that.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
