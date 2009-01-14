From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 14 Jan 2009 10:43:09 +0100
Subject: [Buildroot] external toolchain --sysroot
In-Reply-To: <20090113231130.GA24352@cloud.net.au>
References: <20090113043014.GA5238@cloud.net.au>
	<eaeb93bb0901122045p6e653f67of6172a11f28010d8@mail.gmail.com>
	<eaeb93bb0901122046g2ed61992n672221d163c74971@mail.gmail.com>
	<eaeb93bb0901122052o16f639f8nbc8c25d989fdb876@mail.gmail.com>
	<20090113231130.GA24352@cloud.net.au>
Message-ID: <20090114094308.GA26312@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 14, 2009 at 10:11:30AM +1100, Hamish Moffatt wrote:

>Right. I notice that --sysroot is being used even if gcc is compiled
>without it. And it appears that sysroot is buggy in gcc 4.1.2, which is
>what I'm using currently.

The whole gcc-4.1.x series is discontinued and not maintained anymore.
You would be better off to use a somewhat current toolchain or at least
avoid versions that are known to be broken (like sysroot and 4.1.x).
Sysroot support is deliberately marked as unavailable for anything older
than the 4.2.x series for good reasons -- see toolchain/gcc/Config.in
