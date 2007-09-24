From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 24 Sep 2007 20:31:00 +0300
Subject: [Buildroot] some tips for x11r7
In-Reply-To: <46F7CBF7.8040103@apexar.com.ar>
References: <46F6BBA4.80002@promwad.com> <46F7CBF7.8040103@apexar.com.ar>
Message-ID: <46F7F454.9060603@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>   
> Hi Ivan,
> 
> I was trying to solve the same problem as you: make X working in ARM, 
> but i'm getting this error when compiling FontConfig (the X server i 
> choose was x11r7):
> 
> configure.in:63: error: possibly undefined macro: AC_LIBTOOL_WIN32_DLL
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> configure.in:64: error: possibly undefined macro: AM_PROG_LIBTOOL
> autoreconf: /usr/bin/autoconf failed with exit status: 1
> make: *** 
> [/home/dfons/buildroot_19987/build_arm/fontconfig-2.4.2/.configured] Error 1
> 
> Did you get this error? What can i do to solve it?
> 
> Regards,
> Diego A. Fons.

Hello,

No, do not have such an error. But I have fontconfig and fontconfig-devel rpms installed on my host PC -
may be this could be a reason why I do not see such errors. Are you using latest buildroot svn revision?

Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
