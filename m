From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 08 Mar 2021 10:54:22 +0100
Subject: [Buildroot] [PATCH v2 00/54] package/kodi: bump version to
 19.0-Matrix
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
 <20210306230305.24e8cfef@windsurf.home>
Message-ID: <er8hhhx13m.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 06 Mar 2021 23:03:05 +0100 schrieb Thomas Petazzoni:

> There are two things however that would be nice to improve:
> 
[...]
>  - Be able to drop the manual calls to pkg-config --cflags/--libs egl
>    that exist in a few packages.

I will try to fix the problem, afair this problem only occurs when 
building without x11, the infamous EGL_NO_X11 define needs to be used.

> Once again, many thanks for all this work on Kodi!

Just a small note from the runtime perspective: With this bump I was able 
to get rid of all X.org stuff by using gbm & OpenGLES as render method on 
my x86_64 system: https://forum.kodi.tv/showthread.php?tid=360658 :)

Regards, Bernd
