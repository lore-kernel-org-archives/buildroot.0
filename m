From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 23:04:01 +0200
Subject: [Buildroot] [PATCH] boost: fix build on ARC
In-Reply-To: <87zj1n6lnv.fsf@dell.be.48ers.dk>
References: <1440008812-13384-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87zj1n6lnv.fsf@dell.be.48ers.dk>
Message-ID: <20150819230401.61f3b67c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, 19 Aug 2015 22:57:56 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > This commit adds a patch to Boost to make it use the eventfd()
>  > function provided by the C library when uClibc is used, rather than
>  > falling back to using directly the __NR_eventfd system call. This
>  > fixes the build on ARC, which doesn't define __NR_eventfd.
> 
> What does it then do? Only __NR_eventfd2?

I am not sure. Alexey?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
