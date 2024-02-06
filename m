Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66627C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22ACF6113F;
	Tue,  6 Feb 2024 16:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22ACF6113F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dl9tlrMjlkbT; Tue,  6 Feb 2024 16:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 859126105B;
	Tue,  6 Feb 2024 16:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 859126105B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A6A91BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0266741D6D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0266741D6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HpEb3ybt1b_6 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:29:00 +0000 (UTC)
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69E9E40971
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69E9E40971
Received: from pirotess (unknown [85.119.216.19])
 by iodev.co.uk (Postfix) with ESMTPSA id 199D6290A8C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:28:57 +0100 (CET)
Date: Tue, 6 Feb 2024 17:28:55 +0100
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Message-ID: <ZcJeR7nBNmKTPilA@pirotess>
References: <20240206162555.31657-1-ismael@iodev.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206162555.31657-1-ismael@iodev.co.uk>
X-Spam: Yes
Subject: Re: [Buildroot] [RFC PATCH v3] docs/website: Add Makefile to
 pre-generate the website
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

Ignore the commit message, it only supports the server-side includes
now.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
