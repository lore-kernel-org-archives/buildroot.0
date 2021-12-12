Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72660C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D603A60EA6;
	Sun, 12 Dec 2021 17:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DtFWhZ1-QNKo; Sun, 12 Dec 2021 17:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F41A60E86;
	Sun, 12 Dec 2021 17:05:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCA771BF31D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB33C60E86
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7qwNrqxx95X for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:05:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEAEC607B7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:05:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccde:e15f:6f40:89e5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 870162003CC;
 Sun, 12 Dec 2021 18:05:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639328712;
 bh=h17Fm4duma+l9Bh0GR1mqOHQ+jcvFBEOTPwZ03RX8Ok=;
 h=Date:From:To:Cc:Subject:From;
 b=XgIFloz0YVlWA8RI9NzhSKa6478bE5Vu5wYuVfhPagGuexegk1pOipU11UMPznHeY
 hyERPCIVs2OhzeUJfKSDDaa1QG4VU64xXXncY+mxy45oump3e/a/d6ZJKeAPFgjq/L
 8znZOcNXWKj9DD1Be5OqkheqehjZNtXG70mcGkG8TSDQC/jnfcNUs7HGP8vJ8aAzXC
 2vzJfb/yJm3p9gRAQeKQg5DqRJT3mt4QYKyDe8eMGaFLmcd9IE6tzQ6exQXWVmfQ+V
 StSVe80RKXnJISkTpy7LGwMTVQeQIrvtuxOvzd27fwEb5/I/RhCRqi51vpGe/Ayedl
 OQhjMdEHmIjPA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Dec 2021 18:05:01 +0100
Date: Sun, 12 Dec 2021 18:05:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Buildroot ML <buildroot@buildroot.org>
Message-ID: <20211212170501.GB2603@scaer>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: [Buildroot] 20th anniversay of Buildroot
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
Cc: Eric Andersen <andersen@codepoet.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

In about ten days from now, Buildroot will turn 20. On December the
22st, 2001, Eric did the first commit of what will ultimately become
Buildroot as it is now:

    commit ffde94bd2ca21542ae0b4518348f8e986b9d92e0
    Author: Eric Andersen <andersen@codepoet.org>
    Date:   Sat Dec 22 00:56:11 2001 +0000

        Initial revision

     Makefile                     | 206 +++++++++++++++++++++
     README                       |  28 +++
     boa.mk                       |  78 ++++++++
     busybox.mk                   |  63 +++++++
     sources/boa-config.site-i386 |   1 +
     sources/boa.conf             | 187 +++++++++++++++++++
     sources/device_table.txt     |  76 ++++++++
     sources/linux-uml.config     | 322 +++++++++++++++++++++++++++++++++
     sources/mime.types           | 205 +++++++++++++++++++++
     sources/skel.tar             | Bin 0 -> 71680 bytes
     10 files changed, 1166 insertions(+)

To celebrate this 20th anniversary and 60324 non-merge commits since, we
propose that we gather to a virtual event. Chill or heat your favourite
beverage, ready your webcam and your headset, and join us to this event
on 2021-12-22T20:00Z in our virtual Jitsi lounge:

    https://meet.jit.si/
    room: BuildrootTurns20

We will hang out for some informal discussions and small talk, and share
and recount stories about Buildroot.

Everyone is welcome to join, developers and users and lurkers alike. Come
make that a great event!

See you soon (by webcam very soon, and in-person as soon as possible!)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
