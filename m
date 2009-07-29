From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Jul 2009 20:51:53 +0200
Subject: [Buildroot] Cygwin PPC Build Possible ?
In-Reply-To: <4A707399.2030401@dlasys.net> (David H. Lynch J. r.'s message of
	"Wed\, 29 Jul 2009 12\:06\:49 -0400")
References: <4A707399.2030401@dlasys.net>
Message-ID: <873a8fz5iu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David H Lynch J r <ml@dlasys.net> writes:

 David>     I am trying to use buildroot to create a ppc-405-linux-uClibc
 David> toolchain.

 David>     Currently I am getting a weird failure building gmp-4.2.4-host
 David>     the error is something like
 David>         configure:1 can't find CollabNet/files

grep -rlsi collab in gmp-4.2.4-host doesn't give anything, so maybe
you're remembering wrong?

 David>     Sorry I am in linux at the moment so I do nto have the exact error.
 David>     Regardless it seems to be some kind of cygwin script handling issue.

 David>     Has anyone succeeded in running buildroot under cygwin ?

We have some very basic cygwin support in BR, but I haven't heard
about anyone using it, certainly none of the developers so it could
very well be broken.

-- 
Bye, Peter Korsgaard
