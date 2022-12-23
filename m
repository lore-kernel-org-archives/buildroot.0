Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79FAC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 09:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 619FF61147;
	Fri, 23 Dec 2022 09:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 619FF61147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id It1IDlIpIz_K; Fri, 23 Dec 2022 09:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91B5C61136;
	Fri, 23 Dec 2022 09:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91B5C61136
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4086D1BF34C
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 272F281E39
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272F281E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3WeGHykU0Nc6 for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 09:35:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE4F81E2D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFE4F81E2D
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 09:35:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF73D1BF204;
 Fri, 23 Dec 2022 09:34:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p8eSA-002qrc-Vn; Fri, 23 Dec 2022 10:34:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221222222840.51146-1-fontaine.fabrice@gmail.com>
Date: Fri, 23 Dec 2022 10:34:58 +0100
In-Reply-To: <20221222222840.51146-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 22 Dec 2022 23:28:40 +0100")
Message-ID: <87r0wqjwe5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xtables-addons: bump to version
 3.22
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

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBTdXBwb3J0IGZvciB1cCB0byBMaW51eCA2LjEgYnkgZml4aW5n
IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZToKID4gL3RtcC9pbnN0YW5jZS01L291dHB1dC0x
L2J1aWxkL3h0YWJsZXMtYWRkb25zLTMuMjEvZXh0ZW5zaW9ucy94dF9DSEFPUy5jOiBJbiBmdW5j
dGlvbiDigJh4dF9jaGFvc190b3RhbOKAmToKID4gL3RtcC9pbnN0YW5jZS01L291dHB1dC0xL2J1
aWxkL3h0YWJsZXMtYWRkb25zLTMuMjEvZXh0ZW5zaW9ucy94dF9DSEFPUy5jOjcwOjQ2OgogPiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcHJhbmRvbV91MzLigJk7
IGRpZCB5b3UgbWVhbgogPiDigJhwcmFuZG9tX3UzMl9tYXjigJk/IFstV2Vycm9yPWltcGxpY2l0
LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogPiAgICA3MCB8ICAgICAgICAgaWYgKCFyZXQgfHwgaG90
ZHJvcCB8fCAodW5zaWduZWQgaW50KXByYW5kb21fdTMyKCkgPiBkZWx1ZGVfcGVyY2VudGFnZSkK
ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fgogPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHByYW5kb21fdTMyX21heAoKID4gaHR0cHM6Ly9mb3NzaWVzLm9yZy9saW51eC9w
cml2YXQveHRhYmxlcy1hZGRvbnMtMy4yMi50YXIueHoveHRhYmxlcy1hZGRvbnMtMy4yMi9kb2Mv
Y2hhbmdlbG9nLnJzdAoKID4gRml4ZXM6CiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzLzQ1NjRiYTg4ODE1NjcxMDgxOWY2YmQ4NjExN2UwYzBiZGQ1MTNkYmEKCiA+
IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tPgoKQ29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
