From: Erik Andersen <andersen@codepoet.org>
Date: Thu, 10 Aug 2006 15:11:19 -0600
Subject: [Buildroot] Packages that error out during build
In-Reply-To: <bf61e79a0608101407y34638fe7tb6891a3fd990e3e3@mail.gmail.com>
References: <bf61e79a0608100739p4899b15brb988f9063f044978@mail.gmail.com>
	<20060810175113.GA20615@codepoet.org>
	<bf61e79a0608101407y34638fe7tb6891a3fd990e3e3@mail.gmail.com>
Message-ID: <20060810211119.GA23789@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu Aug 10, 2006 at 05:07:38PM -0400, Drew Cohan wrote:
> And the last one I tried using buildroot 15797, Xorg:
> 
> cc -I../../../exports/include -o xkbcomp  xkbcomp.o xkbscan.o expr.o
> vmod.o indicators.o misc.o alias.o 		 keymap.o keycodes.o 
> keytypes.o
> compat.o action.o 		 symbols.o geometry.o xkbpath.o listing.o  
> xkbparse.o parseutils.o utils.o  -L/usr/X11R6/lib -lxkbfile -lX11

Dunno, this builds for me.  But clearly if it is trying to
use /usr/X11R6/lib for libraries, something is very wrong.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
