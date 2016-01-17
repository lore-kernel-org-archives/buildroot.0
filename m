From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-16
Message-ID: <20160117073021.D37AC10186E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-16
===============================

        success : 192
       failures : 84 
       timeouts : 2  
          TOTAL : 278

Classification of failures by reason
====================================

                  boost-1.60.0 | 8 
                  libffi-3.2.1 | 8 
                   assimp-v3.2 | 7 
zbar-854a5d97059e395807091a... | 5 
                  ffmpeg-2.8.4 | 4 
               trousers-0.3.13 | 4 
              luabitop-1.0.2-1 | 4 
host-vboot-utils-bbdd62f9b0... | 4 
                      qt-4.8.7 | 3 
                   libnss-3.21 | 3 
                 opencv-2.4.10 | 3 
             bluez5_utils-5.37 | 2 
             util-linux-2.27.1 | 2 
                  connman-1.31 | 2 
             host-nodejs-5.3.0 | 2 
               libcap-ng-0.7.4 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                   nginx-1.8.0 | 1 
                python-nfc-212 | 1 
                   mpd-0.19.12 | 1 
                moarvm-2015.10 | 1 
                 mesa3d-11.1.0 | 1 
                  ffmpeg-2.8.5 | 1 
                    ruby-2.3.0 | 1 
