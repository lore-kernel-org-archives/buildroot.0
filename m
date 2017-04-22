From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 08:28:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-21
Message-ID: <20170422062812.57A5E2085D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-21
================================

      successes : 201
       failures : 47 
       timeouts : 0  
          TOTAL : 248

Classification of failures by reason
====================================

                 xenomai-3.0.4 | 9 
           uboot-tools-2017.03 | 4 
                busybox-1.26.2 | 3 
                    mpir-3.0.0 | 3 
                poppler-0.53.0 | 3 
                 binutils-2.27 | 2 
expedite-0529ce56b6fb01e965... | 2 
                libmpeg2-0.5.1 | 2 
             lttng-tools-2.9.4 | 2 
                 qt5base-5.8.0 | 2 
             rabbitmq-c-v0.8.0 | 2 
toolchain-external-codesour... | 2 
               acpica-20161117 | 1 
                  arp-scan-1.9 | 1 
                  dbus-1.10.18 | 1 
                    ffmpeg-3.3 | 1 
              ghostscript-9.21 | 1 
             gutenprint-5.2.11 | 1 
                 libxml2-2.9.4 | 1 
          shairport-sync-3.0.1 | 1 
               syslog-ng-3.9.1 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
                 xorriso-1.4.6 | 1 


Detail of failures
===================

         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/97c2cb3355dbe099fe2302c77e60d764f849aca1 |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/fc770dd08f21cbd9224fb3875a032ba2f6a140df |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/1d49ff3c58dd28d8126358e9697ac40561f9e692 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/a6235dc1a7bc56963263784c0203c5c258557773 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/087caa9cfea7b044247b1750af72d829c3a8eae9 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/de7877977e8b648e1d45dfd040fedad25adf9bc8 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/ea6cd0d5fdae564bdb1fc816c3a7c33d48e66280 | ORPH
      xtensa |                   dbus-1.10.18 | NOK | http://autobuild.buildroot.net/results/e1d562a4c77124cd28dfdd55a0adc95791a72561 | ORPH
      x86_64 | expedite-0529ce56b6fb01e965... | NOK | http://autobuild.buildroot.net/results/f48b1504f1ce8339f018030cc4473da8a108fb5e |     
         arm | expedite-0529ce56b6fb01e965... | NOK | http://autobuild.buildroot.net/results/ed840755e8e486e48eab8c13a8bb5e9a448199ce |     
        m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/8bd1c0ac57a843f6bdf0707c40e94fcacfc8140a |     
         arc |               ghostscript-9.21 | NOK | http://autobuild.buildroot.net/results/09881f67ef95f621b803eda7da02a17bc4227371 |     
         arc |              gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/d18ac9762b8e94beb5742e80b0def851ced4e773 | ORPH
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/cec78c1c558b59e43aecd1e037d518af120404d3 | ORPH
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/55442f2ab41130d0a209f34401860f4362d53ecf | ORPH
         arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/73484637ff0052bde53a18945b619c31a32fe750 | ORPH
     powerpc |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/cace04f1e784a06da7fbedfe5070073f639289dd |     
     powerpc |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/aabef01a7efdbb479b21e2e13ddd1929efec85bb |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/c96ebfad883f298f46c019be4d5ca12418deb904 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/276e1ff0f3927c54bcadd8a5768f83234f58ae8d |     
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/01fc6449b18d67b65de7faaa48c64ef2b69e91a3 |     
         sh4 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/7b1f32a4cc925a86cc95ea7d0f20f7d1d0c0bf43 |     
      mipsel |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/c945dce4446346e1e37be0f1397786485f4f3728 |     
        mips |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/954cff7380d55128367945229288808d319d9644 |     
         arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/a64b4dacea935ad81f9a3cc03c27c12dffb5d81f |     
     powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/d24b91aba839643a867106ce7c15fb806f4b5e15 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/276dcc0e17f334ea0e15ae7a49110848eefdd195 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/6f041f643ee89839c88aa710f90c2d648ebeaacb |     
     powerpc |           shairport-sync-3.0.1 | NOK | http://autobuild.buildroot.net/results/5bd922e06385cf1e56ffbafa8b3dc3cfbc225bff |     
     powerpc |                syslog-ng-3.9.1 | NOK | http://autobuild.buildroot.net/results/dfda5b5bbc62b9c7e08d26fd6a1a79c06e0e8ab5 |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/30b2a2c6ab12fdc60b0c87b6eccea4bc799adc47 | ORPH
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/dab9d6b9e9cdebdd4e78b7d9e259db2976d3dccb | ORPH
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/394b425ae9f8154b14d62ebc665cb78b446e1a2b | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/2d8543190a9068d9649b39e4194dc308ddf4832f | ORPH
     aarch64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/64b763fcdaaf37997ce5ff1b0440a91135e6e4be | ORPH
     sparc64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/5123b0a62de2568ea22c691a213b63240f45cef1 | ORPH
         arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/f7c377dd925090f902cf66248a428cc2405a4a52 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/45cdb417d82e6a9f8f1dd90c4799342d08861aaf |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/bc21e9529bb3b9d9ccf8a0fc6496d491b0ae99cf |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/333d6c736aabbbdf1bcff7b9a87d4fc2a065e521 |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/2cd9f99b39810705b04d458fec4a65771736f09f |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/ba1b5f5e75dd47668b2a29b990f7154c2847f79c |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/fc503260a78665c1949ce081f642253976c21025 |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/936f1a402a43bd9ca49c056a0d11cb55a1f5a64b |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/92a8c678013689dd7b59917f0f5092fd37d8c903 |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/e0761d667aaa5c48267aa599368f4259ec577674 |     
         arm |                  xorriso-1.4.6 | NOK | http://autobuild.buildroot.net/results/a5d0f8bec0d39e48f6dfe4ecc07fe0ca3c6bd70a |     

-- 
http://autobuild.buildroot.net
