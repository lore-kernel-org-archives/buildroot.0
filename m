From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 03 Apr 2019 06:00:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-02
Message-ID: <20190403060059.10FAC227D1@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  27 |   0 |   1 |  28 |
      master | 275 |  73 |   3 | 351 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  rygel-0.36.2 | 24
             dbus-python-1.2.8 | 6 
                  ffmpeg-4.1.3 | 4 
                host-go-1.12.1 | 4 
  vdr-plugin-vnsiserver-v1.5.2 | 4 
                  linuxptp-2.0 | 3 
             openjdk-jdk-12+33 | 3 
                    quota-4.05 | 3 
                  brotli-1.0.7 | 2 
       gettext-tiny-legal-info | 2 
            host-vim-v8.1.0133 | 2 
                   netsnmp-5.8 | 2 
           bayer2rgb-neon-v0.4 | 1 
             biosdevname-0.7.3 | 1 
                gerbera-v1.3.0 | 1 
                  gqrx-v2.11.4 | 1 
                      harfbuzz | 1 
             lirc-tools-0.10.1 | 1 
                   mimic-1.1.0 | 1 
             netsniff-ng-0.6.5 | 1 
                       netsurf | 1 
                    postgresql | 1 
               pulseview-0.4.1 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
            qt5location-5.12.2 | 1 
          qt5multimedia-5.12.2 | 1 
           uboot-tools-2019.01 | 1 
               wireshark-2.6.7 | 1 


Detail of failures
------------------

         arm |            bayer2rgb-neon-v0.4 | NOK | http://autobuild.buildroot.net/results/2e99d0066fadb0802dd0d898215b2f6867603d69 |     
        i586 |              biosdevname-0.7.3 | NOK | http://autobuild.buildroot.net/results/3fc31982af87210b66cbe412410d11c85c9cebd6 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/aa69a7896a75cf8ea256a87cd85221d822f079d9 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/686ac34bb377e821d2a59d519e37c90f8964ec1e |     
         arm |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/6f26c1386c80ab4af868de187ed6df48988fbe88 | ORPH
    mips64el |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/af8670a7c63e0848896199094c5f51c7e2fa2368 | ORPH
        mips |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/7d2bfdfe8c58c886ab4094fe513fe6f4beaf868c | ORPH
     aarch64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/7fd136d9921710dc3fd35f61ea47920d27264328 | ORPH
        mips |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/22438db2e76649d1793473476a348589122c3ee9 | ORPH
         arm |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/2c4fd528eb12cdf939b6a9a03ef066be92305914 | ORPH
    mips64el |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/4e1d754ca3186e1c683cfeb7b17b30b3251383cb |     
    mips64el |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/d5db98ec9fcf42af333904545d00bde9c2dfbc04 |     
      mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/7da68679891c4314f699e61176ed891eebfb1206 |     
      mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/736b422cb5c5e0ef2e4d554da702ee65eb550fab |     
     powerpc |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/10098c8972725d54b717ddc8ea41f4de5e5b066d |     
     aarch64 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/5fd9e7078c24f1c1c7bc5456fa0a5db815a1a21c |     
         arc |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/c27cbada396d1f309d7a0fb45ed05a5fdb5edc46 |     
 powerpc64le |                   gqrx-v2.11.4 | NOK | http://autobuild.buildroot.net/results/c3b48b47592a975fde0a078fc1cc540191878dac |     
  aarch64_be |                       harfbuzz | TIM | http://autobuild.buildroot.net/results/0721aa71c8308779df02e25f72f0a12b11eb3a62 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/03e890bc9825c9ad25f509e9f2025a3bcbf11250 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/066b3089936e6c552e86dc71b3701d06209e8ca6 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/d46916f550994f1d4096bcc24a34be967acba5cc |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/b3ee76a5b1395653a8f0f8c08121cae281ccd0d0 |     
       sparc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/98cc09a48ed2d1e9ede9b811acbe9b2369ac6641 | ORPH
         arm |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/e0f2a47120e1f871062888d329dde602e713a45b | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/d68c8829716015792f772d7d8adbdff717a11b77 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/201ba6669c9b1d0179b0cb212aefea80912c1180 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/c72bc47dae004a623e5d75b822430736c6ae07bf |     
       nios2 |              lirc-tools-0.10.1 | NOK | http://autobuild.buildroot.net/results/abe71039621c79530be73c03114d76af0e2f65fa |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/a6afa87626798853758cf56172b030428f270b04 |     
         arm |              netsniff-ng-0.6.5 | NOK | http://autobuild.buildroot.net/results/6950133b2f369e64ec1da8a8aa35c132dd946554 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/80564d60525e80ef207e9348272db1d42d277f25 | ORPH
         arc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/0db4b80c6f2b7f9d12122da597a246d14eea6794 | ORPH
     sparc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/423276269453c16f9b9c9c8aadcc9b89d81eea7d |     
         arm |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/010447be49bc4b615452f73612d868fc9a688e9c |     
 powerpc64le |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/c35d64e659960663c935a31f4cb8ed4180728eb1 |     
    mips64el |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/3ba39b857d36b2ef0d429f0e5ae230902a3244d2 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/b8a4b64b5897cc91b31dbc528554acfd8c902e7e |     
         sh4 |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/5316ffe065503ec45ce72f52bd9c1115f2f2178c |     
     aarch64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/3d03e0880a1551f0e16bdc1f2c24afce76c988a6 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/786e183c8ce9c88815ef2cc80331387555a87053 |     
