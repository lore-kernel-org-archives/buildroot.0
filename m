From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Jan 2009 13:49:36 +0100
Subject: [Buildroot] DirectFB + linux-headers-2.6.28.1 compilation
	problem
In-Reply-To: <fce2a370901230310y63c0ebe3x10e523e10154a96a@mail.gmail.com>
	(Ihar Hrachyshka's message of "Fri\,
	23 Jan 2009 13\:10\:54 +0200")
References: <fce2a370901230310y63c0ebe3x10e523e10154a96a@mail.gmail.com>
Message-ID: <87sknakx0f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ihar" == Ihar Hrachyshka <ihar.hrachyshka@gmail.com> writes:

 Ihar> Hello guys!
 Ihar> I have the following problem compiling DirectFB with linux-header-2.6.28.1:

 Ihar> /home/booxter/winbox/buildroot/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibc-ld
 Ihar> -o libdirectfb_keyboard.o -r .libs/libdirectfb_keyboard.a.tmp/*.o
 Ihar> rm -f .libs/libdirectfb_keyboard.a.tmp/*.o && rmdir
 Ihar> .libs/libdirectfb_keyboard.a.tmp
 Ihar> make[4]: Leaving directory
 Ihar> `/home/booxter/winbox/buildroot/build_mipsel/DirectFB-1.2.6/inputdrivers/keyboard'
 Ihar> Making all in serialmouse
 Ihar> make[4]: Entering directory
 Ihar> `/home/booxter/winbox/buildroot/build_mipsel/DirectFB-1.2.6/inputdrivers/serialmouse'

Does this also happen with latest trunk (E.G. where we have DirectFB
1.2.7)?

-- 
Bye, Peter Korsgaard
