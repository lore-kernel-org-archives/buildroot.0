From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 10 Apr 2008 19:10:51 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
In-Reply-To: <871w5echoq.fsf@macbook.be.48ers.dk>
References: <20080409113849.004993C4BA@busybox.net>
	<20080409223551.GC4582@cloud.net.au>
	<1207804466.6817.395.camel@nigel-x60>
	<871w5echoq.fsf@macbook.be.48ers.dk>
Message-ID: <20080410091051.GA10688@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 10, 2008 at 09:06:29AM +0200, Peter Korsgaard wrote:
> >>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:
> 
> Hi,
> 
>  >> Should be /usr/lib rather than /lib?
> 
>  Nigel> The rest of the libs are being installed to /lib ... I don't like
>  Nigel> changing install paths, but I agree with you it should be /usr/lib ...
>  Nigel> anyone got any very good reason why ncurses should be installed in /lib?
> 
> The basic libncurses.co* is normally installed in /lib, but the extra
> libs are in /usr/lib, E.G. on my Debian machine:

bash and more (and most other shells in /bin) uses libncurses, so it
needs to be in /lib on a typical system. (On a buildroot system those
would normally be provided by busybox instead).

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
