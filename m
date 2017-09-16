From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Sep 2017 10:44:20 +0200
Subject: [Buildroot] [PATCH 2/2] bluez5_utils: add upstream patch to
 fix	timeout issue with fw download
References: <20170831094932.11121-1-joerg.krause@embedded.rocks>
 <20170831094932.11121-2-joerg.krause@embedded.rocks>
Message-ID: <4s4v8exukd.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 31 Aug 2017 11:49:32 +0200 schrieb J?rg Krause:

> Add upstream patch [1] for the hciattach tool to fix timeout issue when
> downloading firmware to Broadcom bluetooth chips.
> 
> [1]
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?
id=76255f732d68aef2b90d36d9c7be51a9e1739ce7

Hi,

this patch was is included in upstream release 5.47 and can be marked as 
superseded by this patch: http://patchwork.ozlabs.org/patch/814482/

Regards, Bernd
