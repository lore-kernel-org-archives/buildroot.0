Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E59C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 15:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B51A3419B2;
	Fri, 10 Feb 2023 15:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B51A3419B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eETRMpmLT77O; Fri, 10 Feb 2023 15:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D2EC41897;
	Fri, 10 Feb 2023 15:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D2EC41897
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 840881BF2B0
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68BC941897
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68BC941897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HrRctWAmQpSe for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 15:37:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF4494177B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF4494177B
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 15:37:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A2E66000D;
 Fri, 10 Feb 2023 15:36:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQVSK-0002aP-7U; Fri, 10 Feb 2023 16:36:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= via buildroot <buildroot@buildroot.org>
References: <20230210102655.94324-1-alexis.lothore@bootlin.com>
Date: Fri, 10 Feb 2023 16:36:56 +0100
In-Reply-To: <20230210102655.94324-1-alexis.lothore@bootlin.com> ("Alexis
 =?utf-8?Q?Lothor=C3=A9?= via buildroot"'s message of "Fri, 10 Feb 2023
 11:26:55 +0100")
Message-ID: <874jrtedlz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flit-core: set license
 path
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFsZXhpcyIgPT0gQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBXaGVuIGdlbmVyYXRpbmcgbGVnYWwgaW5mbyB3
aXRoIGEgY29uZmlndXJhdGlvbiBlbmFibGluZyBhIHBhY2thZ2Ugd2hpY2ggdXNlcwogPiBmbGl0
IGFzIHNldHVwIHR5cGUsIHdlIGdldCBhIHdhcm5pbmcgYWJvdXQgcHl0aG9uLWZsaXQtY29yZSBs
aWNlbnNlOgogPiBXQVJOSU5HOiBweXRob24tZmxpdC1jb3JlLTMuOC4wOiBjYW5ub3Qgc2F2ZSBs
aWNlbnNlIChIT1NUX1BZVEhPTl9GTElUX0NPUkVfTElDRU5TRV9GSUxFUyBub3QgZGVmaW5lZCkK
CiA+IEFkZCBtaXNzaW5nIHZhcmlhYmxlIHRvIHBvaW50IHRvIHB5dGhvbi1mbGl0LWNvcmUgbGlj
ZW5zZSBmaWxlCgogPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Ro
b3JlQGJvb3RsaW4uY29tPgogPiAtLS0KID4gIHBhY2thZ2UvcHl0aG9uLWZsaXQtY29yZS9weXRo
b24tZmxpdC1jb3JlLm1rIHwgMSArCiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1mbGl0LWNvcmUvcHl0aG9uLWZsaXQtY29y
ZS5tayBiL3BhY2thZ2UvcHl0aG9uLWZsaXQtY29yZS9weXRob24tZmxpdC1jb3JlLm1rCiA+IGlu
ZGV4IDRkN2JlZTgxZGEuLmY5NjE5MWFkZTYgMTAwNjQ0CiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9u
LWZsaXQtY29yZS9weXRob24tZmxpdC1jb3JlLm1rCiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWZs
aXQtY29yZS9weXRob24tZmxpdC1jb3JlLm1rCiA+IEBAIC04LDYgKzgsNyBAQCBQWVRIT05fRkxJ
VF9DT1JFX1ZFUlNJT04gPSAzLjguMAogPiAgUFlUSE9OX0ZMSVRfQ09SRV9TT1VSQ0UgPSBmbGl0
X2NvcmUtJChQWVRIT05fRkxJVF9DT1JFX1ZFUlNJT04pLnRhci5negogPiAgUFlUSE9OX0ZMSVRf
Q09SRV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzEwL2U1
L2JlMDg3NTFkMDdiMzA4ODlhZjEzMGNlYzIwOTU1Yzk4N2E3NDM4MGExMDA1OGU2ZTg4NTZlNDAx
MGFmYwogPiAgUFlUSE9OX0ZMSVRfQ09SRV9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCiA+ICtQWVRI
T05fRkxJVF9DT1JFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCgpZb3UgYWxzbyBuZWVkIHRvIGFk
ZCB0aGUgc2hhMjU2IG9mIExJQ0VOU0UgdG8gdGhlIC5oYXNoIGZpbGU6Cgpha2UgaG9zdC1weXRo
b24tZmxpdC1jb3JlLWxlZ2FsLWluZm8KZmxpdF9jb3JlLTMuOC4wLnRhci5nejogT0sgKG1kNTog
N2M0MWRhMTMyNzNmNzc4NzcwOWEyNGY3NGUwZjVhOTkpCmZsaXRfY29yZS0zLjguMC50YXIuZ3o6
IE9LIChzaGEyNTY6IGIzMDViMzBjOTk1MjZkZjVlNjNkNjAyMmRkMjMxMGEwYTk0MWExODdiZDM4
ODRmNGM4ZWYwNDE4ZGY2YzM5ZjMpCj4+PiBob3N0LXB5dGhvbi1mbGl0LWNvcmUgMy44LjAgRXh0
cmFjdGluZwpnemlwIC1kIC1jIC92YXIvbGliL2Rvd25sb2Fkcy9weXRob24tZmxpdC1jb3JlL2Zs
aXRfY29yZS0zLjguMC50YXIuZ3ogfCB0YXIgLS1zdHJpcC1jb21wb25lbnRzPTEgLUMgL2hvbWUv
cGVrby9zb3VyY2UvYnVpbGRyb290L291dHB1dC9idWlsZC9ob3N0LXB5dGhvbi1mbGl0LWNvcmUt
My44LjAgICAteGYgLQo+Pj4gaG9zdC1weXRob24tZmxpdC1jb3JlIDMuOC4wIFBhdGNoaW5nCj4+
PiBob3N0LXB5dGhvbi1mbGl0LWNvcmUgMy44LjAgQ29sbGVjdGluZyBsZWdhbCBpbmZvCkVSUk9S
OiBObyBoYXNoIGZvdW5kIGZvciBMSUNFTlNFCgpDb21taXR0ZWQgd2l0aCB0aGF0IGZpeGVkLCB0
aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
