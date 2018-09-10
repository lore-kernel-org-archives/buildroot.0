From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 08:00:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-09
Message-ID: <20180910060014.7239B20701@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   4 |   0 |  29 |
   2018.05.x |  28 |   1 |   1 |  30 |
      master | 140 | 111 |   0 | 251 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

linuxptp-303b08cbf55096aba5... | 2 
                   attr-2.4.48 | 1 
              host-bison-3.0.4 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/0cfa3ee750a5d403e7eb52d62dcd605c7f53e947 |     
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/11f287786aef5f58c4a98d2e13293b63dbf3c115 | ORPH
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/75204a8139040c0ad56fd4df109e70b7714d9b0d |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/a0f1b588e19575a7cd97378d6d787f1539c169fe |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 1 
                host-libsodium | 1 


Detail of failures
------------------

    mips64el |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/c1a069f90bf3b0819c49e8ca3e5558e4616e06df | ORPH
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/168ba394e6cac4493982559b440161b220ce5b9b |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 31
              ptpd2-ptpd-2.3.1 | 12
 Makefile:708: target-finalize | 9 
         host-e2fsprogs-1.44.2 | 6 
                   botan-2.7.0 | 4 
                host-file-5.33 | 4 
                libmpeg2-0.5.1 | 4 
                blktrace-1.1.0 | 3 
         host-e2fsprogs-1.44.4 | 3 
                  libssh-0.8.1 | 3 
               boa-0.94.14rc21 | 2 
                   dante-1.4.1 | 2 
              glibc-legal-info | 2 
host-android-tools-4.2.2+gi... | 2 
               host-parted-3.2 | 2 
                   lsscsi-0.28 | 2 
                   netsnmp-5.8 | 2 
package/python-numpy/python... | 2 
       python-numpy-legal-info | 2 
                rtorrent-0.9.7 | 2 
                     vlc-3.0.4 | 2 
                  acpid-2.0.30 | 1 
                beecrypt-4.2.1 | 1 
              e2fsprogs-1.44.4 | 1 
               findutils-4.6.0 | 1 
          host-libsemanage-2.7 | 1 
          motion-release-4.1.1 | 1 
perl-crypt-openssl-random-0.15 | 1 
         perl-digest-sha1-2.13 | 1 
          synergy-v2.0.12-beta | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arm |                   acpid-2.0.30 | NOK | http://autobuild.buildroot.net/results/2cb0435d36a2aa2d75b6c1dfecc93bb49b0f6266 | ORPH
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9f1283469e1213244a41067562b7353c96b22757 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/47bf09ae9ee8fda09e0f45d814f1673d31f8b767 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/3775b3aee0082c2f43c799ac2e37a09b28d5a362 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/3df1f0cd7c42bdaac1e59b2e063c6ec8928bcaa5 | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/5a649b79a8187bae0000a81f044e5008b2455fa1 | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/4c45c112da34c42c275e60860eb2ec1d5ac5e2a9 | ORPH
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/0c2129d87575a6a247dfce82bf9f25cc69483d0d |     
     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/0bdc6a6f88e3bf7b3af240a485609212956c1bba |     
      x86_64 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/22104f5d55c2f384f6dcd417095183b7a6d652ea |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/9569d113168dcd6bdf2788b7a10169e59f7f924c |     
microblazeel |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/729f6ea434b4f4def52bfc9ec995b83031b96744 |     
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/9fea2798f85eb085a344efe5edd3e5f7b4cf162b |     
        i586 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/07a3ab323fc7b5c20abd51ed2eee59cbde05a83d | ORPH
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/24357471f6e8fc76a21fd646e68c5280bab9d0a9 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/33642c4ad836f5f64a970de49d2858c4749d02e8 | ORPH
         arm |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/72824137037f675e4efe3284089451803f944abf | ORPH
 powerpc64le | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/142c5672fdc44f2d68f18df3509e5051b3295df5 |     
        i586 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9011c6af71fb81988c2a05f2acee913a2bae2eff |     
        or1k |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/0fe26c98d51b72833046ef5a43088c7baf1a04b4 | ORPH
        m68k |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/0916f6414f71b0f7f74738f8a6fca9d8b2698c46 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/77e98030a096f03bc031cc17a440f1f38ba4a1ad | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/91d7756b83e6b85216a678851924f2267e69474f | ORPH
       sparc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/3e2dbacde80eb1af271d863dcbce8a0d3d0ba34d | ORPH
      xtensa |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/9f0ba58e8d55074638e26d2d0fa20a0307bcf16f | ORPH
