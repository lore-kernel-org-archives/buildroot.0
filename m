From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Dec 2018 08:00:31 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-10
Message-ID: <20181211070031.D7C9720DDA@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  44 |   2 |   0 |  46 |
   2018.11.x |  37 |   2 |   0 |  39 |
   2018.08.x |  29 |   0 |   0 |  29 |
      master | 137 | 124 |   0 | 261 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                libselinux-2.7 | 1 
                   mpd-0.20.15 | 1 


Detail of failures
------------------

         arm |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/6a8a56a99fd154e6401ebb5e3b5ee53085382b9f |     
      x86_64 |                    mpd-0.20.15 | NOK | http://autobuild.buildroot.net/results/c3439f0eba4aca2ba0d012c768d0f5143467a7d1 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 2 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/41ead9f435c9118b41d860a528e23e6acf96186a | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/5cd15c73c855ab08ba124640646f66a0829d5917 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 acsccid-1.1.4 | 26
             bluez5_utils-5.50 | 25
        glib-networking-2.50.0 | 13
                   libxcb-1.13 | 13
                   ccid-1.4.29 | 12
                      iwd-0.11 | 7 
                  ffmpeg-3.4.5 | 5 
                 dmalloc-5.5.2 | 2 
                    php-7.2.13 | 2 
                  dhcpdump-1.8 | 1 
                  grpc-v1.16.1 | 1 
       gst-plugins-bad-0.10.23 | 1 
             host-grpc-v1.16.1 | 1 
     intel-microcode-20180807a | 1 
              libgeotiff-1.4.2 | 1 
                libmad-0.15.1b | 1 
                  libssh-0.8.4 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                   libva-2.3.0 | 1 
                 mesa3d-18.3.0 | 1 
                openobex-1.7.2 | 1 
              pcsc-lite-1.8.23 | 1 
               qt5webkit-5.9.1 | 1 
  vdr-plugin-vnsiserver-v1.5.2 | 1 
            xapp_editres-1.0.7 | 1 
             xapp_oclock-1.0.4 | 1 
            xapp_viewres-1.0.5 | 1 
               xapp_xmag-1.0.6 | 1 


Detail of failures
------------------

         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/6a4e0e5c3a5f5ad22bc674eb44400521a1f7056b |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/2255dcb8dfebec5680f8263543cd0916a5e8601c |     
        m68k |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/442e283f3a0cdbba6c593483e1484b8cfbf66652 |     
      x86_64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/ac0dc1163c6517f3d05e2e180934605013b62a33 |     
         sh4 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/395245a13c00d6d1ecb06b717d07fa22d13ddd34 |     
         sh4 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/b2656025568554702335204b7a62ea4447801123 |     
      x86_64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/38560cc1cea20d946fbee0b2f3fe72b5b125b949 |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/f1ab32325f3b37d38af8fce53d70d9ff4f54dc8c |     
     powerpc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/32669eb7eb38f12948bfacb4e16a3559b8c4d050 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/2bd8b49dd03c2bef0dcf0cf7124dcb5cb2f42592 |     
        i686 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/b300da23db177dc300897bace8172a366673e56e |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/f8d36d0e44ead5900aee870e08ab50a5f243308f |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/71e2e35618e8a52609fde5649cd7053f291a41d7 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/ff066344fe4abc61bcab87b785cd6dcebbf35fbd |     
         arc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/39f8bd704e936f70911cccd14518b1bfbe303a65 |     
   powerpc64 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/439f1b5a41b71161579ad9de609a2aac72fe07b9 |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/0920abf77891456e3248b91549b53e6ce8702f16 |     
        i686 |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/54b92d6b0ba954ff8f743eef8fd8a461e094bf8f |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/e49c8bc6a7628110cf99119294a625e3af548ac2 |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/0b1603799982d51b43132e5ed8a3f641694e140e |     
  aarch64_be |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/21735185fbefcc2f3743d0a317a8b2a707e7da53 |     
microblazeel |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/4d4c1ba7f5d00d1b927ac01ef9851468abfbdff2 |     
      xtensa |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/8a3ec1380fab39b3d3eb2b4f44b3a207c104032a |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/0e1d581df38f07732d3e331b9a893400414af963 |     
    mips64el |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/ae950613b83bb21b71cdb9a7bac231645f73b90e |     
         arm |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/92686335eda7a877dcb64573d9a7e33aa7f26fb8 |     
