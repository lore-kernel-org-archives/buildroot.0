From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-19
Message-ID: <20160920063030.BF671102E46@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-19
================================

      successes : 203
       failures : 73 
       timeouts : 1  
          TOTAL : 277

Classification of failures by reason
====================================

           python-daemon-2.1.1 | 7 
                    mpv-0.20.0 | 6 
             util-linux-2.28.2 | 6 
          google-breakpad-1373 | 3 
                 lvm2-2.02.165 | 3 
                 mono-4.4.2.11 | 3 
                     xen-4.7.0 | 3 
              e2fsprogs-1.43.3 | 2 
                    efl-1.18.1 | 2 
                   fwup-v0.8.2 | 2 
libcec-2c675dac48387c48c7f4... | 2 
                 liburcu-0.8.7 | 2 
                oprofile-1.1.0 | 2 
                  xvisor-0.2.8 | 2 
                collectd-5.5.2 | 1 
                coreutils-8.25 | 1 
filemq-e59951489045825d6fc5... | 1 
                     gpsd-3.16 | 1 
                 jack2-v1.9.10 | 1 
kvm-unit-tests-682187afcc99... | 1 
                    lftp-4.7.3 | 1 
              libarchive-3.2.1 | 1 
               libcap-ng-0.7.8 | 1 
               libepoxy-v1.3.1 | 1 
               libglib2-2.48.2 | 1 
                 libv4l-1.10.1 | 1 
                nodejs-0.10.45 | 1 
                   ntp-4.2.8p8 | 1 
                 opencv3-3.1.0 | 1 
           python-psutil-4.3.0 | 1 
                    qemu-2.7.0 | 1 
               qt5base-5.6.1-1 | 1 
           qt5location-5.6.1-1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
             rabbitmq-c-v0.8.0 | 1 
                  thrift-0.9.2 | 1 
                    urg-0.8.18 | 1 
                   ushare-1.1a | 1 
utils/CMakeFiles/testpat.di... | 1 
                     vlc-2.2.4 | 1 
               wireshark-2.2.0 | 1 
