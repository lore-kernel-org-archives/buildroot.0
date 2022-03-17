Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32498C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 07:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9DF281762;
	Thu, 17 Mar 2022 07:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZ55usk9fuBb; Thu, 17 Mar 2022 07:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0307A81435;
	Thu, 17 Mar 2022 07:48:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8F771BF3B0
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 07:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5C7381466
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 07:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A49zf6YaF525 for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 07:48:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 565B081406
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 07:48:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 02FD520007;
 Thu, 17 Mar 2022 07:48:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUks8-00CoX9-RS; Thu, 17 Mar 2022 08:48:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun via buildroot <buildroot@buildroot.org>
References: <20220228163238.405627-1-theo.lebrun@bootlin.com>
Date: Thu, 17 Mar 2022 08:48:36 +0100
In-Reply-To: <20220228163238.405627-1-theo.lebrun@bootlin.com>
 (=?utf-8?Q?=22Th=C3=A9o?= Lebrun
 via buildroot"'s message of "Mon, 28 Feb 2022 17:32:38 +0100")
Message-ID: <87v8wdrpd7.fsf@dell.be.48ers.dk>
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
CgogPiAiQXNjaWlEb2Mgc3BlY2lmaWNhdGlvbiIgcG9pbnRpbmcgdG93YXJkczoKID4gaHR0cHM6
Ly9wcm9qZWN0cy5lY2xpcHNlLm9yZy9wcm9qZWN0cy9hc2NpaWRvYy5hc2NpaWRvYy1sYW5nCgog
PiBTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgoK
Q29tbWl0dGVkIHRvIDIwMjEuMDIueCBhbmQgMjAyMS4xMS54LCB0aGFua3MuCgotLSAKQnllLCBQ
ZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
