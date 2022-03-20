Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A2EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2458408C6;
	Sun, 20 Mar 2022 18:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYAr5k5UgkDv; Sun, 20 Mar 2022 18:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC5D404A3;
	Sun, 20 Mar 2022 18:42:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3FE1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECB12404A3
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id is1-7YtW6wXq for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:42:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4EB440372
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:42:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D5CF2FF803;
 Sun, 20 Mar 2022 18:42:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nW0VU-00FG7v-UL; Sun, 20 Mar 2022 19:42:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20220315211223.1F9208408A@busybox.osuosl.org>
Date: Sun, 20 Mar 2022 19:42:24 +0100
In-Reply-To: <20220315211223.1F9208408A@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Tue, 15 Mar 2022 22:10:01 +0100")
Message-ID: <878rt4mpnz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] support/testing: test_rust.py: fix
 flake8 errors
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=12588a667a6e4d3c852a82a9d89c58bcf43eea1e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fix flake8 errors introduced in commit f0d1f21195

 > Fixes:
 > support/testing/tests/package/test_rust.py:2:1: F401 'tempfile' imported but unused
 > support/testing/tests/package/test_rust.py:3:1: F401 'subprocess' imported but unused
 > support/testing/tests/package/test_rust.py:4:1: F401 'shutil' imported but unused
 > support/testing/tests/package/test_rust.py:18:1: E302 expected 2 blank lines, found 1

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
