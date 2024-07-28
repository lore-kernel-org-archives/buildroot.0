Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423B8C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC3B812A7;
	Sun, 28 Jul 2024 10:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1E-m81bzJ5U; Sun, 28 Jul 2024 10:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A830E812D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A830E812D6;
	Sun, 28 Jul 2024 10:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86D101BF5F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67F3F403BD
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUznsftakKn0 for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:13:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 22A8B4035B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22A8B4035B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22A8B4035B
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:13:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F54940002;
 Sun, 28 Jul 2024 10:13:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sY0tg-0027Ug-2w;
 Sun, 28 Jul 2024 12:13:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: yegorslists@googlemail.com
References: <20240610093833.1871754-1-yegorslists@googlemail.com>
Date: Sun, 28 Jul 2024 12:13:00 +0200
In-Reply-To: <20240610093833.1871754-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 10 Jun 2024 11:38:33
 +0200")
Message-ID: <87ed7dx1sj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/tftpd: bump to latest git commit
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

Pj4+Pj4gInllZ29yc2xpc3RzIiA9PSB5ZWdvcnNsaXN0cyAgPHllZ29yc2xpc3RzQGdvb2dsZW1h
aWwuY29tPiB3cml0ZXM6CgogPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29v
Z2xlbWFpbC5jb20+CiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgZXJyb3Igd2hlbiBjb21waWxlZCBh
Z2FpbnN0IEdDQyAxNC54OgoKID4gdGZ0cC5jOiBJbiBmdW5jdGlvbiDigJh0ZnRwX3NlbmRmaWxl
4oCZOgogPiB0ZnRwLmM6ODg6NTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0
aW9uIOKAmGJzZF9zaWduYWzigJk7IGRpZAogPiB5b3UgbWVhbiDigJhzc2lnbmFs4oCZPyBbLVdp
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KID4gICAgODggfCAgICAgYnNkX3NpZ25hbChT
SUdBTFJNLCB0aW1lcik7CiA+ICAgICAgIHwgICAgIF5+fn5+fn5+fn4KID4gICAgICAgfCAgICAg
c3NpZ25hbAogPiB0ZnRwLmM6ODg6NTogd2FybmluZzogbmVzdGVkIGV4dGVybiBkZWNsYXJhdGlv
biBvZiDigJhic2Rfc2lnbmFs4oCZIFstV25lc3RlZC1leHRlcm5zXQogPiBtYWluLmM6IEluIGZ1
bmN0aW9uIOKAmG1haW7igJk6CiA+IG1haW4uYzozMDg6NTogZXJyb3I6IGltcGxpY2l0IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGJzZF9zaWduYWzigJk7CiA+IGRpZCB5b3UgbWVhbiDigJhz
c2lnbmFs4oCZPyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KID4gICAzMDggfCAg
ICAgYnNkX3NpZ25hbChTSUdJTlQsIGludHIpOwogPiAgICAgICB8ICAgICBefn5+fn5+fn5+CiA+
ICAgICAgIHwgICAgIHNzaWduYWwKID4gbWFpbi5jOjMwODo1OiB3YXJuaW5nOiBuZXN0ZWQgZXh0
ZXJuIGRlY2xhcmF0aW9uIG9mIOKAmGJzZF9zaWduYWzigJkgWy1XbmVzdGVkLWV4dGVybnNdCgog
PiBSZW1vdmUgYW4gdXBzdHJlYW1lZCBwYXRjaC4KCiA+IHRmdHBkL3RmdHBkLmMgaGFzIGNoYW5n
ZWQsIGhlbmNlLCBjaGFuZ2UgaXRzIGNoZWNrc3VtLgoKID4gU2lnbmVkLW9mZi1ieTogWWVnb3Ig
WWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgoKQ29tbWl0dGVkIHRvIDIwMjQu
MDUueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
