From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Wed, 30 Jul 2008 10:20:02 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <87tzfo8cta.fsf@macbook.be.48ers.dk>
References: <485A3396.80701@cetrtapot.si>
	<87iqw5dyyb.fsf@macbook.be.48ers.dk>	<20080620083646.GB12682@mx.loc>
	<485B6CF6.7040901@cetrtapot.si>
	<87tzfo8cta.fsf@macbook.be.48ers.dk>
Message-ID: <48902432.2010903@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Hinko" == Hinko Kocevar <hinko.kocevar@cetrtapot.si> writes:
> 
> Hi,
> 
>  Hinko> I've been looking for recent gcc for the cris arch as I was
>  Hinko> seeing gcc internal errors when compiling kernel or openssl
>  Hinko> source with gcc 4.2.3 or 4.2.4.  With gcc 4.3.1 gcc internal
>  Hinko> errors went away, so I'm really glad I found the GIT tree!
> 
> Notice that 4.3.1 also has issues (on i686 atleast):
> 
> http://kerneltrap.org/Linux/Compiler_Oops
> 

To somehow close the thread about the 4.3.1 gcc and cris architecture. There
are some nice people at Axis that made some effort in order to fix the
internal compiler error (Thank you!!). The bug report exists in bugzilla 
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=35492.

The bug report has a patch that was tested by me and it passed the 
build of kernel and openssl that used to fail with internal compiler error
 - I haven't noticed problems with other packages yet.

Patch is at http://gcc.gnu.org/bugzilla/attachment.cgi?id=15874&action=view

Could you please pull the patch for gcc 4.3.1 into the buildroot?

Thank you,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
