From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 26 Oct 2007 08:43:43 +1000
Subject: [Buildroot] tslib fails to build
In-Reply-To: <1193340722.4552.38.camel@localhost.localdomain>
References: <1193340722.4552.38.camel@localhost.localdomain>
Message-ID: <20071025224343.GC2902@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 25, 2007 at 07:32:02PM +0000, Ormund Williams wrote:
> Hi All
> 
> I'm trying to build buildroot with DirectFrameBuffer and ran into this
> error with tslib:
> 
> ./autogen.sh: line 4: autoreconf: command not found
> /bin/sh: line 2: ./configure: No such file or directory
> make: *** [~/buildroot/build_i686/tslib-1.0/.configured] Error 127
> 
> I'm lost, help.

Install autoconf (and probably automake also) on your host.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
