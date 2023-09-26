Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BEAEE020C
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 06:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2FBC61410;
	Tue, 26 Sep 2023 06:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2FBC61410
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7KkobzHmjfJF; Tue, 26 Sep 2023 06:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 449886141E;
	Tue, 26 Sep 2023 06:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449886141E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C812B1BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1A8760BD6
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A8760BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0Yu_zUvp2tA for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 06:11:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0D206132B
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 06:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0D206132B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9074BE0009;
 Tue, 26 Sep 2023 06:10:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ql1Hd-002z41-VA; Tue, 26 Sep 2023 08:10:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Lang <dalang@gmx.at>
References: <20230906194420.279926-2-dalang@gmx.at>
 <20230906194420.279926-4-dalang@gmx.at>
Date: Tue, 26 Sep 2023 08:10:57 +0200
In-Reply-To: <20230906194420.279926-4-dalang@gmx.at> (Daniel Lang's message of
 "Wed, 6 Sep 2023 21:44:19 +0200")
Message-ID: <871qelbh1q.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/libcoap: ignore CVE-2023-35862
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Daniel" == Daniel Lang <dalang@gmx.at> writes:

 > According to a collaborator [0] the affected code isn't in 4.3.1
 > [0]: https://github.com/obgm/libcoap/issues/1117

 > Signed-off-by: Daniel Lang <dalang@gmx.at>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
