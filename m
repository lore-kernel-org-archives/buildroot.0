From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-17
Message-ID: <20150418063017.CCBDF10115D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-17
===============================

        success : 185
       failures : 108
       timeouts : 3  
          TOTAL : 296

Classification of failures by reason
====================================

                      bmon-3.6 | 28
libubox-5a0bbefc8fa44044625... | 9 
                libtirpc-0.2.4 | 7 
                     vlc-2.2.0 | 6 
                 leveldb-v1.18 | 4 
                  dhcpcd-6.7.1 | 3 
           libfreeimage-3.17.0 | 3 
                  boost-1.57.0 | 3 
      host-gdb-arc-2014.12-gdb | 3 
               libecore-1.7.10 | 3 
freerdp-770c67d340d5f0a7b48... | 2 
                    webp-0.4.3 | 2 
                host-ola-0.9.4 | 2 
           aircrack-ng-1.2-rc1 | 2 
              postgresql-9.4.1 | 2 
                  python-2.7.9 | 1 
                    qpdf-5.1.2 | 1 
                  snmppp-3.3.4 | 1 
             armadillo-4.000.4 | 1 
                   atftp-0.7.1 | 1 
                    qemu-2.1.2 | 1 
                 clamav-0.98.6 | 1 
                 clapack-3.2.1 | 1 
libconfuse-9413a82f9cb56a94... | 1 
filemq-482797b8aa30fcc9ea13... | 1 
               libsigsegv-2.10 | 1 
               celt051-0.5.1.3 | 1 
                 jack2-v1.9.10 | 1 
         conntrack-tools-1.4.2 | 1 
              xmlstarlet-1.5.0 | 1 
