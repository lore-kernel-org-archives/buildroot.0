Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FABC433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 11:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F80B8136D;
	Mon, 17 Jan 2022 11:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnDFg2jIyozP; Mon, 17 Jan 2022 11:44:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BDD781365;
	Mon, 17 Jan 2022 11:44:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5581BF419
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 11:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8744881365
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 11:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2PXYPVG4xsg for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 11:44:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from exit1-us.msgsafe.io (exit1-us.msgsafe.io [104.131.125.206])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 620E181356
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 11:44:21 +0000 (UTC)
Received: from exit1-us.msgsafe.io (localhost [127.0.0.1])
 by exit1-us.msgsafe.io (Postfix) with ESMTP id B8EAB3F465
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 11:44:19 +0000 (UTC)
X-Msgsafe-Uuid: 6db20ffc-caf7-4d68-9bb0-0ec0a031bd56
To: buildroot@buildroot.org <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="0397d51880d9469caac916df57d3f6a0"
Mime-Version: 1.1 (msgsafe.io)
Message-Id: <20220117114419.B8EAB3F465@exit1-us.msgsafe.io>
Date: Mon, 17 Jan 2022 11:44:19 +0000 (UTC)
Subject: [Buildroot] package/vte: install to staging
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
From: rainbox2k12 via buildroot <buildroot@buildroot.org>
Reply-To: rainbox2k12 <rainbox2k12@msgsafe.io>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--0397d51880d9469caac916df57d3f6a0
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="786d385a76b849cfa42dcb92c495406a"

--786d385a76b849cfa42dcb92c495406a
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ascii"
Mime-Version: 1.0

Yann,

Can you accept my patch as an attached text document?

Cheers,

Rainer

\-- Sent using MsgSafe.io's Free Plan Private, encrypted, online communication
For everyone. https://www.msgsafe.io



--786d385a76b849cfa42dcb92c495406a
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="ascii"
Mime-Version: 1.0

<p>Yann,</p>
<p>Can you accept my patch as an attached text document?</p>
<p></p>
<p>Cheers,</p>
<p>Rainer</p>
<br><br></div>--</div>
<div>Sent using <a href='https:/www.msgsafe.io/?utm_source=msgsafe&utm_medium=email&utm_campaign=freemailsignature'>MsgSafe.io</a>'s Free Plan</div>
<div>Private, encrypted, online communication</div>
<div>For everyone. <a href='https:/www.msgsafe.io/?utm_source=msgsafe&utm_medium=email&utm_campaign=freemailsignature'>www.msgsafe.io</a></div>


--786d385a76b849cfa42dcb92c495406a--

--0397d51880d9469caac916df57d3f6a0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="vte-install-staging.patch"
Content-Type: text/x-patch; charset="ascii"; name="vte-install-staging.patch"
Mime-Version: 1.0

cGFja2FnZS92dGU6IGluc3RhbGwgdG8gc3RhZ2luZwoKdnRlIGFsc28gcHJvdmlkZXMgbGlidnRl
LCBhIGxpYnJhcnkgdGhhdCBjYW4gYmUgbGlua2VkIHRvIGJ5IG90aGVyCnByb2dyYW1zLCBzbyBp
bnN0YWxsIGl0IGluIHN0YWdpbmcuCgpTaWduZWQtb2ZmLWJ5OiBSYWluZXIgSm9uc3NvbiA8cmFp
bmJveDJrMTJAbXNnc2FmZS5pbz4KLS0tLS0tCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92dGUvdnRl
Lm1rIGIvcGFja2FnZS92dGUvdnRlLm1rCmluZGV4IDA3ZTgxMzYuLmNlYjJmMDkgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvdnRlL3Z0ZS5taworKysgYi9wYWNrYWdlL3Z0ZS92dGUubWsKQEAgLTExLDYg
KzExLDcgQEAgVlRFX1NJVEUgPSBodHRwOi8vZnRwLmdub21lLm9yZy9wdWIvZ25vbWUvc291cmNl
cy92dGUvJChWVEVfVkVSU0lPTl9NQUpPUikKIFZURV9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2Nv
bmYgbGliZ3RrMyBwY3JlMiAkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQogVlRFX0xJQ0VOU0Ug
PSBMR1BMLTMuMCsKIFZURV9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORy5MR1BMMworVlRFX0lOU1RB
TExfU1RBR0lORyA9IFlFUwogCiBpZmVxICgkKEJSMl9QQUNLQUdFX0lDVSkseSkKIFZURV9DT05G
X09QVFMgKz0gLURpY3U9dHJ1ZQoK

--0397d51880d9469caac916df57d3f6a0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--0397d51880d9469caac916df57d3f6a0--
