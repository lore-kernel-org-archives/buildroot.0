From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Aug 2016 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-02
Message-ID: <20160803063032.1B045101519@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-02
===============================

        success : 150
       failures : 82 
       timeouts : 2  
          TOTAL : 234

Classification of failures by reason
====================================

      host-uboot-tools-2016.07 | 10
                  multicat-2.1 | 5 
                 libunwind-1.1 | 4 
               host-gdb-7.10.1 | 4 
             transmission-2.92 | 4 
openblas-f04af36ad0e85b64f1... | 4 
                     php-7.0.9 | 3 
                  babeld-1.7.1 | 2 
    xserver_xorg-server-1.18.4 | 2 
                    owfs-3.1p1 | 2 
iputils-55828d1fef3fed7f07a... | 2 
                 clapack-3.2.1 | 2 
                  cairo-1.14.6 | 2 
kmsxx-a706f157b86e906968080... | 2 
              libarchive-3.2.1 | 2 
               qt5base-5.6.1-1 | 2 
               libcap-ng-0.7.7 | 2 
                   ulogd-2.0.5 | 1 
                cppunit-1.13.2 | 1 
                   fwup-v0.8.0 | 1 
              squeezelite-v1.8 | 1 
                  snmppp-3.3.5 | 1 
                    mosh-1.2.5 | 1 
                tinydtls-0.8.2 | 1 
               logrotate-3.9.2 | 1 
                dosfstools-4.0 | 1 
                     vlc-2.2.4 | 1 
