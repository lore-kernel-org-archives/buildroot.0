From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 11:05:29 +0100
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <52749C54.8080601@writeme.com>
References: <20131029204108.5d707d09@skate> <20131101193153.04cdd643@skate>
 <52749C54.8080601@writeme.com>
Message-ID: <20131102110529.4e98755d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sinan Akman,

On Sat, 02 Nov 2013 02:31:48 -0400, Sinan Akman wrote:

>    I don't know if I would qualify well as a maintainer but
> I have quite a number of powerpc boards that I build and use
> buildroot almost regularly.

Sure. I know Gustavo also has a number of PowerPC platforms. Feel free
to pick some PowerPC related issues in the autobuilder results and send
fixes for them.

Here is the list of packages that were causing the highest number of
problems on PowerPC since October, 1st 2013. Note that looking at the
trace-cmd problem is useless, we already have a fix for this one (it
just hasn't been applied to Buildroot yet), and that some of the
problems below may have already been fixed, or may not necessarily be
related to PowerPC specific issues.

+--------------------------------------------+-----+
| reason                                     | cnt |
+--------------------------------------------+-----+
| trace-cmd-trace-cmd-v2.2.1                 | 219 |
| host-util-linux-2.23.2                     |  41 |
| gstreamer-0.10.36                          |  33 |
| php-5.3.27                                 |  18 |
| make: *** [uboot-tools-legal-info] Error 1 |  16 |
| w_scan-20130331                            |  16 |
| bison-3.0                                  |  14 |
| nano-2.3.2                                 |  11 |
| omniorb-4.1.6                              |  10 |
| mpd-0.17.6                                 |  10 |
| cryptsetup-1.6.2                           |  10 |
| webkit-1.11.5                              |   8 |
| qt-4.8.5                                   |   8 |
| minidlna-1.0.26                            |   7 |
| mediastreamer-2.8.2                        |   6 |
| rpm-5.2.0                                  |   6 |
| uboot-tools-2013.10                        |   6 |
| binutils-2.21                              |   5 |
| alsa-lib-1.0.26                            |   4 |
| qt5base-5.1.1                              |   4 |
| gst1-plugins-bad-1.2.0                     |   4 |
| nettle-2.7.1                               |   3 |
| uclibc-0.9.33.2                            |   3 |
| host-uboot-tools-2013.10                   |   3 |
| enlightenment-0.17.3                       |   3 |
| sysklogd-1.5                               |   2 |
| imagemagick-6.8.6-2                        |   2 |
| audiofile-0.3.6                            |   2 |
| alsa-utils-1.0.26                          |   2 |
| python-2.7.3                               |   2 |
| gettext-0.18.3.1                           |   2 |
| mediastreamer-2.9.0                        |   2 |
| host-cmake-2.8.10.2                        |   2 |
| cairo-1.12.10                              |   1 |
| matchbox-keyboard-0.1                      |   1 |
| cdrkit-1.1.11                              |   1 |
| fltk-1.1.7                                 |   1 |
| imagemagick-6.8.7-0                        |   1 |
| libargtable2-13                            |   1 |
| make: write error                          |   1 |
| libwebsockets-v1.22-chrome26-firefox18     |   1 |
| host-expat-2.1.0                           |   1 |
| host-gettext-0.18.3.1                      |   1 |
| dbus-1.4.26                                |   1 |
| weston-1.1.0                               |   1 |
| protobuf-2.4.1                             |   1 |
| httping-2.2.1                              |   1 |
| mtdev2tuio-e1e7378                         |   1 |
| systemd-44                                 |   1 |
| libcgroup-0.38                             |   1 |
| host-ruby-1.9.3-p448                       |   1 |
| tn5250-0.17.4                              |   1 |
| netsnmp-5.7.2                              |   1 |
| usbredir-0.6                               |   1 |
| udisks-1.0.4                               |   1 |
| libsvgtiny-12121                           |   1 |
| bustle-0.4.2                               |   1 |
| host-libglib2-2.36.3                       |   1 |
| host-protobuf-c-0.15                       |   1 |
| libiconv-1.14                              |   1 |
| xlib_libpthread-stubs-0.3                  |   1 |
| collectd-5.4.0                             |   1 |
| qt5webkit-5.0.2                            |   1 |
| pcsc-lite-1.8.6                            |   1 |
+--------------------------------------------+-----+

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