make: *** [network-manager-... | 1 
                  weston-1.7.0 | 1 
                 rsyslog-8.9.0 | 1 
            host-heimdal-1.5.3 | 1 
               alsa-lib-1.0.29 | 1 
           libmemcached-1.0.18 | 1 
                   bdwgc-7.4.2 | 1 
                     gdb-7.8.2 | 1 
               host-qemu-2.1.2 | 1 
           libvncserver-0.9.10 | 1 
              wireshark-1.12.4 | 1 
           qt5multimedia-5.4.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
             fxload-2008_10_13 | 1 
             exfat-utils-1.1.1 | 1 
          libedit-20130712-3.1 | 1 
                host-gdb-7.8.2 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/6f93e23d41e3d0e06402923381e63dc38ad7fa5d/
         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/2816333c8525b6f7025b59091c439850a3ff6c19/
         sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/702ac31e2b4b69ec299e4195d51c31f96cd2b35b/
      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/67fc3461dc3a30b4c246ef674de05fa88a269afe/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/f92d5dfb37ff884ae3458b78fd304c898b3c018b/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/97e47fbfe663a742445405d8fbca44a8ba528650/
     powerpc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/d0a9bd72289e79f486b86c3b3bbb5bc4f3c7446d/
        i486 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/390473845e1353689005714e54721f955f762c31/
        sh4a |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/6d500cbbfb3f641deecb739214ab0b47b403e3e9/
       nios2 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/186830c2e3806055e7555f51fb499ebfa7757c5e/
        sh4a |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/0b16c077d9320f88e9a6263e08400413ac6bf4a5/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/0a823b943bf32877c183e43e194fa03b69d3d3bb/
      x86_64 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/ac8120f47bca2c75c120319a8bc3c1d8d690afd1/
      x86_64 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/dc178b56b270d2ef988094749a7d31b9aabb186b/
      xtensa |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/8b700be859cde113cdbdf76e3b97d2a27fdadb92/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/296bcaf4fd1fadcab71881d6d00a8763bfa91a41/
      mipsel |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/eeac33312a6c6f24ea00482100f74572bf71b365/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/acad45bd6e787ff6dcbf3dc975d3e9c543df23ca/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/5a5c711145b798969dc4a33a985faad5c3136239/
      mipsel |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/45bd14ad6898c16a7292580232c01bb6b2376ee5/
     powerpc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/33222c2694f37367178e4ee2c40030db413e0cf4/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/0f6b55bf4cc85458ea311c67f01c020090aac9df/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/5a040eccb60629582fc0a99cdabcaa0ddb64695b/
        mips |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/b621c66689d2d84bb677e3a70417f6ccffdad9e0/
     powerpc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/c584b9a0d4aae85ebfefdf731cea2ed2b1e2a88b/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/d68e578c15719b3455d7e3472f06fa103b7553a1/
     powerpc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/d414b842f6231116af334905f6ad89601da5f874/
      mipsel |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/20b5942338a15d8f68a36859bff609d8caca530e/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/21aa5f0590b46c249a50b88328ed14f43398b827/
        i486 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/285ab28bd7281a58cde172a18c66aba700a59693/
      xtensa |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/8e0f5be114361b593fda2db560e500f8a5a92757/
         arc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/db38341cce2aad36a625667e106a44d3d22aeedf/
      x86_64 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/74c56c72152946635e41e8b8f68a7dbc7b3faede/
     powerpc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/0a2aeb6a988c330c9f67ef9e1d4ef10e3095cec3/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/8076f17de6d7c6c0145f3f159b678f25cda71352/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/42ae4a6a1cb4e3a9ec10742d116ba38db51494ca/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/4f871c5f063a65cd129560a359421860cf8e4f56/
         arm |                celt051-0.5.1.3 | NOK | http://autobuild.buildroot.net/results/aa365d74b27e1a0b4f9664bb5bbb1a172ea4aaea/
        i686 |                  clamav-0.98.6 | NOK | http://autobuild.buildroot.net/results/32ce89ff98edafb30eec0ac3c96ed9c031925ea9/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/865dc9aea54eaba2e6049112fc6fd0efcacd0ea8/
      xtensa |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/a77ac1acfc4bd9727629c6119426b58959352544/
      xtensa |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/f5755a32311e03d9eb2c8bf8dba18264d3769406/
microblazeel |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/90c62f0413ff0f606f50f97dba1073dc87db4cb3/
     aarch64 |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/3851e2543dcab190211d48f830ccb74f12c0e57d/
         arm |              exfat-utils-1.1.1 | NOK | http://autobuild.buildroot.net/results/78ea208ab06e9ecd5b17defbb9380b0d43ae2da1/
     powerpc | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/32b0012cea40d14c8054eb1f774a1ef241ede3a0/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/8159e9cf37282487e76e3db0690f67c1ce3aaa4a/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/e0a3b695926ad3f32637b2971f146468dfc61b13/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/47f8948c8c90adc2297c6bfa18af56d857f9e1a8/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/df7365ecda81433d1222e04c0595b61477227532/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/d1bb29c248ae7a4c63f6a8c879a0237cfe107648/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/c46a2b0f209940a9708091f74e5cd87c71e6fd5a/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/633d3c0f0019cf64e8b5387e9d39ca503f715206/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/bab6417c7d74978930d7a91cc9b3deaa538fa6c0/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ae7c5d270be73fc10d32ae3333ad878df96e295a/
      x86_64 |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/8ab58fce2c21df3260c091e81320a70a6632c20a/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/8bd761c52388e937d1372c531f0c7b4d9ad533b6/
      mipsel |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/239eea35463bcc27e1098304fbd61a8daff90307/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/76b27aeae4ea1508a06af2e53cd3d3cfff8207b0/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/aa3e94b3ff6d56f4a8dd2197f7c2ca748a513980/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/24d1da36fa3950ac226beb678d3b1d5b1d431bdd/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/b1d2bdacb2006cbedc80aca42f554ba18e8a2dd3/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/8edd5110b893566b73b0710e3f0560937b1cf9fa/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/8f36a1aac8d3c3842b5435933e36631654c780d5/
      x86_64 | libconfuse-9413a82f9cb56a94... | TIM | http://autobuild.buildroot.net/results/996ea6190e50c08ce7155ff48ecdc6c3a81c2c17/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/d0dd0b909c540bf3792b87ded2ddca330cf934c7/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/d21d385ab2beb657083a7eaa5014ad455f06275b/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/cb5438642e2f6f6a97b30b4e7cb2dee419a23aed/
         arm |           libedit-20130712-3.1 | NOK | http://autobuild.buildroot.net/results/9fff30ea48777cf18258ff4e48e6c1af6d7801ff/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/229a1e5ee41faaee4f33ed914334de530ad5e4cd/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/62e1e9e062f5c2366fb1803480a2d7d4799f7829/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/59c9d5ed79092024c4280e69a7186eb92f56d3f5/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ebd3b9e84d0fde1a70daaa954f020f0de7e87c01/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/98d803a57cf7fd516654e217c97f2a274165a7f4/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/750274d17021c292303c235fb29b90f4122bd3fb/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/eca62a1552ba017da3dce291845f68309364fc57/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/cba95780409a465e2affdd367ef17636e57c9904/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/d0112bd82e6f7212d19ab1ce042e400f1f46d814/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/52c56fe9dfaba3b2bf2e97fe2d994f1c58204c41/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/5be0356728e09c0634a2494b7736b1f2285a2681/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/ea3bd61f9fa9b7f82f2b87ebfe7f56bca9d1d8e5/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/650c77ebea5f97b16c8a51f9f97709efdc7e8474/
        i486 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/3979974ad9662467b836411355350c08ad3efe5a/
      x86_64 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/ffd40055fa9457568b66595460c426ecdeae3f83/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/b1b7d2d826eb8abd2cd7cdf2c654478db4e8434a/
         sh4 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/603ebd4bfbfb8260aaf68ff68fcb3457fab99b0e/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/37786cbbe368b83ce5f606bd2fe7eabfa2db9049/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/aa739159f0fae8f36ba65eb658e870522f91c7bb/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/843d5c8a980b320b9c26e4f23f26bcadb69869ff/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/38e76f3633f5590a3746299fd7dd6496daab72e6/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/9362eb7fb34336a7ce35d2a930ff1bd4502efdce/
         arm | make: *** [network-manager-... | NOK | http://autobuild.buildroot.net/results/e8bc1e23d334e452d981d1a7d7280cf1f90c030a/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/9f2e42c9fc68d688bbbbf9a4fd6c4feee213612e/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/37feafe52fa3af2b627de41495576e304d5fca61/
      xtensa |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/3f475b19a78587f73f4a1754458ffe7f4430f056/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/a280e5267b3910957cc2be746897fbc0939da2b5/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/556f6ee36db5087c17100d3162aaf61ec1aa4f97/
         arm |            qt5multimedia-5.4.1 | NOK | http://autobuild.buildroot.net/results/62feff0aa0c4841fc45bb9cefc4cba41d3a927af/
         arm |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/3ce8d9795a10cb0610c099ef8bf981e9cce0c4b5/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/418fe5eb32d76fac666dbdaa0a0dcb58a2f69e95/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/5f66a8a135c95624a14908c685f1201dd7f8ae87/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/1a97ff57648261a6d5afe732a1783aafdba43706/
      x86_64 |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/9b07deb767c95b29d9a03f23badd5f5e054f7dc2/
        i686 |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/90aaaaaa372a71b067a95a53ba8a64273cc39fa0/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/de487ec8be0ca0101c8d0ce328504936d8e6fcf0/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/26d5acf2d644d57abcd9fa3813de4d704ae64a9b/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/c071e54799744b02c35a877d97ff1111e748db38/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/7caa14254c76f8f00fe212af3a99e804a02bfa5b/
     powerpc |                   weston-1.7.0 | NOK | http://autobuild.buildroot.net/results/b40349652fff53997c56bd6722981ef5b5f2f279/
         arm |               wireshark-1.12.4 | NOK | http://autobuild.buildroot.net/results/da6f57432efc793ec6e346c677b4c634b5d261e0/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/e9959b6503bf931b8a348ab287755ab63f944d3e/


-- 
http://autobuild.buildroot.net
