Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD11C25B50
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 23:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 771C7416DA;
	Fri, 20 Jan 2023 23:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 771C7416DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3SNXIQnhltA; Fri, 20 Jan 2023 23:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A59F416CF;
	Fri, 20 Jan 2023 23:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A59F416CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9837C1BF4D5
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 23:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D7F5416CF
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 23:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D7F5416CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTS3SLZNzFQv for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 23:13:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32851409E9
 for <buildroot@uclibc.org>; Fri, 20 Jan 2023 23:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32851409E9
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 1DEDB87C17; Fri, 20 Jan 2023 23:13:24 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 20 Jan 2023 23:13:23 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Outdated package
X-Bugzilla-Version: 2022.11.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: apines@mac.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15266-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15266] New: curl-7.87.0 is missing from
 http://sources.buildroot.net/libcurl
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTI2NgoKICAgICAgICAg
ICAgQnVnIElEOiAxNTI2NgogICAgICAgICAgIFN1bW1hcnk6IGN1cmwtNy44Ny4wIGlzIG1pc3Np
bmcgZnJvbQogICAgICAgICAgICAgICAgICAgIGh0dHA6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQv
bGliY3VybAogICAgICAgICAgIFByb2R1Y3Q6IGJ1aWxkcm9vdAogICAgICAgICAgIFZlcnNpb246
IDIwMjIuMTEuMQogICAgICAgICAgSGFyZHdhcmU6IEFsbAogICAgICAgICAgICAgICAgT1M6IExp
bnV4CiAgICAgICAgICAgIFN0YXR1czogTkVXCiAgICAgICAgICBTZXZlcml0eTogbm9ybWFsCiAg
ICAgICAgICBQcmlvcml0eTogUDUKICAgICAgICAgQ29tcG9uZW50OiBPdXRkYXRlZCBwYWNrYWdl
CiAgICAgICAgICBBc3NpZ25lZTogdW5hc3NpZ25lZEBidWlsZHJvb3QudWNsaWJjLm9yZwogICAg
ICAgICAgUmVwb3J0ZXI6IGFwaW5lc0BtYWMuY29tCiAgICAgICAgICAgICAgICBDQzogYnVpbGRy
b290QHVjbGliYy5vcmcKICBUYXJnZXQgTWlsZXN0b25lOiAtLS0KCmJ1aWxkcm9vdCB0cmllcyB0
byBhY2Nlc3MgY3VybC03Ljg3LjAudGFyLnh6IGZyb20gaXRzIGhvc3QgYXQKaHR0cHM6Ly9jdXJs
LnNlL2Rvd25sb2FkLCBmYWlscyBiZWNhdXNlIHRoZSBjZXJ0aWZpY2F0ZSBpcyBleHBpcmVkLCB0
aGVuIHRyaWVzCnRvIGdldCBpdCBmcm9tIGh0dHA6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQvbGli
Y3VybCBidXQgZmFpbHMgYWdhaW4gYmVjYXVzZSB0aGUKbGF0ZXN0IHZlcnNpb24gb24gdGhhdCBz
aXRlIGlzIGN1cmwtNy44Ni4wLiAgQWRkaW5nIGN1cmwtNy44Ny4wIHRvCmh0dHA6Ly9zb3VyY2Vz
LmJ1aWxkcm9vdC5uZXQvbGliY3VybCB3b3VsZCBwcm9wZXJseSByZXNvbHZlIHRoaXMgaXNzdWUu
IApUaGFua3MuCgoKYXBpbmVzQHN0aW5reTp+L2J1aWxkcm9vdC0yMDIyLjExLjEkIG1ha2UKL3Vz
ci9iaW4vbWFrZSAtajEgTz0vaG9tZS9hcGluZXMvYnVpbGRyb290LTIwMjIuMTEuMS9vdXRwdXQK
SE9TVENDPSIvdXNyL2Jpbi9nY2MiIEhPU1RDWFg9Ii91c3IvYmluL2crKyIgc3luY2NvbmZpZwo+
Pj4gbGliY3VybCA3Ljg3LjAgRG93bmxvYWRpbmcKd2dldCAtLXBhc3NpdmUtZnRwIC1uZCAtdCAz
IC1PCicvaG9tZS9hcGluZXMvYnVpbGRyb290LTIwMjIuMTEuMS9vdXRwdXQvYnVpbGQvLmN1cmwt
Ny44Ny4wLnRhci54ei5la09LVVUvb3V0cHV0JwonaHR0cHM6Ly9jdXJsLnNlL2Rvd25sb2FkL2N1
cmwtNy44Ny4wLnRhci54eicgCi0tMjAyMy0wMS0yMCAxNjo1NTowMy0tICBodHRwczovL2N1cmwu
c2UvZG93bmxvYWQvY3VybC03Ljg3LjAudGFyLnh6ClJlc29sdmluZyBjdXJsLnNlIChjdXJsLnNl
KS4uLiAxNTEuMTAxLjEuOTEsIDE1MS4xMDEuMTkzLjkxLCAxNTEuMTAxLjEyOS45MSwKLi4uCkNv
bm5lY3RpbmcgdG8gY3VybC5zZSAoY3VybC5zZSl8MTUxLjEwMS4xLjkxfDo0NDMuLi4gY29ubmVj
dGVkLgpFUlJPUjogY2Fubm90IHZlcmlmeSBjdXJsLnNlJ3MgY2VydGlmaWNhdGUsIGlzc3VlZCBi
eSDigJgvQz1VUy9PPUxldCdzCkVuY3J5cHQvQ049UjPigJk6CiAgSXNzdWVkIGNlcnRpZmljYXRl
IGhhcyBleHBpcmVkLgpUbyBjb25uZWN0IHRvIGN1cmwuc2UgaW5zZWN1cmVseSwgdXNlIGAtLW5v
LWNoZWNrLWNlcnRpZmljYXRlJy4Kd2dldCAtLXBhc3NpdmUtZnRwIC1uZCAtdCAzIC1PCicvaG9t
ZS9hcGluZXMvYnVpbGRyb290LTIwMjIuMTEuMS9vdXRwdXQvYnVpbGQvLmN1cmwtNy44Ny4wLnRh
ci54ei5JZGxQN1kvb3V0cHV0JwonaHR0cDovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC9saWJjdXJs
L2N1cmwtNy44Ny4wLnRhci54eicgCi0tMjAyMy0wMS0yMCAxNjo1NTowMy0tIApodHRwOi8vc291
cmNlcy5idWlsZHJvb3QubmV0L2xpYmN1cmwvY3VybC03Ljg3LjAudGFyLnh6ClJlc29sdmluZyBz
b3VyY2VzLmJ1aWxkcm9vdC5uZXQgKHNvdXJjZXMuYnVpbGRyb290Lm5ldCkuLi4gMTA0LjI2LjEu
MzcsCjEwNC4yNi4wLjM3LCAxNzIuNjcuNzIuNTYKQ29ubmVjdGluZyB0byBzb3VyY2VzLmJ1aWxk
cm9vdC5uZXQgKHNvdXJjZXMuYnVpbGRyb290Lm5ldCl8MTA0LjI2LjEuMzd8OjgwLi4uCmNvbm5l
Y3RlZC4KSFRUUCByZXF1ZXN0IHNlbnQsIGF3YWl0aW5nIHJlc3BvbnNlLi4uIDQwNCBOb3QgRm91
bmQKMjAyMy0wMS0yMCAxNjo1NTowNCBFUlJPUiA0MDQ6IE5vdCBGb3VuZC4KCi0tIApZb3UgYXJl
IHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSBvbiB0aGUgQ0MgbGlzdCBmb3Ig
dGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
