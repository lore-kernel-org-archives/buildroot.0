Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11660C77B7E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jun 2023 13:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA0F83AFA;
	Thu,  1 Jun 2023 13:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA0F83AFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQejezfpO9eN; Thu,  1 Jun 2023 13:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B7F982CDE;
	Thu,  1 Jun 2023 13:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B7F982CDE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 665CA1BF316
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 13:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CD8D82CDE
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 13:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD8D82CDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dAV0797cVnrp for <buildroot@lists.busybox.net>;
 Thu,  1 Jun 2023 13:25:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FADB82BF4
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FADB82BF4
 for <buildroot@buildroot.org>; Thu,  1 Jun 2023 13:25:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC72C1063;
 Thu,  1 Jun 2023 06:25:49 -0700 (PDT)
Received: from debian (X72Y076X74.nice.Arm.com [10.34.111.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EACEE3F7D8;
 Thu,  1 Jun 2023 06:25:03 -0700 (PDT)
Date: Thu, 1 Jun 2023 15:25:01 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZHicLZXBbEKasztN@debian>
Mail-Followup-To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Dick Olsson <hi@senzilla.io>
References: <20230530200728.12239-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230530200728.12239-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/3] boot/edk2: bump to version
 edk2-stable202305
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

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMTA6MDc6MjZQTSArMDIwMCwgSnVsaWVuIE9saXZhaW4g
d3JvdGU6Cj4gRm9yIGNoYW5nZSBsb2cgc2luY2UgdmVyc2lvbiBlZGsyLXN0YWJsZTIwMjIwOCwg
c2VlOgo+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3JlbGVhc2VzL3RhZy9l
ZGsyLXN0YWJsZTIwMjIxMQo+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3Jl
bGVhc2VzL3RhZy9lZGsyLXN0YWJsZTIwMjMwMgo+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5v
Y29yZS9lZGsyL3JlbGVhc2VzL3RhZy9lZGsyLXN0YWJsZTIwMjMwNQo+IAo+IFRoZSBtYWluIG1v
dGl2YXRpb24gb2YgdGhpcyBidW1wIGlzIHRoZSBSSVNDLVYgUUVNVSBWaXJ0IHN1cHBvcnQKPiBp
bnRyb2R1Y2VkIGluIGVkazItc3RhYmxlMjAyMzAyIChub3QgeWV0IHN1cHBvcnRlZCBpbiBCdWls
ZHJvb3QpLgo+IAo+IENjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+Cj4gQ2M6IFZpbmNl
bnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0tLQo+IFBhdGNoIHNlcmllcyB0ZXN0ZWQgb24g
YnJhbmNoIG1hc3RlciBhdCBjb21taXQgYzc2NWFjOSB3aXRoIGNvbW1hbmRzOgo+IAo+ICAgICB1
dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2FnZQo+ICAgICAuLi4KPiAgICAgMCB3YXJu
aW5ncyBnZW5lcmF0ZWQKPiAKPiAgICAgc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyBcCj4gICAg
ICAgICAtZCBkbCAtbyBvdXRwdXRfZm9sZGVyIFwKPiAgICAgICAgIHRlc3RzLmJvb3QudGVzdF9l
ZGsyCj4gICAgIC4uLgo+ICAgICBPSwo+IAo+ICAgICBtYWtlIHFlbXVfYWFyY2g2NF9zYnNhX2Rl
ZmNvbmZpZwo+ICAgICBtYWtlCj4gICAgIC4uLgo+ICAgICBvdXRwdXQvaW1hZ2VzL3N0YXJ0LXFl
bXUuc2gKPiAgICAgLi4uCj4gICAgIGJ1aWxkcm9vdCBsb2dpbjoKCkhpIEp1bGllbiwKClRoYW5r
cyBmb3IgdGhvc2UgcGF0Y2hlcyEKCkkgZGlkIHRlc3QgdGhlIGZvbGxvd2luZyBvbiBteSBzaWRl
IHdpdGhvdXQgaXNzdWU6CgogIHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZwogIHRlc3RzLmJv
b3QudGVzdF9lZGsyLlRlc3RFZGsyCiAgdGVzdHMuYm9vdC50ZXN0X2dydWIuVGVzdEdydWJBQXJj
aDY0RUZJCiAgdGVzdHMuYm9vdC50ZXN0X2dydWIuVGVzdEdydWJYODY2NEVGSQogIHRlc3RzLmJv
b3QudGVzdF9ncnViLlRlc3RHcnViaTM4NkVGSQogIHRlc3RzLmZzLnRlc3RfaXNvOTY2MC5UZXN0
SXNvOTY2MEdydWIyRUZJCiAgdGVzdHMuZnMudGVzdF9pc285NjYwLlRlc3RJc285NjYwR3J1YjJI
eWJyaWQKCkZlZWwgZnJlZSB0byBhZGQgKG9yIG5vdCk6CgogIFRlc3RlZC1ieTogVmluY2VudCBT
dGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgoKQmVzdCByZWdhcmRzLApWaW5jZW50LgoK
PiAtLS0KPiAgYm9vdC9lZGsyL2VkazIuaGFzaCB8IDIgKy0KPiAgYm9vdC9lZGsyL2VkazIubWsg
ICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3QvZWRrMi9lZGsyLmhhc2ggYi9ib290L2VkazIvZWRr
Mi5oYXNoCj4gaW5kZXggOTRlZTIyZGRjNC4uMzRkNGIxMGUyOSAxMDA2NDQKPiAtLS0gYS9ib290
L2VkazIvZWRrMi5oYXNoCj4gKysrIGIvYm9vdC9lZGsyL2VkazIuaGFzaAo+IEBAIC0xLDMgKzEs
MyBAQAo+ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIGMxMDUyMGYyNjk1NTdkNTY2
ZTM1ZmU4MTA0MTQxYWEyODY1ZjkwODVhZDJiM2EzMGFhZThhN2U3OGEzY2E1YWEgIGVkazItZWRr
Mi1zdGFibGUyMDIyMDgtYnIxLnRhci5nego+ICtzaGEyNTYgIGNhNTUzNTE5MTNlNjI1OGViZDhj
MDgxMDZmMzY5YWM3MTA3M2Q5Y2ZhYTgwNDI3ZmM1ZjEzMWIwNmQ4MDg5NDAgIGVkazItZWRrMi1z
dGFibGUyMDIzMDUtYnIxLnRhci5nego+ICBzaGEyNTYgIDUwY2UyMGM5Y2ZkYjBlMTllZTM0ZmUw
YTUxZmMwYWZlOTYxZjc0MzY5N2IwNjgzNTlhYjJmODYyYjQ5NGRmODAgIExpY2Vuc2UudHh0Cj4g
ZGlmZiAtLWdpdCBhL2Jvb3QvZWRrMi9lZGsyLm1rIGIvYm9vdC9lZGsyL2VkazIubWsKPiBpbmRl
eCBmYjZiOWEzMjgwLi4zOTliZDM0NmVmIDEwMDY0NAo+IC0tLSBhL2Jvb3QvZWRrMi9lZGsyLm1r
Cj4gKysrIGIvYm9vdC9lZGsyL2VkazIubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtRURLMl9WRVJTSU9OID0gZWRrMi1zdGFibGUyMDIy
MDgKPiArRURLMl9WRVJTSU9OID0gZWRrMi1zdGFibGUyMDIzMDUKPiAgRURLMl9TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyCj4gIEVESzJfU0lURV9NRVRIT0QgPSBnaXQK
PiAgRURLMl9MSUNFTlNFID0gQlNELTItQ2xhdXNlLVBhdGVudAo+IC0tIAo+IDIuNDAuMQo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
