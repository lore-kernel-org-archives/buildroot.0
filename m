Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0749C7618E
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 21:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59CB54089D;
	Sat, 22 Apr 2023 21:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59CB54089D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PaTzU36it03; Sat, 22 Apr 2023 21:10:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE004088D;
	Sat, 22 Apr 2023 21:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE004088D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE691C2B82
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 21:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2569682218
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 21:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2569682218
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y5Z4pKbviRhC for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 21:10:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31A3F821FB
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31A3F821FB
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 21:10:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD22E240003;
 Sat, 22 Apr 2023 21:10:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqKUs-002LN4-PD; Sat, 22 Apr 2023 23:10:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent Fazio <vfazio@gmail.com>
References: <20230403013530.3502-1-vfazio@gmail.com>
Date: Sat, 22 Apr 2023 23:10:18 +0200
In-Reply-To: <20230403013530.3502-1-vfazio@gmail.com> (Vincent Fazio's message
 of "Sun, 2 Apr 2023 20:35:30 -0500")
Message-ID: <87wn237hdx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/check-package: drop six usage
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Vincent" == Vincent Fazio <vfazio@gmail.com> writes:

 > The shebang in check-package now defines python3. There is no longer a
 > need to maintain support with python 2.x.

 > See-also: 02b165dc71 (check-package: fix Python3 support)

 > Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
