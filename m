From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Sat, 26 May 2007 15:45:18 +0100
Subject: [Buildroot] ALSA for build root
In-Reply-To: <4656F77D.30303@teamboyce.co.uk>
References: <4656F77D.30303@teamboyce.co.uk>
Message-ID: <465847FE.6050304@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rod Boyce wrote:
> All,
>
> I have been adding ALSA to the build root package system I am only able 
> to test on a x86 platform.  Is anybody else interested in ALSA for 
> build-root?  I have also been adding libogg and libvorbis would it be OK 
> if I submitted a combined patch or would you prefer 2 separate patches?  
> Is anybody else working on this who would like an advanced copy to test 
> out and or compare against?
>
> This would include the following packages:
> alsa-lib-1.0.14rc4
> alsa-utils-1.0.14rc4
> libogg-1.1.3
> libvorbis-1.1.2
>
>
> Regards,
> Rod Boyce
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   
All,

As promised attached is a patch to add ALSA packages to build root I 
have only tested on i386 but it seems to work for me.  This patch is 
against the latest SVN repository No. 18694.  I have not tested the 
alsa-tools well and in-fact because I am not using X or GTK most will 
not compile I have disabled all the the ac3dec by default.  Also I am 
assuming the latest version of ALSA and a compatible kernel.

Regards,
Rod Boyce
-------------- next part --------------
A non-text attachment was scrubbed...
Name: alsa.patch
Type: text/x-patch
Size: 23409 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070526/0dee6bb5/attachment.bin 
