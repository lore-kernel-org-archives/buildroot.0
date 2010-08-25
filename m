From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 25 Aug 2010 13:42:48 +0200
Subject: [Buildroot] mini 2440 config nfs problems
In-Reply-To: <001c01cb443c$f9b3d570$ed1b8050$@pauljones.id.au>
References: <AANLkTikb76LCoPYX93MntAG-dKWerjfBACHkQaOQs2wh@mail.gmail.com>
	<001c01cb443c$f9b3d570$ed1b8050$@pauljones.id.au>
Message-ID: <AANLkTimX+64V70t=pxV_SQ+GMfiZ-BLZj=m-t3M6AX3k@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Wed, Aug 25, 2010 at 12:04 PM, Paul Jones <paul@pauljones.id.au> wrote:
> I use my mini2440 over nfs without any trouble. I have attached my buildroot
> and kernel configs.
> Note also that I use the kernel source from the friendlyarm site.
> My kernel command line is:
> console=ttySAC0 root=/dev/nfs nfsroot=192.168.0.1:/media/root rw ip=dhcp
>
> I have some more info on my website that might help, but some of it is
> slightly out of date.
> http://pauljones.id.au/blog/
Thanks for info. Problem is resolved. Problem was between keyboard and chair ;).
I select wrong arch type in buildroot (generic arm instead arm920t).
Sorry for disturbing.
>
> Cheers,
> Paul.
>
>> -----Original Message-----
>> From: buildroot-bounces at busybox.net [mailto:buildroot-
>> bounces at busybox.net] On Behalf Of Belisko Marek
>> Sent: Wednesday, 25 August 2010 6:48 PM
>> To: buildroot at uclibc.org
>> Subject: [Buildroot] mini 2440 config nfs problems
>>
>> Hi,
>>
>> playing with buildroot (2010.08_rc1) to build complete system for my
>> mini 2440 board.
>> I was able to build kernel and rootfs correctly but when I try to
>> mount rootfs over nfs it
>> always hangs with :
>>
>> Freeing init memory: 120K
>> Kernel panic - not syncing: Attempted to kill init!
>>
>> Is there anything what I can check? This is not related to some EABI
>> tweaking?
>>
>> Thanks for replies,
>>
>> Marek
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

Marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
