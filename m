From: Cyril HAENEL <chaenel@free.fr>
Date: Tue, 20 Jan 2009 15:57:30 +0100
Subject: [Buildroot] Buildroot compilation blocks on LZO package
In-Reply-To: <87bpu2w0n3.fsf@macbook.be.48ers.dk>
References: <4975D32E.7020602@free.fr> <87bpu2w0n3.fsf@macbook.be.48ers.dk>
Message-ID: <4975E65A.30901@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Peter Korsgaard a ?crit :
>>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:
>>>>>>             
>
>  Cyril> Hi all,
>  Cyril> I try to build a rootfs based on 
>  Cyril> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc1.tar.gz
>
>  Cyril> After unpacking, I done make menuconfig and done very small things :
>
>  Cyril> - Put Target Architecture to Arm
>  Cyril> - Put Target Architecture variant tp generic_arm
>  Cyril> - Put Filesystem for target device to jffs2, and not ext2
>
>  Cyril> After that, a make the build works well until it reach the LZO package.
>  Cyril> The configure script blocks on this line :
>
>  Cyril> checking whether we are using the GNU C++ compiler...
>
> Strange, it works here (powerpc):
>
> checking for g++... g++
> checking whether we are using the GNU C++ compiler... no
> checking whether g++ accepts -g... yes
> checking dependency style of g++... gcc3
> checking how to run the C++ preprocessor... g++ -E
>
> Please send you .config file.
>
>   
Peter, you will my config attached

I don't know what happen because until lzo package, everything is built 
successfully !

Regards

-- 

Cyril Haenel
Registered Linux User #332632

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: config.txt
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090120/22db80df/attachment-0001.txt 
