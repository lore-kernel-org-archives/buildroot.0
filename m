From: Kuten Ivan <ivan.kuten@promwad.com>
Date: Wed, 26 Sep 2007 11:15:43 -0100
Subject: [Buildroot] some tips for x11r7
In-Reply-To: <46F8FB49.8050808@apexar.com.ar>
References: <46F6BBA4.80002@promwad.com> <46F7CBF7.8040103@apexar.com.ar>
	<46F7F454.9060603@promwad.com> <46F8FB49.8050808@apexar.com.ar>
Message-ID: <46FA4D6F.2030308@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> configure.in:63: error: possibly undefined macro: AC_LIBTOOL_WIN32_DLL
>>>       If this token and others are legitimate, please use m4_pattern_allow.
>>>       See the Autoconf documentation.
>>> configure.in:64: error: possibly undefined macro: AM_PROG_LIBTOOL
>>> autoreconf: /usr/bin/autoconf failed with exit status: 1
>>> make: *** 
>>> [/home/dfons/buildroot_19987/build_arm/fontconfig-2.4.2/.configured] Error 1
>>>

...

> Yes, i have fntcongif and fontconfig-dev installe in the host system...
> I think it's a problem of autoconf and friends, do you know what are the 
> recommended versions of these tools?
> 
> Regards,
> Diego A. Fons.

Hello, there no official recommended versions.
As for me I'm using
automake-1.9.6
libtool-1.5.22
autoconf-2.60

May be try to upgrade.

-- 
--------------------------------
> Embedded Linux engineer,
> Promwad Company: http://www.promwad.com/
> Homepage : http://www.ivankuten.com/
> --------------------------------
