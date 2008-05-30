From: Leandro oliveira <leandro@helpo.com.br>
Date: Fri, 30 May 2008 17:23:08 -0300
Subject: [Buildroot] fontconfig error
Message-ID: <23b419180805301323u1f8adb36p447e2622f45948ca@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Somebody can help me,  please?

I'm trying to compile X11R7. So, I enabled only the following itens:

X Window System server (x11r7)  --->
[*]   X.org X Window System, X11R7, release 7.3  --->

But, I receive the following error message:

*Error message:*
/tmp/buildroot/build_i586/fontconfig-2.4.2/fc-case/fc-case.c:217: undefined
reference to `__ctype_b'
collect2: ld returned 1 exit status
make[4]: *** [fc-case] Error 1
make[4]: Leaving directory
`/tmp/buildroot/build_i586/fontconfig-2.4.2/fc-case'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/tmp/buildroot/build_i586/fontconfig-2.4.2/fc-case'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/tmp/buildroot/build_i586/fontconfig-2.4.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/tmp/buildroot/build_i586/fontconfig-2.4.2'
make: *** [/tmp/buildroot/build_i586/fontconfig-2.4.2/.stamp_built] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080530/d43b7be9/attachment.htm 
