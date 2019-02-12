From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Feb 2019 07:00:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-11
Message-ID: <20190212070052.8321F87024@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   2 |   0 |  26 |
   2018.11.x |  34 |   1 |   0 |  35 |
      master | 185 |  74 |   0 | 259 |
        next |  58 |  33 |   1 |  92 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-17.3.6 | 1 
                    sdl-1.2.15 | 1 


Detail of failures
------------------

     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/f6b55fd1271215295acc9db9e9936ad2139688a1 |     
     powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/f92a206a25d9a745aaf7aed903dea4edfefa2e51 | ORPH

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                 minizip-2.5.3 | 1 


Detail of failures
------------------

        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/67e6e5245d069f64548580eaff9834c11bc260ee |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libva-utils-2.4.0 | 24
                 qt5base-5.6.3 | 9 
                     efivar-35 | 5 
               openldap-2.4.46 | 4 
       gst-plugins-bad-0.10.23 | 3 
           host-sg3_utils-1.44 | 3 
                 ibrdtnd-1.0.1 | 3 
                gerbera-v1.3.0 | 2 
               host-qemu-3.1.0 | 2 
                  mender-1.7.0 | 2 
                   netsnmp-5.8 | 2 
                   netsurf-3.8 | 2 
                  brotli-1.0.7 | 1 
                    efl-1.21.1 | 1 
               fftw-quad-3.3.8 | 1 
                  gqrx-v2.11.4 | 1 
                ipmiutil-3.1.2 | 1 
                 libdrm-2.4.97 | 1 
                   luvi-v2.7.6 | 1 
                 python3-3.7.2 | 1 
                qt5base-5.11.3 | 1 
              sqlcipher-v3.2.0 | 1 
                   strace-4.26 | 1 
             stress-ng-0.09.47 | 1 
                 xenomai-3.0.6 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/c99270ed49012626ee7c666e4581325b27b8cb39 |     
      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/34f7227463affdfa5d12cce73c6e42873f474011 |     
     aarch64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/963e8cbb64a826a1a22d9c2c1ada4af291f279c8 |     
         arm |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/c491565bb7dc6a4d3607ae313249ea6f34ca7c32 |     
         arm |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/faff6d737ad590d3a1b2c8132e5426ff6cb71b5b |     
    mips64el |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/f9b47d433efbf93c951613e41ed0effc5ae4d538 |     
     powerpc |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/4e60ca5e0a57076a37207711d7bfde2384dce9d0 |     
        i686 |                fftw-quad-3.3.8 | NOK | http://autobuild.buildroot.net/results/07cb862dd653cff31171ef61d502c1a89551fb8a | ORPH
     aarch64 |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/5b03542270fe1736567465294a0ef57af7e02577 |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/227f4c58e2cb189dbda896f0c8fffe80ee34ced8 |     
       sparc |                   gqrx-v2.11.4 | NOK | http://autobuild.buildroot.net/results/464602175d026d135125e5baa00e0729aec7a931 |     
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/88bf5ad295c567c0e85d6aeefcf034027eafa1df | ORPH
      x86_64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/8dc68b6e1462523c36f05f70689783a362a5889a | ORPH
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/2bf853c5f2465eff31c1b8dddafe98dd999b54bf | ORPH
         arm |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/61072272a9868f3560d9f21ea6cb199d3d6c6c71 |     
     aarch64 |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/c1c431d9472743b7eda7723c277c91e0e5f95fba |     
     powerpc |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/fa2c6b297a6833dd001ac40a4b9ab0ae9b8e1cea |     
         arm |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/eeabf7cb9ebfe1f1d24f4c1372a7e598db45098a |     
