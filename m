From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Nov 2019 07:17:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-11
Message-ID: <20191112071722.2A4C087F0C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 10  |  0  |  0  | 10  |
  2019.08.x  |  9  |  2  |  0  | 11  |
    master   | 93  | 24  |  0  | 117 |
     next    |  9  |  3  |  0  | 12  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 2 
                libselinux-2.9 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
                 xvisor-0.2.11 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                  cmocka-1.1.5 | 1 
                    dhcp-4.4.1 | 1 
                 gerbera-1.3.2 | 1 
                       kmod-26 | 1 
                libdrm-2.4.100 | 1 
                libgdiplus-5.6 | 1 
               libsigsegv-2.12 | 1 
                     lxc-3.2.1 | 1 
           oracle-mysql-5.1.73 | 1 
     perl-class-inspector-1.36 | 1 
              sigrok-cli-0.7.0 | 1 
                    strace-5.3 | 1 
    systemd-243-78-gef677436aa | 1 
toolchain-external-codesour... | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/72f8f9053ec76b8bb5084ad69181a6f194f16e7f | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/4b94f892b76fc289e2bfe5b1121a686726cc494a |     
  aarch64    |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/16f800dd844572336c2fbba3d123604405382a84 | ORPH
    i686     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/baabcc9862018774f39db682db2ea2f3f25a75e4 |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/c32ca002f7fa3efcbd87a0b962943c882b2f739b |     
    mips     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/40cb399adf5ada06e40ec5fb53a77a77bc7be50f |     
 aarch64_be  |            kmod-26             | NOK | http://autobuild.buildroot.net/results/1699615f574cb77f11fc636fcfdbe40919445941 |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/39f60db0a7ba52b67324c70cf60b6f4f5a13002c |     
    arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/889612df113445f219cde9816014ba87f6847f54 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/58c5008cad3a178924f5ace21c25e2438c01d78c |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0c4a97864bb2da302220588a6de6a4f265de1f08 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/aed1b3b407ec2d22b3b3f8ee87582c8a78daeded |     
   xtensa    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/d186c18a70e8a3e831e2ac4ea58209e188fe9293 | ORPH
    i686     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/9a8d28e7a833e6e0786eb46f696488970f3f0bbe | ORPH
    i586     |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/57945f54ffbc5c8764b6891a4516c4907e56ab97 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/0136590777936b45f204a37758011b21333a3e1a | ORPH
    sh4      |   perl-class-inspector-1.36    | NOK | http://autobuild.buildroot.net/results/229454f2e3bba4863f0807c15a0c0625382e7921 |     
   x86_64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/572c7fc23a43d5a4bbd05c62f9e727e74ecfb4d3 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/83d568c3ab637872945c8e0ac16af214d22a3472 |     
 powerpc64   |   systemd-243-78-gef677436aa   | NOK | http://autobuild.buildroot.net/results/217735b58ce52b919630b6d5d2ef98457b735514 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/c35e5d15600f2b3b44e2abe1eeb3beb3c8c54dc1 | ORPH
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/1a77f2316b62f2da3343efccfdd23077e05d23f5 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/d0936973805991d50ab059dd517b0e7f0c74504a |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/1ac591cad685a093d74ec91fb6a2f3e662545eca |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 1 
             safeclib-03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/7571ccc8845407f34dc6631037a5ca4524bf0018 |     
    i586     |       safeclib-03032018        | NOK | http://autobuild.buildroot.net/results/ab6f8e3d7b90e6b4bdf7e0b97742218d446fc6f3 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
                libselinux-2.9 | 1 
        ltp-testsuite-20190930 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/8c9e7335fe998266eccb01df8498801082abb6cf |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/84923d738e9cf2611185a40383d53c98a63cef64 |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/8cb36f0d4bc7c6bc5582bd5a89dc4b817be014f8 |     



-- 
http://autobuild.buildroot.net
