Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002FBC7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69988215E;
	Wed,  5 Apr 2023 20:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A69988215E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kc0RIPZ-Rqqv; Wed,  5 Apr 2023 20:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5EEA81E53;
	Wed,  5 Apr 2023 20:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5EEA81E53
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 923F71C2B98
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A406417CD
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A406417CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VP4nFEyDmMFG for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:11:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 649C2417C5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 649C2417C5
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:11:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5669C1C0002;
 Wed,  5 Apr 2023 20:11:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pk9TO-00Bway-F3; Wed, 05 Apr 2023 22:11:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
References: <20230404230029.32385-1-peter.macleod.thompson@gmail.com>
Date: Wed, 05 Apr 2023 22:11:14 +0200
In-Reply-To: <20230404230029.32385-1-peter.macleod.thompson@gmail.com> (Peter
 Thompson's message of "Tue, 4 Apr 2023 17:00:28 -0600")
Message-ID: <87zg7mjdi5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/sdl2_ttf: bump version to 2.20.2
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

>>>>> "Peter" == Peter Thompson <peter.macleod.thompson@gmail.com> writes:

 > Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
 > ---
 >  package/sdl2_ttf/sdl2_ttf.hash | 5 +++--
 >  package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 3 deletions(-)

 > diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
 > index 3313b341f9..5e7b614130 100644
 > --- a/package/sdl2_ttf/sdl2_ttf.hash
 > +++ b/package/sdl2_ttf/sdl2_ttf.hash
 > @@ -1,3 +1,4 @@
 >  # Locally calculated
 > -sha256  78cdad51f3cc3ada6932b1bb6e914b33798ab970a1e817763f22ddbfd97d0c57  SDL2_ttf-2.20.1.tar.gz
 > -sha256  28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
 > +sha256  9dc71ed93487521b107a2c4a9ca6bf43fb62f6bddd5c26b055e6b91418a22053  SDL2_ttf-2.20.2.tar.gz
 > +sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
 > +

Committed after dropping the extra newline as pointed out by
check-package:

package/sdl2_ttf/sdl2_ttf.hash:4: empty line at end of file

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
