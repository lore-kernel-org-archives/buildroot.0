From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Feb 2019 07:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-12
Message-ID: <20190213070054.8794C84EDB@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   3 |   0 |  25 |
   2018.11.x |  19 |   2 |   0 |  21 |
      master | 197 |  32 |   2 | 231 |
        next |  36 |  16 |   0 |  52 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
               host-efl-1.20.6 | 1 
neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/ae02a6b7ebcda12a44322b1e3f345df59c3d75dd |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/6f46e3ec8abe04dafc610ca8620093d9ba85a9fe |     
         arc | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/463a45595a53d5ea430484bfea6ce28b2f846410 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                     efivar-35 | 2 


Detail of failures
------------------

        i586 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/a1c81d591f2ee444ca68ce0467e8cbbe262ccd91 |     
 powerpc64le |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/e9b9321478b42d6ecef4aa57645c4be9ff10335d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 7 
                     efivar-35 | 4 
                 ibrdtnd-1.0.1 | 4 
              lua-curl-0.3.9-1 | 3 
               host-qemu-3.1.0 | 2 
                ipmiutil-3.1.2 | 2 
                     pcre-8.42 | 2 
                host-libsodium | 1 
                  libssh-0.8.6 | 1 
                   luvi-v2.7.6 | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
               runc-v1.0.0-rc6 | 1 
                   strace-4.26 | 1 
            sunxi-tools-v1.4.1 | 1 
                   tor-0.3.5.7 | 1 


Detail of failures
------------------

     aarch64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/12f00dd54612281bde43ca7113a13ec3a16648cc |     
        i586 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/3b4cd1845134f3688bba350eab18e81d40446d6a |     
        i586 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/f7512c4452d86d8926a6bda25dda3e42c17cf28d |     
      x86_64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/797670c1c35705fe07983c0edc9f0f9e198b3f38 |     
      mipsel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/c29d2ead420082a51a633446e5387b1d3017884d |     
        i686 |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/56e989ce3ba7f7e910ac191eb462a6d539bd9b0d |     
      x86_64 |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/fe5947d936a23df391bb6d656d7dc301164fd1ef |     
     powerpc |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/64c18140e21f080a2038397d60b25e36a01270d6 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/1a584dcbc75608849218da1337adf9526701480b | ORPH
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/6283700a42ffec40582e011f378e3a8c53068612 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/967acf65d104c9effb220b66124bba3589658efc | ORPH
        i686 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/ec6ab9d36c497dfba0a8ffee05e7cb5d57eae1c3 |     
      x86_64 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/8c7be5ae7429c5840e824248241f4defa65b8644 |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/20e32161d8108a571203fc2b3378634bc7a8d72d |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/0e1d72521cdf0559496847b2692817183a0d1532 |     
     powerpc |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/d726f459f8d9267fa576730022d26687d0892497 |     
     powerpc |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/b1795c6f64b13d219308fe146b5c47ff9f096bba |     
        i686 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/e87994a3dc987f5aa101a5e721ac927e21453373 |     
microblazeel |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/35ea8cf25bb6f2ce020d87722e5c6f93057faeb1 | ORPH
     sparc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/4751b02b462a276667d3b1f3c2d83cde47b845d1 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ef766560c88fc1ed55e2b2bbdff8b8bbae4b6eb1 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/68f05320598a6b17c508dfe3b732e0d58c7f3656 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/e8b96e8e893b716c8d148fb556d296d37f04000e | ORPH
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/792eb026d7d51b1a1b70e1673e2522332a09f9ad |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/165cde8a788b051d4e8c6306d08dd9c131c91d32 |     
   powerpc64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3dc0f1350d73f023ced75b8efcb7f1532e0ac141 |     
        mips |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/6d877d6b66e596e0056ed182d3eae42966dc8e16 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/073c7bf12aa3575f7153f208882765bcbc823439 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/81a0d99acce9f226295349d70d72a53014271dd0 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/094ba7bcb184f345b39a5310be202e5781661dfe |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/738e773cde2e470637dda65b142f63b07efc4693 |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/fb29ff2e25ffca97c9c1f0b1a1c29b0b1f56d9dd |     
         arm |             sunxi-tools-v1.4.1 | NOK | http://autobuild.buildroot.net/results/bf10cbe40c0f672c34db72e4eea4c168d5932bd4 | ORPH
     powerpc |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/2da038f4043cacfdf0c4caf77f4fc3f4fde9ec60 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

 brcm-patchram-plus-legal-info | 4 
                 qt5base-5.6.3 | 4 
             libva-utils-2.4.0 | 2 
               wireshark-2.6.6 | 2 
                     efivar-35 | 1 
              lua-curl-0.3.9-1 | 1 
               qt5webkit-5.9.1 | 1 
              sqlcipher-v3.2.0 | 1 


Detail of failures
------------------

         arm |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/703a15f6097fc68ed9d6398514a7c6c109229073 |     
         arm |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/5e93dd7162725da6c070c52b81ecf16959b7ad79 |     
        or1k |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/b83ebd4ca661dbfc090533fe489ef6df8346c536 |     
        m68k |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/7ec430e0d434ebfc3c57f99934f00d6aca80374a |     
    mips64el |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/d2f0800fde46f21de710e03223a77bb3ba845bb6 |     
      x86_64 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/461e91fdc16fb762d0571260fc0c3b40892ae17a |     
    mips64el |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/bedaa656ef0b052e13ba373b59392e3c7e20c842 |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/0931046a0ffda9d89fc277c8f0fe7ef63896911c |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/936147178fd4267fef705b47578af2c52f232d27 |     
     sparc64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/fe38208450bb17fc7a41f0f26e04848dda7e8e19 |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/bc0572a01a70c1ae64642426db62702e8cb889ca |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/43a2743576f8185e763e01bf8f08e282e6ed099a |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/c6d29afe92856a413b534de2e028539f2fd1e7f9 |     
      mipsel |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/34d8de0d272fb5a1a05804930b0e1bbcc249dd03 |     
     aarch64 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/ab80d7cb51bcfaa2987c27ccba93676b997377ee | ORPH
         sh4 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/2e3a7f83dcd9c0c23c9ba17794fd5ecf4aff02dc | ORPH


-- 
http://autobuild.buildroot.net
