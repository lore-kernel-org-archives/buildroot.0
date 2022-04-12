Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CB8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 20:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62CE441781;
	Tue, 12 Apr 2022 20:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Urow_BnjbTA2; Tue, 12 Apr 2022 20:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15F7A40324;
	Tue, 12 Apr 2022 20:00:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF6D1BF239
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C28840324
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2gYSADIziW7 for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:59:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D1FF402E2
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 19:59:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7133:9439:48a3:ea79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AA1E413F7E7;
 Tue, 12 Apr 2022 21:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649793595;
 bh=/chPADc+ue8kZwG2Wo0q0F/Dp3XinR9VKwPYsjFgB0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eljljSnCEgLYgaif2j4/QmePSXIwjsKVmZbg6mRSpmRl/LSJ6AvrxCmty/ZxtRtlS
 8x7y5AWF6thFwRO7RcQTM/IhIfHtsoFBhMfSZGjQNXaVr28q49yYMBSEhYFhqLlrEE
 p4zPTiMoI65DZzCQ09fnaFmkS9dQTu6ICElAz/YND69npjTgvCyH1nW4dBHGMMcBAs
 imcyU8WefHp19DS+SEjquokdeTgrd21UqusGJqDWU72YrYpWtcb42c8AqjgVqB1FB2
 W5depbbyaqsO98P/yTKqanaDbGiC3O4Qzmdq0SDPFedcyyYbgaMfXMY/4EkgsabGN+
 vwhC06zfncvHg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 12 Apr 2022 21:59:52 +0200
Date: Tue, 12 Apr 2022 21:59:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220412195952.GL4029883@scaer>
References: <20220412132753.89827-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412132753.89827-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_DEVELOPERS=3A_add_missing_Miqu?=
 =?utf-8?q?=C3=A8l_Raynal_e-mail?=
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
Cc: =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2l1bGlvLCBBbGwsCgpPbiAyMDIyLTA0LTEyIDE1OjI3ICswMjAwLCBHaXVsaW8gQmVuZXR0aSBz
cGFrZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5l
dHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIERFVkVMT1BFUlMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGQ1MDM1YjMyMzkuLjdhODdjY2Vh
ZWYgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMjA2
Nyw3ICsyMDY3LDcgQEAgRjoJcGFja2FnZS9saWJmcmliaWRpLwo+ICBOOglNaW4gWHUgPHh1bWlu
cmVhZHlAZ21haWwuY29tPgo+ICBGOglwYWNrYWdlL3NoYWRvd3NvY2tzLWxpYmV2Lwo+ICAKPiAt
TjoJTWlxdcOobCBSYXluYWwKPiArTjoJTWlxdcOobCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+Cj4gIEY6CXBhY2thZ2UvbWFsaS1kcml2ZXIvCj4gIEY6CXBhY2thZ2Uvcm9ja2No
aXAtbWFsaS8KPiAgCj4gLS0gCj4gMi4yNS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
