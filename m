Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F5CECAAD1
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 08:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 138C7812E8;
	Thu,  1 Sep 2022 08:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 138C7812E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kts-x0dcBMwa; Thu,  1 Sep 2022 08:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F35C80C80;
	Thu,  1 Sep 2022 08:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F35C80C80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20BBE1BF34A
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 08:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8392418D3
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 08:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8392418D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id okeAz3v4d9a5 for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 08:41:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2AB141872
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2AB141872
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 08:41:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7189C1C000D
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 08:41:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1oTfli-000gDi-EE
 for buildroot@buildroot.org; Thu, 01 Sep 2022 10:41:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 01 Sep 2022 10:41:46 +0200
Message-ID: <87y1v3lc51.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.08-rc2 released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Buildroot 2022.08-rc2 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2022.08-rc2.tar.gz

or

http://buildroot.net/downloads/buildroot-2022.08-rc2.tar.xz

Or get it from Git:

git://git.buildroot.net/buildroot

Later than hoped, but here is another release candidate.

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2022.08-rc1..

    74  Fabrice Fontaine
    32  Ricardo Martincoski
    10  Giulio Benetti
     7  Thomas Petazzoni
     7  Yann E. MORIN
     6  Peter Korsgaard
     5  Romain Naour
     4  Francois Perrad
     4  Marcus Hoffmann
     3  Adrian Perez de Castro
     3  James Hilliard
     2  Jesse Van Gavere
     2  Joachim Wiberg
     2  Julien Olivain
     1  Alexey Brodkin
     1  Alistair Francis
     1  Arnout Vandecappelle
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Atsushi Nemoto
     1  Bernd Kuhls
     1  Bram Vlerick
     1  Edgar Bonet
     1  Markus Mayer
     1  Michael Fischer
     1  Michael Nosthoff
     1  Nicolas Cavallari
     1  Thomas Devoogdt

For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.08-rc2

Expect the final 2022.08 release by next week.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
