From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Mar 2010 16:16:02 +0100
Subject: [Buildroot] Resume on WGET commands
In-Reply-To: <4BA08BFB.4080102@iwtech.com.au> (Paul Jones's message of "Wed,
	17 Mar 2010 18:59:55 +1100")
References: <4BA08BFB.4080102@iwtech.com.au>
Message-ID: <877hp8gx59.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Jones <paul.jones@iwtech.com.au> writes:

Hi,

 Paul> Is there a reason that buildroot doesn't seem to use the -c
 Paul> command for wget by default? It would be quite handy to have.

Not as far as I remember.

 Paul> Then I remembered there was an option to modify the wget command
 Paul> line in build options and it didn't seem to work.

No? It seems to work here from a quick look. For easy debugging you can
remove the $(Q) from the line just after define DOWNLOAD in
package/Makefile.package.in

-- 
Bye, Peter Korsgaard
