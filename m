Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43525C25B4E
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 07:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A36BD41B3E;
	Fri, 20 Jan 2023 07:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A36BD41B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVOKj1RrrJQD; Fri, 20 Jan 2023 07:19:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F8A41B2D;
	Fri, 20 Jan 2023 07:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8F8A41B2D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDBC31BF2A7
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 07:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9A0D60F65
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 07:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9A0D60F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpgxKIJKlfce for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 07:19:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68D4560EF2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68D4560EF2
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 07:19:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E4A54FF803;
 Fri, 20 Jan 2023 07:19:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pIlgD-00AJvm-Rd; Fri, 20 Jan 2023 08:19:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
References: <VBwNLuJA6_zFEAtMG_B8NHN22C-vUtTiXkB1BRCnP2LxbBrsBrOhgAA0q3PPW-zR7mJL324mht-Cbf-XZzb0o9bldpk1PY199lzihCbNmVo=@protonmail.com>
Date: Fri, 20 Jan 2023 08:19:17 +0100
In-Reply-To: <VBwNLuJA6_zFEAtMG_B8NHN22C-vUtTiXkB1BRCnP2LxbBrsBrOhgAA0q3PPW-zR7mJL324mht-Cbf-XZzb0o9bldpk1PY199lzihCbNmVo=@protonmail.com>
 (Yair Ben-Avraham via buildroot's message of "Thu, 19 Jan 2023
 14:21:51 +0000")
Message-ID: <87h6wlbrm2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/sudo: security bump to version
 1.9.12p2
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
Cc: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yair" == Yair Ben-Avraham via buildroot <buildroot@buildroot.org> writes:

 > Fix https://nvd.nist.gov/vuln/detail/CVE-2023-22809
 > Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
