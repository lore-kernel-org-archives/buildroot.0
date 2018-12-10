From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 08:00:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-09
Message-ID: <20181210070023.7542C207D4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   1 |   0 |  30 |
   2018.08.x |  28 |   1 |   0 |  29 |
      master | 196 |  52 |   1 | 249 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 


Detail of failures
------------------

         arm |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/be8774ddd8635b655325aea220b62afe594f350c |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

         qt5declarative-5.11.1 | 1 


Detail of failures
------------------

      mipsel |          qt5declarative-5.11.1 | NOK | http://autobuild.buildroot.net/results/6798bd3861744df0bc987a1d7b93777a45a14537 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   libxcb-1.13 | 13
                   ccid-1.4.29 | 6 
             bluez5_utils-5.50 | 4 
             host-grpc-v1.16.1 | 4 
                  linuxptp-2.0 | 4 
        glib-networking-2.50.0 | 2 
     intel-microcode-20180807a | 2 
                   strace-4.25 | 2 
                supertux-0.5.1 | 2 
                 acsccid-1.1.4 | 1 
                 dmalloc-5.5.2 | 1 
                    efl-1.21.1 | 1 
                   eudev-3.2.7 | 1 
                  ffmpeg-3.4.5 | 1 
                  grpc-v1.16.1 | 1 
                  libssh-0.8.4 | 1 
                 mesa3d-18.2.6 | 1 
                          opus | 1 
                     pcre-8.42 | 1 
                    php-7.2.13 | 1 
               qt5webkit-5.9.1 | 1 
                     squid-4.4 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 


Detail of failures
------------------

     powerpc |                  acsccid-1.1.4 | NOK | http://autobuild.buildroot.net/results/45cddb8193097c3b1757e2f8a11f27defd0c60d9 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/0e7faa112a2d600148e029f406340b11d816a934 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/febf729cec1d4a7439ab6b1905482c4d97b26171 |     
        or1k |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/86fe15751002aadf92388f55484727115770c5c1 |     
        mips |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/41e2815303e4a4bd952c52e9ea2cb76d96d23e6f |     
      xtensa |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/11af9681afab32bd310282db89741b4b7e15e80b | ORPH
         arc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/d4ab276e7d55e643c098828644bd629feb896e39 | ORPH
         arc |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/ff0516abb70449adacf13f0d83264cbadfc545c9 | ORPH
      mipsel |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/1078624b139e5b62ec1195c0714eaf5a5829562c | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/ae0dcad3458387a4ae20dc2dba3c8130dd548a91 | ORPH
         arm |                    ccid-1.4.29 | NOK | http://autobuild.buildroot.net/results/d22af48b282951491c821b5b898faf89f6971193 | ORPH
      x86_64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/9b54e0d278d94e270fb79e8991ef57a946b89e30 | ORPH
     powerpc |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/9f7d118ae69b08f3dcb226c007212467c602f480 |     
        i686 |                    eudev-3.2.7 | NOK | http://autobuild.buildroot.net/results/e9d94084be8ed3296ba63cffdb9d69ffcc3b7140 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/c618a7456c79ba67ca54b01423aea59b9074f85a |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ff641f9d1be81d22aaa9ceb85570deceb93026c6 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/6a73052a2e34ee898d127afb6c7a5ff5783f7ddf |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d5b96c142d2e2ebf6bc1a293822a209d3fb4a2b8 |     
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/3c984494a003a9b9c6b40ab4d7a9a1559fd40443 |     
   powerpc64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a0eb5dea423fc8608cf09da3f0b73f9f0303d018 |     
        i686 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/06ca4f10ca2af8b90662fcfd1c589bf531a36c84 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a0d19f7374e3816bc48cc1c3feb115b6dde34f64 |     
        i686 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/77ce1d3649b14fea3b1bb46aa5335825e9f9d4b1 |     
      x86_64 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/c8b891017706d90c6828ae477b174e1aa7c43e62 |     
         arm |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/3a6395fd85f434ff855d602949166d5cec725c7e |     
         sh4 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/08a609808963575f095fc66a6d849e216459e48c |     
       nios2 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/0ee1860652f59345a25d399b36a9d6b4af10de7d |     
microblazeel |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/78577394e8e08967db5fa9133b296311023bc514 |     
     sparc64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/e09a52f43ac7b0cc4bd0d92a5198a422a609caf7 |     
     powerpc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/1033c673e1415175befd64320d657d8cc7898cb1 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/10b48ffd966004013f93bdf00b418c3c830e9302 |     
     aarch64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/1752915119b795c916d75594e51a7c79126afd5f |     
     riscv64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/f7fa031f117da7eb68805da4f4627d328e151a5d |     
         sh4 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/29e9881d9901d34976518e6b7124ad77e6cabc42 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/0d665f454d64f72fdb0434b37bad4d242119e842 |     
      xtensa |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/f471e451f46e669090b5c9cf8c37f886a71df188 |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/39fabd3d0330a49333c211c4353b1035c425796d |     
     sparc64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/7fb713016f0f88ee3e7d0f0e49274dfacc6aac6c |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/051a567afbf72ad4e47e0a044154c9d1ddb71fba |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/d36d0e20a90bc22b30fe3af86d083b4cd049ec38 |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/77dbcf5d64645777b97cf5313c69448352d39f78 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/720747e8939c7e89c85e59c08217aa9872b2b119 |     
         sh4 |                  mesa3d-18.2.6 | NOK | http://autobuild.buildroot.net/results/7d6247f6daf554dec25b1dd8b63117058602db52 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/1a50731d5eccba6471716162c94399b220411258 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/07465776c3b7242670563e6428d5c66ee71eb465 | ORPH
      x86_64 |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/f24f7da7d729a3633e47620377fa67c09dddaa06 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/2f94b3cd3812761fcb7949987f3d23e1b504d5e7 |     
         sh4 |                      squid-4.4 | NOK | http://autobuild.buildroot.net/results/b7c26cfc6073e99dd931f075604be37c8e65f595 | ORPH
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/31c0061451388940aae6b054b52ce6dd145981b9 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/14ecbc96b7c83448b3f4e74661adaf8c6d47908b |     
         arm | sunxi-cedarx-b8f52d913f7372... | NOK | http://autobuild.buildroot.net/results/deadfccf37c1055a92967282be4c523b93408f0c | ORPH
         arm |                 supertux-0.5.1 | NOK | http://autobuild.buildroot.net/results/21dbc048fb3a1eca5541a2afa44e65bc3d993317 |     
       nios2 |                 supertux-0.5.1 | NOK | http://autobuild.buildroot.net/results/45cb799fd3efbc57c6f260a5c23134107679dcd2 |     


-- 
http://autobuild.buildroot.net
