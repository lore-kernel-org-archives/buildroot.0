From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-28
Message-ID: <20150329063021.4AC00101738@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-28
===============================

        success : 228
       failures : 82 
       timeouts : 3  
          TOTAL : 313

Classification of failures by reason
====================================

                  powertop-2.7 | 20
                  boost-1.57.0 | 8 
freerdp-b21ff842ef3de583751... | 7 
                     vlc-2.1.6 | 3 
                elfutils-0.161 | 3 
                 jsoncpp-1.6.0 | 3 
               libecore-1.7.10 | 2 
                espeak-1.48.04 | 2 
                host-gdb-7.7.1 | 2 
                collectd-5.4.2 | 2 
                host-tcl-8.6.3 | 1 
                  python-2.7.9 | 1 
               celt051-0.5.1.3 | 1 
               mongrel2-v1.9.1 | 1 
                 netsnmp-5.7.3 | 1 
                   zyre-v1.0.0 | 1 
                     exim-4.85 | 1 
                 clapack-3.2.1 | 1 
               arptables-0.0.4 | 1 
                   evtest-1.32 | 1 
                     nmap-6.47 | 1 
                 lcdproc-0.5.7 | 1 
                       unknown | 1 
                    php-5.5.23 | 1 
                    bsdiff-4.3 | 1 
               sdl_sound-1.0.3 | 1 
               host-qemu-2.1.2 | 1 
ti-uim-c73894456df5def97111... | 1 
                 python3-3.4.2 | 1 
                libtirpc-0.2.4 | 1 
                 rsyslog-8.8.0 | 1 
pulseview-19be0af16af83ca10... | 1 
                xapp_xfs-1.1.4 | 1 
              postgresql-9.4.1 | 1 
               libsigsegv-2.10 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
             host-thrift-0.9.2 | 1 
                      qt-4.8.6 | 1 
         network-manager-1.0.0 | 1 
                numactl-2.0.10 | 1 
                host-ola-0.9.4 | 1 
               openldap-2.4.40 | 1 
           libmemcached-1.0.18 | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/98c1e650d6648dfcf426676cf94501fe54259016/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/a011446704229f47c34ec38ffd94f9aaed0510d3/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/eff00e2dfebd8722a9537e8017147b458c8aa939/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/b7019b52361c655429586e7f72070ba68c4c8562/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/c7d44b71a86cb7243e3150faefa249daf4af689a/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/17873d26d833a29c5c046b62f2c8eb429fb39f28/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/fcb0ff352dc79bf0def8d27aca6fafde3c26db3e/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/aa2fd89626ca4d09c87b4fccb640c1f62a392f77/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/a1251b8ea18267ecccf1f3fb57fef1aaf5243c30/
         arm |                     bsdiff-4.3 | NOK | http://autobuild.buildroot.net/results/283a77e0f3740cc3bbc2241552c53a0e818a9491/
         arm |                celt051-0.5.1.3 | NOK | http://autobuild.buildroot.net/results/b56d10df02dfce670a41dae49ba46b46376478ce/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/87f5afd0b3872173486494828af15953a9d4c48b/
      xtensa |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/249721b468aa6c5181a8371b913abca09457374c/
      xtensa |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/316b08e313ccf6935ba42bb0285263b07b3160d2/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/96ffc65f672510200cbb3cd181cda528c955face/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/810fc3f1f7675626aed487131d431ed95b8ee15a/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/977a4e6bec60a8e69ab966edbb04c5edfdd5d197/
     powerpc |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/b84f56cdc22f333b95e0894084a800be53aefd26/
      xtensa |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/59fb2000f554166e47f7c986dbfd6f1bc6cabf39/
         arc |                    evtest-1.32 | NOK | http://autobuild.buildroot.net/results/a3ffe2cff9abe1b7b58f2c5e53af1c76a256be75/
         arc |                      exim-4.85 | NOK | http://autobuild.buildroot.net/results/331ed781b422448205fb9e7c9730ec0c438d6306/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/b8f025ca857a62fbc46a568b3197a1d7181b7aa3/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/73dea181afb8cea26643d4e84b85f5c6d6e76124/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/5fcbb681821a2a58d1b1e827535de24b3764120a/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/eceaa0bc35b9802cb87dede6d66103502f79fe02/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/a412376bcc35bf8d7a7c3e50b17652872ab70a0c/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/58ac47f33d11c2997ae04c37a1041f439c0c8cbf/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/a8f5bc8d55abd791ceed59580bedb19d49c1518f/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/c64909f1afcc3fcd4c0d617f00bf540a650a7734/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/3178dcc454498a49aa00a2af3c676fe5ec3a24f0/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/f8a8d6a3b6d4a0158cd2aec4af722209e8bb45d4/
        i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/c50d6fcb6dcc83489aeb5d704553762bc1584a8f/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/2e9c2469c6974f93cb2e6d5e920ce9fb620551ab/
        i686 |                 host-tcl-8.6.3 | TIM | http://autobuild.buildroot.net/results/acce8f3856706b1603d1c274a8049a7480733918/
    mips64el |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/74530d52b3d48caf757100622575505f5baf51fb/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/7e2bcf1d372abd8a18e4545857e7f786016d6eb0/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/7569598d6102c7a0ac6549b4b781412a40930ef7/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/03e3bde7301774897111794f9444aae528fbc61a/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/9db0a166ac04ce709860c00244b7a801096e3df6/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/aa2f6cce6edf902da3d5876142f78c021a437910/
        i686 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/a1a6ae84c1774310124cd455a8c350cb4aea63a4/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/31a74efed9e47acfee353350ea5e37da0d5f6c84/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/349b2b6d0b067a1e0f3ae68185705d8f84374b7f/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/bc1d854d5fd63add8097436a5928e7fea1faddf8/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/9729bf4bc14ab3ad66de7a04a33d22371f55a199/
         arc |                  netsnmp-5.7.3 | NOK | http://autobuild.buildroot.net/results/7c6ac65f902c883e73be236981dc7e9776b7f110/
         sh4 |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/85e1d0b5bb1cf5ed68da60e734b6a706bf039308/
         sh4 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/767b8eafe7a204327eaa182c065ca5cfff18096f/
    mips64el |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/9527762626dfcb17274da8ea221b515b14cc2117/
         arm |                openldap-2.4.40 | NOK | http://autobuild.buildroot.net/results/1180b12d1944cbde2db71d8ea9e50162de177dcf/
     powerpc |                     php-5.5.23 | NOK | http://autobuild.buildroot.net/results/e44d8ea2d3faa8462273f37a6fefbf83a450b580/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/50e05a988d519cba52289b985258120503f9fea4/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/86e021ceaf0ec68dd0ab0139d723e06dacc35b75/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/db632c9fa2fc816790809c685b636175173640de/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/789f2b5dbaf297a1676890381a57c858a13aa080/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/20e9c9cc6176cb10149c5b143314a62ad415c47a/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e54691390b658532f27d036ffee39e00e5c54419/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/962f6ab48f3414cf465dcd7c40ea19494b6be8b9/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/9b4ad227400412375c8972cbdc8e5fbbb686761d/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/bf4c8a5c279b6dc71b28eae774350fc37d757581/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/0e42a5c49a37ac39a5903ad1a50364a46b923ded/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/f08411f15501a1a11b767b8f3a56e4a2530023de/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/695bd68793b979bb52eabd9c4dad542f0cac8cb9/