xdriver_xf86-video-openchro... | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/799470f9cbd947a02f4b345698cde5ce8182277f
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/69fe013dd0c5f629b87aca863a797e583ff24466
        sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/0380d7c8d195983cd392d8e45851c9dbcd17871c
        sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/329946b982ee32ddc6093e0668935694e067fed6
         arm |                     efl-1.18.1 | NOK | http://autobuild.buildroot.net/results/0b7efd30b7b5e15130cdceff9a853084c6c2351c
         arm |                     efl-1.18.1 | NOK | http://autobuild.buildroot.net/results/c9b07c3c9bae83c0aba4b7b6c650925ba56bcd94
         sh4 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/ef23ea1033a9aa4e0322538e0e77c5fd79f65804
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/1d23f9a2459b426462db5c153e6b396948610c7d
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/b659b80978b6bbf383293dbba29ad2944be99374
         arm |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/77e69e53c75afc61bfd1659fcda913d9abcf6b31
         arm |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/6e6bc845314100f2deb8ed06d2a6373ccf715ffe
         arm |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/57d6de635365c4ace4f12bc094ba79bcee5f3b95
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/2f8554659835fed587e498a0dfddb56d10049e64
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d7b1be8ada4ffedf3e8479231e3b20ee1502196e
      x86_64 | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/4453e8001406a658ae4dc58448baaceb6d93cbf1
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/546c6482ec3501025a2dee82678d3bace1a733e2
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/23c60fde316fd706c1fc1ce9bc59512713f6f873
         arc |                libcap-ng-0.7.8 | NOK | http://autobuild.buildroot.net/results/c0d8283e7b9cebd948db4c88fdc2259546251036
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/601851906e15f0c98870b1078d0fb22479fc8d78
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/7cc2288792646357652fc42305ab81094588da2e
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/a3c2468acf4ac072034e4e2f08d04cf7e69d1872
microblazeel |                libglib2-2.48.2 | NOK | http://autobuild.buildroot.net/results/402aaf1fa1520c9ca62ff3e00a054afca1d35231
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/56631605f76b8623c9674f25c529ac67d0de12a8
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/1035a7e660d09ee5e419e63b19ee9130640ddabe
       sparc |                  libv4l-1.10.1 | NOK | http://autobuild.buildroot.net/results/28170fe8d5fa00077736a832066ce0bc16abde7a
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/fe0aaa0b6132290a75ec8baaedd534facd5a9160
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/cbf55132418c1fbf19826df6154dd30b4c8cc247
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/59203ce5e1ef18c1f707b7882c1774e21411be40
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/6b0c204234a5ed778980305d137071bafe65bcf4
        i586 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/40dbc20a3af66a774acb21cac2c9d40d24cbed3b
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/b2ce32dff67a3222df51cf35c646f55c50bd2993
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/46e16eed7cadfd813268167bc07294ca898caf74
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/e173942408be29cbc30bae59bd49d942576d8d41
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/d237c0dcd4b56ec7ba2887c14fef801d655d1c31
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0c3852e95bad898aea0ad1f880706b07418bbe86
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b25c9661585291da499dda52fa381dfa13a52fb7
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/03b422889a4189463977309fe3b1a2eeb10539b2
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/33388ac27c220c71f06b76cc06f058db0493ff62
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/2c20ae0b1ceb0e496e196295487a95747c10131e
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/2733ac8345ceb73c5061c31e0f4ffff0f845aa4d
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/4e4b98eb2e6ff8c61334e6db8d22da538b507c67
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/950e0872fbef4e7575ac017feae7b9f1fe0325cd
     aarch64 |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/8efcbe153d6de90333fc411b9855b1effc2a4f4b
       nios2 |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/5d3157a51b738ab0cc0cfde8ccf8b3c9a82e3b9b
     sparc64 |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/752d3b29186e13bb9d976808ce2ce694b5437899
     powerpc |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/fd00ffba04e7738832521be9a568f14a469d8738
      xtensa |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/5b0a0eaae974722e883afa78bd27f5ff5f3f169c
     aarch64 |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/61e309ae631da93928da5608d0e538dc9c8b8884
      x86_64 |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/a472d9109c465c0ce0920d05d4db7ba74a583d31
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/140d0ec9d94f75453c4c82e18803c8d7bffcf6be
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/792d4475ad699ba408aa99d1be037ef72d49808c
         arc |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/697412b29bf031bf8f246cc3af97ebcbf6bf6d1b
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/cc1805fb5aefaf3d0a922ea66f5ecd95d8de905e
      x86_64 | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/43276b6a54e42e3d2f5e4624b338bba681c3a409
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/657d762b9c0e73ac705d7455d7cddcc138d927ac
      x86_64 |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/ae0fbf347ad0c0324e5fe862e52373f629fc9a0e
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/459165e4be7849b8cfbac02e462bfb46c95cd116
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/19d67dd43e5a313c77e4be97ecb9811ffa52f797
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/68c73e997270aa9df4a48bba7299ee0f9bf6ad91
        bfin |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/a45006fd5d9a13d8366d439632203b1e64c8d70c
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/84b95745691d0fa52ff44542a910d5c59a7e0f7d
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/cbb5f5312135beca9189af391897006885ad7834
     powerpc |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/0fea3af9ecc8b63461bbff10423e98ee2d7b6aa3
     powerpc |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/1e4b6748a59b92c37e2be8c7a2de0e3f60e4c1b4
microblazeel | utils/CMakeFiles/testpat.di... | TIM | http://autobuild.buildroot.net/results/fb97d7e1800d7daf1be2e0143e22315748b8d83f
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/6b5736dbc4087d502c9c697ed05fe20c1bb4a799
      xtensa |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/38ed8d932e8513bfdfc09aefde4c531aa61cc40d
     sparc64 | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/bfcc42cb43bb0a4de9924a76a5bf54f2895a1faf
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/6319cfa209e66ae2c726424fd0e7025a7423afad
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/4b37b44e3fc97032706b8c994e563942b231eec4
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/cb012ed732237d0ec658bc0e483faf55b4743c2f
         arm |                   xvisor-0.2.8 | NOK | http://autobuild.buildroot.net/results/62f81d5c75eeb21271723011b05fe7a9ac6a0737
         arm |                   xvisor-0.2.8 | NOK | http://autobuild.buildroot.net/results/777bfcebf5fa0e638b39d838329706e977156c78
      x86_64 | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/090693d73829891f631f61d24247adb40271fb5e

-- 
http://autobuild.buildroot.net
