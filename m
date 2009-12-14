From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 14 Dec 2009 14:21:59 -0600
Subject: [Buildroot] [Bug 803] [PATCH] lua - add shared library patch
	and config option for readline/ncurses support
In-Reply-To: <20091214201632.1E292777F5@busybox.osuosl.org>
References: <bug-803-163@https.bugs.busybox.net/>
	<20091214201632.1E292777F5@busybox.osuosl.org>
Message-ID: <200912141422.01807.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon December 14 2009, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=803
> 
> 
> Gustavo Zacarias <gustavo@zacarias.com.ar> changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                  CC|                            |gustavo at zacarias.com.ar
> 
> 
> 
> 
> --- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-12-14 20:16:31 UTC ---
> 
> You're probably missing a patch in your patch file since normally lua doesn't
> build shared libs (a patch to lua's Makefile to be precise), maybe you forgot
> to include it?
> 

Depends on the version - but the current and recent version have had the makefile
reorganized to always build-in the standard libraries;
So yes, the makefile needs to be un-reorganized (by a patch?) to get Lua + shared
libraries out of it.
(The prior to 5.0 organization).

Mike
> 
