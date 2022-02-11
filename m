Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DC9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 12:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33CD882735;
	Fri, 11 Feb 2022 12:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MtqGL3GyQ-Sg; Fri, 11 Feb 2022 12:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7646B8194A;
	Fri, 11 Feb 2022 12:19:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1A31BF2CE
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 12:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D8D3403D8
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 12:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWpSOLRXaHRX for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 12:19:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03C324035F
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 12:19:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC5C82000D;
 Fri, 11 Feb 2022 12:19:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nIUtZ-00071u-5q; Fri, 11 Feb 2022 13:19:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <20220210213036.F2A0582DFF@busybox.osuosl.org>
 <YgZO1rIL/K/4ynG3@waldemar-brodkorb.de>
Date: Fri, 11 Feb 2022 13:19:25 +0100
In-Reply-To: <YgZO1rIL/K/4ynG3@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Fri, 11 Feb 2022 12:56:06 +0100")
Message-ID: <87tud5r3xu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/lzip: bump to version 1.23
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Hi Peter,
 > Peter Korsgaard wrote,

 >> commit: https://git.buildroot.net/buildroot/commit/?id=4648090a89a2478a4b0fa8cc43a49bc94668622c
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> https://lists.nongnu.org/archive/html/lzip-bug/2022-02/msg00000.html
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/lzip/lzip.hash | 4 ++--
 >> package/lzip/lzip.mk   | 3 ++-
 >> 2 files changed, 4 insertions(+), 3 deletions(-)
 >> 
 >> diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
 >> index 57e7eb43f4..5e285a5ad8 100644
 >> --- a/package/lzip/lzip.hash
 >> +++ b/package/lzip/lzip.hash
 >> @@ -1,4 +1,4 @@
 >> -# From https://lists.nongnu.org/archive/html/lzip-bug/2021-01/msg00008.html
 >> -sha256  c3342d42e67139c165b8b128d033b5c96893a13ac5f25933190315214e87a948  lzip-1.22.tar.gz
 >> +# From https://lists.nongnu.org/archive/html/lzip-bug/2022-02/msg00000.html
 >> +sha256  ea02b9e6fb25d0e1a1d3ef4fdeb6ab26b931f1ece66fa1cee2983c95215e930a  lzip-1.23.tar.lz
 >> # Locally calculated
 >> sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
 >> diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
 >> index cca6da07d0..e3cc86b956 100644
 >> --- a/package/lzip/lzip.mk
 >> +++ b/package/lzip/lzip.mk
 >> @@ -4,7 +4,8 @@
 >> #
 >> ################################################################################
 >> 
 >> -LZIP_VERSION = 1.22
 >> +LZIP_VERSION = 1.23
 >> +LZIP_SOURCE = lzip-$(LZIP_VERSION).tar.lz
 > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

 > This seems to break the build for at least snps_archs38_hsdk_defconfig, when no
 > lzip is installed on the host. Kind of chicken-egg problem.

 > https://pastebin.com/cyt1UsuG

Doh, indeed - I've pushed a change to use the .tar.gz instead.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
