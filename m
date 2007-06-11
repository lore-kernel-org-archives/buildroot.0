From: kevint <kevint@lanl.gov>
Date: Mon, 11 Jun 2007 16:10:07 -0700
Subject: [Buildroot] problems building x86_64 target
In-Reply-To: <20070611220849.GK2853@aon.at>
References: <3AF470EE-B97B-40FC-B806-12627EC946D0@lanl.gov>
	<20070606173826.GA4543@aon.at> <20070606184023.GA7593@aon.at>
	<FC6B700F-A073-4E83-A3AB-BFD8A9E5ED56@lanl.gov>
	<20070607101948.GH2853@aon.at> <20070611155624.GB28991@aon.at>
	<BE02E238-29E8-49E4-9355-D95E821B1189@lanl.gov>
	<20070611220849.GK2853@aon.at>
Message-ID: <C8F43D52-6247-4A1E-8B8D-FA610A33F497@lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I will revisit the topic when we have a stable 2.6.20 bproc package,  
and keep our 2.6.11 and 2.6.14 packages in-house unless someone sends  
me a request for them offline.

We do have specific needs regarding lower-level communication stacks,  
but we have a good handle on them and won't require the mailing list  
to resolve those.  I am mostly interested in a good starting point  
for x86_64 development, which I think we have achieved with the help  
you have provided.

Thanks again,

Kevin

On Jun 11, 2007, at 3:08 PM, Bernhard Fischer wrote:

> On Mon, Jun 11, 2007 at 09:28:56AM -0700, kevint wrote:
>> Hello,
>>
>> I am comfortable using gcc-4.2.0 now, so that is my new target.  I
>> will try out your patch today and let you know how it goes.
>>
>> I am planning on adding a package for bproc, which includes a kernel
>> patch, kernel module, and a few user space daemons and configs.  We
>> currently have two supported kernels, 2.6.11 and 2.6.14.  I wrote a
>> patch to the 2.6.11 source tree that adds the headers_install
>> functionality and patched toolchain/kernel-headers/kernel-headers-
>> new.makefile to include a 2.6.11 target, and it seems to work pretty
>> well.  I will be doing the same for 2.6.14 later this week.  We are
>> targeting 2.6.20 for our next bproc port, but that is a few months  
>> off.
>>
>> Is this something you would be interested in including in the
>> buildroot project?
>
> 2.6.<20 is not interresting for me, personally. I'm currently using
> 2.6.20.x as my "unified" openswan/bproc/blcr/etc suite and do not
> currently plan to move anything else than the very first onward,  
> due to
> time-constraints layed upon my scarse spare-time (not in the near  
> future
> nor else-wise; If you're interrested in any of these contact me
> offline; Likewise if you have specific needs regarding lower-level
> communication stacks, this is highly OT. Neither IB nor dolphin nor GM
> et al are within the scope of this list, fwiw).
>
> thanks anyway for the offer and nice to see you on-track.

********************************************
Kevin Tegtmeier
HPC-3 Scientific Computing Resources
Los Alamos National Laboratory
email:  kevint at lanl.gov
phone: 505.667.3488
********************************************



-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070611/9ee4ae7a/attachment.htm 
