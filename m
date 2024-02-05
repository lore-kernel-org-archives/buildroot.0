Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D809CC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ED8360FE9;
	Mon,  5 Feb 2024 11:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ED8360FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0eFy3DtJeoK; Mon,  5 Feb 2024 11:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6E9760FC0;
	Mon,  5 Feb 2024 11:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E9760FC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD201BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 825FE60FC0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 825FE60FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TadbFrLpf4U8 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:39:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77A6160EE5
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77A6160EE5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94D741BF206;
 Mon,  5 Feb 2024 11:39:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWxJu-00C4il-2w;
 Mon, 05 Feb 2024 12:39:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240111053157.2928259-1-james.hilliard1@gmail.com>
Date: Mon, 05 Feb 2024 12:39:26 +0100
In-Reply-To: <20240111053157.2928259-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Wed, 10 Jan 2024 22:31:57 -0700")
Message-ID: <87plxbta1d.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to
 version 0.18.5
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > License hash changed due to year update:
 > https://sourceforge.net/p/ruamel-yaml/code/ci/56b3e2666fb275deab3eec99193c103e4edf93bb/

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 >  package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
 >  package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 >  2 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
 > index 29852a51ed..7b5dc1e29a 100644
 > --- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
 > +++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
 > @@ -1,5 +1,5 @@
 >  # md5, sha256 from https://pypi.org/pypi/rfc3987/json
 > -md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
 > -sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
 > +md5  24fac3544a3c7bd7eeaf6e4f704a056e  ruamel.yaml-0.18.5.tar.gz
 > +sha256  ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0  ruamel.yaml-0.18.5.tar.gz


Hmm, I get a different hash:

ruamel.yaml-0.18.5.tar.gz: OK (md5: 24fac3544a3c7bd7eeaf6e4f704a056e)
ERROR: while checking hashes from package/python-ruamel-yaml//python-ruamel-yaml.hash
ERROR: ruamel.yaml-0.18.5.tar.gz has wrong sha256 hash:
ERROR: expected: ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0
ERROR: got     : 61917e3a35a569c1133a8f772e1226961bf5a1198bea7e23f06a0841dea1ab0e
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Any ideas?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
