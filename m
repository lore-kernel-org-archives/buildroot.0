From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 04 Nov 2020 08:10:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-03
Message-ID: <20201104081017.8BD7F203A8@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  2  |  0  | 21  |
  2020.08.x  |  7  |  2  |  0  |  9  |
    master   | 77  | 29  |  0  | 106 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.13.0 | 4 
        host-sentry-cli-1.57.0 | 4 
     mesa3d-headers-legal-info | 2 
                rocksdb-6.10.1 | 2 
               apcupsd-3.14.14 | 1 
                  boost-1.74.0 | 1 
               capnproto-0.8.0 | 1 
               domoticz-2020.1 | 1 
                     efivar-37 | 1 
          fuse-overlayfs-1.2.0 | 1 
  gobject-introspection-1.64.1 | 1 
      gst1-plugins-base-1.18.1 | 1 
                   guile-3.0.4 | 1 
                   libcap-2.44 | 1 
              libostree-2020.6 | 1 
                    mpv-0.32.0 | 1 
                    quazip-1.1 | 1 
              sigrok-cli-0.7.0 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                       unknown | 1 
                  weston-9.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/87f73b2e4478bdc4947af29408cd8cbe517cbc90 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/0dd045ef5c0ee6d2afeb12e1f7fde819e02fb303 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/bbf24ec5d3a81f7088af78df12243ab2e8069264 |     
 powerpc64   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/80a2767555a7988e9aef292a4c69c8ce9933b283 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/71d77ddee8d1932c46af394e8563a61726958b8c |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c892267ee8795ec4d44386337a282548b4d2eddc |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/31719a76f2fec072447c4d4c72403270c3390120 |     
 aarch64_be  |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/a1fff8911e45c08982c361bea8bf74b4cbf5ca30 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/a054fd89ef04a362942965692cd70f4336289e0b |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/a035b9ef153fa34974fa24a4499403b4a2b20ab9 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0879ebcefedd7d1325afae6924a337379da065fd | ORPH
    sh4      |    gst1-plugins-base-1.18.1    | NOK | http://autobuild.buildroot.net/results/e74b2b15c21449e6ee2acbd5f43ea78f3d62cf32 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/76c711dc772bc253e95e5b1a2792bc08df7a9369 | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f294a49f97162d719b06d9176e899efccaffa879 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bb8915ed9d281cb7000255ae0c16f8876b20ea1c |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/de426de9ac96494366ca830510670c0a09b2c80f |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/91a614dfeb3b166f0e5013d25dec150b0ad3aeaa |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/c6fe0f3102e6b764c38d2d3e79da161052e217fa |     
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/e6f0fee6fe752da3e2e8753bab4c0d8420c94de8 |     
    arm      |   mesa3d-headers-legal-info    | NOK | http://autobuild.buildroot.net/results/d75e90863525d4abd3d83f3f947261695a2f0d65 |     
    arm      |   mesa3d-headers-legal-info    | NOK | http://autobuild.buildroot.net/results/87cb2669378fcfd280a651c7b00cd379a3fae02c |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/f35357a4a9f145d5e45c69ab3e99e596496fefa9 |     
    arm      |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/ed3467cbcea02ac3f878a29e8832539e50a1b2c2 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/09c03386f6a54f20fb75be22b7e491fbb3f84eba |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/add3a9b1991881a07c189783ec0b8a371d477a26 |     
    arm      |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/c688c24c2327b9e6000e44e4a38a69451f647416 |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/f08fc5f189a63527c7c5f880986c9c408eee9dd7 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/28b4db058fde1709f7b071a8d8074a33112289d1 |     
    arm      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/f2a8071754c3238b399433303cb821684db82a12 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  ndisc6-1.0.4 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b858cef3324c6ea4c5184dc22ed9dddcdf576769 | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/2fc95e4b6083860357e65c86c9c5fd56cd1b4f4a |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                    php-7.4.12 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2b8399263f8d324d72e4eceda2ed92ba1a1ee370 |     
   mipsel    |           php-7.4.12           | NOK | http://autobuild.buildroot.net/results/e02c713b93c8da5ff08cd99e00155165548559fe | ORPH



-- 
http://autobuild.buildroot.net
