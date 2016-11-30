From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 08:30:01 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-29
Message-ID: <20161130073001.38A99207CA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-29
================================

      successes : 162
       failures : 31 
       timeouts : 2  
          TOTAL : 195

Classification of failures by reason
====================================

                 libnss-3.27.1 | 3 
               trousers-0.3.13 | 3 
                 libraw-0.17.1 | 2 
python-libconfig-b271c3d9da... | 2 
                     vlc-2.2.4 | 2 
             berkeleydb-5.3.28 | 1 
                bind-9.11.0-P1 | 1 
                  cppcms-1.0.5 | 1 
                   dante-1.4.1 | 1 
             host-boost-1.61.0 | 1 
                 jack2-v1.9.10 | 1 
              libarchive-3.2.1 | 1 
                libcurl-7.51.0 | 1 
               libdvbcsa-1.1.0 | 1 
make[2]: *** [CMakeFiles/ya... | 1 
                   mpd-0.19.19 | 1 
                 opencv-2.4.13 | 1 
               openldap-2.4.44 | 1 
                 openssh-7.3p1 | 1 
               polarssl-1.2.19 | 1 
                    qemu-2.7.0 | 1 
                      qt-4.8.7 | 1 
qt5webkit-b35917bcb44d7f200... | 1 
              sdl_mixer-1.2.12 | 1 
                  squid-3.5.22 | 1 
               tcpreplay-4.1.1 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5e1d2ce1d84790ec9207982ba0bf8aec38227a54
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/24bb48fbce296169087d61bdabf5a8c2ca6ca848
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/0978b1850f30a140d4a957dce93432c12abf57d7
      xtensa |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/326c8607b814fc883ab62fca698e017dc6b5dfc5
      mipsel |              host-boost-1.61.0 | TIM | http://autobuild.buildroot.net/results/836c546ee1dcf4e208dfc0ed85e1ecb7811b28f6
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2f0766f937e4dee9b1e41f6f4283272748909cb3
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/1ce3f53bc1dba5844a8858f7d5008e856a7948f4
         arm |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/504a6f51858a67ab2833ca2417aea2b123478610
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/afc2c3fe42cd871a9432a285f7c2fe56f253e1ec
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/680296aa947447f9842c9541d9150ccf9f09cc42
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/7970ac3b9e685e7def7e65bde7b1b79a2b3ed7a8
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/9da9dffa2e5f0f7d21af88d6010072c000c085c6
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/d0cc5175d6de06b3ac53868bda55984cb0a3f4c5
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/7789e49f4d7fdee0682d9e4166e8d09be0ca9594
         arm | make[2]: *** [CMakeFiles/ya... | TIM | http://autobuild.buildroot.net/results/33644f958c55ad8e099784f15cd394a2fbcbdfd3
         sh4 |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/ec8098e0df04fcfc392cdc43b9a69eea2397c457
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/323188a59cfef3f749f4dacf61251c84d437d74b
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/7f264d9eecd93ecdd0e46b8b7a00a175f5ba1763
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/6e40fcf74d9794a267ad1d104643c0adcdce9d04
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/2e35e30e370cfacd9a5a06194c4a0f295cb65f7e
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/7dd4f70be7cea0e79b2ab166a3a6f7a252444d74
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/55dfdf02e8e06e6aeca4beaea25361cecccc46e2
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/f8dcc83b924abdf0540bf86b70dc285a7b6ea0e9
 powerpc64le |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6dbe759d39a11b1907fa220de0f0292a35b99c59
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/167352caf76469e2957a454136b44d8fdbb5d845
         arc |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/084c2990d6d37637b694006d3b71e23daec66a8b
      xtensa |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/5eb62a4721952f5c0c60d7bf8a7ffa210577ea35
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/6c2809f9c564d3c4d2b47eccf0fa632246cec4a7
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/5ed1c695a77b6a6f63661de7b7fab0587752dde0
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/06fa0d5c2471f7c9b9af4fa90e05a47ce0203187
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/486ef4d79fe0cf8dbae39cdbc7724bc12759abed
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a457652468a58b715f66413e683b0b0e17565eb8
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f42d4862c37e24565c6816374558ac11abd5558e

-- 
http://autobuild.buildroot.net
