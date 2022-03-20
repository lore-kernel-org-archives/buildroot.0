Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8B5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 047FA40002;
	Sun, 20 Mar 2022 21:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lgke1QSfjO37; Sun, 20 Mar 2022 21:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA2AC4018E;
	Sun, 20 Mar 2022 21:38:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 803131BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B2EA4018E
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eY2ohNhKiIjq for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:37:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6F5A40002
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:37:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8DD0460004;
 Sun, 20 Mar 2022 21:37:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nW3FL-00FKHD-Lq; Sun, 20 Mar 2022 22:37:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220315205405.9291-1-ps.report@gmx.net>
 <20220316213626.GZ283544@scaer>
Date: Sun, 20 Mar 2022 22:37:55 +0100
In-Reply-To: <20220316213626.GZ283544@scaer> (Yann E. MORIN's message of "Wed, 
 16 Mar 2022 22:36:26 +0100")
Message-ID: <87ee2wl2z0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/libopenssl: bump version to
 1.1.1n
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
Cc: Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IFBldGVyLCBBbGwsCiA+ICtQZXRlciBLLjogY2FuZGlkYXRlIHRvIGJlIGJhY2tw
b3J0ZWQsIHRoYXQncyBhIHNlY3VyaXR5IGZpeC4KCkNvbW1pdHRlZCB0byAyMDIxLjAyLngsIDIw
MjEuMTEueCBhbmQgMjAyMi4wMi54LCB0aGFua3MuCgogPiBPbiAyMDIyLTAzLTE1IDIxOjU0ICsw
MTAwLCBQZXRlciBTZWlkZXJlciBzcGFrZSB0aHVzbHk6CiA+PiBDaGFuZ2VzIGJldHdlZW4gMS4x
LjFtIGFuZCAxLjEuMW4gWzE1IE1hciAyMDIyXQogPj4gCiA+PiAqKSBGaXhlZCBhIGJ1ZyBpbiB0
aGUgQk5fbW9kX3NxcnQoKSBmdW5jdGlvbiB0aGF0IGNhbiBjYXVzZSBpdCB0byBsb29wIGZvcmV2
ZXIKID4+IGZvciBub24tcHJpbWUgbW9kdWxpLgogPj4gCiA+PiBJbnRlcm5hbGx5IHRoaXMgZnVu
Y3Rpb24gaXMgdXNlZCB3aGVuIHBhcnNpbmcgY2VydGlmaWNhdGVzIHRoYXQgY29udGFpbgogPj4g
ZWxsaXB0aWMgY3VydmUgcHVibGljIGtleXMgaW4gY29tcHJlc3NlZCBmb3JtIG9yIGV4cGxpY2l0
IGVsbGlwdGljIGN1cnZlCiA+PiBwYXJhbWV0ZXJzIHdpdGggYSBiYXNlIHBvaW50IGVuY29kZWQg
aW4gY29tcHJlc3NlZCBmb3JtLgogPj4gCiA+PiBJdCBpcyBwb3NzaWJsZSB0byB0cmlnZ2VyIHRo
ZSBpbmZpbml0ZSBsb29wIGJ5IGNyYWZ0aW5nIGEgY2VydGlmaWNhdGUgdGhhdAogPj4gaGFzIGlu
dmFsaWQgZXhwbGljaXQgY3VydmUgcGFyYW1ldGVycy4KID4+IAogPj4gU2luY2UgY2VydGlmaWNh
dGUgcGFyc2luZyBoYXBwZW5zIHByaW9yIHRvIHZlcmlmaWNhdGlvbiBvZiB0aGUgY2VydGlmaWNh
dGUKID4+IHNpZ25hdHVyZSwgYW55IHByb2Nlc3MgdGhhdCBwYXJzZXMgYW4gZXh0ZXJuYWxseSBz
dXBwbGllZCBjZXJ0aWZpY2F0ZSBtYXkKID4+IHRodXMgYmUgc3ViamVjdCB0byBhIGRlbmlhbCBv
ZiBzZXJ2aWNlIGF0dGFjay4gVGhlIGluZmluaXRlIGxvb3AgY2FuIGFsc28KID4+IGJlIHJlYWNo
ZWQgd2hlbiBwYXJzaW5nIGNyYWZ0ZWQgcHJpdmF0ZSBrZXlzIGFzIHRoZXkgY2FuIGNvbnRhaW4g
ZXhwbGljaXQKID4+IGVsbGlwdGljIGN1cnZlIHBhcmFtZXRlcnMuCiA+PiAKID4+IFRodXMgdnVs
bmVyYWJsZSBzaXR1YXRpb25zIGluY2x1ZGU6CiA+PiAKID4+IC0gVExTIGNsaWVudHMgY29uc3Vt
aW5nIHNlcnZlciBjZXJ0aWZpY2F0ZXMKID4+IC0gVExTIHNlcnZlcnMgY29uc3VtaW5nIGNsaWVu
dCBjZXJ0aWZpY2F0ZXMKID4+IC0gSG9zdGluZyBwcm92aWRlcnMgdGFraW5nIGNlcnRpZmljYXRl
cyBvciBwcml2YXRlIGtleXMgZnJvbSBjdXN0b21lcnMKID4+IC0gQ2VydGlmaWNhdGUgYXV0aG9y
aXRpZXMgcGFyc2luZyBjZXJ0aWZpY2F0aW9uIHJlcXVlc3RzIGZyb20gc3Vic2NyaWJlcnMKID4+
IC0gQW55dGhpbmcgZWxzZSB3aGljaCBwYXJzZXMgQVNOLjEgZWxsaXB0aWMgY3VydmUgcGFyYW1l
dGVycwogPj4gCiA+PiBBbHNvIGFueSBvdGhlciBhcHBsaWNhdGlvbnMgdGhhdCB1c2UgdGhlIEJO
X21vZF9zcXJ0KCkgd2hlcmUgdGhlIGF0dGFja2VyCiA+PiBjYW4gY29udHJvbCB0aGUgcGFyYW1l
dGVyIHZhbHVlcyBhcmUgdnVsbmVyYWJsZSB0byB0aGlzIERvUyBpc3N1ZS4KID4+IChDVkUtMjAy
Mi0wNzc4KQogPj4gW1RvbcOhxaEgTXLDoXpdCiA+PiAKID4+ICopIEFkZCBjaXBoZXJzdWl0ZXMg
YmFzZWQgb24gREhFX1BTSyAoUkZDIDQyNzkpIGFuZCBFQ0RIRV9QU0sgKFJGQyA1NDg5KQogPj4g
dG8gdGhlIGxpc3Qgb2YgY2lwaGVyc3VpdGVzIHByb3ZpZGluZyBQZXJmZWN0IEZvcndhcmQgU2Vj
cmVjeSBhcwogPj4gcmVxdWlyZWQgYnkgU0VDTEVWRUwgPj0gMy4KID4+IAogPj4gW0RtaXRyeSBC
ZWx5YXZza2l5LCBOaWNvbGEgVHV2ZXJpXQogPj4gCiA+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBT
ZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CgogPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtz
LgoKCgogPiBSZWdhcmRzLAogPiBZYW5uIEUuIE1PUklOLgoKID4+IC0tLQogPj4gcGFja2FnZS9s
aWJvcGVuc3NsL2xpYm9wZW5zc2wuaGFzaCB8IDQgKystLQogPj4gcGFja2FnZS9saWJvcGVuc3Ns
L2xpYm9wZW5zc2wubWsgICB8IDIgKy0KID4+IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQogPj4gCiA+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJvcGVu
c3NsL2xpYm9wZW5zc2wuaGFzaCBiL3BhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLmhhc2gK
ID4+IGluZGV4IGEwNTVjYmMyNzAuLjIyYmIzNjViY2MgMTAwNjQ0CiA+PiAtLS0gYS9wYWNrYWdl
L2xpYm9wZW5zc2wvbGlib3BlbnNzbC5oYXNoCiA+PiArKysgYi9wYWNrYWdlL2xpYm9wZW5zc2wv
bGlib3BlbnNzbC5oYXNoCiA+PiBAQCAtMSw1ICsxLDUgQEAKID4+IC0jIEZyb20gaHR0cHM6Ly93
d3cub3BlbnNzbC5vcmcvc291cmNlL29wZW5zc2wtMS4xLjFtLnRhci5nei5zaGEyNTYKID4+IC1z
aGEyNTYgIGY4OTE5OWJlOGIyM2NhNDVmYzdjYjlmMWQ4ZDNlZTY3MzEyMzE4Mjg2YWQwMzBmNTMx
NmFjYTY0NjJkYjZjOTYgIG9wZW5zc2wtMS4xLjFtLnRhci5negogPj4gKyMgRnJvbSBodHRwczov
L3d3dy5vcGVuc3NsLm9yZy9zb3VyY2Uvb3BlbnNzbC0xLjEuMW4udGFyLmd6LnNoYTI1NgogPj4g
K3NoYTI1NiAgNDBkY2ViNTFhNGY2YTUyNzViZGUwZTZiZjIwZWY0YjkxYmZjMzJlZDU3YzA1NTJl
MmU4ZTE1NDYzMzcyYjE3YSAgb3BlbnNzbC0xLjEuMW4udGFyLmd6CiA+PiAKID4+ICMgTGljZW5z
ZSBmaWxlcwogPj4gc2hhMjU2ICBjMzI5MTNiMzMyNTJlNzExOTBhZjIwNjZmMDgxMTVjNjliYzlm
ZGRhZGYzYmYyOTI5NmUyMGM4MzUzODk4NDFjICBMSUNFTlNFCiA+PiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsgYi9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3Bl
bnNzbC5tawogPj4gaW5kZXggYmQ4ZWY2MTQxYS4uYWU2NjU4ZWQ0MCAxMDA2NDQKID4+IC0tLSBh
L3BhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLm1rCiA+PiArKysgYi9wYWNrYWdlL2xpYm9w
ZW5zc2wvbGlib3BlbnNzbC5tawogPj4gQEAgLTQsNyArNCw3IEBACiA+PiAjCiA+PiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwogPj4gCiA+PiAtTElCT1BFTlNTTF9WRVJTSU9OID0gMS4xLjFtCiA+
PiArTElCT1BFTlNTTF9WRVJTSU9OID0gMS4xLjFuCiA+PiBMSUJPUEVOU1NMX1NJVEUgPSBodHRw
czovL3d3dy5vcGVuc3NsLm9yZy9zb3VyY2UKID4+IExJQk9QRU5TU0xfU09VUkNFID0gb3BlbnNz
bC0kKExJQk9QRU5TU0xfVkVSU0lPTikudGFyLmd6CiA+PiBMSUJPUEVOU1NMX0xJQ0VOU0UgPSBP
cGVuU1NMIG9yIFNTTGVheQogPj4gLS0gCiA+PiAyLjM1LjEKID4+IAogPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KID4+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKID4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCiA+PiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCiA+IC0tIAogPiAuLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgogPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAogPiB8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAogPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAogPiB8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAogPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
