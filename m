From: Leonid <Leonid@a-k-a.net>
Date: Tue, 16 Oct 2007 21:11:42 -0700
Subject: [Buildroot]  x11r7-matchbox-tslib patch
Message-ID: <406A31B117F2734987636D6CCC93EE3C02528F8A@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Christopher:

Sorry for repetition, I wasn't sure my another message did reach you.
Could you resolve the problem with matchbox undefined references:

/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/tests
/dump-image.c:30: undefined reference to `XOpenDisplay'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/tests
/dump-image.c:41: undefined reference to `XCloseDisplay'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb
/.libs/libmb.so: undefined reference to `XFreePixmap'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb
/.libs/libmb.so: undefined reference to `XShmDetach'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb
/.libs/libmb.so: undefined reference to `XDrawString'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb
/.libs/libmb.so: undefined reference to `XGrabKeyboard'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb
/.libs/libmb.so: undefined reference to `XSync'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb
/.libs/libmb.so: undefined reference to `XDrawLines'
/home/christopher/newbuildroot/buildroot/build_arm/libmatchbox-1.9/libmb
/.libs/libmb.so: undefined reference to `XMapWindow'

I have the same now...

Thanks,

Leonid.
