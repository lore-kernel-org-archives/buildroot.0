Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296AEC001B0
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 13:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E19660F8C;
	Mon, 24 Jul 2023 13:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E19660F8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chE4NQOG2lj3; Mon, 24 Jul 2023 13:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9286360F68;
	Mon, 24 Jul 2023 13:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9286360F68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D30331BF488
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 13:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A565C60F68
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 13:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A565C60F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e29pUOE2V5NA for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 13:10:22 +0000 (UTC)
X-Greylist: delayed 1687 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Jul 2023 13:10:21 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A529A60E27
Received: from mx1.sonologic.net (mx1.sonologic.nl
 [IPv6:2a01:4f8:121:43cd::1:9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A529A60E27
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 13:10:21 +0000 (UTC)
Received-SPF: pass (mx1.sonologic.net: authenticated connection)
 receiver=mx1.sonologic.net; client-ip=178.63.120.221; helo=[10.1.3.45];
 envelope-from=kmartens@sonologic.se;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.11; 
Received: from [10.1.3.45] (portal.sonologic.net [178.63.120.221])
 (authenticated bits=0)
 by mx1.sonologic.net (8.17.1/8.16.1) with ESMTPSA id 36OCg92P052832
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 24 Jul 2023 12:42:11 GMT (envelope-from kmartens@sonologic.se)
X-Authentication-Warning: mx1.sonologic.net: Host portal.sonologic.net
 [178.63.120.221] claimed to be [10.1.3.45]
Message-ID: <eee5a213-c0d0-c400-227e-fe3df1c941a4@sonologic.se>
Date: Mon, 24 Jul 2023 14:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Koen Martens <kmartens@sonologic.se>
To: buildroot@buildroot.org
Content-Language: en-GB
Organization: Sonologic AB
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4
 (mx1.sonologic.net [178.63.120.202]); Mon, 24 Jul 2023 12:42:11 +0000 (UTC)
Subject: [Buildroot] [PATCH 1/1] package/capnproto: bump version to 0.10.4
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogS29lbiBNYXJ0ZW5zIDxnbWNAc29ub2xvZ2ljLm5sPgotLS0KIMKgcGFj
a2FnZS9jYXBucHJvdG8vY2FwbnByb3RvLmhhc2ggfCAyICstCiDCoHBhY2thZ2UvY2FwbnByb3Rv
L2NhcG5wcm90by5ta8KgwqAgfCAyICstCiDCoDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2FwbnByb3RvL2NhcG5w
cm90by5oYXNoIApiL3BhY2thZ2UvY2FwbnByb3RvL2NhcG5wcm90by5oYXNoCmluZGV4IDBmYWY2
OWQwNjkuLmFhNzIyYTQyNDIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvY2FwbnByb3RvL2NhcG5wcm90
by5oYXNoCisrKyBiL3BhY2thZ2UvY2FwbnByb3RvL2NhcG5wcm90by5oYXNoCkBAIC0xLDMgKzEs
MyBAQAogwqAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2IGUwNzQ0NmY1NjA0M2M5ODNlMDA5
MDM4ZTY5ZDE4ZmY4NmEyOTI0OTA5ZjBiNTE4Y2NmNDdlY2NmNWFjMDM5MTkgCmNhcG5wcm90by0w
LjEwLjMudGFyLmd6CitzaGEyNTYgYzZmMjU5NDA2ODhjODdkZGIyNGUwYzRlNDc1YzMyMTNkOWIw
NDRhYWQyYmEzMDU0MzljYzhjMjI0ZjU1OWRhNiAKY2FwbnByb3RvLTAuMTAuNC50YXIuZ3oKIMKg
c2hhMjU2IAo5NTY0OTk4YzhkN2YyNzBhNjFhOGI4OTg2OWE4ZDE3YTlkNWUzNzgzYjY0MDI3Nzg4
YjVlMzM5ZWM4NDc5ZTEwIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2FwbnByb3RvL2Nh
cG5wcm90by5tayBiL3BhY2thZ2UvY2FwbnByb3RvL2NhcG5wcm90by5tawppbmRleCA4NGFjZjVm
YzY1Li43NDI0YTE0MjBmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2NhcG5wcm90by9jYXBucHJvdG8u
bWsKKysrIGIvcGFja2FnZS9jYXBucHJvdG8vY2FwbnByb3RvLm1rCkBAIC00LDcgKzQsNyBAQAog
wqAjCiDCoCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgotQ0FQTlBST1RPX1ZFUlNJT04gPSAwLjEw
LjMKK0NBUE5QUk9UT19WRVJTSU9OID0gMC4xMC40CiDCoENBUE5QUk9UT19TSVRFID0gJChjYWxs
IGdpdGh1YixjYXBucHJvdG8sY2FwbnByb3RvLHYkKENBUE5QUk9UT19WRVJTSU9OKSkKIMKgQ0FQ
TlBST1RPX0xJQ0VOU0UgPSBNSVQKIMKgQ0FQTlBST1RPX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
CgotLSAKU29mdHdhcmUgYXJjaGl0ZWN0dXJlICYgZW5naW5lZXJpbmc6IGh0dHBzOi8vd3d3LnNv
bm9sb2dpYy5zZS8KU2NpLWZpOiBodHRwczovL3d3dy5rb2VubWFydGVucy5ubC8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
