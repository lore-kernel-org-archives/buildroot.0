From: Aleksander Dutkowski <adutkowski@gmail.com>
Date: Wed, 23 Nov 2011 15:27:09 +0100
Subject: [Buildroot] running 'make ctng-menuconfig' after make clean doesn't
	work
Message-ID: <CABkKHSYPHr7MAXH8B-yQe3LwHzaWBzdc1F_nSZW0hyXOE+rTbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

If I choose crosstool-ng, make my rootfs, then 'make clean', and then
'make ctng-menuconfig' it crashes:

http://wklej.org/id/633176/

after make distclean it works fine. I have got this problem under
buildroot 2011-08, in few hour I'll test if 2011.11-rc2 provides the
same problem

-- 
pozdrawiam
Aleksander Dutkowski
