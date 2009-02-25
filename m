From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Feb 2009 11:18:20 +0100
Subject: [Buildroot] native toolchain compilation problem
In-Reply-To: <20090225191212.c5a31f46.william@brodie-tyrrell.org> (William
	Brodie-Tyrrell's message of "Wed\, 25 Feb 2009 19\:12\:12 +0900")
References: <20090225174424.09d0badc.william@brodie-tyrrell.org>
	<87iqmyoogi.fsf@macbook.be.48ers.dk>
	<20090225191212.c5a31f46.william@brodie-tyrrell.org>
Message-ID: <8763iyom4z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Brodie-Tyrrell <william@brodie-tyrrell.org> writes:

Hi,

 >> Hmm, 23434 is half a year old, and we have had various toolchain fixes
 >> since then. Could you try with svn head?

 William> OK, I'll give it a go.  Will it be sufficient to copy over my .config
 William> and run make oldconfig or something like that?

Yes, that should be fine (depending on what that atmel patch does).

-- 
Bye, Peter Korsgaard