microblazeel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/9a2a48eccd1d0478129b1b58348a58ba39022ded/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e77da9b39cdcb8730b5650924ba640170f79379c/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/79a919027e2c59c067bd2c978889af1abc595cb3/
microblazeel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/a952b26a4539caa65554a67ab58a1de4a8d25831/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5b71a4d79e2c7050d655cf1d672a7237f70b9d95/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/a364ad2b2571df6d917da9fca2eafaf0299ac0af/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/d4c4688d70b85fba5c536684378f78381a085768/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/a3a4bb08b266222e90d2a3f915981c87baaed420/
        mips |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/013e64b4af43fa5fa184b55a550c08dc46f04020/
    mips64el | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/f519edb7a586a99f1e0a370aac6f8d7d46a54ba5/
         arc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/e583583bc0ba4aff84d896fb7e6caf4793e03eb9/
        i686 |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/cdc9ac220643a7e2ca66d455700266a6c8ab5aeb/
      mipsel |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/a2b8136ad7768455dd1564943dead3166fc31b8d/
        i486 |                  rsyslog-8.8.0 | NOK | http://autobuild.buildroot.net/results/3ca2a7a38cf48e69fed888aecb8782687ad48c99/
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/922716a0fdb7332a1e0f6211e6af1ccc239b74e4/
    mips64el | ti-uim-c73894456df5def97111... | NOK | http://autobuild.buildroot.net/results/10c31fdd1fc1bce9f67e97376ed4c28d1888b933/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/2c79e8c7ec94eaa1e933e63b6f442819e69a8b98/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/476a98957de259add50510e7d92c5b527e0b25d2/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/d230905f49458b049e7f8e39a6c8008a372ac0c8/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/eeab34b374850cc4b068b23d7eb075a30c683fba/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/c9a47bf3b96ffe7cef52c1955c882d2d1200def6/
       nios2 |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/c831fb9a5a6b9503e61b8ec4aad72a7d48e40b75/


-- 
http://autobuild.buildroot.net
