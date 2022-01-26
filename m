Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D82C636C9
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C97A41789;
	Wed, 26 Jan 2022 20:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPlg-Qj1440e; Wed, 26 Jan 2022 20:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E053341786;
	Wed, 26 Jan 2022 20:04:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE16D1BF5A0
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACDC041786
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEeiWMIPtnm4 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:03:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B144C41780
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:03:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id A7DC020000B;
 Wed, 26 Jan 2022 20:03:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCoWD-00065W-0D; Wed, 26 Jan 2022 21:03:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20220119202333.5A504832B5@busybox.osuosl.org>
Date: Wed, 26 Jan 2022 21:03:45 +0100
In-Reply-To: <20220119202333.5A504832B5@busybox.osuosl.org> (Yann E. MORIN's
 message of "Wed, 19 Jan 2022 21:28:02 +0100")
Message-ID: <87fspafen2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] paclage/tpm2-tss: do not select
 liburiparser
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
Content-Type: multipart/mixed; boundary="===============6807429487885751381=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6807429487885751381==
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=cbb70493af20445fbd24de4c5a15ba0de7f27c6e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 593683b45f72 (package/tpm2-tss: remove unused dependency)
 > removed the build-time dependency (in the .mk), but forgot to
 > remove it from the Config.in.

 > Signed-off-by: Tilman Keskin¶z <arved@arved.at>
 > [yann.morin.1998@free.fr: reword commit log]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard

--===============6807429487885751381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6807429487885751381==--