microblazeel |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/ea09a787511e59b38e421d1cb5e33c2c925aeb78 |     
     riscv64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/eef55512858f9205c1373f099523c73dd0943702 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/9a72040488bdb8acf0a10e645cedbf831fecf42d |     
    mips64el |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/76273458c80d7f59260e750b6292fa02e1121553 |     
       nios2 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/f97ee55cfe397a14e4df80b992ed6ad554dbc3ce |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/fc5fb30f8d92a78bac13979be12da79a8943b9ae |     
        or1k |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/9e463cf0a2cfb858b32d8af10503903d26653e1e |     
     powerpc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/5baa98c46ae6948f09cd72af1949b59f425f0d37 |     
    mips64el |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/cb8a857c00f6f2a62fbd9b843833118c6641559c |     
        mips |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/5e876ad95d065d78975f153ec168632648ddaa79 |     
        mips |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/8fccea575be2bdbaa83379c1cced260e4b6399be |     
      x86_64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/0bca3662ec8f2bcb54f81b6268899edd56855148 |     
      x86_64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/a8e28308bce2c90fb877f0c91b7346cca4860c79 |     
        i586 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/9c0c70e4544999343d72a40f65677c9e93cf9bdd |     
    mips64el |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/4c658bce96f862f721c48843cdd22a3343e94645 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/19407fabb5c4180fb3a9d4e656375070f4cc58e2 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/b3835cdd585a51d7e02af983130a9a710bfdacd7 |     
     sparc64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/2fa829b5ba276b8258f2027bdbbd9a094d65f2ab |     
         sh4 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/6327222d0169a32c73457edc0fd24ca45054296c |     
    mips64el |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/becba53158cdbdafed4a121fbd2ef786c1d6b8bb |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/10eb2a2505928b585076cede38bf50507887951f |     
     aarch64 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/333b3c2a2a9c1cf609f7168d400258bd470c40d8 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/7f3380ad1f0167417d87ab891a7aee133f857c89 |     
    mips64el |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/6eaed8e494a63056316d9ca375523d066d3ed3cb |     
         arc |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/3cf2c217d4f1f2c6cbe85cab758121b71c6bde91 |     
      x86_64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/6fa19a5e19f7ad00f43c74cda7c173ba3bc0e1ab | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/5dbfe704ea0824b01559d5e7ed12a4875bc447e1 | ORPH
        or1k |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/c9faa927b37d011d98413bcc6b75e30022d8d72a | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/1f2c74f3522175a1230cc40e4d0763c77e71cdf7 | ORPH
        i686 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/e90ed412199087e0e3a8446a794b4990e40414dc | ORPH
      x86_64 |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/b59bd1b2254f3c083f1b524f47eae125ebe343c4 | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/0e4e45a0b98996c25b12678c1b8746dfc8a2339f | ORPH
       sparc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/0142a03fd0ae80515c5ab656326b67b10eca4a14 | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/4b2c680f514c70c07f66300202fed6f004a4a60d | ORPH
     powerpc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/e91e083c3fff23e11a1fd80154a7d946cb5768e3 | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/f54529899cd520d8d0951ac951865a419d8cbe10 | ORPH
    mips64el |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/3cd6629ebf525ed2e6232e56cf50b703b875f757 | ORPH
        mips |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/a0c24d4dd706d85923f70ac24202b1fc4e042aee | ORPH
        mips |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/9a246760f872ffd10f2f13e1982e41594fb8f550 | ORPH
     powerpc |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/868664973a6dbde2318a4e5c7790f02a8de3db89 | ORPH
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/26b89d58d25ee468099e02e5e010ee0424324584 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ece7b41fe70c5c91017e58342fa198903e9b5f85 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/216505cd1f49510ded2643889d3718f765275d51 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/03681c4a5585531136cb0d81741e1f847f41da7e |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/75bcce20dd0dec2fad99eaf4ea06e7d7a9ad0964 |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/82f19f9a6ae1aada5e5704509c089e73bcc1444c |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8e36c4e2cb2c1052163e569ec2c85181c813989a |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/68856973fa01b1dbebec0601b4b14e7cc23ded57 |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/45d18b760b55ae3f6d6da669e5bc3c230d08f891 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1a8f420d0565954f542c82d36d517827f92d69d5 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/abff081e1bd20c8fc4c4ee3904bb8d4344c763d1 |     
     sparc64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d0e8f2a8e308b570f24515eaf009f35b87192f5e |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/df14776a815e94b1be8981ce7bb7a13c26aa4675 |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7bb648fc8a9584db8aca4db98696d3574ad41941 |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5d2d3c211b9e169cea77aa84f5c48c1ca5a2eb60 |     
        m68k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ae49b9649aab6fa68dbcc0bc543bcbc7cfe24758 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4146eed00411b884223cd9c4893cb883dbdd5106 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9ccf9754868f412afd2ecadd72897004c67e2703 |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/1c09c37bf405c9ca3602e83435e86a4c7fdb1dd0 |     
     powerpc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/1a0ebd8196a23b375e0fd73482a90ff67730e52d | ORPH
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/55a56c954f059dd33f8198acdbbbaf3ba8a8ad06 |     
      x86_64 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/034a525cb9b4452f0baa0d033277269fc2f055db |     
      mipsel |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/5b77937b4aadf988afb6268ab7f74fd480311364 |     
    mips64el |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/c99d26969dcd5c82c01991881ec7f5a2dd9517f9 |     
       nios2 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/bedd4958216c52518b1a7314b5594a2ab7e78cef |     
       nios2 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/e912125bd2487288f4736ffa6174caecdb477be0 |     
     riscv64 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/45905240f92b6152a7d0debd139f321776aaa49f |     
         arm |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/6db691df39ab3c05dc57c9c9ceb3980b5e6bec06 |     
         sh4 |                       iwd-0.11 | NOK | http://autobuild.buildroot.net/results/1e21461e5d6bf7911a29cddb8b8dd72743937fb0 |     
