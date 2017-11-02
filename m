From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 09:07:42 +0100
Subject: [Buildroot] [PATCH 1/4] package/openobex: disable on Blackfin
In-Reply-To: <20171102021434.GJ1829@waldemar-brodkorb.de>
References: <20171101201137.29939-1-s.martin49@gmail.com>
 <20171101232343.764c231a@windsurf>
 <20171102021434.GJ1829@waldemar-brodkorb.de>
Message-ID: <20171102090742.4d71278b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 03:14:34 +0100, Waldemar Brodkorb wrote:

> > Also, I'd like to hear from Waldemar about accept4 availability on
> > Blackfin/uClibc-ng.  
> 
> For me it looks like a uClibc bug.
> When socketcalls.c was converted to use cancel.h for syscall
> cancellation (19607f1113ef9916a0a0ac2bf99b5bc32526f0de)
> it seems accept4 was left out for no specific reason.
> 
> For Linuxthreads the syscall wrapper for accept4 isn't compiled in.
> I think for NPTL we do not see the issue.
> 
> I am going to sent out a patch soon.

Great, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