microblazeel |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/227b147a3bab9368b21aa66b4c4226a7755be80b |     
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/e6dd715c6d2db6f384940d29bd87f87d66e01200 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/8dc577788312ede4b6b10d86d74109a76bedfe72 | ORPH
      x86_64 |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/3bcbd9785b2534900abe9e4b40da1ab70b1cfc15 | ORPH
      x86_64 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/2d455b9e9830963b8e32735e4e22b4e613095f78 |     
         arm |                  libdrm-2.4.97 | NOK | http://autobuild.buildroot.net/results/68430721e9a22aab153f39800fd8db39b3a9941f |     
        m68k |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/66b4c236c39e9e13b53d7a9da8e1da2e1e0c5994 |     
    mips64el |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/29414f8591aa62499cef6aab56a256eebe693608 |     
     aarch64 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/dd5cf6ab2c334e98003c29fe8bd1cd9f9a3f1364 |     
         arm |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/fdec95b3c548fceb9c49033f558ce31586e70f1f |     
       sparc |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/26391245f568e01a6cf3b16da992a403d9cfbd0a |     
      xtensa |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/adffa93fc94adfe9b41155713d78e97cc95a9df7 |     
      xtensa |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/3d64ec6ef99a8add53a81543cbd5d9321da94d50 |     
     powerpc |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/e89e64f020abce78d3da26966aaec3f4b24d8fc0 |     
      x86_64 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/06aa7b37aee35594fb5d40ca21b233ec76fdb615 |     
         arm |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/2f89e41f79e8bec1c0561b486ae5750fc87a6320 |     
        i586 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/ee8886d577f930da55913fa945e4a22d3603a6d4 |     
     sparc64 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/ae965475588c191c538c97407fa49961e81571a4 |     
         arm |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/cfeedf28987d0ed61916d83a0ed44d8ba99c0cb7 |     
      mipsel |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/010fa5fd77dd1094e54d1c1d4f8788e2fc27e172 |     
      xtensa |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/4a33820dba2faa47357fe46b1e2443bdcf3d5c9a |     
    mips64el |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/03a79835261c48a4e10c5d97ecb62695f47aa994 |     
     powerpc |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/d5049eedb5e1d0e7055dfc695e25242f8499407f |     
     powerpc |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/812b2aa3f9c1cf7ee60ea9e46b2c2d80f49a1971 |     
         arc |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/79f47cb43009162b87533d03329291b4450ff337 |     
       sparc |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/12d0f66c08b0ce27b024914f360d3c72971a708d |     
      mipsel |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/3e1f16b0677d54644d3697de19799d784c3b1718 |     
         arm |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/c1d6be48684dc69c32a85bd171468e32cb595028 |     
       nios2 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/d19abc817744d9ce0de8a3d6801bf8b885bfc971 |     
         sh4 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/92224f14a257ee331ec4b5004d434bd4f049a8d5 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/ea725ad90cfcd3c5e242268a593dcabd7297fe70 |     
         arm |                   mender-1.7.0 | NOK | http://autobuild.buildroot.net/results/a543de1498cdff846ce8f61df9f8b7dd280b2661 |     
     aarch64 |                   mender-1.7.0 | NOK | http://autobuild.buildroot.net/results/394c157cb2086e18642f46c6bd43f870e61c2c3b |     
         sh4 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/794deda2cdf6f1a1e7a624763ebe0a4b1dba3ca7 | ORPH
         sh4 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/70fa7253b9f5bec9ab46094cd0adf96796ed0d16 | ORPH
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/02b587f3fffea99cb68754fca743bc95aa3e1006 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/57302d11f131db836116d1cf68007dbb5170a281 |     
        i586 |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/e698ec4b80b96ac26ab2445d41b08015efd1c436 |     
     powerpc |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/58dc932a30002ff97f50189dc65b292b8371308b |     
microblazeel |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/edfa056ef840d6f34a636cf8b04100f9fdd85fcd |     
      mipsel |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/77639284e0a3a4bbd9b3c58975900ec4ccf92c8f |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/2bdb2ca0c002bbeadc629e6630b043d9ddddc560 |     
        mips |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/f24d158f81e7110d83140a20bfb10085c1952918 |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0af761de9e8e271955219c6b564a2588597d9d84 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/be387dfb3eae67022b632cae9ceda9f9dc624ef4 |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0beedffbb1ea895e04bd81c0997bdfc933e05596 |     
    mips64el |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/de3c1b25c5ed720db7f0468b6cbbafe43ad2be72 |     
         sh4 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3d9a388034a3b1e1e6c60038b271775c4f976dc8 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/6634cb39ee329aa9915ce189f73f8c7e3df81b85 |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/371a9745b00cc315c8f4295872b618e81ba0a1a5 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/34d115d8c35094715fbe5f1ba12f90da41dcee4b |     
        mips |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0f57bbceb4c1c9048f77b689170f76cc7e95d25e |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/7769fbc31faf2f8b13884adc0086e26eaa073842 |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/2193c5a5c7d4adc10689d370bec03fe5e0558388 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/8c2e07d559dbf322b134e5fd1a4ea9474e28fbf6 |     
     aarch64 |                  xenomai-3.0.6 | NOK | http://autobuild.buildroot.net/results/83231ed879a12a5ee024c8293f071ad18449c18a |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

 brcm-patchram-plus-legal-info | 10
             libva-utils-2.4.0 | 8 
           host-sg3_utils-1.44 | 2 
                    ncmpc-0.33 | 2 
                   netsurf-3.8 | 2 
