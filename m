From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 16 Jan 2009 17:36:36 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20090116141347.DD52277567@busybox.osuosl.org>
References: <20090116141347.DD52277567@busybox.osuosl.org>
Message-ID: <1232123796.6639.16.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2009-01-16 at 14:13 +0000, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2009-01-16 14:13:46 +0000 (Fri, 16 Jan 2009)
> New Revision: 24880
> 
> Log:
> toolchain/gcc: default to 4.3.2 for !AVR32

I've tried to follow this change in our tree, but ran into the following
error when building libmad:

 cc1: error: unrecognized command line option "-fforce-mem"

I guess this can somehow be fixed in the libmad package. Just wanted to
let you know.


Sven
 
