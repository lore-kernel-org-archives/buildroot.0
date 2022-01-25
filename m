Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC40FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 19:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E1160A73;
	Tue, 25 Jan 2022 19:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7PPv86jNbN6; Tue, 25 Jan 2022 19:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B6C3607F7;
	Tue, 25 Jan 2022 19:24:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 497FB1BF297
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 380C5825C7
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMcebe6O87VE for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 19:23:59 +0000 (UTC)
X-Greylist: delayed 02:06:30 by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20E31825C6
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 19:23:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A3E720005;
 Tue, 25 Jan 2022 19:23:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCRQ2-0001u4-8R; Tue, 25 Jan 2022 20:23:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211014160824.2154396-1-fontaine.fabrice@gmail.com>
 <20211228230513.5ebc14e9@windsurf>
Date: Tue, 25 Jan 2022 20:23:54 +0100
In-Reply-To: <20211228230513.5ebc14e9@windsurf> (Thomas Petazzoni's message of
 "Tue, 28 Dec 2021 23:05:13 +0100")
Message-ID: <87sftbk4ad.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libdbi: needs dynamic library
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
Cc: =?utf-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4gd3JpdGVzOgoKID4gT24gVGh1LCAxNCBPY3QgMjAyMSAxODowODoyNCArMDIwMAog
PiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgog
Pj4gbGliZGJpIG5lZWRzIGR5bmFtaWMgbGlicmFyeSB0byBhdm9pZCB0aGUgZm9sbG93aW5nIGJ1
aWxkIGZhaWx1cmUgcmFpc2VkCiA+PiBzaW5jZSB0aGUgYWRkaXRpb24gb2YgdGhlIHBhY2thZ2Ug
aW4gY29tbWl0CiA+PiBjNmFhYzZlYmRiYmQzODczMTEwYTllMTlkZTE5NTdlNDljYjkzNDRlOgog
Pj4gCiA+PiBkYmlfbWFpbi5jOjg0OjI6IGVycm9yOiAjZXJyb3Igbm8gZHluYW1pYyBsb2FkaW5n
IHN1cHBvcnQKID4+IDg0IHwgI2Vycm9yIG5vIGR5bmFtaWMgbG9hZGluZyBzdXBwb3J0CiA+PiB8
ICBefn5+fgogPj4gCiA+PiBGaXhlczoKID4+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvOWNkNTZhNjI1Y2JkNTJiMGMwNzBlMmQ0NjJlMDJmNTE2MWQ5NjMxZAogPj4g
CiA+PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdt
YWlsLmNvbT4KID4+IC0tLQogPj4gcGFja2FnZS9saWJkYmktZHJpdmVycy9Db25maWcuaW4gfCA0
ICsrKysKID4+IHBhY2thZ2UvbGliZGJpL0NvbmZpZy5pbiAgICAgICAgIHwgNCArKysrCiA+PiAy
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKID4gQXBwbGllZCB0byBtYXN0ZXIsIGJ1
dCBhZnRlciBhZGRpbmcgdGhlICFCUjJfU1RBVElDX0xJQlMgZGVwZW5kZW5jeSB0bwogPiBjb2xs
ZWN0ZCwgYXMgc3VnZ2VzdGVkIGJ5IEhlcnbDqS4gSW5kZWVkLCB3ZSBwcmVmZXIgdG8gZHVwbGlj
YXRlIHRob3NlCiA+IGRlcGVuZGVuY2llcywgaWYgdGhleSB0dXJuIG91dCB0byBjaGFuZ2UgYXQg
dGhlIHRvcC1sZXZlbAogPiBCUjJfUEFDS0FHRV9DT0xMRUNURCBvcHRpb24uCgpDb21taXR0ZWQg
dG8gMjAyMS4xMS54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
