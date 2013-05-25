From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Sun, 26 May 2013 00:41:24 +0200
Subject: [Buildroot] [PATCH 2/2] Add HW decoding support for Hantro x170
In-Reply-To: <878v425vm2.fsf@dell.be.48ers.dk>
References: <1360016773-8691-1-git-send-email-alexandre.belloni@piout.net>
 <1360016773-8691-2-git-send-email-alexandre.belloni@piout.net>
 <878v425vm2.fsf@dell.be.48ers.dk>
Message-ID: <20130525224123.GA3833@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Apr 28, 2013 at 09:00:05PM +0200, Peter Korsgaard wrote :
> Will you send a v2 fixing the comments Thomas had?
> 

I had a look again today, I addressed almost all the comments but I'm
still try to figure what is happening with the configure script.
It is actually find glib and the other one correctly but it is not using
the correct environment variable in the Makefile.

I'll try to send something next week.

> For the on2-8170-libs package, do you know what toolchain the binaries
> have been built with? Do we need to limit the C library / arch variant
> to ensure it is only available on compatible configs?
> 

The symbol that are coming from the libc are limited and if I recall
correctly, it was working with a toolchain built by buildroot (that is
using uClibc).

Regards

-- 
Alexandre Belloni