microblazeel |             qt5location-5.12.2 | NOK | http://autobuild.buildroot.net/results/2f9ed3a638416a01091321ebfbfc7f08bf8dd63b |     
     aarch64 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/a0891fd6cfac20dc14c340bc81a9faffa9956333 |     
microblazeel |                     quota-4.05 | NOK | http://autobuild.buildroot.net/results/7f10957ef52d13aa7008338df18ecb52206b916d |     
        m68k |                     quota-4.05 | NOK | http://autobuild.buildroot.net/results/3a2be2cff5c9a4d6c5a21ae4a9d2875b1931ef82 |     
        m68k |                     quota-4.05 | NOK | http://autobuild.buildroot.net/results/25985bbc160e3d62b23c4c613b2a81f3711621e3 |     
     powerpc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/f706b8dbd09f9fea53555b118caa496fe2bf547e |     
        i686 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/f14f5c0cd3b528112199ef3432582f96de365c62 |     
     riscv64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/104dc3fec5a4c7926d404eeefc25ef55c3344681 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/ab0735b0ad5f979db9fb952dd2492dd9c272c878 |     
         arc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/a51ef7c9bb82458e87a616c00f2c3743b72a5902 |     
         arc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/b98cb42241079c8523571d5d74f09442d988d9f0 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/b4959b944914640829d2f7637d6e92accd8a7f7a |     
     aarch64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/8074746e3ba4f48b0c4b845de8dae12b4e7697a1 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/514e0ad62d3ce2f6634061bc3bfa83f49d198c9c |     
     aarch64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/a111904cd44815dd2308908e68f3f12c6c4a4b4e |     
       nios2 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/73f599a2b719d5ad07a7291e422a2063a2bc8920 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/3ae8f60a237cbfdc9babf2a0d520a0547e5698d6 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/6a57879f570dc2e01f2009077883fd85949d9d12 |     
     powerpc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/92cff2fd7251f79c9f62880dd4a1dc77ccb33bc3 |     
       nios2 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/e5bb72743882495ceb53f1b597948913476722be |     
      x86_64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/2129e431949dc2297caa5a5553ad64b7bc0ce9bf |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/fc95dc5c5951f1b9a3b849d883070b7d43917235 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/fb85ff5186147a33e7c01659c20feb0ede2959b9 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/c28558d58605b5af007525b86be5215f6841c18d |     
    mips64el |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/b947947106b368a302a8d43c84b998480f696448 |     
 powerpc64le |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/bbaf8baf5aa598863cc36bbd83dc69c919c7784e |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/6fb8b37107f18802d28d753c9c7fb5ddbaddfab8 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/9963a1562c507b7f1eeead405b1ff3eb03a8980a |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/151f1f8a5c8dc01e689a47f357c1d4e3ec7610cd |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0a3225c9050e672dc586d1f8e2ee80173eb32a0f |     
         arm |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/7022ff2fb66d286b129e61e3462db2bdb6acb0d4 |     
    mips64el |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/a7b18168f234a311a3b5fc41e89ec3c66ecc82e9 |     
     aarch64 |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/0c230e49b6e9bf27163f751e6912ee85c6eb62e3 |     
         arm |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/4437f4aa5daa571984af1e11340c87963b9dbc0b |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/a939e18502953941c52bd96a2b1832a31e82e967 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                       netsurf | 1 


Detail of failures
------------------

         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/4f0cb14e2db2fc9ff03dfa673c44afc18421b526 |     


-- 
http://autobuild.buildroot.net
