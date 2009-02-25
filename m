From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Feb 2009 10:28:13 +0100
Subject: [Buildroot] native toolchain compilation problem
In-Reply-To: <20090225174424.09d0badc.william@brodie-tyrrell.org> (William
	Brodie-Tyrrell's message of "Wed\, 25 Feb 2009 17\:44\:24 +0900")
References: <20090225174424.09d0badc.william@brodie-tyrrell.org>
Message-ID: <87iqmyoogi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Brodie-Tyrrell <william@brodie-tyrrell.org> writes:

 William> Hi,

 William> I'm using buildroot to build a linux system for the
 William> AT91SAM9G20-EK board and it's working fine except that I
 William> can't get it to build the native toolchain.  The
 William> cross-compiler works perfectly.

 William> I'm using a patched v23434 from SVN as instructed by this website:
 William> http://www.linux4sam.org/twiki/bin/view/Linux4SAM/BuildRootBuild

 William> The error I'm getting is this:

Hmm, 23434 is half a year old, and we have had various toolchain fixes
since then. Could you try with svn head?

-- 
Bye, Peter Korsgaard
