From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 May 2013 10:27:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-05-28
In-Reply-To: <20130529063005.BEB9E52C0F6@lolut.humanoidz.org>
References: <20130529063005.BEB9E52C0F6@lolut.humanoidz.org>
Message-ID: <20130529102724.2c50f89c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Wed, 29 May 2013 08:30:05 +0200 (CEST), Thomas Petazzoni wrote:

>                    flex-2.5.37 | 28

Fixed.

>    host-lttng-babeltrace-1.0.2 | 5 

Fixed.

>                wvstreams-4.6.1 | 5 

Fixed.

>                 libtirpc-0.2.2 | 4 

Two of the libtirpc failures can be fixed by committing
http://lists.busybox.net/pipermail/buildroot/2013-May/072929.html.

>          host-gutenprint-5.2.9 | 2 

This doesn't seem complicated. Someone to take it? See
http://autobuild.buildroot.org/results/8f1/8f1da2d88bbfc75ca67d704f6529377746f3f66e/build-end.log.

>                       gpsd-3.9 | 2 
>                  pixman-0.28.2 | 2 
>                  rt-tests-0.83 | 2 
>                    dbus-1.4.24 | 2 
>                      m4-1.4.16 | 2 
>                     acl-2.2.51 | 2 
> media-ctl-ac40b79f002a2315f... | 2 
>                   iozone-3_414 | 1 
>                     fbgrab-1.0 | 1 
>                   python-2.7.3 | 1 
>                  libiconv-1.14 | 1 
>                   libv4l-0.8.9 | 1 

Fixed.

>                      pcre-8.32 | 1 
>                pcsc-lite-1.8.6 | 1 
>      xlib_libpthread-stubs-0.3 | 1 
>                        kmod-13 | 1 
>                  netsnmp-5.7.2 | 1 
>                qt5webkit-5.0.2 | 1 
>                    icu-4.8.1.1 | 1 
>                     nettle-2.7 | 1 
>                alsa-lib-1.0.26 | 1 
>                   gnutls-3.1.9 | 1 
>                  binutils-2.21 | 1 
>            xlib_libXdmcp-1.1.1 | 1 
>                    bzip2-1.0.6 | 1 
>               e2fsprogs-1.42.7 | 1 
>                   gnupg-1.4.13 | 1 
>                       udev-182 | 1 
>                qt5quick1-5.0.2 | 1 
>                czmq-cb9839cf90 | 1 

This one can be fixed by committing
http://lists.busybox.net/pipermail/buildroot/2013-May/072927.html.

>             qt5jsbackend-5.0.2 | 1 

This one can be fixed by committing
http://lists.busybox.net/pipermail/buildroot/2013-May/072937.html.

>                aircrack-ng-1.1 | 1 
>                sconeserver-211 | 1 

All the rest needs *your* help ! :)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
