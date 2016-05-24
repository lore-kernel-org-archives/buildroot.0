From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 09:22:58 +0200
Subject: [Buildroot] building error
In-Reply-To: <CAG7w3y=Fp_Dm9bUQvANvt97Q_Nhpx75jF556EMm04_txG7LEdA@mail.gmail.com>
 (gdbabu Krishnan's message of "Tue, 24 May 2016 10:11:46 +0530")
References: <CAG7w3y=Fp_Dm9bUQvANvt97Q_Nhpx75jF556EMm04_txG7LEdA@mail.gmail.com>
Message-ID: <87posbdinh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gdbabu" == gdbabu Krishnan <gdbabu.krishnan@gmail.com> writes:

 > Hi
 >    i have given "make  clean all " in terminal i got same error,

 > make[7]: Nothing to be done for `all-am'.
 > Making all in xwayland
 >   CC       Xwayland-xwayland.o
 >   CC       Xwayland-miinitext.o
 > xwayland.c:33:26: fatal error: compositeext.h: No such file or directory
 >  #include <compositeext.h>
 >                           ^
 > compilation terminated.
 > make[4]: *** [Xwayland-xwayland.o] Error 1
 > make[4]: *** Waiting for unfinished jobs....
 > make[3]: *** [all-recursive] Error 1
 > make[2]: *** [all-recursive] Error 1
 > make[1]: ***
 > [/home/malar/Documents/build_root/buildroot/output/build/xserver_xorg-server-1.18.3/.stamp_built]
 > Error 2
 > make: *** [_all] Error 2

Sounds like a missing dependency. I'm doing a test build to verify.

Do you really want to build wayland AND xserver?

-- 
Bye, Peter Korsgaard
