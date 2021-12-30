Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A3DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E0C282786;
	Thu, 30 Dec 2021 15:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfyVZpxI78TV; Thu, 30 Dec 2021 15:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E710681A24;
	Thu, 30 Dec 2021 15:59:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4B2E1BF263
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2FC481A24
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvenl5wICgXS for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:59:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 903FC8129F
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:59:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E7D4BE0007;
 Thu, 30 Dec 2021 15:59:23 +0000 (UTC)
Date: Thu, 30 Dec 2021 16:59:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211230165923.6a6be968@windsurf>
In-Reply-To: <20210908081630.3404221-1-kory.maincent@bootlin.com>
References: <20210908081630.3404221-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-a-toolchain: bump to
 version 10.3-2021.07
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

SGVsbG8gS8O2cnksCgpPbiBXZWQsICA4IFNlcCAyMDIxIDEwOjE2OjMwICswMjAwCktvcnkgTWFp
bmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBVcGRhdGUgdG8gdmVy
c2lvbiAxMC4zLTIwMjEuMDcuCj4gVGhlIG9sZCB2ZXJzaW9uIGNvbnRhaW5lZCBhIG5hc3R5IG5h
bm8uc3BlYy4gVGhlIG5hbm8uc3BlYyBmaWxlIHdhcyBhZGRpbmcKPiAtbGNfbmFubyBvcHRpb24g
YnV0IHRoZSBjX25hbm8uYSBsaWJyYXJ5IHdhcyBub3QgZGVsaXZlcmVkIGluIHRoZQo+IHRvb2xj
aGFpbiBhcmNoaXZlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFp
bmNlbnRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvYXJtLWdudS1hLXRvb2xjaGFpbi9h
cm0tZ251LWEtdG9vbGNoYWluLmhhc2ggfCAyICstCj4gIHBhY2thZ2UvYXJtLWdudS1hLXRvb2xj
aGFpbi9hcm0tZ251LWEtdG9vbGNoYWluLm1rICAgfCA2ICsrKy0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKClNvLCBJIGhhdmUgYXBwbGllZCwg
YnV0IHdpdGggYSB2ZXJ5IGltcG9ydGFudCBjaGFuZ2U6IEkgcmVhbGx5IGJ1bXAgdGhlCmdudS1h
IHRvb2xjaGFpbiwgSSBkb24ndCBzd2l0Y2ggdG8gdGhlIGdudS1ybSB0b29sY2hhaW4sIHdoaWNo
IHNob3VsZApiZSBhZGRlZCBhcyBhIHNlcGFyYXRlIHBhY2thZ2UsIGJlY2F1c2UgaXQncyBkaWZm
ZXJlbnQuCgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
