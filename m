Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BDDC433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 10:38:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C5AA60EBB
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 10:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C5AA60EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 409C6607DA;
	Thu,  4 Nov 2021 10:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSgQNqWHPAA7; Thu,  4 Nov 2021 10:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5DB36064B;
	Thu,  4 Nov 2021 10:38:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D001E1BF909
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 10:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC7FC6064B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 10:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KtOg6sw9X4Ra for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 10:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83966605E0
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 10:38:26 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6C88F20010;
 Thu,  4 Nov 2021 10:38:23 +0000 (UTC)
Date: Thu, 4 Nov 2021 11:38:22 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211104113822.200bc2b3@bootlin.com>
In-Reply-To: <20211104094440.879700-1-fontaine.fabrice@gmail.com>
References: <20211104094440.879700-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libdbi-drivers: bump to
 0bfae6c43134cf58dc89364328545982ca297abb
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiBUaHUsICA0IE5vdiAyMDIxIDEwOjQ0OjQwICswMTAwCkZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKCj4gQnVtcCB0byAwYmZhZTZjNDMx
MzRjZjU4ZGM4OTM2NDMyODU0NTk4MmNhMjk3YWJiIHRvIGZpeCB0aGUgZm9sbG93aW5nCj4gYnVp
bGQgZmFpbHVyZSB3aXRoIHBvc3RncmVzcWwgcmFpc2VkIHNpbmNlIGNvbW1pdAo+IGYwMzI5NzNm
YzU2YmE0YTczZDk1OTI3Mzg0ZDJhNWQxODVmMmRkY2Ugd2hpY2ggcmVtb3ZlZAo+IGh0dHBzOi8v
c291cmNlZm9yZ2UubmV0L3AvbGliZGJpLWRyaXZlcnMvbGliZGJpLWRyaXZlcnMvY2kvN2E4ZTI0
ZWMxY2Y3NjMyMjZmNGJlMzFiYTEwMThkODg4ZDQ5ODlmMwo+IAo+IGNoZWNraW5nIGZvciBNeVNR
TCBzdXBwb3J0Li4uIG5vCj4gY2hlY2tpbmcgZm9yIFBvc3RncmVTUUwgc3VwcG9ydC4uLiB5ZXMK
PiBjaGVja2luZyBmb3IgcGdfY29uZmlnLi4uIG5vCj4gCj4gRml4ZXM6Cj4gIC0gaHR0cDovL2F1
dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvODlmNTgwMDViM2E0ZDUwMzg0ODAzZmU2ZjA3
ZWEzMDQ5OTM1OTU5Ywo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tPgoKQWNrZWQtQnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29k
aW5hQGJvb3RsaW4uY29tPgoKVGhhbmtzIGZvciB0aGUgZml4LgoKSGVydsOpCgotLSAKSGVydsOp
IENvZGluYSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