microblazeel |               libgeotiff-1.4.2 | NOK | http://autobuild.buildroot.net/results/7f3bff7ad1e9a8264b6604d6b8a4cdc8c779ace6 |     
     riscv64 |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/b120de339fa58bfe51ce02b56fc1223cffbb1d1d | ORPH
      x86_64 |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/41490ebb181762d14c565effb0155db7ac1e0db0 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/0fb877762574db0b8b7ba6e930d9f89e48c78b79 |     
        mips |                    libva-2.3.0 | NOK | http://autobuild.buildroot.net/results/6c549f6c9e371a0797b8b49433d48d8983714f20 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/d9fc1d7610eee7d56fb18e35412260cd9d1eda8a |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/36a9de43e95e4066527d12f578f11a4679a7fa8a |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/f42c024762ff4a518d68b0bd15d801eff9fa2e89 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/fe732fc1fb12541c453bff2de40a91f4c9166ecd |     
  aarch64_be |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/487be41b9a5a4b628f46a1d37a0edd7238be6e6e |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/8dfb7da6465baba20fc2ce9f6c22ff39f255c058 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/9de95720fbc8c17c9efb2de1ca88c0af350bcb54 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/0f0083a6db3ec0321a31effcbbfcb2e9975ee835 |     
         sh4 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/6f28888e4e013f68e1ab4cafb4d95b4383d259a4 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b95598447df0fd3230c2ec4b301a449ff5842ca0 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b94350d474405186cb427488480a37c00f483e95 |     
     powerpc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/19b5f2b8f49f46a4d982ea33f321ca744644f15c |     
   powerpc64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/41b1e4dd342dabeb1444c6470a8d026a1d1fb48b |     
         arm |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/9f8d08494c368a937fc10bb61f1b26fbfb7ce412 |     
     sparc64 |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/ec6b733029385d2df1a69dadd9c60b934714cf23 |     
         arc |               pcsc-lite-1.8.23 | NOK | http://autobuild.buildroot.net/results/8f27c359c69e7d27eee2d615122141ec35107526 | ORPH
  aarch64_be |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/8a5d5af5b487b5b71543e9e4034e6f362f2f0ddf | ORPH
     aarch64 |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/a925b1126473bbfacfe4d29551ed1765ca68adbc | ORPH
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/f7559c618631d6d85afe24c4e5ec99615f9ee421 |     
      xtensa |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/ccfa5074a4eb73be4853fdb733f2846457f7dc39 |     
     sparc64 |             xapp_editres-1.0.7 | NOK | http://autobuild.buildroot.net/results/5f46a3ab5505f5b07f1aeb5cc1b6fec1edd96129 |     
         arc |              xapp_oclock-1.0.4 | NOK | http://autobuild.buildroot.net/results/d7859c1668d61a248e5986237f7e38cbabff9392 |     
     riscv64 |             xapp_viewres-1.0.5 | NOK | http://autobuild.buildroot.net/results/55ee30b72a036bf145260df6fe5a9b547d564467 |     
        i586 |                xapp_xmag-1.0.6 | NOK | http://autobuild.buildroot.net/results/37dd630639a0d76e8121b3cca9e0e1f305ad620b |     


-- 
http://autobuild.buildroot.net
