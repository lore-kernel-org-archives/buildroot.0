From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Oct 2009 21:37:56 +0100
Subject: [Buildroot] busybox question
In-Reply-To: <4AE89CFE.5050406@cs.ucsb.edu> (Roman Chertov's message of "Wed\,
	28 Oct 2009 12\:35\:26 -0700")
References: <20091027211438.BEC2B7773A@busybox.osuosl.org>
	<4AE7C7C5.8090001@cs.ucsb.edu> <877hufddx5.fsf@macbook.be.48ers.dk>
	<4AE870AC.6070601@cs.ucsb.edu> <4AE87550.9090603@toumaz.com>
	<4AE89CFE.5050406@cs.ucsb.edu>
Message-ID: <87y6mvb6fv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:

 Roman> Emmanuel,
 Roman> I have created a tar fs and then untarred as root so that mknod would
 Roman> work properly.  I have then rebooted the board and pointed it to the new
 Roman> file system.  I get the uClibc prompt, but I can't log in.

With uclibc prompt I guess you mean login prompt, right? What happens if
you try to login as root?

Do you get a shell if you boot with init=/bin/sh?

Have you verified that you have softfloat enabled like I asked yesterday?

-- 
Bye, Peter Korsgaard
