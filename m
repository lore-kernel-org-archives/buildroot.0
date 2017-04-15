From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 08:28:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-14
Message-ID: <20170415062819.52B1A20858@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-14
================================

      successes : 201
       failures : 69 
       timeouts : 0  
          TOTAL : 270

Classification of failures by reason
====================================

                    mpv-0.23.0 | 29
                busybox-1.26.2 | 5 
                   trinity-1.7 | 4 
                 xenomai-3.0.3 | 4 
               hiredis-v0.13.3 | 3 
           uboot-tools-2017.03 | 3 
             bluez_utils-4.101 | 2 
             lttng-tools-2.9.4 | 2 
               acpica-20161117 | 1 
                  arp-scan-1.9 | 1 
                    ffmpeg-3.3 | 1 
                 libxml2-2.9.4 | 1 
                  luasec-0.5-2 | 1 
          mediastreamer-2.14.0 | 1 
                    mpir-3.0.0 | 1 
                 mplayer-1.3.0 | 1 
                  ntp-4.2.8p10 | 1 
           oracle-mysql-5.1.73 | 1 
                     php-7.1.3 | 1 
                 phytool-1.0.1 | 1 
                      qt-4.8.7 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  readline-7.0 | 1 
                rsyslog-8.22.0 | 1 
                  samba4-4.5.7 | 1 


