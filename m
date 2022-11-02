Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBF2C43219
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 810C640B51;
	Wed,  2 Nov 2022 22:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 810C640B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpLczPCStweP; Wed,  2 Nov 2022 22:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 990C640A92;
	Wed,  2 Nov 2022 22:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 990C640A92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95F7C1BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E5B140B51
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E5B140B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70KnDHzAzRCp for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:54:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D3D340B46
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D3D340B46
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:54:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D06DFF803;
 Wed,  2 Nov 2022 22:54:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqMcf-007nMS-C8; Wed, 02 Nov 2022 23:54:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221017190300.6A2B186E83@busybox.osuosl.org>
Date: Wed, 02 Nov 2022 23:54:13 +0100
In-Reply-To: <20221017190300.6A2B186E83@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 17 Oct 2022 21:01:42 +0200")
Message-ID: <87fsf1rmqy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/openssh: fix hash of LICENSE
 file
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gY29tbWl0OiBodHRwczovL2dpdC5idWlsZHJv
b3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTI5MWM2YzI3YWRhZjc1ZmZkMWQ4NGI5MjBlMWVk
NzljM2Y4NGNjMTMKID4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9v
dC9jb21taXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCgogPiBUaGUgYnVtcCBmcm9tIDkuMHAxIHRv
IDkuMXAxIGluIGNvbW1pdAogPiBiYjU3MWRjM2U4N2QwZTg0YjNhZTEyMWUwZDRhOWM2MDM5YTA1
MWZhIGZvcmdvdCB0byB1cGRhdGUgdGhlIGhhc2ggb2YKID4gdGhlIGxpY2Vuc2UgZmlsZS4gVGhl
IGxpY2Vuc2UgZmlsZSBjaGFuZ2UgKGRldGFpbGVkIGJlbG93KSBkb2VzIG5vdAogPiBjaGFuZ2Ug
dGhlIGxpY2Vuc2UgdGVybXMgb2YgT3BlblNTSDoKCiA+IC0tLSBvdXRwdXQvYnVpbGQvb3BlbnNz
aC05LjBwMS9MSUNFTkNFCTIwMjItMDQtMDYgMDI6NDc6NDguMDAwMDAwMDAwICswMjAwCiA+ICsr
KyBvdXRwdXQvYnVpbGQvb3BlbnNzaC05LjFwMS9MSUNFTkNFCTIwMjItMTAtMDMgMTY6NTE6NDIu
MDAwMDAwMDAwICswMjAwCiA+IEBAIC0yMzEsNiArMjMxLDcgQEAKID4gIAlFcmljIFAuIEFsbG1h
bgogPiAgCVRoZSBSZWdlbnRzIG9mIHRoZSBVbml2ZXJzaXR5IG9mIENhbGlmb3JuaWEKID4gIAlD
b25zdGFudGluIFMuIFN2aW50c29mZgogPiArCUt1bmdsaWdhIFRla25pc2thIEjDtmdza29sYW4K
CiA+ICAJKiBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1z
LCB3aXRoIG9yIHdpdGhvdXQKID4gIAkqIG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92
aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucwoKID4gRml4ZXM6CgogPiAgIGh0dHA6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzY5N2NkY2VhMTI4YzM3MTZjOWFlODFi
ZTZjOTc5MzdlYmQ4MGE1ZGEvCgogPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQ29tbWl0dGVkIHRvIDIwMjIuMDgueCwgdGhh
bmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
