Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B6BE7716E
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 18:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D01040777;
	Thu,  5 Dec 2024 18:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNdpEPVNwnwW; Thu,  5 Dec 2024 18:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7BE440830
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7BE440830;
	Thu,  5 Dec 2024 18:07:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7846A1DD1
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 18:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5859040830
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 18:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMGLmwgYvWYe for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 18:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5DF840777
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5DF840777
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5DF840777
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 18:07:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D50E2E0004
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 18:07:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJGFm-004ckj-0r
 for buildroot@buildroot.org; Thu, 05 Dec 2024 19:07:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 05 Dec 2024 19:07:06 +0100
Message-ID: <87wmge80mt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.11-rc3 released
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgMjAyNC4xMS1yYzMgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyNC4xMS1yYzMu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0
LjExLXJjMy50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC5naXQKCkFub3RoZXIgd2VlaygtaXNoKSwgYW5vdGhlciBy
ZWxlYXNlIGNhbmRpZGF0ZS4KClBsZWFzZSBnaXZlIGl0IGEgc3BpbiBhbmQgcmVwb3J0IGFueSBw
cm9ibGVtcyB0byB0aGUgbWFpbGluZyBsaXN0IG9yCmJ1ZyB0cmFja2VyLiBNYW55IHRoYW5rcyB0
byB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cg
LXNuIDIwMjQuMTEtcmMyLi4KCiAgICAgNiAgSnVsaWVuIE9saXZhaW4KICAgICA0ICBQZXRlciBL
b3JzZ2FhcmQKICAgICA0ICBUaG9tYXMgUGV0YXp6b25pCiAgICAgMiAgQmVybmQgS3VobHMKICAg
ICAyICBNYXhpbSBLb2NoZXRrb3YKICAgICAyICBSb21haW4gTmFvdXIKICAgICAyICBTY290dCBG
YW4KICAgICAxICBBbnNzaSBIYW5udWxhCiAgICAgMSAgQmFydWNoIFNpYWNoCiAgICAgMSAgQnJh
bmRvbiBNYWllcgogICAgIDEgIENoZXJuaWFldiBBbmRyZWkKICAgICAxICBGbG9yaWFuIEZhaW5l
bGxpCiAgICAgMSAgSi4gTmV1c2Now6RmZXIKICAgICAxICBMUCBDCiAgICAgMSAgTmVhbCBGcmFn
ZXIKICAgICAxICBUSUFOIFl1YW5oYW8KICAgICAxICBXb2xmcmFtIFNhbmcKICAgICAxICBZYW5u
IEUuIE1PUklOCgpFeHBlY3QgdGhlIGZpbmFsIDIwMjQuMTEgcmVsZWFzZSB0aGlzIHdlZWtlbmQu
CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
