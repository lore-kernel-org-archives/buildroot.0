From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 02 Dec 2011 19:33:47 +0100
Subject: [Buildroot] Real time Linux implementation
In-Reply-To: <20111201221840.00174379@skate>
References: <CAO6BqMXyye4TFHf0Pxc99Naq28wWg1ne=--q=e+VmfvPVuwD3w@mail.gmail.com>
 <20111201221840.00174379@skate>
Message-ID: <4ED91A0B.10403@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 01.12.2011 22:18, schrieb Thomas Petazzoni:
> Le Thu, 1 Dec 2011 11:27:37 -0800,
> Morten Jensen <mjensen@nvs-technologies.com> a ?crit :
>
>> Hello,
>> We are using Buildroot on an ARM based development platform from IC-BOARD:
>> http://www.ic-board.de/product_info.php?info=p163_STK-ADB3000---ICnova-SAM9G45-XC3S700AN-OEM.html
>>
>> Does anybody have any experience with implementing Real Time OS
>> functionality in the Linux Buildroot system or can you guide us to someone
>> that may be able to help or consult in this effort ?
> Yes. First thing to find out is what you need in terms of real-time :
>
>  *) A vanilla Linux kernel with preemption enabled and proper process
>     priorities ;
>
>  *) A Linux kernel patched with PREEMPT_RT
I have good experiences with this patch, but did not try it with a ARM.
It's not that much effort and integrates well with buildroot. Look here:
https://rt.wiki.kernel.org/ and here:
https://www.osadl.org/Latest-Stable-Realtime.latest-stable-realtime-linux.0.html
for further information.

@Peter and Thomas,

what do you think about adding the PREEMPT_RT patch as a config option
to buildroot?

Kind regards

Stephan


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
