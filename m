From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jun 2018 08:00:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-17
Message-ID: <20180618060012.C054E20787@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   6 |   0 |  33 |
   2018.05.x |  19 |   2 |   0 |  21 |
      master | 182 |  41 |   0 | 223 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 
                  boost-1.66.0 | 1 
           cups-filters-1.17.9 | 1 
                libvips-7.42.2 | 1 
                 mplayer-1.3.0 | 1 
                    quota-4.01 | 1 


Detail of failures
------------------

    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/82af23177735e998d419112847f322691c8f7aff |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/db6947228d4567158ccf2f612edfda45adb56769 |     
    mips64el |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/3964324faa7c8d3586b6a786ebe25a826b73bdef |     
       nios2 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/cec6a6278401d2fda04071b4760de491f1aa9700 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/55695b2eff8de8228a7ca5455d9fa6289163918a |     
      xtensa |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/1c873ce151a1a374c972e7966abd0abbe0ac6519 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-acpica-20170531 | 1 
open-plc-utils-1be781d1ea81... | 1 


Detail of failures
------------------

         arm |           host-acpica-20170531 | NOK | http://autobuild.buildroot.net/results/547c3492619b9a015b93d34ea806ef88081f4d1b |     
         arm | open-plc-utils-1be781d1ea81... | NOK | http://autobuild.buildroot.net/results/a3d33b87e83d8d1f9752c35963a40e03385dd72b |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libtirpc-1.0.3 | 6 
                 libnss-3.37.3 | 4 
                      x265-2.8 | 4 
host-imx-usb-loader-e539461... | 3 
                    host-rustc | 3 
          mediastreamer-2.14.0 | 3 
                  mender-1.4.0 | 3 
                  samba4-4.8.2 | 3 
               mono-5.12.0.226 | 2 
       shadowsocks-libev-3.2.0 | 2 
             host-gauche-0.9.5 | 1 
                libmpeg2-0.5.1 | 1 
                 opencv3-3.3.0 | 1 
                poppler-0.59.0 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.9.1 | 1 
                   tor-0.3.3.6 | 1 
triggerhappy-b8228880661293... | 1 


Detail of failures
------------------

    mips64el |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/e39773063b5f7b2397b056b275879a3727cc47df |     
         arm | host-imx-usb-loader-e539461... | NOK | http://autobuild.buildroot.net/results/8df4880447febccd2d98270dfd43c5b3ff0cbc33 |     
         arm | host-imx-usb-loader-e539461... | NOK | http://autobuild.buildroot.net/results/39773a6dea79f007a12579a71357617c68698368 |     
         arm | host-imx-usb-loader-e539461... | NOK | http://autobuild.buildroot.net/results/c9d4f99b49ddb9b2ce08fce7672dd7c70cf62912 |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/1a47658f98129903dffcf68da92e761babbc2ddf |     
      xtensa |                     host-rustc | NOK | http://autobuild.buildroot.net/results/f1f216fe83045142fcec082565f1faf59e4faff1 |     
     sparc64 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/fc73d3614e5be861852a0355aa0903d0ce830304 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/29b83e3b9b3ebf637cdcc1d5e1f1d4231733ef0c | ORPH
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/2dfd57541e82abe58ea373dd9206f0800a97b6cf |     
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/45ddcf82420e0c6178a2744f82e63dffb8d0336a |     
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/2f02496bc02f6af56021750d7569eac3ea18a6dc |     
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/2ffb1d28ef43a5faa5cc21a7b5f596cfd8f28f52 |     
        i586 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/2d6c870eea0b932d928be04c9f20773cff18a62f |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/e03c3617df66d8f2e7ec2fbb11770594fd1e7569 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/72684fea42715556add64f1c587bad614f1221ee |     
        i586 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d3b298a48f40678f967507cd749b50c34c2b0bc2 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/53a8bc7c3affee9cd559ab8f619323a646697cad |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/0d5ac77c0e9a8e37730f0ea3dda56376b317f83b |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/6c3e45fbd8766d24d621fc22f81159a796ffb7c5 | ORPH
     aarch64 |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/f55477f8fbb48a07b11a47ef6402f0e284b30cb2 | ORPH
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/e698b7a035e79c22885503794b299ad0a9578ca0 | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/57d52ba67a1f699b557ac50869fc2f4b0285c64a |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/8ecb95cf5e72ab48d5d3f938e38ba27676ee0152 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/d49fe8a431e3f3dd096c9dc72ffd49a478b93c17 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/0fa23adbf8543db0539682078430fe653818a929 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/64d87c95abba9400c90d2d6de649aec4455f0506 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/4a8ec76cc519ccb7663188a57402c3fe9a42a586 |     
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/82850ade672d7f888261f17703367ac8970b5b4a |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/45e2535d3c947d814c4b5e6d19f09c5969aac9bd | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/fe91c2aeb5cb95d8c5a9cc1e20e8617230772bd2 |     
      xtensa |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/5ba892c1048dfca16ac55683db7c07cefa47a5bf |     
         arc |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/b49ae1242ff74d570d3f34042ab7a56e62c85ab4 |     
      xtensa |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/4d54f8e196a5c0ac0d64edcfc7f45172f5eab154 |     
       sparc |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/ace80079003202e3d13f0389440bed0af1046af5 |     
       sparc |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/56b74b0746005163ab817b9e03917ec138f62874 |     
       sparc |                    tor-0.3.3.6 | NOK | http://autobuild.buildroot.net/results/b7915df77ae58448830e8e515c0fd642f3348611 |     
         arm | triggerhappy-b8228880661293... | NOK | http://autobuild.buildroot.net/results/70492f5b7c75f88035603cf66cea07cba5528dbe |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/23fec8070064453395f9c5836ce143a2856c2cda |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/17ec8af2af12d223dd244872e660519fd68a67c7 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/ebfe6c1aa12cf7211552c715afdd976ce0239547 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/b067f6d6afd318ea816c37972db02c64ab97b721 |     


-- 
http://autobuild.buildroot.net