make[3]: *** [code/CMakeFil... | 1 
make[6]: *** [libavfilter/a... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    glibc-2.21 | 1 
                 libdrm-2.4.66 | 1 
                   glog-v0.3.4 | 1 
          chocolate-doom-2.2.1 | 1 
                    unscd-0.52 | 1 
                    pppd-2.4.7 | 1 
canfestival-7740ac6fdedc23e... | 1 
               lighttpd-1.4.39 | 1 
             stress-ng-0.04.16 | 1 
               tcpreplay-4.1.1 | 1 
                iproute2-4.4.0 | 1 

Detail of failures
===================

     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/042d711af060b68055b1b092dfcfeb26f0f7e929/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/cf79c4ffd02144e3eac73e59f94f4137cc56ae56/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/db6bcd1b6e45d581d7891c105482db0cc14564aa/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3d7f9e0a639d9b4923975352e31d86499ae9ec24/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1fcd7668ec6c2fac5518ebf9cedd26b64ab37508/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a4115e92bc0a7ffa5646dfcbbe83ffdf97376575/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/8cbd6891771353d3240b1965dc67aca743ed25af/
       sparc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/461f011ae8faff1db4941ece9ed2a0af35d8faac/
     powerpc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/b5546b421c6acba7f73f5a3a093dea6b14ef88fb/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/70344cfc431ac0a6e03a64f136d40a89e8483502/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c8ab78492c5c39fa9545f3a03e4916a60958f516/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e9e761149ef43bbb4235b56f9adea3e8ff6b2dec/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3ab2e66780ec5088530f06486a72085831f2e5a1/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0dec3025b54e14c9080b179f0e8c6e297b0e2d1e/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/08e1f06aa899eddb2d343a0585eb233530957fed/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fc8d9bd3c5e5777c616ad2ee19aa68167e1b1d56/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/817dd12688bb6c8a5df25de719d193ff4c684d6d/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/f997fc98f84e52188dc991672ff5d9bd66eb50e7/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/cbcf408906e55acc0d4cc00689478aaea05466dd/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c9f146e5cdc1fb7c54b9c4e2186bef1455b74664/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/223bf0f1a408e876b9360e7865dc1e917a834fe0/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/7c057c282fc1e4dacc3836030727f175f68be628/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/ef40d3230aa8406c74b45a345ce8709a78f20c5b/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/4b091679fc69f2a10d49eb98654d6923534e6986/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/6cdf361850ba17873d286c05af14cf3819213802/
    mips64el |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/277a325fe0f7dc5456615dba6d6eeded240e6ba5/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/01964187309c981096e917b8ec0ad2605b728646/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/59f4bc971a7f4a8880536ecdd76d45aa7b23719c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/ebc72aa4e4436adc2505642807e84af544a0dfae/
      mipsel |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/9d6b384bf65e77530676454bc62bd46fc732e1f5/
      mipsel |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/b0512d7b3516b57eef65f97ec3b99e61bc4acb83/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/68d00f6fb32ccf9072602d6218d014282ef0bd17/
     sparc64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5f63b7519bb77e648b3890a1058386be04b76ff7/
     aarch64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/18258328a6196aa8056efffc0fdee616fff00274/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/19e4f3a4ed4ca0705b23517c9d51fd926d870f71/
      x86_64 |                 iproute2-4.4.0 | NOK | http://autobuild.buildroot.net/results/2b422ff193be6039fd55449062432f7c3868d528/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/988bd189bab37a03c037160d6758774d4aa6c8a0/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/dcbd60f0e0192dd2717518ad92891e5709b8e1ea/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/8c4f9806b46825487773a5ea7002e9567078cb4b/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/03dcf96e29e454fd8dbdff5c9ce404ab0a4cca9a/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/9801517430b7fb69a9238d65d13f8f702350b9b2/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/66b9fa1c4518d7e35ab0d09ea9b859c704e67dab/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3790e8eeaf9d579840e5f056d79ae9d331244f2a/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9c53481d8a875c33465bf3340d1efca37c60164c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/bb1e3a1eb51c5c24d8c7fc59f495fb753ea5f318/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5a6f1a279b6990fcd1190dd4b3dac6e51c50d945/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dfd8e120326e6414b1875b06c55c9b9a34aa3e7c/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4299aff45b8e1e57375a246d254824aef7829564/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a5e314276d9f6486c22d9215e16d28a56995042a/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/0b2da52e8cc91099ea813fa9772589fd8df80743/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/c3f34f7cccbcc3ddbe4a276210ea6a2b50d63d57/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/b9b3ead85ac56a62df7738baebdf2111a0b6bfaa/
     aarch64 |                lighttpd-1.4.39 | NOK | http://autobuild.buildroot.net/results/623154cab3a09eb1ad891b682a17b2a07dce1de0/
    mips64el |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/91aa322682c48cdf7b63d5a3325bc45900d9e124/
      x86_64 |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/c763f6f3ab5351d67bf7584669c16306c2fe396f/
         arm |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/625009c1b1c1de8bc97dd78d8534f16acbc4284b/
       nios2 |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/2e69629a96a9bf823b770e480dddb55fc4e6d9e9/
microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/baf840a8df64058834fd6a69f93dd49eefc9db8a/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/a7fdbec7256ec2f50b45305514e2606270270239/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/14d6cb295c4e3ee074bd2336c8060e090cc025d0/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/26625b6247deba3c8885d0de199765faa1e50986/
       sparc |                    mpd-0.19.12 | NOK | http://autobuild.buildroot.net/results/e2207280f3a177e12dba502b1c01f5aeb431d04c/
         arm |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/135735b54ad1abcf2e3cddb96f16c432b8bd25a0/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/1517fd31b4c6eed1b2d0372dc45bbf07dfd8a375/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/287c4b4f2c11e534c2442c69e7b0290e0d658403/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/b04058728fa4e09481fcf8079579987f2ed0a7b7/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/c33e0bb1646b2d8df8e5e5d1d1d3f7d07e57591b/
     aarch64 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/bc111ebda53fe5184a976eb2125cf82ba82f47c3/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2c6e577db2a0522f7e17cc2eb1ebb6cd19971731/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f0965cba65b069bdc7edcdb5e7c66e63763ea955/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5e1df40cdc41e271f0c61a3d2c5c05dd741c6fc0/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/f37de56e14f2aa2f8223713d121fca28c77b367d/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/cd16749274857f2c0964f5c3953cb11436987f2f/
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/9bf60b19c24b05240f2a9d8b21833ebe0ad5f737/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/1056fea11f879ad899d6fd72848c022d25e80417/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/444b3c7bcddb106519f105ac97edfc7f1cd9a140/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/96331c1fc7e3f8ae0cacab568cb2dc9ae3fc6067/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/9426fa74085e26289b887da26ec6a1112ad8ec74/
    mips64el |                     unscd-0.52 | NOK | http://autobuild.buildroot.net/results/8c55915f1043b809eec41abe98f955fbd49bd5e0/
     powerpc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/40b1dead57f63c6abd853b1e792f242727ad041a/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/2c6a8aee874de9f6174bb2ef25449f3533549134/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/a5e8a6e7e1e1821c656716322f804be52f23767a/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/89e8341112b5faf9a3c466e94f86908ffee5ec7e/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/0c0fca92f0a43b764a8c89844b0db52d5da132f8/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/90147142115d67cdd81cd74f18063ad6210b74f5/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/d72c561aadd8fea37e8936d0829cb14d68a2fd11/


-- 
http://autobuild.buildroot.net
