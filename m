Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE84EDEC7E
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 15:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D4A682F14;
	Wed, 13 Sep 2023 15:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D4A682F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ydSYiPHPwgl; Wed, 13 Sep 2023 15:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF5018175B;
	Wed, 13 Sep 2023 15:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF5018175B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2311BF5EA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 15:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 483C96108F
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 15:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 483C96108F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApzL_jeaMO1o for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 15:58:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8160760760
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 15:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8160760760
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CC7020003;
 Wed, 13 Sep 2023 15:58:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgSFj-005zqS-ML; Wed, 13 Sep 2023 17:58:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= via buildroot
 <buildroot@buildroot.org>
References: <20230824150950.56165-1-raphael.melotte@mind.be>
Date: Wed, 13 Sep 2023 17:58:07 +0200
In-Reply-To: <20230824150950.56165-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte?= via buildroot"'s message of
 "Thu, 24 Aug 2023 17:09:48 +0200")
Message-ID: <878r9a2hgw.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: remove
 leftover comment about headers
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
Cc: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IDxidWls
ZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gQ29tbWl0IDBhOGVmMmYzZjdiYzIxMWQz
OGE1YTM3MDA3YmRlYjQ4OWJkMzdhYWUgYnVtcGVkIHRoZSBoZWFkZXJzCiA+IHZlcnNpb24gcmVx
dWlyZW1lbnRzLCBidXQgZGlkIG5vdCB1cGRhdGUgdGhlIGFzc29jaWF0ZWQgY29tbWVudC4KCiA+
IFJlbW92ZSB0aGUgY29tbWVudCBlbnRpcmVseSwgYXMgaXQgZG9lcyBub3QgYXBwbHkgYW55bW9y
ZS4KCiA+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVA
bWluZC5iZT4KCkNvbW1pdHRlZCB0byAyMDIzLjAyLnggYW5kIDIwMjMuMDUueCwgdGhhbmtzLgoK
LS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
