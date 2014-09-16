From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Sep 2014 17:55:03 +0200
Subject: [Buildroot] Missing Buildroot x86_64 CC Archiver tool in
 eclipse integration
In-Reply-To: <8cbab74434594ef7ab6e81bc2eb88441@DBXPR07MB142.eurprd07.prod.outlook.com>
References: <8cbab74434594ef7ab6e81bc2eb88441@DBXPR07MB142.eurprd07.prod.outlook.com>
Message-ID: <20140916175503.7fdd3a7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Oded Hanson,

On Fri, 5 Sep 2014 18:55:00 +0000, Oded Hanson wrote:

> I am trying to build a static library in eclipse using the buildroot toolchain and the buildroot eclipse plugin.
> 
> I have successfully created shared objects and executables but now
> when I am trying to create a static library, I see that the eclipse
> plugin doesn't identify the archiver tool, all though the
> x86_64-buildroot-linux-gnu-ar tool was generated in my buildroot
> output directory.

Could you give a few more details about how you're building your static
library? Are you using an autotools based project, a Makefile based
project, or a "managed build" project (where Eclipse takes care of the
build system) ? M?lanie has tested a "managed build" project for a
static library, and apparently, it worked fine. So maybe you're using
your own Makefile or autotools based build system?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
