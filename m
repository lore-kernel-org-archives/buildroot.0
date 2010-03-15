From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Mar 2010 15:17:08 +0100
Subject: [Buildroot] setserial fails to build (after uClibc 0.9.30.3
	upgrade?)
In-Reply-To: <badfd5ba1003150033n3bc99fc0ofe5123e2c4011bcc@mail.gmail.com>
	(Paulius Zaleckas's message of "Mon, 15 Mar 2010 09:33:53 +0200")
References: <4B9CBD6D.6010606@gmail.com> <87k4teziju.fsf@macbook.be.48ers.dk>
	<badfd5ba1003150033n3bc99fc0ofe5123e2c4011bcc@mail.gmail.com>
Message-ID: <87sk81y8ij.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

Hi,

 >> The hayes stuff is for a really ancient driver (which has recently been
 >> removed by Alan Cox).
 >> 
 >> As far as I can see, this has nothing to do with uClibc - Did you
 >> recently change the kernel headers version?

 Paulius> Yes, I switched to 2.6.33

Ok, I've pushed a fix to git (5a2844c74815)

-- 
Bye, Peter Korsgaard
