From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Wed, 28 Oct 2009 13:51:31 -0700
Subject: [Buildroot] busybox question
In-Reply-To: <87y6mvb6fv.fsf@macbook.be.48ers.dk>
References: <20091027211438.BEC2B7773A@busybox.osuosl.org>	<4AE7C7C5.8090001@cs.ucsb.edu>
	<877hufddx5.fsf@macbook.be.48ers.dk>	<4AE870AC.6070601@cs.ucsb.edu>
	<4AE87550.9090603@toumaz.com>	<4AE89CFE.5050406@cs.ucsb.edu>
	<87y6mvb6fv.fsf@macbook.be.48ers.dk>
Message-ID: <4AE8AED3.9040004@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:
> 
>  Roman> Emmanuel,
>  Roman> I have created a tar fs and then untarred as root so that mknod would
>  Roman> work properly.  I have then rebooted the board and pointed it to the new
>  Roman> file system.  I get the uClibc prompt, but I can't log in.
> 
> With uclibc prompt I guess you mean login prompt, right? What happens if
> you try to login as root?

I can't type anything over the serial so I can't log in.  This is what I
see though:

Freeing init memory: 120K



Welcome to Buildroot
uclibc login:


> 
> Do you get a shell if you boot with init=/bin/sh?

I am going to try that in a few.

> 
> Have you verified that you have softfloat enabled like I asked yesterday?

I do not have softfloat enabled.  Do I also need to enable "Enable C99
Floating-point environment" (uclibc-menuconfig)?

Thanks

> 
