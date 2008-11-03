From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Nov 2008 09:41:23 +0100
Subject: [Buildroot] kernel size
In-Reply-To: <000001c93d37$d5a696d0$80f3c470$@be> (steve caster's message of
	"Sun\, 2 Nov 2008 23\:10\:37 +0100")
References: <000001c93d37$d5a696d0$80f3c470$@be>
Message-ID: <87ej1tp5fw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "steve" == steve caster <steve@c2root.be> writes:

 steve> Hi all,

 steve> I am trying to build a kernel with buildroot and are using a
 steve> separate .config file which I made myself. The kernel is
 steve> working, yet is about 90MB is size.  This is unbelievable as I
 steve> nearly don?t have any modules. What could make is so big?

Hard to know without any more details. How big is the kernel if you
compile it by hand with the buildroot cross compiler? What platform,
what is your buildroot and kernel .config's?

-- 
Bye, Peter Korsgaard
