Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C0FC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 07:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0DF581E59;
	Mon,  4 Dec 2023 07:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0DF581E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTEo0WFAF-Z7; Mon,  4 Dec 2023 07:30:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 072B88130B;
	Mon,  4 Dec 2023 07:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 072B88130B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 630D11BF969
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B84060B12
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B84060B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmgwIXjqOIHc for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 07:30:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B04A60A6B
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 07:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B04A60A6B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 326FF20005;
 Mon,  4 Dec 2023 07:30:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rA3Pl-00Acw3-1l;
 Mon, 04 Dec 2023 08:30:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231203222145.347693-1-fontaine.fabrice@gmail.com>
Date: Mon, 04 Dec 2023 08:30:49 +0100
In-Reply-To: <20231203222145.347693-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Dec 2023 23:21:45 +0100")
Message-ID: <871qc2v2za.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/lttng-modules: bump to version
 2.13.10
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBUaGlzIGJ1bXAgd2lsbCBmaXggdGhlIGZvbGxvd2luZyBidWls
ZCBmYWlsdXJlcyB3aXRoIGtlcm5lbCA+PSA2LjMuMAogPiB0aGFua3MgdG8KID4gaHR0cHM6Ly9n
aXRodWIuY29tL2x0dG5nL2x0dG5nLW1vZHVsZXMvY29tbWl0L2YzNTU5ZTViMDZiMjRhZDAzMzYy
MTE5NTA3OTJmYTk3Mzk4YzVlOWEKID4gYW5kCiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9sdHRuZy9s
dHRuZy1tb2R1bGVzL2NvbW1pdC85MzkyMDBlZjE2MGM5NWM4YTlkNzFmZDgwYzk5ZjQyYTFkZTBh
OWYwOgoKID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQv
aW5zdGFuY2UtMS9vdXRwdXQtMS9idWlsZC9sdHRuZy1tb2R1bGVzLTIuMTMuNy8uL3NyYy9sdHRu
Zy1yaW5nLWJ1ZmZlci1jbGllbnQuaDoxNiwKID4gICAgICAgICAgICAgICAgICBmcm9tIC9ob21l
L2J1aWxkcm9vdC9hdXRvYnVpbGQvaW5zdGFuY2UtMS9vdXRwdXQtMS9idWlsZC9sdHRuZy1tb2R1
bGVzLTIuMTMuNy8uL3NyYy9sdHRuZy1yaW5nLWJ1ZmZlci1jbGllbnQtZGlzY2FyZC5jOjE2Ogog
PiAvaG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTEvb3V0cHV0LTEvYnVpbGQvbHR0
bmctbW9kdWxlcy0yLjEzLjcvLi9zcmMvLi4vaW5jbHVkZS9sdHRuZy9ldmVudHMtaW50ZXJuYWwu
aDoyOTI6OTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHV1aWRfbGXigJkKID4gICAyOTIg
fCAgICAgICAgIHV1aWRfbGUgdXVpZDsgICAgICAgICAgICAgICAgICAgLyogVHJhY2Ugc2Vzc2lv
biB1bmlxdWUgSUQgKGNvcHkpICovCiA+ICAgICAgIHwgICAgICAgICBefn5+fn5+CgogPiBbLi4u
XQoKID4gL2hvbWUvdGhvbWFzL2F1dG9idWlsZC9pbnN0YW5jZS0zL291dHB1dC0xL2J1aWxkL2x0
dG5nLW1vZHVsZXMtMi4xMy43Ly4vc3JjL2xpYi9yaW5nYnVmZmVyL3JpbmdfYnVmZmVyX21tYXAu
YzoKID4gSW4gZnVuY3Rpb24g4oCYbGliX3JpbmdfYnVmZmVyX21tYXBfYnVm4oCZOgogPiAvaG9t
ZS90aG9tYXMvYXV0b2J1aWxkL2luc3RhbmNlLTMvb3V0cHV0LTEvYnVpbGQvbHR0bmctbW9kdWxl
cy0yLjEzLjcvLi9zcmMvbGliL3JpbmdidWZmZXIvcmluZ19idWZmZXJfbW1hcC5jOjExNjoyMzoK
ID4gZXJyb3I6IGFzc2lnbm1lbnQgb2YgcmVhZC1vbmx5IG1lbWJlciDigJh2bV9mbGFnc+KAmQog
PiAgIDExNiB8ICAgICAgICAgdm1hLT52bV9mbGFncyB8PSBWTV9ET05URVhQQU5EOwogPiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICBefgoKID4gaHR0cHM6Ly9naXRodWIuY29tL2x0dG5n
L2x0dG5nLW1vZHVsZXMvYmxvYi92Mi4xMy4xMC9DaGFuZ2VMb2cKCiA+IEZpeGVzOgogPiAgLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy83YjhmNTcyNjJhMDJjZDlhYWE5
NTNhOWQ4NjY2NjQ2YmFlMWNjNjU1CgogPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5l
IDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KCkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5
ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
