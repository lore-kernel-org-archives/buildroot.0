Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F136C41535
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 08:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB2E60757;
	Fri, 22 Dec 2023 08:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AB2E60757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2br0U8EVrrGi; Fri, 22 Dec 2023 08:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACE65605B5;
	Fri, 22 Dec 2023 08:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACE65605B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 876FC1BF2F7
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 08:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DED183E0F
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 08:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DED183E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVO0o0GJXzcI for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 08:33:14 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 579AE83E09
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 08:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 579AE83E09
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AD85E0005;
 Fri, 22 Dec 2023 08:33:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rGaxz-001xGb-1v;
 Fri, 22 Dec 2023 09:33:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Davis <davikovs@gmail.com>
References: <20231218183230.1899-1-davikovs@gmail.com>
 <20231220212445.16494c0f@windsurf>
 <CAHQn7pKn5-Ss+zVkEzGow6TNm8xc2kmfkWMEXe2zZbYmFOmQPw@mail.gmail.com>
 <20231221084252.287ba580@windsurf>
 <CAHQn7pKD3HBJ96Pe90+gvsNehuALXGbXarqLDDcn8_M5hSKDrA@mail.gmail.com>
Date: Fri, 22 Dec 2023 09:33:11 +0100
In-Reply-To: <CAHQn7pKD3HBJ96Pe90+gvsNehuALXGbXarqLDDcn8_M5hSKDrA@mail.gmail.com>
 (Davis's message of "Fri, 22 Dec 2023 00:41:23 +0200")
Message-ID: <87il4q7i2g.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.71
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Davis" == Davis  <davikovs@gmail.com> writes:

 > Hello Thomas,
 > Thank you!

 > Just one more question, BlueZ itself is covered by a license that allows
 > persons not affiliated with BlueZ or Buildroot to bump the package version,
 > correct?

Yes. I am not aware of any license having such restrictions (and we
would not be able to carry such package in Buildroot then).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
