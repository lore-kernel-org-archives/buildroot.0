From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Aug 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-01
Message-ID: <20160802063032.EA4AC102507@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-01
===============================

        success : 153
       failures : 89 
       timeouts : 1  
          TOTAL : 243

Classification of failures by reason
====================================

      host-uboot-tools-2016.07 | 4 
openblas-f04af36ad0e85b64f1... | 4 
                    owfs-3.1p1 | 4 
      kismet-Kismet-2014-02-R1 | 3 
                 libunwind-1.1 | 3 
                  libsepol-2.5 | 3 
                 clapack-3.2.1 | 3 
                  connman-1.33 | 2 
             transmission-2.92 | 2 
                  mono-4.4.1.0 | 2 
           igd2-for-linux-v1.1 | 2 
               host-gdb-7.10.1 | 2 
                 jack2-v1.9.10 | 2 
               libcap-ng-0.7.7 | 2 
                  lshw-B.02.18 | 2 
                    cups-2.1.4 | 2 
                  fbterm-1.7.0 | 2 
              lirc-tools-0.9.4 | 2 
                    ustr-1.0.4 | 2 
                  babeld-1.7.1 | 2 
                 rpcbind-0.2.3 | 2 
                   erlang-18.3 | 1 
tstools-08f6be304040e7b8476... | 1 
               qt5base-5.6.1-1 | 1 
               linux-pam-1.2.1 | 1 
                  multicat-2.1 | 1 
                 raptor-2.0.15 | 1 
                   ncurses-5.9 | 1 
                       unknown | 1 
                     php-7.0.9 | 1 
                    fftw-3.3.4 | 1 
                blktrace-1.1.0 | 1 
           argp-standalone-1.3 | 1 
