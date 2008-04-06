From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Apr 2008 19:18:26 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <03b701c89801$6b9003e6$85f0af0a@corp.atmel.com> (Ulf Samuelsson's
	message of "6 Apr 2008 15\:28\:50 +0000")
References: <03b701c89801$6b9003e6$85f0af0a@corp.atmel.com>
Message-ID: <87k5ja7vh9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Samuelsson, Ulf <ulf.samuelsson@atmel.com> writes:

 Ulf> But as it's just a default, you can always change it locally if you
 Ulf> prefer xconfig.

 Ulf> => Try "make > project.log 2>&1"
 Ulf>     with menuconfig enabled.
 Ulf>     I doubt that will give the 
 Ulf>      desired result.

Then don't do that (Doctor, it hurts when I ..).

I guess it works with a tee project.log instead.

Similarly, a xconfig doesn't work within a screen session.

 Ulf>      If people have a problem
 Ulf>     then they should keep
 Ulf>     the normal kernel build.
 Ulf>     Menuconfig is soo 20th 
 Ulf>    century.

So, where's the xconfig patch for buildroot itself? ;)

(No, please don't).

-- 
Bye, Peter Korsgaard
