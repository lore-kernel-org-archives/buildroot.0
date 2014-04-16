From: Rohit Kumar <rohit.kumar@hitechroboticsystemz.com>
Date: Wed, 16 Apr 2014 16:31:13 +0900
Subject: [Buildroot] buildroot file system: Kernel panic
In-Reply-To: <20140416091611.03ce43f3@skate>
References: <CABzetm2iM9vUAQ4GHfiKv_y3HCq_Jek45Pe16MPSZo=CoV+6Cw@mail.gmail.com>
 <20140416091611.03ce43f3@skate>
Message-ID: <CABzetm3snhCBbvvtZ8Z9btySm0BeRsf2gwG2GxhNn0mXy4d1fA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

** The platform you're using, so that we can figure out which processor
 it is using.*

i am using an ARM11 processor form Nexell (NXP2120)
32bit Embedded CPU : 700/800Mhz ARM1176 with
16KByte I-Cache, 16Kbyte D-cache with VFP(vector floating-point processor)


* * The Buildroot .config file you're using, to check that the
 configuration you've made matches the processor of your platform.*

please see the attached configuration.



*Also, how did you prepare your NFS filesystem? By just copying
output/target, or by following the instructions at
http://buildroot.org/downloads/manual/manual.html#_nfs_boot
<http://buildroot.org/downloads/manual/manual.html#_nfs_boot> ?*

i am following as mentioned in above manual.




On Wed, Apr 16, 2014 at 4:16 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Rohit Kumar,
>
> On Wed, 16 Apr 2014 11:21:25 +0900, Rohit Kumar wrote:
>
> > i used buildroot to make toolchain and file system.
> > i used toolchain to compile the kernel source given by processor
> > manufacturer.
> > kernel compiled successfully and boots fine but the file system generated
> > by buildroot doesnt work.
> >
> > and gives following error:
> >
> > VFS: Mounted root (nfs filesystem) on device 0:13.
> > devtmpfs: mounted
> > Freeing init memory: 480K
> > Kernel panic - not syncing: Attempted to kill init!
>
> Can you give us:
>
>  * The platform you're using, so that we can figure out which processor
>    it is using.
>
>  * The Buildroot .config file you're using, to check that the
>    configuration you've made matches the processor of your platform.
>
> Most of the time, those errors are due to inadequate architecture
> variant / floating point configuration.
>
> Also, how did you prepare your NFS filesystem? By just copying
> output/target, or by following the instructions at
> http://buildroot.org/downloads/manual/manual.html#_nfs_boot ?
>
> Best regards,
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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140416/8eefb781/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 39372 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140416/8eefb781/attachment-0001.obj>
