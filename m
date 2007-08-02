From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 2 Aug 2007 20:07:11 +0200
Subject: [Buildroot] why is /usr/lib/libgmp.so linked in a cross	compile?
In-Reply-To: <46B21187.901@freescale.com>
References: <46B21187.901@freescale.com>
Message-ID: <20070802180710.GM11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 02, 2007 at 01:16:55PM -0400, Paul Barrette wrote:
> Hi,
> I am running a snap shot from Aug 1, building for powerpc.  I can see that 
> there is a problem trying to link /usr/lib/libgmp.so during the toolchain 
> build, which is not surprising, since I am on an i686 crosscompiling for 
> powerpc.

Since this worked before, revert that ORIGINAL_(TOOL)_FOR_TARGET stuff.
Ulf, until this atmel stuff works, please create yourself a branch to work
on so the rest of us can continue to have a working buildroot.
