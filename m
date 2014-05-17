From: Tal Lubko <tallubko@yahoo.com>
Date: Sat, 17 May 2014 11:55:17 -0700 (PDT)
Subject: [Buildroot] Booting new kernels
In-Reply-To: <20140517102101.1034b695@free-electrons.com>
References: <1400278020.25876.YahooMailNeo@web122103.mail.ne1.yahoo.com>	<20140517091121.59fdaa6b@free-electrons.com>	<1400313412.16686.YahooMailNeo@web122105.mail.ne1.yahoo.com>
 <20140517102101.1034b695@free-electrons.com> 
Message-ID: <1400352917.66521.YahooMailNeo@web122102.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Damn it !!!

I took yours and Gene's advices and? looked again at the kernel configuration.
For some reason, starting from kernel 3.7.1, "RAM block device support" is turned off by default.
I think its mandatory for me because I use initrd. Now I'm going to try a newer kernel (3.14.3).
I think I'll go and read about the boot sequence to understand it a little bit better.

Thanks a lot for your help,
Tal


________________________________
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Tal Lubko <tallubko@yahoo.com> 
Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
Sent: Saturday, May 17, 2014 11:21 AM
Subject: Re: [Buildroot] Booting new kernels
 

Dear Tal Lubko,

On Sat, 17 May 2014 00:56:52 -0700 (PDT), Tal Lubko wrote:

> Thanks a lot for replying.
> 
> I'm not sure I'm using initrd kernel option correctly (I have to do my homework and read a little bit about it).
> BUT, it works
 with kernel 3.6.8 and even with 3.6.11 and the same kernel parameters...
> Still, it doesn't mean that I use it correctly.

Probably your kernel configuration that is different.

> Maybe it has something to do to permissions table but it's only a guess.

No, I clearly don't think it's related to the permission table.


Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140517/a7bca8c0/attachment.html>
