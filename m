From: Ma Andrew <andrewma83@hotmail.com>
Date: Thu, 3 Apr 2008 15:07:14 -0700
Subject: [Buildroot] Error when compiling Buildroot to create .iso
 (cannot	stat /.../i386-linux-2.6.24-20
In-Reply-To: <BLU136-W8787D45D6697B1F3539C3C3F70@phx.gbl>
References: <326f33790804031358n63fd21bs5ee753b194d3a89b@mail.gmail.com>
	<BLU136-W8787D45D6697B1F3539C3C3F70@phx.gbl>
Message-ID: <BLU136-W10B5C6A74557210931D68FC3F70@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Perhaps mail truncate part of the command...

"ln -s ./project_build_i686/\/linux-2.6.24/arch/x86 x86"

Thanks
--Andrew
----------------------------------------
> From: andrewma83 at hotmail.com
> To: reddyac at gmail.com; buildroot at uclibc.org
> Date: Thu, 3 Apr 2008 14:33:45 -0700
> Subject: Re: [Buildroot] Error when compiling Buildroot to create .iso (cannot	stat /.../i386-linux-2.6.24-20
> 
> 
> I think you can make a sym link like this on your /root/buildroot directory.
> "ln -s ./project_build_i686//linux-2.6.24/arch/x86 x86" and see if it works for you.
> 
> 
> 
> ________________________________
>> Date: Thu, 3 Apr 2008 13:58:28 -0700
>> From: reddyac at gmail.com
>> To: buildroot at uclibc.org
>> Subject: [Buildroot] Error when compiling Buildroot to create .iso (cannot stat /.../i386-linux-2.6.24-20080403)
>> 
>> Hi everyone.
>> 
>> I am able to successfully compile Buildroot and I end up with a resulting file system image rootfs.i386.ext2 and a bzImage for the kernel. I want to boot up my newly created kernel in VirtualBox, and I will need an .iso to do that. So modified menuconfig to give me an .iso and typed make again. Unfortunately I run into an error that states:
>> 
>> cp: cannot stat '/root/buildroot/binaries/uclibc/i386-linux-2.6.24-20080403': No such file or directory
>> make: *** [/root/buildroot/binaries/uclibc/rootfs.i386.iso] Error 1
>> 
>> I checked that folder and I see file named i386-linux-2.6.24-20080403, and cannot understand why it is giving me this error. Can someone give me a clearer indication to what this error is referring and how I can go about fixing it?
>> 
>> Thank you in advance for your response!
> 
> _________________________________________________________________
> ??????????????? ? MSN ????? 
> http://toolbar.live.com/
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

_________________________________________________________________
5 GB ???? ????????????????? ? ???? Windows Live Hotmail
http://mail.live.com 
