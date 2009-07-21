From: nfrench at xtale.biz <nfrench@xtale.biz>
Date: Tue, 21 Jul 2009 08:24:05 -0000 (Europe/London)
Subject: [Buildroot] standard libc libm support
Message-ID: <43962.172.16.221.250.1248164645.squirrel@cvs.xtale.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



thanks both of you, will go and investigate cosstool-ng. Is it it straight
forward to setup are there any howto's on using it with build root. If not
I could create a readme if that is any good.


> Le Tue,
21 Jul 2009 08:26:38 +0200,
> Peter Korsgaard
<jacmet@uclibc.org> a ??crit :
> 
>> 
nfrench> You are correct it is closed source and linked against
>>  nfrench> glibc.  Is there no way that buildroot could build
this or
>>  nfrench> am I missing something or have I just
overlooked a part of
>>  nfrench> buildroot, or is it
outside the scope of this project.
>>
>> The only
way to use glibc with buildroot is to generate a glibc
>>
toolchain with something like crosstool-ng, and use that as an
>> external toolchain.
>>
>> Thomas
Petazzoni afaik uses this.
> 
> I confirm.
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
>
consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot
mailing list
> buildroot at busybox.net
>
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090721/5f062d42/attachment-0001.htm>