microblazeel |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/942e939240502830a3c47ba97193d074efda372e | ORPH
         arm |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/a5ef09c60c1fd45026eb16d9c05b2c530be023dc | ORPH
microblazeel |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/a9fc5100fe4be0f1ff52c5038b6bff820f5ed104 | ORPH
    mips64el |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/49e08cc6d6c01c231dcaf883866a9d669e4ea0e6 | ORPH
         arm |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/2aaa4a61f1a2cb74b30a46c4873f5e087771d765 | ORPH
         arm |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/192bfa98aa762c0ae6adb28ae90e1436c1227660 | ORPH
   powerpc64 |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/8785eb5ef5cbba132f4a5c5233b674b0a5fe9ca9 | ORPH
     powerpc |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/7d019f1f798f0a647dd7d1138c8d77c12817b40c |     
      x86_64 |                host-parted-3.2 | NOK | http://autobuild.buildroot.net/results/ecfb634b5e6dac2c88b399fc1f1adc68ca42504c |     
       nios2 |                host-parted-3.2 | NOK | http://autobuild.buildroot.net/results/d3a3cd9963e5a2be1cec8fb553f5b20fc2e3c85c |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/5e1fb8475de8059c36c67e19e31d6caf6779f7ea | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/8a208be6d66244654cd45c08e5b2f7a28dd0cfae | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/57c48f8fa5af3e2908b82661b8e4c1b8be8c76fd | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/c493bf91a089c948e3f0dfdb7d0780be803d109c | ORPH
         arm |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/c8eee91f11f2862a81e100e7f30e2043cd393827 |     
      x86_64 |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/3e0a1722564e38bfb9b2811b8436194f440f5d89 |     
      x86_64 |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/36513a8f31edc869ff2c128a180e183b38a8b9ab |     
         arm |                    lsscsi-0.28 | NOK | http://autobuild.buildroot.net/results/7c0fea781ff59f8792c4677079ced11eaf25f62b |     
         arm |                    lsscsi-0.28 | NOK | http://autobuild.buildroot.net/results/60ec736ec524dcffedcef8f92d98aa29fb8987aa |     
         sh4 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/28c4671bc69f8c58ab0c598070c5eaff5ec83bc4 |     
       sparc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/f28a1698672153c34672b820279fce9b86519736 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/51bea93964a2a4e4e67329dcfa2642d8990ded5b |     
         arc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/c25f8f0db2088194de2be062cbed6658745ff985 |     
        i586 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/785954b31f7a6481787778a0e9195b2081a8756f |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/b7c362000fbdf3e88da8c929620397fc16ccd2f2 |     
      xtensa |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/ae627155e42f636bf048255e24cd55b83916367f |     
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/f46e08cfff6a2cdc47533f98dc3542e49f7489ab |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/37f0b344186a6b0e85ab59b18ebc04da3314e244 |     
         arm |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/395be1a9cab824b82ef34c2ebd84d54243029b33 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/f15c22e0257d7498456049d8aae195ed6a265d2e | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/9cc19e481de20ea0b4b5163e45c5aee525b81229 | ORPH
         arm | package/python-numpy/python... | NOK | http://autobuild.buildroot.net/results/78e490c23b8a28bd0d249c65f31dc79ee9e8c9f6 |     
     powerpc | package/python-numpy/python... | NOK | http://autobuild.buildroot.net/results/707917d6a0536424a6ad57bc1b5bd983ff08df3f |     
      mipsel | perl-crypt-openssl-random-0.15 | NOK | http://autobuild.buildroot.net/results/f676600ce05e9bcf7ef1183182673f06da67ad79 |     
    mips64el |          perl-digest-sha1-2.13 | NOK | http://autobuild.buildroot.net/results/87acb92c2a0ea7cf7d9cba3687190e46beb79a85 |     
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4cbafc8ad48eef95489d0c7c9f183a674b5360b5 | ORPH
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/fb366f6dcd5bae814e30da4511e03734716a2d1a | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4b9493ebe94f04627390ee54493bbc7f8b09d3a8 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/05574d050df57ab7c589616f6c163d0bb8b70b57 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d4dee16108592ebdb534781579554748399bf349 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d722cd4f5722991d3c4e3c6bd673e543f81072e7 | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/937098f26b202e19d81a9b05546becc2644a9f14 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4f4cfff3993cfa8889681be52d560bb75a677e2d | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/0667d6827a4550d4a11ee522e2838c6e03ff32b5 | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ffc71ec417326e9f59172c2c80c6ed680d9cc8d1 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/459adc973936f3aaf79b79d8a374264bede642bd | ORPH
   powerpc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/eed70868710b82857951281434348835e6723a1d | ORPH
      x86_64 |        python-numpy-legal-info | NOK | http://autobuild.buildroot.net/results/9d0e557c5946b76aa4c8c87b7616433c16b61e20 |     
        mips |        python-numpy-legal-info | NOK | http://autobuild.buildroot.net/results/08e1121af151c65b2333e06839256eb13f4ad800 |     
    mips64el |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/97546797caa7233000752ca59e159e8600ace912 | ORPH
    mips64el |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/ac0384a2b6c178b49fe79c07b5ded7fbd89fa0a2 | ORPH
      x86_64 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/5bab942322357bd71901cfc13ed3cff0c17edcce |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d27dfe04eaf25e9ac92e6642190429689c96f847 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/f9b2632624bcdcac0d65889dd1b49ca8fa0f719b |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/a74ae941ec3b3ea7ebd7d875522949e8990231d1 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/046dd390f054e12a489df158e8195bb6129e9a92 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/7f515106ed4abdaa7e9b8b11e0c2118e856ea0f4 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/2e3ac5e9f2ce8cc3dfe13cb3a63f4ccb69d97f93 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/60bdae4ff2fd665fdf865d92d77d04499baa8a15 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/422aca21163f20776cc41ba676521f8a1916d554 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5f2afb29ad34ca62a9e1afeeb8f1a29fc31b7405 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/2b7bddb6c982fc7a7b9424f8029593985e22aa31 |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4595766ce6bae41029993aabb2605424e06d3219 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/7c423314cab4d6eb51293904ec405e10a94fb9bd |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/a630cf1ee5a3b5ff4965f95a2ee528b206844167 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/9491da941142cbb7c02c90ee74beb5bd1d90a258 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/546157b73726b51381cbf7489deaf552295b303f |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/1de30ebb7f817b7757237a51c2f93dda199c3485 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/dd7c902f2905b90ac6cb0637c75a41377581c59b |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/c6704a6f50dd7c7887daab679ce61ac2c03821dd |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/00d24c575103b0882ee995759cb1ad0474578989 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/63e04a8376144b0422ac16163f94d1cc0df9940b |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/2e1e18979aaa764e0ba5107053ac8dd48e4f62a9 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a03751735f1b5e234ba929d49f54ee0f6e0a2510 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b16f5c2cc4f035c5594756ac8dfa061e17cf8b0f |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/89fe4f4a3c3f3b28b6c6b4ab857f3a12745670ee |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/67c8495d2e1cefbb8d2ba9389951065d9e1175c8 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/10136317274b92898b17f4db5be9ea2113fe38aa |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/3ce29f50e383c5b5780d1708576a5a15c1c2cfb3 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/57a7216923733355823abc3899d5ace26ee9469c |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/fec7cab15b36e83c260752b942b4f6c51708f560 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/aa3520601a0e62dde452767d169cdff35ae73d48 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/5f2bcc80d5e2602df8d3bbdab0ff15d5075b1f26 |     
         arc |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/6ffc58ea680863978db7dce6b92b1dae8725912e |     
      mipsel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/50f297b43884288d92e171388d62c9a7654c6d51 |     
       nios2 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/57a9ae2f157183a86fbf1b2cc5cbb38e948690ce |     


-- 
http://autobuild.buildroot.net
