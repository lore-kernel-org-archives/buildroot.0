From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Aug 2019 06:16:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-21
Message-ID: <20190822061626.62EE3875C7@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-21
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  1  |  0  | 19  |
  2019.05.x  | 10  |  1  |  0  | 11  |
    master   | 167 | 31  |  1  | 199 |
     next    | 18  |  5  |  0  | 23  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/4dc9ed49eaf9c67532796b8d501874c8ecd0b4de |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/91766e36be5273702864afdd825d2428adadb9cb |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

   vdr-plugin-vnsiserver-1.8.0 | 4 
                  cmocka-1.1.5 | 3 
                host-go-1.12.9 | 2 
                 libdrm-2.4.99 | 2 
               libsigsegv-2.12 | 2 
         xlib_libxkbfile-1.1.0 | 2 
                  flashrom-1.1 | 1 
                     gzip-1.10 | 1 
           host-harfbuzz-2.5.3 | 1 
           host-nodejs-10.15.3 | 1 
                   i2pd-2.24.0 | 1 
                      icu-64-2 | 1 
              iputils-20190709 | 1 
               libupnpp-0.17.1 | 1 
               log4cplus-2.0.4 | 1 
                   mimic-1.1.0 | 1 
                       mongodb | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
           python-numpy-1.16.4 | 1 
               qt5script-5.6.3 | 1 
                    xen-4.11.2 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/3e24bfa1f5b6c163e53f474e1e56ce8e6c32aea0 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/ec5dace802d82e053e8544b36a7751b9922a20f2 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/78091c48e6932dd61c7e742d141a3cba5c27784e |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/8e06693f4c61e59cd8c7bf8d1fb38c9f34f78086 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/c0c2a4e0ec5bb51236f054be16fbfd026b0122c3 | ORPH
  aarch64    |         host-go-1.12.9         | NOK | http://autobuild.buildroot.net/results/8e307b75079eb1f041c9a009b2c3a02bea9acb60 |     
  mips64el   |         host-go-1.12.9         | NOK | http://autobuild.buildroot.net/results/04de34b1f9fa9e68b3c13354133e542da7dcdce7 |     
    m68k     |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/7bb6316240b41ce09621e668e1e4d403590b46bf | ORPH
   x86_64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/fd1d0a6141d4460a678b0fb21b71482713d34582 |     
  riscv64    |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/a1e4ac812463ed34b01bbabf85c396f7c007b68e |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/49e079374dc1c83f16925340114c80eb3c709255 | ORPH
    sh4      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/14de70b0d39aa972df1c38a49613a3cc5636e7f4 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/6bcfe5a8144517c1b5cfd4518ae4df98a91be7c1 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/059990bd441f2412ca1480045a4c03784bebcb1c |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/5c05dfacd981e9f7410826bc9d41610b632fe0e1 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/95d54b38246036d047f031f2a3e589becd756527 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/6a3abe3c9bbb066ed7a726f67881461799296c95 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/5d74d5ad3bfaa84f0609ecc217299a894ad6e6c1 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5c3edfef86db64362bc0fa0049db7b90e2f5d482 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/f86cdd5ecacbb6a449d71c14290668f5cdb4b618 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/eafbc5f78791a5dde16b633bc9fa5c3b10ccb73c |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9f33b3fef8484acd6a5466844bc919a6a9605add |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/69a194ada219d5bb5ccac6a0bfbb04ea9a234f15 |     
    arm      |        qt5script-5.6.3         | NOK | http://autobuild.buildroot.net/results/1b0157abb0aa146afef36946420de4b0b8a72b8a |     
  riscv32    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/57076a9f0f0c25a0aee26ab38ac5bd53f87f453f |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/8c5e0a60e681f814e089781bd94695efd055c2c3 |     
  riscv64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/ab3a408898d2c25823416ebb1bc480af57142023 |     
   nios2     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/957f0abea8f63c27c8a071d2a3e83b4679dab0d8 |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/a880b2ca83df09882ccd6e50f2c7a9b55cd979f4 |     
    arc      |     xlib_libxkbfile-1.1.0      | NOK | http://autobuild.buildroot.net/results/367122ed6f8333e62174e6637da0d218e7ec3d01 |     
    arc      |     xlib_libxkbfile-1.1.0      | NOK | http://autobuild.buildroot.net/results/8c8d7b0e7902d1e2b0350896255da25c010e501f |     
    i586     |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/966cd8809a650629f9ef333f1181b242120d56f1 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

           python-numpy-1.16.4 | 2 
                     gzip-1.10 | 1 
               libsigsegv-2.12 | 1 
                    strace-5.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/de00b258b45548f4758ea594757fcc8279eccf05 | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/dbd3b367058d9395a40794baa8ba1662c2ffc97b |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/5f3a715eca6279fb6b739c62951da297f13d2c5c |     
    sh4      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/aa02b958e891fe60040776ce0c0402679c3ed598 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/17f3865aa84ffb3ec5f4a1af38bf44b9627f8d53 |     



-- 
http://autobuild.buildroot.net
