From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 7 Feb 2016 18:27:13 -0300
Subject: [Buildroot] [PATCH] configs/qemu: bump to the latest linux
 versions
In-Reply-To: <20160207222223.11b237a1@free-electrons.com>
References: <1454879953-19093-1-git-send-email-gustavo@zacarias.com.ar>
 <20160207222223.11b237a1@free-electrons.com>
Message-ID: <56B7B6B1.1020003@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/16 18:22, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
>
> On Sun,  7 Feb 2016 18:19:13 -0300, Gustavo Zacarias wrote:
>> Keep arm_nuri on 3.10.x for the usual reasons.
>
> Should we drop arm_nuri? Does it provide something interesting that
> arm_versatile and arm_vexpress doesn't provide?

Hi.
If we want SMP on ARM testing we could just switch to a smp-enabled 
vexpress, i've already tested that and it works without any significant 
change other than qemu invocation (-smp 4).
We can even make a "big" vexpress-a15 with smp + a15.
I haven't dropped nuri because we have no policy/consensus on the qemu 
samples, but on my side i'd +1 that, maybe adding the fat vexpress sample.
Regards.
