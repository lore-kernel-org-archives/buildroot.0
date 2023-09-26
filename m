Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A37E8181D
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 06:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8625D61405;
	Tue, 26 Sep 2023 06:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8625D61405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zN5dHnppWkz; Tue, 26 Sep 2023 06:06:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6239612D4;
	Tue, 26 Sep 2023 06:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6239612D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85A151BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FAEA6132B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 06:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FAEA6132B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qE8_O7mXf1Bu for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 06:06:33 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23585612D4
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 06:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23585612D4
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1C60240007;
 Tue, 26 Sep 2023 06:06:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ql1DI-002yjg-0W; Tue, 26 Sep 2023 08:06:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230909075753.7471-1-thomas@devoogdt.com>
Date: Tue, 26 Sep 2023 08:06:27 +0200
In-Reply-To: <20230909075753.7471-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Sat, 9 Sep 2023 09:57:50 +0200")
Message-ID: <87edilbh98.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/4] package/webkitgtk: security bump to
 version 2.40.5
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Bugfix release with many security fixes, including (but not limited to)
 > patches for CVE-2023-37450, CVE-2023-38133, CVE-2023-38572, CVE-2023-38592,
 > CVE-2023-38594, CVE-2023-38595, CVE-2023-38597, CVE-2023-38599,
 > CVE-2023-38600, and CVE-2023-38611.

 > Release notes:

 >   https://webkitgtk.org/2023/07/21/webkitgtk2.40.4-released.html
 >   https://webkitgtk.org/2023/08/01/webkitgtk2.40.5-released.html

 > Accompanying security advisory:

 >   https://webkitgtk.org/security/WSA-2023-0006.html
 >   https://webkitgtk.org/security/WSA-2023-0007.html

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > ---
 > v2: no change

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