make[2]: *** [utils/CMakeFi... | 1 
          sane-backends-1.0.25 | 1 
           linux-zigbee-v0.3.1 | 1 
                   dante-1.4.1 | 1 
               binutils-2.25.1 | 1 
                alsa-lib-1.1.1 | 1 
                openssl-1.0.2h | 1 
                  ffmpeg-2.8.7 | 1 
                     tftpd-5.2 | 1 
kmsxx-a706f157b86e906968080... | 1 
                  hwloc-1.10.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                cifs-utils-6.5 | 1 
                 xenomai-2.6.4 | 1 
    xserver_xorg-server-1.18.4 | 1 
               tinycbor-v0.3.1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
               netplug-1.2.9.2 | 1 
                   ntp-4.2.8p8 | 1 
android-tools-4.2.2+git2013... | 1 
            mesa3d-demos-8.3.0 | 1 
                   luvi-v2.7.2 | 1 
                acpitool-0.5.1 | 1 
          xapp_setxkbmap-1.3.1 | 1 
                    libiio-0.7 | 1 
                  boost-1.61.0 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/ab3bb37cc058f8b7dc8143d9c712166d59e4becf/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/e4217a152deaecf32b97658aea2b0c2d3d010173/
    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4c014054cad49247c3f61fb0990f937618236f63/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/822f8aeb7f4f9fac66a15abaafdcef59be2224e0/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/cef2a316cd6a7cb6d0175c7862be78e420b754f0/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/898fe47e1045dda879319d535794a59b42698310/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/fdbc51b4e4bfdf765e36430867aa5c0428b19ba6/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/098dce5ed25f22e49acf407c385827d39fee0c9f/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/06d67feace4cdd2b8d5970f0869b7aad67a058a9/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/9076993275bbb41ffcf3ef9c5e29690f84215519/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/e6cb26db1dc0d923ba603dcdafea3a1133511df8/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/db5593c31a55db4a953cf3c8b1d96ca13079cf61/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/5065269c7861fc9e0ee0b625da528c7f5e8ae4ff/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/3247b9c7ccfeffa623dbd0d89d520592119609c4/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/b1d24303e0db30ca942b6feef27d2d279b111f48/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/f183ab39d617cf703bce12d42197bfc19bc3e839/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/a1066b065e57af2e08a2d291182e16ab1cb487bd/
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/37841907f7ec95b1bc3ca3321675770a4ba4e319/
      mipsel |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/48b962b1c68fbb265c05b9c57c2c26e1dc88670b/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/617fef69feef1a1fcdd729518667f0248d381102/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/59f44d99360f31219855bf7f4b1a7658243e6efa/
         arm |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/15aabc70395af5bf723fcc4d6e985ae0cc6f9dfd/
        m68k |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/635fe4bf83d97d337f965cdbc10721da95c48303/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/47f1136d834684049798a35ad63e7a9d7b670704/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/5e235b57fd2634650d4c91bd33633d23097d4365/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/6124d6fcfbe85617a45a81cec42cb42aab883f45/
microblazeel |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/204edd544d445ae5f22536a8899e65b5a10608f2/
      x86_64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/9d3a948c86b97d4831578d70fa03278f512029ef/
      xtensa |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/60ee9b9ae6db63711123ab7977b012287acf0092/
      mipsel |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/c94512f8d6c6f08a13e04bedc7a718639a4a95ab/
         arc |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/b195c8d9f458db71a56e03eb2b275532f53165bc/
        i686 |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/3752fc857821095fa38b5aeb0f2895055dd80ca8/
        m68k |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/341a2af4ad1e89b08ad2c7d7654d60c851829f88/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3debd516f0091426f9d7e58028ad88dea5ad27e7/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f15a244a93a0eaf96053fb9d88c8bffb7599e26c/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/ca2cf2e83abfd1537e73c5b7cfc7d113ede8bbe2/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/fa4d6356edeff0931b8d078f841cf706c90a642f/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/52e0a8d253c199ffd65ba9e0b13b4c678acc212d/
      x86_64 | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/502a60aec7042de6d72d08f8fdd95d91e626a0c1/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/39cea45592b8af9cd01fb004e3e2d8fe945f9dc4/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/8a3aa0f3a755100fcbbcd24837256f7daaf386a0/
        sh4a |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/ef4b27a1d5ec204b7ed6380fc652926f63d84ad7/
        i586 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/971d4f03d04b75d1b8ad225162f8639c2e29906a/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/075f4a8ddca03741a3260176a9005d0c6543b428/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/047f995188431a4a51934b69966ed82e78d3ec5b/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/bbba99b3bbe4b9e9839fb491e3558b2a6e136af6/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/d8df5baad39e676b058a9bf912eb074e66ed375f/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/a7ffa0a221469929712518d9e7b7823099de8800/
        bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/639a8c70566c1a45d2a22c9250d65fc653c81cdf/
        i586 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/62ed810c8f97cb347206f38849a4215c6612a80d/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/fe2ee7d99ef066db2f23bafb52978bb2a40287c1/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/963149de24636c9ad09c8f0448816fecdddc67ef/
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/b60b1245e95cca6719eebbca15cce9f0b080fcc3/
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/984fa961017bc0f0de85a9bc342f4b842148eb66/
      mipsel |                    luvi-v2.7.2 | NOK | http://autobuild.buildroot.net/results/d4ae77484f7760e3758613bfec4b8be00b4105ca/
microblazeel | make[2]: *** [utils/CMakeFi... | TIM | http://autobuild.buildroot.net/results/c5b25662b8ec7bab69ddd6140175e6f9ee6d7af6/
         arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/1a313c562df1d2d8b69c001b5100162919e93e55/
      x86_64 |                   mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/9ac05894879875d6157c52c7012846d9319f5d20/
         arm |                   mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/9817cf6d6dc664b4d183c97aa21db31e81ae839a/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/edb0472fd65fec0d32ec8a5ab82fda29064115f6/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/0a0a5ffc1acd7586f9dda67a94d3c92451154877/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/c2a5dfedba46cc8eb3d0c5c43f1f76fe0bb1805f/
        bfin |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/ebfb2e88de3cdf4c0bdd860c618c415996eb767d/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/a40f5b92ba4e2a546043d5b77e6812c8771e4f1c/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e933d80a2fa019238638f64b98e0cc54bf1a207e/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/519a138aca9fef5cb79430358fdeffb8fbf9fce8/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2d1ff44eae989578af8a7ca06aee100f98428a65/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/62d8ed0bce127c7dc0aa4f32b9c2b5df6c2ba93e/
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/458e1d1d48283c6ac46ec2e11c62a56a23b969e2/
        sh4a |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/f590fe9ad8ce7772d7fb341bb862073ef951b9f0/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/e0dd5217359481cb08f7037db2ed314d917d9ba8/
        mips |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/a75fb14451ade217c0a031c152d684aff6b94021/
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/08ffa04ec07ee5d9a55d6b671fff5f2065f9bed7/
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/3e011716383838790e8c56c6c15c059383362c84/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/5deded251112eeed24350d700a2d63877246c8fb/
        m68k |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/c31a851a4d229f28615773a6f69d276fd6767c47/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/e9b293345217a757c1c363900995b30def63001f/
        i586 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/4131b82b102a304a8fff4be8151255cc2f67503d/
     powerpc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/f1b7a48142415a8b32ff250ad9e93ea35f88a22b/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/c20f069612d424e8b40cd62cd0bb0aadca4e441d/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/fbd299f3031f686bd6a3b839ab12c7165605cb7c/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/9419b6e0556d4b989ab2c98e841f9392df29a82d/
         sh4 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/a740cabac8c35a3ffe151ca6040664b40791f92f/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/c59c80246edfd072e0e2a7aa801b7508100c6e99/
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/71e90affd184cb6aaca7e816a55ebbf2032f1489/
      mipsel |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/18b6ec537da9e9055f58a8649c0719dc64df1bcf/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/b19c1666beb45d7641aab0873a5ae2864fa539b2/
     sparc64 |           xapp_setxkbmap-1.3.1 | NOK | http://autobuild.buildroot.net/results/c8877b1bc6f15cf491d550bac0b32a09db202769/
         arm |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/06a52b2c2c23df595f58feb6b95437fc65a86d31/
        sh4a |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/1a0487d31bc19977c72eda1c4b6c607f3519b6d1/


-- 
http://autobuild.buildroot.net