Detail of failures
===================

         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/d969108d8f10c7ddd3902fd5ae0e0f1ffc9b3001 |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/088aad92dcd811de6858f9615288b75e421a1d43 |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/52b5edce00b459994cf588b42411c84c87b468ec |     
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/e8f821f5710b46f7504681e971e26ad57f891b72 |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/daacd0cbc7b0b5a95017d12d754ba4b350c97e99 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/38a0776704605c3fd2a005993572429bcba971bc | ORPH
        mips |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/3eeee1a87994572d8341de626ed5f4171e4285e1 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/0c05b76b2cf9de14106247facfef5bdd0c0e6b85 | ORPH
      mipsel |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/5d1dfc212dd4407d87f2e76b12d4b89ba2a97e59 | ORPH
     aarch64 |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/54504e010b753462dbcc8867beb1fc6c3d0f3dde |     
         arm |                hiredis-v0.13.3 | NOK | http://autobuild.buildroot.net/results/9cd3aae9170ea446c066bf93ec085fadac01ed03 |     
         arm |                hiredis-v0.13.3 | NOK | http://autobuild.buildroot.net/results/3cdcb56e2c39a416390091713e4a6992db6fd82c |     
         arm |                hiredis-v0.13.3 | NOK | http://autobuild.buildroot.net/results/6be8024dd664af83fcf49ede29c8ad59a37f73d1 |     
         arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/e712ece1df1ec2024106be83cdb6e0f5e0ecc911 | ORPH
        i686 |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/9ea00d5f609f3f8034b66b2f427733bd0b1f6268 |     
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/63af9146cb9286749385026296eb0008b3d22b9c |     
      x86_64 |                   luasec-0.5-2 | NOK | http://autobuild.buildroot.net/results/8c4c6f726bbfee023baab9bdce4a0fde230ce6a3 |     
       sparc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/3ac3dd6c2938086fa91365d7addfdc2e3244ee4b | ORPH
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/512fe216197b9459f4841ca3086c5aaa051b3779 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3595ecde95fba8e92dd6b558c1ba95b2ab7f9096 |     
    mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/a959e2957b9e06e3daed9bb71a97bba0ba456d88 |     
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/52347c8908cd8e4430c6cad8863a655f8ad501a6 |     
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/fa41604be80894e5069e0b2b34e5a639148e7904 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/1ca53e500323f91278d23194dda6bffaa43ce598 |     
     powerpc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/41a4a64267ebd08d0858e087409cf4517de810e9 |     
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/f14dd1c5528c6acb2c076183e54d2a2d72ac79c2 |     
      xtensa |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/da4119d423ab1dc0299644958c18eecb37b31267 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/e6ebbdc31b13b3ad5f6e54c0d9934ee7d172304e |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/0d1f7ba88560de536eafcb9650eeaa13fc135b5d |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/2ec562a7268d2b3c88b38ee523c58ef465efe709 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/3d6b8fc33b5e377e458000b08729f7fa304d73b4 |     
      xtensa |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/999a3982c16547971c968d242934d10f7b10eb9f |     
         sh4 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/de123520091422d4c78f38bc4e9417c86d3367e3 |     
    mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/4f6a4aa653ef7cbbca8bd2a1d3d3e7aef2d652e6 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/1ef6b510dac904bd7482cd0f054b1a898a920b43 |     
      x86_64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/cfb9a7418422e4c62a0a32d8d6f1359a6141c4af |     
     powerpc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/3e8be9cd60d71002ec6aa8f4f058e7bae66f89b8 |     
     powerpc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/328048c5c3abe1c67d0c8584c16360b1a76d9410 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/d98fae40b6fc8c6bf1fd1515cdb6a0973b01d310 |     
    mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/195e584c74bb65faea37444b944b7a5ad0abc9bb |     
      x86_64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/d4d6b1a2d397cd425e8744b4c3b4c35ff6c85e68 |     
      x86_64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/8a79bf9b0b1b27a0cd4c147f00f72712c68152a0 |     
    mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/6afee0ba9c0296dc01ac0605572514abb25a647f |     
     powerpc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/cee846beab486ffd8d6654713812cb94b23d126e |     
     sparc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/e47b09a74a8d10f3b8c5246356a81344ac114196 |     
      xtensa |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/c99e7f31d91c2c0e7cfa0f45fd90ef27c99a0578 |     
    mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/1587bc340e91c08541e4ebad8f156d9ff350e2f2 |     
        mips |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/1ca0e67b365e98bbb8fe3933ac941de5f1bd40d1 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/ad80cafeb1f703ceb83797d314f942005ef770cc |     
      mipsel |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/2638060758395c83da8c3ac4abdd03525def4707 | ORPH
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/9ca6eab03f8a0faf7c5194bcd486cdd5a1ede1d1 | ORPH
         arm |                      php-7.1.3 | NOK | http://autobuild.buildroot.net/results/f39c509df01b5554bf4f5cd7724e95e7c3038c03 | ORPH
        i686 |                  phytool-1.0.1 | NOK | http://autobuild.buildroot.net/results/e0eebcb9a694cd5d4c76c40e5dba971e3ac9d7c5 |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/aa5cd4038fb16bec816eaaf3f76767ba7e5e4198 | ORPH
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fc0a4f26faee0ba3cb76b7573b0b27e212a6b98e |     
         arm |                   readline-7.0 | NOK | http://autobuild.buildroot.net/results/9a5c58a19c98a718f3e6c22e475783083333b254 | ORPH
         arc |                 rsyslog-8.22.0 | NOK | http://autobuild.buildroot.net/results/261c50598d9b163e449a34902fb90da834309ffa | ORPH
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/7762c7c5fdd59d40727cab2b5530aad47674ce7c |     
      x86_64 |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/b627b406c3db06135043e557e21dfa44bf03a729 |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/a5391fc272f99b80974582ea735d764db8dc8e9e |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/2ae76fb61d017d99653d57807cb62c4d8c91ff4d |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/a6f858c49f57a2254385e8639fc97f68acf72b49 |     
         arc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/01504919116ad98851da40475084efa5bdd7b356 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/e805875ff7b5291bce12d8146372cd32ad56c4fd | ORPH
     powerpc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/4337cce1f4421fa499d7a650e214b93a0a38c80e | ORPH
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/6179786f685087d829962e2275ff5951109bf84e |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/5a2030c66f087cfd78578ec9f39cceff2098eae1 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/97b813ff99e0c6252de7097aa95aaa987e28ef9b |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/feac5195da706c50ce897933eaf688b93832a384 |     

-- 
http://autobuild.buildroot.net
