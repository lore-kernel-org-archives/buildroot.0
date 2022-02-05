Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F2DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 12:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7356740257;
	Sat,  5 Feb 2022 12:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Z0ThLo9dANv; Sat,  5 Feb 2022 12:48:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5FAA4025E;
	Sat,  5 Feb 2022 12:48:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9AA11BF2E3
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 12:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C64FF60BD2
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 12:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4QUPVud7HWw2 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 12:48:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ED81600B5
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 12:48:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 72A7EC0002;
 Sat,  5 Feb 2022 12:48:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGKUe-0007Qa-Ez; Sat, 05 Feb 2022 13:48:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: ca0 via buildroot <buildroot@buildroot.org>
References: <5_xofMlQqIrdAjpopLNCIYCGiqsc2UoXvUQG4GIV5Bd0dY31bw-gZ_0eoD0ix_iW-BI3-5O_RbQESkV3ybUN1zFSLY2r3PAr3ZOfxYOFmrU=@protonmail.ch>
 <ff363cc2-4eab-1b91-1933-d0fbe65aaf48@mind.be>
 <6c85206c-139f-474d-7ca5-5f21fd606d96@mind.be>
 <M1HJ925Vrlc5UKKd3Er28hvdnpcIq6zhIwkxj3UaM8a5YBNpnSQtz-4pMS7-kMf0GvOsrUAfZOTOvfvoa4GFwTnC-27WTz6NQUKoBWLYpz8=@protonmail.ch>
Date: Sat, 05 Feb 2022 13:48:44 +0100
In-Reply-To: <M1HJ925Vrlc5UKKd3Er28hvdnpcIq6zhIwkxj3UaM8a5YBNpnSQtz-4pMS7-kMf0GvOsrUAfZOTOvfvoa4GFwTnC-27WTz6NQUKoBWLYpz8=@protonmail.ch>
 (ca's message of "Thu, 03 Feb 2022 21:37:39 +0000")
Message-ID: <877da9wkb7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] package libldns
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
Cc: ca0 <ca0@protonmail.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gImNhMCIgPT0gY2EwIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
PiB3cml0ZXM6CgogPiBOYWFoIC0gYnVpbGRzIG9ubHkgZm9yIEludGVsLiAgRG8gYW4gYXJtIGJ1
aWxkIGFuZCB5b3UnbGwgZmluZCB0aGF0IHRoZQogPiBtNC9saWJ0b29sLm00IHJ1bnMgYSB3aG9s
ZSBsb3Qgb2YgbGRjb25maWcgY29tbWFuZHMgdGhhdCBzaG93IHNvbWUKID4gZXJyb3IgY29kZXMg
YW5kIHRoZSB3b3JzdCBwYXJ0IGlzIHRoYXQgdGhlIGxpYmMgZmlsZXMgbWVudGlvbmVkIGFyZQog
PiAiYmxvd24gYXdheSIgKHNlZQogPiBodHRwczovL2RpY3Rpb25hcnkudG4vd2hhdHMtYW5vdGhl
ci13b3JkLWZvci1ibG93bi1hd2F5LykgbGlrZSB0YWtlbgogPiBvdXIgYmVoaW5kIHRoZSBzaGVk
IGFuZCBoYXZlIGEgZmV3IGJ1bGxldHMgcHV0IGluIHRoZW0gLQogPiBpZS4gZGVsZXRlZC4gRG8g
eW91IGtub3cgd2hhdCBhIHBhaW4gaXQgaXMgbm90IGhhdmluZyB0aGUgYnVpbGQgZmFpbAogPiB0
aGVyZSBhbmQgdGhlbiwgYmVjYXVzZSB5b3UgaGF2ZSB0byBkZWJ1ZyBhIG5vbiB3b3JraW5nIGlu
aXQsIGNoZWNrCiA+IHRoZSBrZXJuZWwgYW5kIHRoZW4gZmluZCB0aGF0IHlvdXIgdXNlciBzcGFj
ZSBoYXMgYmVlbiBjcmlwcGxlZCBieQogPiBzb21lIE5hemkgY29sbGFib3JhdG9ycyAobXkgYmFk
LCBJJ2xsIHN0aWNrIHRvIEVVIE5hemkgcmVmZXJlbmNlcyBmcm9tCiA+IG5vdyBvbikuCgogPiBB
cmUgeW91IHNheWluZyB0aGF0IHRoaXMgcGFja2FnZSB3b3JrcyBmb3IgQVJNPwoKSXQgYnVpbGRz
IGhlcmUgb24gYXJtdjcvbXVzbCB3aXRob3V0IGlzc3VlcyBvbiBnaXQgbWFzdGVyOgoKY2F0IGRl
ZmNvbmZpZwpCUjJfYXJtPXkKQlIyX2NvcnRleF9hOT15CkJSMl9BUk1fRU5BQkxFX1ZGUD15CkJS
Ml9UT09MQ0hBSU5fRVhURVJOQUw9eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eQpC
UjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fQVJNVjdfRUFCSUhGX01VU0xfU1RBQkxFPXkK
QlIyX1BBQ0tBR0VfTElCTEROUz15CiMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQK
CnRyZWUgdGFyZ2V0L2xpYiB0YXJnZXQvdXNyL2xpYgp0YXJnZXQvbGliCuKUnOKUgOKUgCBsZC1t
dXNsLWFybWhmLnNvLjEgLT4gLi4vbGliL2xpYmMuc28K4pSc4pSA4pSAIGxpYmF0b21pYy5zby4x
IC0+IGxpYmF0b21pYy5zby4xLjIuMArilJzilIDilIAgbGliYXRvbWljLnNvLjEuMi4wCuKUnOKU
gOKUgCBsaWJjLnNvCuKUlOKUgOKUgCBsaWJnY2Nfcy5zby4xCnRhcmdldC91c3IvbGliCuKUnOKU
gOKUgCBsaWJjcnlwdG8uc28gLT4gbGliY3J5cHRvLnNvLjEuMQrilJzilIDilIAgbGliY3J5cHRv
LnNvLjEuMQrilJzilIDilIAgbGliZ2ZvcnRyYW4uc28uNSAtPiBsaWJnZm9ydHJhbi5zby41LjAu
MArilJzilIDilIAgbGliZ2ZvcnRyYW4uc28uNS4wLjAK4pSc4pSA4pSAIGxpYmxkbnMuc28gLT4g
bGlibGRucy5zby4zLjIuMArilJzilIDilIAgbGlibGRucy5zby4zIC0+IGxpYmxkbnMuc28uMy4y
LjAK4pSc4pSA4pSAIGxpYmxkbnMuc28uMy4yLjAK4pSc4pSA4pSAIGxpYnNzbC5zbyAtPiBsaWJz
c2wuc28uMS4xCuKUnOKUgOKUgCBsaWJzc2wuc28uMS4xCuKUnOKUgOKUgCBsaWJzdGRjKysuc28u
NiAtPiBsaWJzdGRjKysuc28uNi4wLjI4CuKUnOKUgOKUgCBsaWJzdGRjKysuc28uNi4wLjI4CuKU
nOKUgOKUgCBsaWJzdGRjKysuc28uNi4wLjI4LWdkYi5weQrilJzilIDilIAgbGliei5zbyAtPiBs
aWJ6LnNvLjEuMi4xMQrilJzilIDilIAgbGliei5zby4xIC0+IGxpYnouc28uMS4yLjExCuKUnOKU
gOKUgCBsaWJ6LnNvLjEuMi4xMQrilJTilIDilIAgb3MtcmVsZWFzZQotLSAKQnllLCBQZXRlciBL
b3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
