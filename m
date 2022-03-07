Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F291EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CF5832EB;
	Mon,  7 Mar 2022 19:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7exm2sL0FiK; Mon,  7 Mar 2022 19:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE3982F40;
	Mon,  7 Mar 2022 19:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E51B61BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3FF660E74
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QPgjlWw9jN0 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:28:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AD3860B50
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:28:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B39E4FF809;
 Mon,  7 Mar 2022 19:28:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRJ1X-000y7O-El; Mon, 07 Mar 2022 20:28:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun via buildroot <buildroot@buildroot.org>
References: <20220228163238.405627-1-theo.lebrun@bootlin.com>
Date: Mon, 07 Mar 2022 20:28:03 +0100
In-Reply-To: <20220228163238.405627-1-theo.lebrun@bootlin.com>
 (=?utf-8?Q?=22Th=C3=A9o?= Lebrun
 via buildroot"'s message of "Mon, 28 Feb 2022 17:32:38 +0100")
Message-ID: <87pmmx7ebg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] docs: fix links to AsciiDoc
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
Cc: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRow6lvIiA9PSBUaMOpbyBMZWJydW4gdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1
aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IExpbmtzIHdlcmUgYWltZWQgYXQgdGhlIG1ldGhvZHMu
Y28ubnogZG9tYWluLCB3aGljaCBpcyBub3cgcmV0dXJuaW5nCiA+IDQwNHMuIFRoZSBjdXJyZW50
IHNpdHVhdGlvbiBvZiBBc2NpaURvYyBpcyB1bmNsZWFyIHRvIG1lOiB0aGUgRmVkb3JhCiA+IHBh
Y2thZ2UgcG9pbnRzIHRvIHRoaXMgd2Vic2l0ZSwgdGhleSBvd24gYXNjaWlkb2Mub3JnLCBXaWtp
cGVkaWEgcG9pbnRzCiA+IHRvIHRoaXMgcHJvamVjdCBhcyB3ZWxsIGJ1dCB0aGVpciBHaXQgcmVw
bydzIFJFQURNRSBpbmNsdWRlcyB0aGUKID4gZm9sbG93aW5nIHBhcmFncmFwaDoKCiA+PiBBc2Np
aURvYy5weSBpcyBhIGxlZ2FjeSBwcm9jZXNzb3IgZm9yIHRoaXMgc3ludGF4LCBoYW5kbGluZyBh
biBvbGRlcgogPj4gcmVuZGl0aW9uIG9mIEFzY2lpRG9jLiBBcyBzdWNoLCB0aGlzIHdpbGwgbm90
IHByb3Blcmx5IGhhbmRsZSB0aGUKID4+IGN1cnJlbnQgQXNjaWlEb2Mgc3BlY2lmaWNhdGlvbi4g
SXQgaXMgc3VnZ2VzdGVkIHRoYXQgdW5sZXNzIHlvdQogPj4gc3BlY2lmaWNhbGx5IHJlcXVpcmUg
dGhlIEFzY2lpRG9jLnB5IHRvb2xjaGFpbiwgeW91IHNob3VsZCBmaW5kIGEKID4+IHByb2Nlc3Nv
ciB0aGF0IGhhbmRsZXMgdGhlIG1vZGVybiBBc2NpaURvYyBzeW50YXguCiA+IC0tLSBodHRwczov
L2dpdGh1Yi5jb20vYXNjaWlkb2MtcHkvYXNjaWlkb2MtcHkvYmxvYi8xMC4xLjMvUkVBRE1FLm1k
CgpUaGlzIGlzIGxpc3RlZCBhcyBwYXRjaCAyLzIsIGJ1dCBJIGRvbid0IHNlZSBhIDEvMj8KCk5v
dGljZSB0aGF0IC0tLSBlbmRzIHRoZSBjb21taXQgbWVzc2FnZSwgc28gZXZlcnl0aGluZyBhZnRl
ciB0aGlzIGdldApkcm9wcGVkIHdoZW4gYXBwbHlpbmcgdGhlIHBhdGNoIHdpdGggZ2l0IGFtLgoK
Q29tbWl0dGVkIHdpdGggdGhhdCBmaXhlZCwgdGhhbmtzLgoKID4gIkFzY2lpRG9jIHNwZWNpZmlj
YXRpb24iIHBvaW50aW5nIHRvd2FyZHM6CiA+IGh0dHBzOi8vcHJvamVjdHMuZWNsaXBzZS5vcmcv
cHJvamVjdHMvYXNjaWlkb2MuYXNjaWlkb2MtbGFuZwoKID4gU2lnbmVkLW9mZi1ieTogVGjDqW8g
TGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KID4gLS0tCiA+ICBkb2NzL2NvbmYvYXNj
aWlkb2MtdGV4dC5jb25mICB8IDIgKy0KID4gIGRvY3MvbWFudWFsL3dyaXRpbmctcnVsZXMudHh0
IHwgNCArKy0tCiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCiA+IGRpZmYgLS1naXQgYS9kb2NzL2NvbmYvYXNjaWlkb2MtdGV4dC5jb25mIGIvZG9j
cy9jb25mL2FzY2lpZG9jLXRleHQuY29uZgogPiBpbmRleCA0NzBiZGVjZmMyLi5iYjYxNGI5ZDg1
IDEwMDY0NAogPiAtLS0gYS9kb2NzL2NvbmYvYXNjaWlkb2MtdGV4dC5jb25mCiA+ICsrKyBiL2Rv
Y3MvY29uZi9hc2NpaWRvYy10ZXh0LmNvbmYKID4gQEAgLTEsNSArMSw1IEBACiA+ICAjIFJlZmVy
IHRvIGZvbGxvd2luZyBhc2NpaWRvYyBkb2N1bWVudGF0aW9uOgogPiAtIyAgICAgaHR0cDovL3d3
dy5tZXRob2RzLmNvLm56L2FzY2lpZG9jL3VzZXJndWlkZS5odG1sCiA+ICsjICAgICBodHRwczov
L2FzY2lpZG9jLXB5LmdpdGh1Yi5pby91c2VyZ3VpZGUuaHRtbAogPiAgIyBJbiBwYXJ0aWN1bGFy
IHNlY3Rpb25zICJNYWNyb3MiIGFuZCAiQXR0cmlidXRlIFJlZmVyZW5jZXMiCiA+ICAjCiA+ICAj
IEZvciBoeXBlcmxpbmtzLCBzaG93ICdsaW5rIHRleHQgW1VSTF0nIChpZiBsaW5rIHRleHQgcHJv
dmlkZWQpIG9yICdVUkwnCiA+IGRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC93cml0aW5nLXJ1bGVz
LnR4dCBiL2RvY3MvbWFudWFsL3dyaXRpbmctcnVsZXMudHh0CiA+IGluZGV4IDU3YmE2MWJkYjEu
Ljg0ZDhmNzY0MzEgMTAwNjQ0CiA+IC0tLSBhL2RvY3MvbWFudWFsL3dyaXRpbmctcnVsZXMudHh0
CiA+ICsrKyBiL2RvY3MvbWFudWFsL3dyaXRpbmctcnVsZXMudHh0CiA+IEBAIC0yMDcsMTAgKzIw
NywxMCBAQCBodHRwczovL2dpdGh1Yi5jb20vcGVuZ3V0cm9uaXgvZ2VuaW1hZ2UvYmxvYi9tYXN0
ZXIvUkVBRE1FLnJzdFtdLgogPiAgPT09IFRoZSBkb2N1bWVudGF0aW9uCiAKID4gIFRoZSBkb2N1
bWVudGF0aW9uIHVzZXMgdGhlCiA+IC1odHRwOi8vd3d3Lm1ldGhvZHMuY28ubnovYXNjaWlkb2Mv
W2FzY2lpZG9jXSBmb3JtYXQuCiA+ICtodHRwczovL2FzY2lpZG9jLXB5LmdpdGh1Yi5pby9bYXNj
aWlkb2NdIGZvcm1hdC4KIAogPiAgRm9yIGZ1cnRoZXIgZGV0YWlscyBhYm91dCB0aGUgYXNjaWlk
b2Mgc3ludGF4LCByZWZlciB0bwogPiAtaHR0cDovL3d3dy5tZXRob2RzLmNvLm56L2FzY2lpZG9j
L3VzZXJndWlkZS5odG1sW10uCiA+ICtodHRwczovL2FzY2lpZG9jLXB5LmdpdGh1Yi5pby91c2Vy
Z3VpZGUuaHRtbFtdLgogCiA+ICA9PT0gU3VwcG9ydCBzY3JpcHRzCiAKID4gLS0gCgogPiAyLjM1
LjEKCiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCiA+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKID4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgoKLS0g
CkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
