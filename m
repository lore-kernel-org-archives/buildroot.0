From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2016 10:21:16 +0200
Subject: [Buildroot] [PATCH] php: fix bfin compile error
In-Reply-To: <20160930060702.GA30641@waldemar-brodkorb.de>
References: <20160930060702.GA30641@waldemar-brodkorb.de>
Message-ID: <20160930102116.3c9824ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Sep 2016 08:07:02 +0200, Waldemar Brodkorb wrote:
> Avoid a gcc segfault with Os.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/61532c31701c9bf756d85c639a00627667baa4fb
> 
> Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>

Thanks, but could you please report a gcc bug upstream, and add the
reference to the bug report in the patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
