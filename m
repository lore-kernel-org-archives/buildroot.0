From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Dec 2019 07:16:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-12
Message-ID: <20191213071637.A562C871CC@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-12
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  2  |  0  | 18  |
  2019.08.x  | 26  |  3  |  0  | 29  |
    master   | 151 | 81  |  0  | 232 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 18
                  apitrace-9.0 | 6 
              host-grpc-1.25.0 | 5 
                       unknown | 5 
       alsamixergui-0.9.0rc2-1 | 4 
                   dante-1.4.1 | 3 
                   libnss-3.48 | 3 
           python-numpy-1.16.4 | 3 
              jpeg-turbo-2.0.3 | 2 
               log4cplus-2.0.4 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
   python-pylibftdi-legal-info | 2 
                qt5base-5.12.5 | 2 
                 samba4-4.11.2 | 2 
           uboot-tools-2019.10 | 2 
                 uclibc-1.0.32 | 2 
              alsa-utils-1.2.1 | 1 
                apr-util-1.6.1 | 1 
                  boost-1.71.0 | 1 
       gst1-plugins-bad-1.16.2 | 1 
                haproxy-2.0.10 | 1 
            host-mfgtools-0.02 | 1 
                libgdiplus-5.6 | 1 
                  libssh-0.9.0 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-19.2.7 | 1 
                  polkit-0.116 | 1 
        python-alsaaudio-0.8.4 | 1 
     python-subprocess32-3.5.4 | 1 
            qt5location-5.12.5 | 1 
                    quota-4.05 | 1 
                   systemd-244 | 1 
toolchain-external-codesour... | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/7d6df70f2e87931239dc207912ff90db40043417 |     
   x86_64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/7bf58912e178ab93ffacf372a3ea9f1e49b8e6c3 | ORPH
  mips64el   |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/f45d5e7f831a0faf5a07114d26619744adafcc96 | ORPH
  riscv32    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/289bf42c415f6b5852118f73f120c39a109819ea | ORPH
   sparc     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/5363a7fd1c57c3018a1278cbb03996977599fa2b | ORPH
    or1k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/0b50499d07d50fcc37d97cc81a6138d514bf822a |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/052cfeb98d83c2a982fa4ea70716386d65303c8d |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/e706031ef7ec0b0e3b1cd1e97a6fd820e6b47526 |     
   x86_64    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/4aebca7c9e399d48882e1f2a407a22682c41fa89 |     
    arc      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/7af508f706a6a20e156bb530b3e1356d1d603552 |     
 aarch64_be  |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/259cee161aeb168aa50a60caf7c1986aa62c6d2e |     
   mipsel    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/899d290d7ca3e95c1dfe3ef6a520ebfaba1b77f2 |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/91f94f922f9898b134cbed067479b2fc51a0b0a4 |     
  sparc64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/0113dff4b7310da4ffe96775ea1cdc517a26df27 |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/b756bebce368f701c47a614fcfe6299b78c7bb12 |     
  riscv64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/6dbec02e6ff6bc2b007b2e686d93c3696f1281df |     
    arm      |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/252d2d247339ee6f89ae2b813d33518d612dd9b3 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/5682b40ce3be9a940906c17e17854160d9269c5e |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/26b4a692daa7464efd33f5dc94114249d4334ed0 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/72f45fb440c4908debfb8771e5c32e9ce9b8a57b |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/80f2ffc1374e57a25b755102e3e5bff076e22533 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/06e8416404a703995100fc5c111453f2dc45835e |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/13cf0d71f85ff5c407e693b19537d57edf763247 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/6ac4e17e6bb89fa6d8778bf2305a94e0417f00f8 |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/2264f063d510cd739fd752f8437541564ef1e4e9 |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/caab849547d6dfb2f659bfb15eb4b9e59ff31047 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/784a4e1a1f6d5d898bfe1bc9b6bafff3be44dbfb |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/20d2622e6cdb752e5a94b9a1d11fc4a81be9aec6 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5e6993af8241dba13bf7eeb5aca3489ec03a1638 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/177ec5b9207727a93f7ac160993a8595ffdcd862 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/1bba2af51f4595d52a741a4b5e7d54bfcc6d7ead |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/4aaa05f79b34e3cd3990dc7af3eb22d28448f7ac |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0287357469eba5a03a74a720fcf55b76cd9679fa |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0fca81de7c1347ee7e5bccb8cde5f402332284b4 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/40846631b32f8d1c48fadefe32e9b2e94409dd63 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a03cdddfc1c4b64663e61ee6528c769613071add |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/feca2ac059c9b2e626bd32cb44f8e0d4cbefb598 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/8d288ad35d2ad6089d18d294a0c4fe4bb5f4799b |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/2586d2b4681fe5e549b91973adb239765f4658b8 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e6fb452e7cd7e9f06ce8518ab8ab9c8c606bb516 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a7d17b889378b71af207c11ee7692bccbd0be3dd |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/040f4e9864c0b2dbb6ef3b4266c3df5d417cde11 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/558b7137d8c29f8b2de6020b66e21f70f164acad |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/1328615b0144f9d25aaf94141df16c6939c1561f |     
    arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/5c1c841a9a54df999075e2349c6b4758f5bfb6a8 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/6cacafc321b74795afdf89a1e353c94e838e9d8c |     
    m68k     |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/4a5f9ef6254c5444f9bb2ee630ee669ff340bd14 |     
  mips64el   |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/ccc35b6936c91229d235d0eefbad0203f12f2ced |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/cfd38773602896b40444ac9e1c4cc648b3ef6d69 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/b86d07ffd3c9e29b40d4509a90d1db5325d7e8a8 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/a78543015c1916455189701fec7c15c0da2ffe70 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/62a368f021b5e9c2209c3e4d559bdb4fb0ae9f34 |     
  aarch64    |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/de263d56ded9268ac56bc6c6e844f84ea3cdcfca |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/0ad28f8414c25033a843ad3ff054b74ab823e45e |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/43591bdb51252f625406653e5597d8a6cbb6674b |     
    mips     |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/1869c29d14a818bdb43237639f935f0bda182671 |     
   x86_64    |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/cf4ea9efe74ef1d2ef3794d99975407322ef49d1 |     
  aarch64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/ddb215cca937428013fc3379adaff28895bdd6c8 |     
  aarch64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/edc460cf04a92a78aa3cf6ef3777babe566bc67a |     
  aarch64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/93d3016535a02d9ee3a44521c55e904ea4766694 |     
    arm      |  python-pylibftdi-legal-info   | NOK | http://autobuild.buildroot.net/results/d9eefbfd0c67b03545f5cf5009eb28092de71e40 |     
    arm      |  python-pylibftdi-legal-info   | NOK | http://autobuild.buildroot.net/results/35035515368ed8715a413c5badc2236253a6c901 |     
