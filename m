Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62906C10F1B
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 17:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC21F81457;
	Mon, 19 Dec 2022 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC21F81457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yr_gEjmbw51n; Mon, 19 Dec 2022 17:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FB2481463;
	Mon, 19 Dec 2022 17:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FB2481463
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F36541BF293
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 17:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE26C40933
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 17:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE26C40933
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpEvMENJ3CPJ for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 17:08:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93E0B4092B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93E0B4092B
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 17:08:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CAFD5E0006;
 Mon, 19 Dec 2022 17:08:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7JcX-006u1b-Tw; Mon, 19 Dec 2022 18:08:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: John Lemonovich <lemonoje@gmail.com>
References: <CABBCHidJG84Y_tpnSAE7t2qksEj4izv_TRMRLxfNcbADDUw05A@mail.gmail.com>
 <87sfhcomp4.fsf@dell.be.48ers.dk>
 <CABBCHifyTV7PV20P8krtmnRaRtwBrLDPuDBej37=AbUmgi-mNg@mail.gmail.com>
 <CABBCHic7A3dVoJLXKDFLkq4mYVzGuUbbuPR0EDav8ppHpw6x6g@mail.gmail.com>
Date: Mon, 19 Dec 2022 18:08:09 +0100
In-Reply-To: <CABBCHic7A3dVoJLXKDFLkq4mYVzGuUbbuPR0EDav8ppHpw6x6g@mail.gmail.com>
 (John Lemonovich's message of "Mon, 19 Dec 2022 12:00:37 -0500")
Message-ID: <87359biao6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] error - machine `ARM-buildroot' not recognized for
 libpcap
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

Pj4+Pj4gIkpvaG4iID09IEpvaG4gTGVtb25vdmljaCA8bGVtb25vamVAZ21haWwuY29tPiB3cml0
ZXM6CgpIZWxsbywKCiA+Pj4+IGhvc3QtZ2V0dGV4dC10aW55IDAuMy4yIERvd25sb2FkaW5nCiA+
IHdnZXQgLS1wYXNzaXZlLWZ0cCAtbmQgLXQgMyAtTwogPiAnL3VzL2psL3NmaXB2Ni9pcHY2L2J1
aWxkcm9vdC9vdXRwdXQvYnVpbGQvLmdldHRleHQtdGlueS0wLjMuMi50YXIuZ3ouUmxlS0tKL291
dHB1dCcKID4gJwogPiBodHRwczovL2dpdGh1Yi5jb20vc2Fib3RhZ2UtbGludXgvZ2V0dGV4dC10
aW55L2FyY2hpdmUvdjAuMy4yL2dldHRleHQtdGlueS0wLjMuMi50YXIuZ3oKID4gJwogPiAtLTIw
MjItMTItMTkgMTE6NTc6MTQtLQogPiBodHRwczovL2dpdGh1Yi5jb20vc2Fib3RhZ2UtbGludXgv
Z2V0dGV4dC10aW55L2FyY2hpdmUvdjAuMy4yL2dldHRleHQtdGlueS0wLjMuMi50YXIuZ3oKID4g
UmVzb2x2aW5nIGdpdGh1Yi5jb20gKGdpdGh1Yi5jb20pLi4uIGZhaWxlZDogTmFtZSBvciBzZXJ2
aWNlIG5vdCBrbm93bi4KID4gd2dldDogdW5hYmxlIHRvIHJlc29sdmUgaG9zdCBhZGRyZXNzIOKA
mGdpdGh1Yi5jb23igJkKClNvIHlvdSBjYW5ub3QgcmVzb2x2ZSBnaXRodWIuY29tCgo+IHdnZXQg
LS1wYXNzaXZlLWZ0cCAtbmQgLXQgMyAtTwogPiAnL3VzL2psL3NmaXB2Ni9pcHY2L2J1aWxkcm9v
dC9vdXRwdXQvYnVpbGQvLmdldHRleHQtdGlueS0wLjMuMi50YXIuZ3ouYWdrd29tL291dHB1dCcK
ID4gJ2h0dHA6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQvZ2V0dGV4dC10aW55L2dldHRleHQtdGlu
eS0wLjMuMi50YXIuZ3onCiA+IC0tMjAyMi0xMi0xOSAxMTo1NzozOS0tCiA+IGh0dHA6Ly9zb3Vy
Y2VzLmJ1aWxkcm9vdC5uZXQvZ2V0dGV4dC10aW55L2dldHRleHQtdGlueS0wLjMuMi50YXIuZ3oK
ID4gUmVzb2x2aW5nIHNvdXJjZXMuYnVpbGRyb290Lm5ldCAoc291cmNlcy5idWlsZHJvb3QubmV0
KS4uLiBmYWlsZWQ6IE5hbWUgb3IKID4gc2VydmljZSBub3Qga25vd24uCiA+IHdnZXQ6IHVuYWJs
ZSB0byByZXNvbHZlIGhvc3QgYWRkcmVzcyDigJhzb3VyY2VzLmJ1aWxkcm9vdC5uZXTigJkKCk9y
IHNvdXJjZXMuYnVpbGRyb290Lm5ldAoKSXQgc291bmRzIGxpa2UgeW91IGhhdmUgYSBETlMgaXNz
dWUgb24geW91ciBidWlsZCBtYWNoaW5lLiBQbGVhc2UgY2hlY2suCgotLSAKQnllLCBQZXRlciBL
b3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
