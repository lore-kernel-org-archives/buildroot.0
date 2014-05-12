From: Charles Manning <cdhmanning@gmail.com>
Date: Mon, 12 May 2014 13:32:21 +1200
Subject: [Buildroot] Why must I specify toolchain kernel headers?
Message-ID: <CAE21AQp0xD2ZP7pEGCxUZis97vnwN3zLHj=nW-a-Y=bq6rT2Og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Build-rooters

I don't quite understand why I need to set the kernel header version under
Toolchain/Kernel headers.

Surely this can be figured out from the kernel source I am using?

Setting the version under toolchain/kernel headers makes sense when there
is no kernel being built, but makes little sense when a kernel is buing
built.

Having to set this in multiple places leads to inconsistency.

... or have I misunderstood something?


Thanks

Charles
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140512/4876518d/attachment.html>