microblazeel |   python-subprocess32-3.5.4    | NOK | http://autobuild.buildroot.net/results/6de80b6ace5fa970e779a35933119a4a7f113a99 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/211315c25cb8b1f25401ff348596ed6e0125198c |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/b136938f782a365fefde5adc8c1cd395693a1670 |     
microblazeel |       qt5location-5.12.5       | NOK | http://autobuild.buildroot.net/results/c161b1372589d1ef700ed67b36680946613c5735 |     
    arm      |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/97ec30d3c8c5e59d3e659af0cb7dc13e8535de74 |     
   mipsel    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/adfd99e91985d0e8337b726c6089a8899495c998 |     
  riscv64    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/a95b014ba9a999bb03344b140a86c656ac8e5d20 |     
   mipsel    |          systemd-244           | NOK | http://autobuild.buildroot.net/results/01c3de9507a67e3e36c94177907a02a9c12fabe9 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9ba3eaec1f105742aab8be20d331f8a05b2fb4e6 | ORPH
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/6cceb4dadd4a43966e70a8c3b1dede4451e5b0fe |     
    i586     |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/bd6139de1ad9fb2c5520aa177bccc8e7697b4a9e |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/6608b1d53bd56569f1e8b1f6fe48444b650692e4 |     
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/8d0e30abf850db4b2d1b05b9b29ec1e59f6facbe |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/88ae78ecef565382dbdf32082f2733b69be567b2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c914173fa8029a914973b755f4c30360362d9e16 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/34df6b0362900622426db8df0ed0c7a44c3ba5e6 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf03548b7ff251c212f703b3e84234e6af18afeb |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/7a10d96456c2434c7082c743567a799263857620 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/c67fd7fffc6a833531049c12fa921754046b70f9 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
         host-ti-cgt-pru-2.2.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/61e4f575ab85fb282ac89a714d6b595cd181d5eb |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/58bbdf74030cb1a818ef92e0af5c8e8550f13795 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                haproxy-1.9.13 | 1 
                      icu-64-2 | 1 
                 uclibc-1.0.31 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         haproxy-1.9.13         | NOK | http://autobuild.buildroot.net/results/e9a91d650df87ee471367a8eaf0e51eca91cb868 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f1fdae5a2a992b3bd69f9ee62c1cc2243c2679c6 | ORPH
    arc      |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/96a0416d384c10ddb9eb8d206531b62107289280 |     



-- 
http://autobuild.buildroot.net