make[1]: *** [print-isoclns... | 1 
                 gadgetfs-test | 1 
                acpitool-0.5.1 | 1 
              lirc-tools-0.9.4 | 1 
                libmpeg2-0.5.1 | 1 
make[2]: *** [utils/CMakeFi... | 1 
                   ushare-1.1a | 1 
                  squid-3.5.20 | 1 
                    libiio-0.7 | 1 
                    cups-2.1.4 | 1 
                  connman-1.33 | 1 
                     tftpd-5.2 | 1 
                  boost-1.61.0 | 1 
               openswan-2.6.46 | 1 
                    chrony-2.4 | 1 
                   luvi-v2.7.5 | 1 
                   dante-1.4.1 | 1 
                   cmake-3.5.2 | 1 
           argp-standalone-1.3 | 1 
               linknx-0.0.1.32 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/fe571f74b70f8fa97c41dec94be9324c6ecf08ca/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/5b64059f34916cf48cf8367e4d1b8aa0bb61fed0/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/3c342ba6272f54bc0a514727f6e3ccd4ce195d05/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/9c893ba546ebc46984fac3c59733c7f2ced1689d/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/8f6770b59a343b9f710e9363b43227ee9f026660/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/6c6c64f0acac5c8c441d7d50cb8769a711cb7af0/
        bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/fed36d2823a2cec26888cb33203da0fba4008747/
      x86_64 |                     chrony-2.4 | NOK | http://autobuild.buildroot.net/results/ffca1df852c5dc8275bb437d68305c6f582cb1e0/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/563e150f2f9c9fd3ed584c9d394640b04ff332fa/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/f305af04150ee36bdfebdcd689ea0314d17c9d0d/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/fccf9f798d17f7c4d9d0f700522977f98d5f4e53/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/eb8c046bdda075e8fa47bf6ab5e1dbcf9ac96722/
        bfin |                 cppunit-1.13.2 | NOK | http://autobuild.buildroot.net/results/fdc81c63756c7c952fe1d74d2e1558d229513b9d/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/253deb6fba31d2c06c617adc873553d452c1b8c3/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/a76a20a25698cf457dedc56a02d0c676743adf16/
      x86_64 |                 dosfstools-4.0 | NOK | http://autobuild.buildroot.net/results/ccf8cbf594f0b8c74a7de0c6bb9ef6b9b86a1053/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/76c9391e8d9de7e3f11166b2a0a6825aa3631c87/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/1d38d2f2fe980e079380fbe9c2f635fc850a975b/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/cbe09cb0dfa492b863efbf8cadfe560991870017/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/c2f8580faf7ff215382d96128e5893bb4772f21f/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/22cb7451becd0497e9f54ce3289965ea9b143ece/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/eab8d533ec3ac1c6225af33d3f7b06f583f31f5a/
    mips64el |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/223ac96e0173ba79c92a5e5009283df023d93524/
      x86_64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/2557950ecfba2c5f6c054ebcc36d752861130bfb/
    mips64el |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/37db5a471fb7120728193c8814e19e0133551a60/
      xtensa |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/ecf53fd5f21df4368dd02adab10ebf2f6812f2b3/
    mips64el |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/97775bbf8cc3dd31e51243f6de462018d81a561b/
     aarch64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/cb4b6826d422077d6b2423698530848ea853ca63/
      x86_64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/78808bac827fd08003eca6aeb29655f672935f03/
     powerpc |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/54641f035bf8d9cd5bbac83ddc18decbad140cc5/
        bfin |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/986760c79b086d64c1583cb41d14e7ba97cd898f/
    mips64el |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/18fbfd8ad7dab572332affb91375ea8217fb2513/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/f07ffa0bbf6b823d40eec4c384f2a1cec4cc54cb/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/dbb44c23c1ec7594f7e3b91e80f3217e9d22b89c/
        i686 | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/22467a530a146302ef74b11f69cb5cdc54240876/
        i686 | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/8dcc74586d68195c72a58cb4944d05dd9f935fa1/
      xtensa |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/29adb8e3a325771a0fe9715955f3f791a56cbf1f/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/8f4b4eafc80da8810459c6fe9d0810a7e8e6b934/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/806b633d2605473e452b796c6d23fa9e3f736be8/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/ac310a1dbc60aa79db157a742dd43c620c21e705/
        sh4a |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/18ccc13808879fe111e0c8df06fb99fb87a986b2/
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1ec5f8398ab4dd45be00add8e49b903f24635c14/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/d5e529471c15b47fd6cebf50ce8a7e99d08b778d/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/f69b2221c63ba749c02b7fe137aeec05b2a4c68e/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/fb42f9e4f3ea72b76bdf58c66dbc285ed26fe84c/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/2cc584f13ed05ee2cba12dec501997a4c24cdaf4/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e855168fdc6a3acc3a533b86f6a77c8a7b9a5931/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/1324238be5e2e4c8a9458e5c41547460791eb1ed/
         arm |                logrotate-3.9.2 | NOK | http://autobuild.buildroot.net/results/b4562749f1a0d53a00e9ad1db509a778f553390c/
      mipsel |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/e017671c33314e5bf2d7fc4920f6c0e64a132383/
    mips64el | make[1]: *** [print-isoclns... | TIM | http://autobuild.buildroot.net/results/eccce6ba468942908517840ce8c080a046df9dc5/
microblazeel | make[2]: *** [utils/CMakeFi... | TIM | http://autobuild.buildroot.net/results/c0bc7af1b7f1fa5c899ed3aaf95d95dd6adfbda8/
        i586 |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/fd7dc240379305d5b6f9da0dfa8313b3af708a4d/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/42f1375cc5199b338c23b2b14a208cc80cf65b25/
microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/ae83a464e1181826a5f3eab5683372aab5897f80/
microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/47747a29b194ab010cfe8e727028c4d6649f38ba/
microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/b7128cac6ad18eb8aca4645d7332f0d6f593dbea/
microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/177b45c42d35fd2a3993aabf3098cc7f727e1b81/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2f2f59fd9a8b5dc9bb1f76f6b1fed42d9d3b5120/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/20469c7a683b31d1ccb9879db84a15c1cd88d1c4/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e1eb0e91885c3ab140778dfd1dd231a905a00842/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/198e19242e733cfc2b331b04a17bcb72793185c2/
      x86_64 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/f7b01a5ad5950c3b0f984dfa3569a3648560cc7d/
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/dcc3cdf57f91f324a0057bf633d654ee73cc8445/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/c67fdc4738f1d4831b388cc536106e66f86bb2b0/
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/96624362ab042f5ff10fb1107b4915f71018ece8/
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/460b3395dfa2d9d4130191973849f85b83b068e0/
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/117e3db2cf6016fdc76597b998840b6a1353e86e/
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/57eecefbe6d6c41c701f881647e42c7d415babb7/
     powerpc |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/dbb92aeb355c29de5299aa9afc10ed3f515141f3/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/4119c940203ff9ac7506d6c66c338f64a9f933e2/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/ed2447c69d294663b3187675d091f1ebc2c29e31/
         arm |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/8b149ad86b270935e0a057960ac47b1f986e778c/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/0238d303b3b25857663bc98e2bf9daeb498ca48d/
      x86_64 |                 tinydtls-0.8.2 | NOK | http://autobuild.buildroot.net/results/f7196d25dbc8fddc7b6e83e3b7aa278839fca07a/
       nios2 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/917110ed2a4c3b5583d5bab0a1ed5ef3439484e5/
        mips |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/946167949faa18c16ccdbe69ad92157430ac1438/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/cd64a269a1f6b652ecb6484d828b80fb32276c07/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/6f841b166f965708b08448f02cffd10c14edef49/
         arm |                    ulogd-2.0.5 | NOK | http://autobuild.buildroot.net/results/e70e038959aa2691b20cd4622df897d1936f2032/
      x86_64 |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/9cf0a84c7a125bfbb947d81d66503d21104a4725/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/c811e49f4f6bc5a436b1c20daac619a293b4f6ee/
         sh4 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/9084820a5a3cd50f7e341bf028c7e6f3cbd4deba/
         arm |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/e597a54fd93ac7cb110744f0ac3fa4395701ced2/


-- 
http://autobuild.buildroot.net
