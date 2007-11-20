From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 20 Nov 2007 03:32:06 -0800 (PST)
Subject: [Buildroot] SDL fails for Buildroot arm926ejs toolchain
In-Reply-To: <4742CE14.2060802@promwad.com>
References: <13830846.post@talk.nabble.com> <4741755A.5010404@promwad.com>
	<13848331.post@talk.nabble.com> <4742CE14.2060802@promwad.com>
Message-ID: <13855274.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Ivan

I removed BR2_PACKAGE_SDL_X11 and it worked fine.

BR2_PACKAGE_SDL_FBCON=y
BR2_PACKAGE_SDL_DIRECTFB=y
# BR2_PACKAGE_SDL_QTOPIA is not set
# BR2_PACKAGE_SDL_X11 is not set
# BR2_PACKAGE_SDL_TTF is not

Thanks for the help.

Regards
Gururaja


Ivan Kuten wrote:
> 
> Hebbar wrote:
>> 
>> #
>> # SDL options selection
>> #
>> BR2_PACKAGE_SDL_FBCON=y
>> BR2_PACKAGE_SDL_DIRECTFB=y
>> # BR2_PACKAGE_SDL_QTOPIA is not set
>> BR2_PACKAGE_SDL_X11=y
>> # BR2_PACKAGE_SDL_TTF is not set
>> # BR2_PACKAGE_TIFF is not set
>> 
> 
> Try enabling only BR2_PACKAGE_SDL_FBCON=y
> 
> Regards,
> Ivan
> --------------------------------
> Embedded Linux engineer,
> Promwad Company: http://www.promwad.com/
> Homepage : http://www.ivankuten.com/
> --------------------------------
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
View this message in context: http://www.nabble.com/SDL-fails-for-Buildroot-arm926ejs-toolchain-tf4834503.html#a13855274
Sent from the BuildRoot mailing list archive at Nabble.com.
