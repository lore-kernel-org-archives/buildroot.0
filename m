From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Date: Fri, 13 Nov 2020 09:02:56 -0300
Subject: [Buildroot] [PATCH 1/1] package/busybox: Fix hwclock for glibc
 2.31+
In-Reply-To: <87d00hinfu.fsf@dell.be.48ers.dk>
References: <20201112164844.18731-1-klaus@linux.vnet.ibm.com>
 <87wnyqi8x4.fsf@dell.be.48ers.dk>
 <7ba2b5f8-f871-2e84-fe3c-bcea0c89d5c5@linux.vnet.ibm.com>
 <87d00hinfu.fsf@dell.be.48ers.dk>
Message-ID: <c8c5fc44-7afe-d3c9-1f62-9c89ebb015e1@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/13/2020 7:03 AM, Peter Korsgaard wrote:
> 
> That is also fine, but then use the -x option to git cherry-pick so the
> original git hash is tracked.

Odd, I kinda always automatically cherry-pick with -xs, not sure how I missed that this time.

> 
>   > At any rate, I'm sending a second version where I format-patch'ed the patch itself
>   > (i.e., from busybox master), instead of applying it on top of a local 1_32_0 tree
>   > along with other buildroot build-time patches.
> 
> That is not needed as I already applied this patch.
> 
> Thanks!
> 

Thanks!

I'll send a similar patch to buildroot 2020.08.1 (hopefully this is still active?) and 2020.02.7
(in case it's really affected - need to double check) - but those will require a small change to
apply on top of busybox 1_31_1..

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
