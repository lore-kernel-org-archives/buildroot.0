Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A73C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E9F6817ED;
	Fri, 22 Jul 2022 07:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E9F6817ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HB-WAvVeTtU3; Fri, 22 Jul 2022 07:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C11578146B;
	Fri, 22 Jul 2022 07:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C11578146B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45E081BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F36341B88
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F36341B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjzxyZPkN6Fr for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:47:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF25141B73
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF25141B73
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:47:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BF972240006;
 Fri, 22 Jul 2022 07:47:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oEnNM-0033V0-Qh; Fri, 22 Jul 2022 09:47:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220704073820.3B2DF81F75@busybox.osuosl.org>
Date: Fri, 22 Jul 2022 09:47:08 +0200
In-Reply-To: <20220704073820.3B2DF81F75@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 4 Jul 2022 09:50:43 +0200")
Message-ID: <87ilnpvbb7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] =?utf-8?q?=5Bgit_commit=5D_DEVELOPERS=3A_drop_Ga?=
 =?utf-8?q?=C3=ABl_Portay?=
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
b3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTkxNTYyYzkwNDVlYWJlNTBiMWJmNzhkNmNkZTk4
MjBhMzRhMjEzOTEKID4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9v
dC9jb21taXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCgogPiBHYcOrbCBQb3J0YXkgaXMgYXBwYXJl
bnRseSBubyBsb25nZXIgYXQgQ29sbGFib3JhOgoKID4gPGdhZWwucG9ydGF5QGNvbGxhYm9yYS5j
b20+OiBob3N0IG1haWwuY29sbGFib3JhLmNvLnVrWzQ2LjIzNS4yMjcuMTcyXSBzYWlkOgogPiAg
ICAgNTUwIDUuMS4xIDxnYWVsLnBvcnRheUBjb2xsYWJvcmEuY29tPjogUmVjaXBpZW50IGFkZHJl
c3MgcmVqZWN0ZWQ6IFVzZXIKID4gICAgIHVua25vd24gaW4gbG9jYWwgcmVjaXBpZW50IHRhYmxl
IChpbiByZXBseSB0byBSQ1BUIFRPIGNvbW1hbmQpCgogPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
UGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQ29tbWl0dGVkIHRvIDIw
MjIuMDUueCBhbmQgMjAyMi4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