package/brcm-patchram-plus/... | 2 
                 qt5base-5.6.3 | 2 
              sqlcipher-v3.2.0 | 2 
                     efivar-35 | 1 
                        jasper | 1 
                   luvi-v2.7.6 | 1 
                   tor-0.3.5.7 | 1 


Detail of failures
------------------

         arm |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/8c8c784765bf80f64e0861f0fd9a38ab82c8339a |     
         arm |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/615d489787f85abf29ba6417144f17013ec52d3b |     
         arc |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/1784c0b9e59461afe45d904e23f82576b0ebe08d |     
         arm |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/7b9328eadd5327eb426f0e5a1634b7c4bad4d32c |     
      xtensa |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/e62491ec939270b382d2e5826f687887f7160fae |     
        i686 |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/79ba74835f03208039e79e71e15dab41b5ff9eca |     
     powerpc |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/698d56244dff07090ec805f5b8806a586904fecd |     
      x86_64 |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/40ae3a8e83009e6ad57a13ca5a6e8700a72e5d99 |     
 powerpc64le |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/dea623138f1b4408a562632e69d93466c525843f |     
    mips64el |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/81da4669148ba86241786107f11653a2e061d96c |     
         arm |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/e5bdb53022202c546a32e8e66b51662d97e5a706 |     
         arm |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/36cd6287b58ecbb58189d3d657af2ba4b4c610cf |     
      xtensa |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/46d429b2a29afa0abd4cfa2776800e1dfb5e7c10 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/5dc6e3e0f929a320040e1f0dd63a45e8c533d85a |     
       nios2 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/be50462413d848f69d297f3204a9af6aa6093d86 |     
     powerpc |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/93734a250698c28b801ddbbdc1529b0d759011e1 |     
       nios2 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/37fbcc0f4bbe115d60197bce94cbb00667e1a866 |     
         arc |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/82a3d6a5fcfc9ada8d526d0526c728d56de31b88 |     
  aarch64_be |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/af1dde031821d3d3a7eb91f6b7fdf82b1712e61a |     
       nios2 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/bf074517e13e5ad7028e6cff62032c535240176d |     
     aarch64 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/f2b9764e221e8c0b2bf1b4f1cc7972c81ec7dcc0 |     
      x86_64 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/7eb5280b674a8fcbd636297d1d771aec8d0235eb |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/f2fb9eea0044e4a5f674742d29ea95af49cf5a45 |     
       sparc |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/7ac1a07e4f72633d3ec92b79dc5d8c062490abdc |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/4e043989013cd0d48085bcbf6424e47a1dc07170 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f5b4e261df409da23554b735c6dc92e9008a3d53 |     
         sh4 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5bec6c34fde23e42b9260de2c5ed1766c84dc712 |     
    mips64el | package/brcm-patchram-plus/... | NOK | http://autobuild.buildroot.net/results/800c10a8b26bc813ae7cce94a8301b28529060cc |     
     riscv32 | package/brcm-patchram-plus/... | NOK | http://autobuild.buildroot.net/results/430f8eba6faa2e5d78554282f497fe359222dd2d |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/17153404b58a9cf4e3bd1161865ab3a534b78a03 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/aae53fa8820bfbdef62b42d1c1e5aada66d9ca80 |     
        m68k |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/d24a3c2f2ec18fa84ceb8bd8f9fce9580429de6e |     
      mipsel |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/63c0d098f40f2469f1f89dae472ba60fca661cb8 |     
      x86_64 |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/5111748ea35cc8fb3273ce3d8cd120032cb5635e |     


-- 
http://autobuild.buildroot.net
