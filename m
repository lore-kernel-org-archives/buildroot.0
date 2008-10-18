From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Oct 2008 14:51:12 +0200
Subject: [Buildroot] Atmel file system skeleton missing /sys directory
In-Reply-To: <e4c675870810180052g314a2641oe501318f3a343f62@mail.gmail.com>
	(Roberto A. Foglietta's message of "Sat\,
	18 Oct 2008 09\:52\:16 +0200")
References: <COL0-DAV4103F240DBC50EEFAE20318D2D0@phx.gbl>
	<e4c675870810180052g314a2641oe501318f3a343f62@mail.gmail.com>
Message-ID: <877i86m5hb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roberto" == Roberto A Foglietta <roberto.foglietta@gmail.com> writes:

Hi,

 Roberto>  Playing with the i386 target I see /proc /sys and sometime
 Roberto> /usr/lib are missing. The last one in particular when no any
 Roberto> package 'mkdir' it the main 'make' fails in running a 'find'
 Roberto> in that not existent directory.

Can you be more specific? target/generic/target_skeleton has both
/sys, /proc and /usr/lib.

-- 
Bye, Peter Korsgaard
