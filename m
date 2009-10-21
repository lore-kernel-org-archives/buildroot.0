From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Wed, 21 Oct 2009 08:12:03 -0700
Subject: [Buildroot] precompiled kernel headers
In-Reply-To: <87iqe9q6y0.fsf@macbook.be.48ers.dk>
References: <4ADDE87E.1030601@cs.ucsb.edu> <4ADE49D7.10001@cs.ucsb.edu>
	<87iqe9q6y0.fsf@macbook.be.48ers.dk>
Message-ID: <4ADF24C3.8010204@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:
> 
>  Roman> Hello,
>  Roman> I have the following question regarding buildroot-2009.08.  If a kernel
>  Roman> is selected why does the script download the 2.6.30.5 precompiled
>  Roman> headers anyway?
> 
> Because you have two selections:
> 
> 1: What kernel headers to use to build uclibc/toolchain
> 2: What kernel (if any) to build next to rootfs

So if I want uclibc/toolchain to run a 2.6.24.7 kernel on the ARM
device, I will have to manually edit the Config which is used by
menuconfig to allow 2.6.24.7 to be used for precompiled headers?

Thanks
> 
