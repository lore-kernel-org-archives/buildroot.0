From: W.P. <laurentp@wp.pl>
Date: Wed, 14 Oct 2009 00:13:36 +0200
Subject: [Buildroot] setting up buildroot for using OLD gcc / binutils
In-Reply-To: <4AD4E640.2030103@arcor.de>
References: <4AD389B2.20400@wp.pl>	<87my3w4bw6.fsf@macbook.be.48ers.dk>	<4AD3918B.5000908@wp.pl>	<20091012203645.GX2266@mx.loc>	<4AD3B2BE.2010809@wp.pl>	<20091013111009.GB23718@mx.loc>	<4AD4C1BB.5000304@wp.pl>	<877huz2m5l.fsf@macbook.be.48ers.dk>	<4AD4C7B6.3000202@wp.pl>
	<4AD4D7D6.6020305@wp.pl> <4AD4E640.2030103@arcor.de>
Message-ID: <4AD4FB90.2060202@wp.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U?ytkownik Gammalsvenska napisa?:
>>> No, I didn't. But for binutils 2.15.94.0.2.2 patch directory is
>>> empty in
>>> 2009-02, and there are patches in 0.9.27 in 2.15.94.0.2 dir.
>>>
>>> Will try and report results.
>>>   
>> Made "patches" for Config.in for kernel headers, gcc and binutils. No
>> software packages/kernel selected, just toolchain.
>>
>> First error (download generic 2.6.12.6 kernel OK, and then error):
> > [...]
>> `/usr/src/buildroot/toolchain_build_mipsel/linux-2.6.12.6'
>> Makefile:485: .config: No such file or directory
>> make[1]: *** No rule to make target `headers_install'.  Stop.
>> make[1]: Leaving directory
>> `/usr/src/buildroot/toolchain_build_mipsel/linux-2.6.12.6'
>> make: *** [/usr/src/buildroot/toolchain_build_mipsel/linux/.configured]
>> Error 2
>> [root at laurent-home buildroot]#
>>
>> What should I do?
>
>
> You can always use an older version of buildroot.
> There are no releases earlier than 2009.05, but it was maintained back
> then. Snapshots were done in subversion (nowadays they use git) and
> you can always use an older version from there.
>
> Try to find out which releases are appropriate for you. Manually
> patching is probably not working too well as in recent releases old
> versions have been removed including workarounds needed.
>
Sorry, don't understand. I need to make cross-compile environement with
following "parameters":

gcc: 3.4.4
binutils 2.15.94
kernel 2.6.12.6-venus
uClibc 0.9.28
busybox 1.1.3

and i am trying to do this with buildroot. could you help?

W.P.

> Best regards,
> Sebastian
