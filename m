Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F02DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 22:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C098941942;
	Thu, 14 Apr 2022 22:24:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ya_T2mkgZjL2; Thu, 14 Apr 2022 22:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8869D4193E;
	Thu, 14 Apr 2022 22:24:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D64191BF9A4
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 22:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C46948176B
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 22:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5akIU3qzxMnu for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 22:24:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3D168151E
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 22:24:12 +0000 (UTC)
Received: from [77.244.183.192] (port=63004 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nf7sp-000A4b-2N; Fri, 15 Apr 2022 00:24:11 +0200
Message-ID: <a1178aa6-6a4c-b0cf-ed16-b70e436fab20@lucaceresoli.net>
Date: Fri, 15 Apr 2022 00:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: it-IT
To: Arnout Vandecappelle <arnout@mind.be>, Neal Frager <neal.frager@amd.com>, 
 buildroot@buildroot.org
References: <20220408145531.1641356-1-neal.frager@amd.com>
 <20220408145531.1641356-2-neal.frager@amd.com>
 <0013bb7d-ca34-dd99-7119-8dad8c74a819@mind.be>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <0013bb7d-ca34-dd99-7119-8dad8c74a819@mind.be>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH v1 2/4] configs/zynq_zed_defconfig: bump to
 Xilinx 2021.2
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
Cc: giulio.benetti@benettiengineering.com, ju.o@free.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aEkgYVJOT1VULCBuRUFMLEhpIE5lYWwsIEFybm91dCwKCk9uIDE0LzA0LzIyIDIxOjU5LCBBcm5v
dXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4gLS0tIGEvY29uZmlncy96eW5xX3plZF9kZWZjb25m
aWcKPj4gKysrIGIvY29uZmlncy96eW5xX3plZF9kZWZjb25maWcKPj4gQEAgLTIsMjYgKzIsMjgg
QEAgQlIyX2FybT15Cj4+IMKgIEJSMl9jb3J0ZXhfYTk9eQo+PiDCoCBCUjJfQVJNX0VOQUJMRV9O
RU9OPXkKPj4gwqAgQlIyX0FSTV9FTkFCTEVfVkZQPXkKPj4gLUJSMl9QQUNLQUdFX0hPU1RfTElO
VVhfSEVBREVSU19DVVNUT01fNF8xNj15Cj4+IC1CUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9S
VD0idHR5UFMwIgo+PiArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzEw
PXkKPj4gK0JSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL3p5bnEvcG9zdC1idWls
ZC5zaCIKPj4gwqAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvenlucS9wb3N0
LWltYWdlLnNoIgo+PiDCoCBCUjJfTElOVVhfS0VSTkVMPXkKPj4gLUJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1ZFUlNJT049eQo+PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iNC4xNiIKPj4gLUJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+
PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fR0lUPXkKPj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2xpbnV4LXhsbnguZ2l0Igo+
Pgo+IAo+IMKgV2UgZ2VuZXJhbGx5IHByZWZlciB0byB1c2UgdGhlIHVwc3RyZWFtIGtlcm5lbCBy
YXRoZXIgdGhhbiBhIHZlbmRvcgo+IGtlcm5lbCAtIGlmIGl0IHdvcmtzIG9mIGNvdXJzZS4gSXMg
dGhlIHZlbmRvciBrZXJuZWwgZHJhbWF0aWNhbGx5IGJldHRlcgo+IHRoYW4gdXBzdHJlYW0/CgpJ
bmRlZWQgSSB3b3VsZCBleHBlY3QgdG8gc2VlIHpjdTcwNiBzd2l0Y2ggdG8gbWFpbmxpbmUgcmF0
aGVyIHRoYW4KYW5vdGhlciBib2FyZCBzd2l0Y2ggdG8gbm9uLW1haW5saW5lLiB6eW5xNyBoYXMg
dmVyeSBnb29kIG1haW5saW5lCnN1cHBvcnQgc2luY2UgcXVpdGUgYSBsb25nIHRpbWUgYXMgZmFy
IGFzIEkga25vdy4KCi0tIApMdWNhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
