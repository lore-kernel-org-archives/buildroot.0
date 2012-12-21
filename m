From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Dec 2012 10:03:59 -0300
Subject: [Buildroot] [PATCH] ffmpeg: make ARM optimizations explicit
In-Reply-To: <87pq238swl.fsf@dell.be.48ers.dk>
References: <1356093631-558-1-git-send-email-gustavo@zacarias.com.ar>
 <87pq238swl.fsf@dell.be.48ers.dk>
Message-ID: <50D45E3F.3010502@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/21/2012 09:57 AM, Peter Korsgaard wrote:

> Committed, thanks.
> 
> It would be good to add some BR2_ARM_HAS_ARMVx config options so we
> don't need these written out checks in the packages which care.

Yes, it would be good to have an additional BR2_ARM_CPU_HAS_VFP also
since it's optional for some cores, like NEON.
I haven't seen A9's without VFP, it doesn't mean there aren't.
Regards.
