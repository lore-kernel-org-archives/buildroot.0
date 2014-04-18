From: Rohit Kumar <rohit.kumar@hitechroboticsystemz.com>
Date: Fri, 18 Apr 2014 09:36:24 +0900
Subject: [Buildroot] buildroot file system: Kernel panic
In-Reply-To: <20140417120156.2ee23368@skate>
References: <CABzetm2iM9vUAQ4GHfiKv_y3HCq_Jek45Pe16MPSZo=CoV+6Cw@mail.gmail.com>
 <20140416091611.03ce43f3@skate>
 <CABzetm3snhCBbvvtZ8Z9btySm0BeRsf2gwG2GxhNn0mXy4d1fA@mail.gmail.com>
 <20140416095711.430764d9@skate>
 <CABzetm2VtaC-B4tv+2N9qpD-1anG7FkcgGnbV+fcimRCnCLzFQ@mail.gmail.com>
 <20140416103924.64cdc49f@skate>
 <CABzetm27cTYk_wiu1Skt3dkbvpFioaCQVz+YaE=VWjXKCz4eUw@mail.gmail.com>
 <CABzetm1Ht=SonZ8-6TYtAA3h+Z+Jv-PdeFOuvJoZ89EUgBtqCQ@mail.gmail.com>
 <20140417120156.2ee23368@skate>
Message-ID: <CABzetm0vuCrDN+MeY7YSEX7F_snh17ZXeFD81Ek+1sTvA72iHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,


On Thu, Apr 17, 2014 at 7:01 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Rohit Kumar,
>
> On Thu, 17 Apr 2014 16:59:03 +0900, Rohit Kumar wrote:
>
> > out of all this i figured out that file system works with cpu
> > subarchitecture of "armv6j" and not "armv6zk" which is ARM1176jzf-s
>
> Now that you have a booting system, can you show the output of
> "cat /proc/cpuinfo" ? It will help understand exactly which variant of
> ARM core your processor is using.
>

output of /proc/cpuinfo:
# cat /proc/cpuinfo
Processor       : ARMv6-compatible processor rev 7 (v6l)
BogoMIPS        : 699.59
Features        : swp half thumb fastmult vfp edsp java
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0xb76
CPU revision    : 7

Hardware        : nxp2120
Revision        : 0000
Serial          : 0000000000000000



>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 

With Regards,

Rohit Kumar
Sr. Research Developer
Hitec Robotic systems Ltd.
+91 9891691967
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140418/2687965a/attachment.html>
