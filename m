Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C556C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 17:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0B8B4043C;
	Sun,  5 Dec 2021 17:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzyrpffZ_zEj; Sun,  5 Dec 2021 17:53:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C65B40431;
	Sun,  5 Dec 2021 17:53:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AF881BF484
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 17:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27E96403E6
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 17:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozaSnqVh95HZ for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 17:53:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5250403C3
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 17:53:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3B56660009;
 Sun,  5 Dec 2021 17:53:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mtvhF-0007w0-17; Sun, 05 Dec 2021 18:53:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20211205151518.19449-1-peter@korsgaard.com>
 <152ebb16-2ff4-e8b9-c07b-ec05e3781d46@mind.be>
Date: Sun, 05 Dec 2021 18:53:09 +0100
In-Reply-To: <152ebb16-2ff4-e8b9-c07b-ec05e3781d46@mind.be> (Arnout
 Vandecappelle's message of "Sun, 5 Dec 2021 17:03:44 +0100")
Message-ID: <87k0gj7xbu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/stress-ng: move to github
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 05/12/2021 16:15, Peter Korsgaard wrote:
 >> The current project URL returns 404 error because:
 >> 
 >> Quoting Coling King:
 >> "Unfortunately when I left Canonical last week they removed my tarballs"
 >> 
 >> So use github and update hash.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 >  Ricardo already sent essentially the same patch about two weeks ago,
 > so I applied that one instead.

Ahh, indeed - I somehow missed that.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
