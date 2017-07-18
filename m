From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 18 Jul 2017 22:17:54 +0200
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.12.0
In-Reply-To: <47939b206ec286f2ac9226b96a5b65fd2aa75991.1500377145.git.baruch@tkos.co.il>
References: <47939b206ec286f2ac9226b96a5b65fd2aa75991.1500377145.git.baruch@tkos.co.il>
Message-ID: <20170718201754.GM1482@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
Baruch Siach wrote,

> Drop upstream patch.
> 
> Add uClibc-ng compatibility fix. This is needed due to missing definition in
> netinet/in.h.

Thanks for the report,
fixed in
https://cgit.openadk.org/cgi/cgit/uclibc-ng.git/commit/?id=85c9aaf9e4410bcd367c3e5f6dab13ce9ba936f4

best regards
 Waldemar
