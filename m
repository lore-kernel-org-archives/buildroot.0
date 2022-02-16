Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E65CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4772B83227;
	Wed, 16 Feb 2022 20:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPVprgJGwh77; Wed, 16 Feb 2022 20:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 718F1830A7;
	Wed, 16 Feb 2022 20:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90FC11BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E84140191
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4SLH89HQJZ2 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:50:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C5E840164
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:50:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 423AA100004;
 Wed, 16 Feb 2022 20:50:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nKRG2-0005fi-9B; Wed, 16 Feb 2022 21:50:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <aduskett@gmail.com>
References: <20220204193215.167521-1-aduskett@gmail.com>
Date: Wed, 16 Feb 2022 21:50:38 +0100
In-Reply-To: <20220204193215.167521-1-aduskett@gmail.com> (Adam Duskett's
 message of "Fri, 4 Feb 2022 11:32:15 -0800")
Message-ID: <87h78yh6xt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: bump to version
 4.0.2
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
Cc: Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Tested with:
 > support/testing/run-tests tests.package.test_python_django.TestPythonPy3Django

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

This fixes a number of security issues. It would have been good if you
could have mentioned that:

https://www.djangoproject.com/weblog/2022/feb/01/security-releases/

For 2021.02.x / 2021.11.x I will instead bump to 3.2.12.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
