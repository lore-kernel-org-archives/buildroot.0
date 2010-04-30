From: Bart Otten <bartotten@gmail.com>
Date: Fri, 30 Apr 2010 20:43:03 +0200
Subject: [Buildroot] Mplayer -
	libass/libass.a(ass_bitmap.o):ass_bitmap.c:(.text+0x24d):
	more undefined references to `__assert_fail' follow
Message-ID: <x2x76d09b281004301143w5b198666udda8c2292eb64242@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

How can i solve this error ?

ass_render.c:(.text+0x1b07): undefined reference to `__assert_fail'
libass/libass.a(ass_render.o): In function `ass_render_frame':
ass_render.c:(.text+0x3862): undefined reference to `__assert_fail'
libass/libass.a(ass_bitmap.o):ass_bitmap.c:(.text+0x24d): more undefined
references to `__assert_fail' follow
collect2: ld returned 1 exit status
make[1]: *** [mplayer] Error 1
make[1]: Leaving directory
`/home/Bart/buildroot-2010.02/output/build/MPlayer-1.0rc2'
make: *** [/home/Bart/buildroot-2010.02/output/build/MPlayer-1.0rc2/mplayer]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100430/5dbd2db6/attachment.htm>
