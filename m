From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 25 May 2007 22:03:33 +0200
Subject: [Buildroot] Package selection question
In-Reply-To: <465737B9.8070008@gmail.com>
References: <4656F77D.30303@teamboyce.co.uk> <465737B9.8070008@gmail.com>
Message-ID: <20070525200333.GT24585@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 25, 2007 at 12:23:37PM -0700, Tom wrote:
>
>Hello,
>
>I just want to build the toolchain and the debugger on host: cygwin, 
>target: arm.
>
>So, even after I unchecked busybox and all packages, it still builds gmp 
>(and, unsuccessfully, mpfr). Why does it need it please and why is this 
>an option then? Or am I doing something wrong here?

gcc uses gmp/mpfr, you're doing nothing wrong. Please report build
failures of gmp/mpfr to the respective lists.

Before you report it to the mpfr folks, please paste the error here,
since i suspect that it could have to do something with the
binary/library name extensions, which (IIRC) we currently do not handle
at all (there's a bug somewhere about this, if memory serves me right).
