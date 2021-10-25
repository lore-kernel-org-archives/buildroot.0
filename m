Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC595C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:29:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0CF60C4B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A0CF60C4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CDBC403C0;
	Mon, 25 Oct 2021 12:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qHP3YYNdI88Q; Mon, 25 Oct 2021 12:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE07040399;
	Mon, 25 Oct 2021 12:29:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 269B31BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23DC880BA4
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEA_iuLJZkFK for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:29:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1112280B9D
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 12:29:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 554FE240011;
 Mon, 25 Oct 2021 12:29:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mez6U-0001ez-E0; Mon, 25 Oct 2021 14:29:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210901141029.892409-1-francois.perrad@gadz.org>
 <20211019200643.GY2400@scaer>
Date: Mon, 25 Oct 2021 14:29:26 +0200
In-Reply-To: <20211019200643.GY2400@scaer> (Yann E. MORIN's message of "Tue,
 19 Oct 2021 22:06:43 +0200")
Message-ID: <877de1wamx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] support/scripts/pkg-stats: prefers
 stable version from release-monitoring.org
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
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IEZyYW7Dp29pcywgQWxsLAogPiBPbiAyMDIxLTA5LTAxIDE2OjEwICswMjAwLCBG
cmFuY29pcyBQZXJyYWQgc3Bha2UgdGh1c2x5OgogPj4gZm9yIGV4YW1wbGUgd2l0aCBsaWJwbmc6
IDEuNi4zNyBpbnN0ZWFkIG9mIDEuNy4wYmV0YTg5CiA+PiAKID4+IFNpZ25lZC1vZmYtYnk6IEZy
YW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgogPj4gLS0tCiA+PiBzdXBw
b3J0L3NjcmlwdHMvcGtnLXN0YXRzIHwgMSArCiA+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKID4+IAogPj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHMgYi9z
dXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRzCiA+PiBpbmRleCBjYzkxZDEzMTYuLjI0OWNjNmFmZSAx
MDA3NTUKID4+IC0tLSBhL3N1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHMKID4+ICsrKyBiL3N1cHBv
cnQvc2NyaXB0cy9wa2ctc3RhdHMKID4+IEBAIC00ODUsNiArNDg1LDcgQEAgYXN5bmMgZGVmIGNo
ZWNrX3BhY2thZ2VfZ2V0X2xhdGVzdF92ZXJzaW9uX2J5X2Rpc3RybyhzZXNzaW9uLCBwa2csIHJl
dHJ5PVRydWUpOgogPj4gCiA+PiBkYXRhID0gYXdhaXQgcmVzcC5qc29uKCkKID4+IHZlcnNpb24g
PSBkYXRhWyd2ZXJzaW9uJ10gaWYgJ3ZlcnNpb24nIGluIGRhdGEgZWxzZSBOb25lCiA+PiArICAg
ICAgICAgICAgdmVyc2lvbiA9IGRhdGFbJ3N0YWJsZV92ZXJzaW9ucyddWzBdIGlmICdzdGFibGVf
dmVyc2lvbnMnIGluIGRhdGEgZWxzZSB2ZXJzaW9uCgogPiBJJ3ZlIGNoYW5nZWQgdGhhdCB0byBm
aXQgYWxsIGluIGEgc2luZ2xlIGxpbmU6CgogPiAgICAgdmVyc2lvbiA9IGRhdGFbJ3N0YWJsZV92
ZXJzaW9ucyddWzBdIGlmICdzdGFibGVfdmVyc2lvbnMnIGluIGRhdGEgZWxzZSBkYXRhWyd2ZXJz
aW9uJ10gaWYgJ3ZlcnNpb24nIGluIGRhdGEgZWxzZSBOb25lCgogPiBBbmQgaXQgYWxsIGZpdHMg
aW4gdGhlIGFsbG93ZWQgMTMyLWNoYXIgbGltaXQhIDotKQoKOykKCk5JVDogZGljdC5nZXQgaXMg
aGFuZHkgZm9yIHN1Y2ggdXNlIGNhc2VzLCBFLkcuCgp2ZXJzaW9uID0gZGF0YS5nZXQoJ3ZlcnNp
b24nKQoKaXMgZXF1aXZhbGVudCBidXQgcXVpdGUgYSBiaXQgZWFzaWVyIHRvIHJlYWQgdGhhbjoK
CnZlcnNpb24gPSBkYXRhWyd2ZXJzaW9uJ10gaWYgJ3ZlcnNpb24nIGluIGRhdGEgZWxzZSBOb25l
CgoKRm9yIHRoaXMgY2hhbmdlIEkgZ3Vlc3Mgd2UgY291bGQgbG9vayBhdCB2ZXJzaW9ucyBpbnN0
ZWFkIG9mIHZlcnNpb24gYW5kCmRvIHNvbWV0aGluZyBsaWtlOgoKIyBmaXJzdCBlbGVtZW50IGlz
IHRoZSBsYXRlc3QgdmVyc2lvbgp2ZXJzaW9uID0gZGF0YS5nZXQoJ3N0YWJsZV92ZXJzaW9ucycs
IGRhdGEuZ2V0KCd2ZXJzaW9ucycsIFtOb25lXSkpWzBdCgotLSAKQnllLCBQZXRlciBLb3JzZ2Fh
cmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
