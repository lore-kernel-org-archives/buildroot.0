From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Jul 2019 06:00:57 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-10
Message-ID: <20190711060103.81A4C20407@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  16 |   2 |   0 |  18 |
   2019.05.x |  17 |   0 |   0 |  17 |
      master | 133 |  42 |   0 | 175 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  dnsmasq-2.80 | 6 
              libsodium-1.0.17 | 4 
tvheadend-8f1de1621d78c9143... | 4 
                       unknown | 3 
           at-spi2-core-2.28.0 | 2 
              domoticz-4.10717 | 2 
                harfbuzz-2.5.2 | 2 
               libcap-ng-0.7.9 | 2 
                libvips-7.42.2 | 2 
                    atk-2.30.0 | 1 
                 dovecot-2.3.6 | 1 
      gst1-plugins-base-1.16.0 | 1 
                   gvfs-1.31.4 | 1 
                     gzip-1.10 | 1 
             host-cargo-0.26.0 | 1 
               host-efl-1.22.2 | 1 
           host-nodejs-10.15.3 | 1 
      intel-mediadriver-18.4.0 | 1 
              iputils-20190515 | 1 
          modem-manager-1.10.2 | 1 
       python-matplotlib-3.0.3 | 1 
              syslog-ng-3.19.1 | 1 
           udpxy-1.0.23-9-prod | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

      mipsel |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/9860616b235cc9a08940f691c62d467d6c276cbf |     
         arm |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/d05956346414152efd407a9ae8974e2928a3b615 |     
      xtensa |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/75d52bd813831058cc717e5cf7dac261e2aaff9a | ORPH
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/6e803484c756e3138e0865559fca7d07c7ff1c30 |     
 powerpc64le |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/9dfe2598a560d42c8dfa6e97e367ad816269c034 |     
     powerpc |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/a584147d5ef2423d810dbd940fc436125e59789e |     
     aarch64 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/bc1e77f43fc1a224c6f2c758a071ea05dae90d52 |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/5ebf8a7ca356eaaf2323c75e3896eef193df8037 |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/2b7f2f13be13aeb54c62a2aedbd7b7447d98ccfc |     
     riscv64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/91bdaaff2252310e32ddd6a8ddbf9d870e7de81e |     
     aarch64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/20840b4300f77dac69e07f9ee4050ed7547696c1 |     
   powerpc64 |                  dovecot-2.3.6 | NOK | http://autobuild.buildroot.net/results/bba0d54cab164d77caf7161596b22602875a7a85 |     
       sparc |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/93b58753071dac193881049c79288ef39fa9db16 |     
         arm |                    gvfs-1.31.4 | NOK | http://autobuild.buildroot.net/results/cebd107316981d736374310b11580093810a89c1 | ORPH
         arm |                      gzip-1.10 | NOK | http://autobuild.buildroot.net/results/cd6fd646e7df7245e074c5194347e8891cfe26e8 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/09dc35b5a1f0b79c15d6a3e351d8d348ef7a142d | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/a1ca826b72d99a3b53c32ec55366385cab1ca15c | ORPH
     riscv64 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/f59467a268db235ed623dd0720848478da9f2409 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/66ab77d194cc4640bdafb584fe78d82a74e46e9c |     
        i686 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/40ccccfd027a0b384da0740aa0cd806d8c2c2552 |     
      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/dc5faa5d64824747fa32e6cc5f77d1ad6b396823 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/d46bf80eca495844046344629314c23684138835 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/ae28dbea6780e65136d60c189cf845734e1a5cd3 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/042bc235c64eb97a8673825c2b1aa256ac652330 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/240db17740c53637bab9221d53111fc697576d45 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/f42e46acedb22ed74f70779713beea1a1c995fc8 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/a68d24c1290ca59f2028bd98f3391879cfea0269 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/dc1255304cd418bc0509edcdbe1bc2552e27ef44 |     
        i686 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/b4c2f4b4e3c09e54b4d97dabb43d2f1ee1b61f6b |     
        m68k |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/e5b7b89beecc4fefa170aa9c0e8139b20df896f8 |     
     riscv64 |           modem-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/67d9bb135058bb4b80d558e35f47d5a5b0f79e4b |     
   powerpc64 |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/ca751420670a16a433393c36934ad23273e34288 |     
         arc |               syslog-ng-3.19.1 | NOK | http://autobuild.buildroot.net/results/590a2e1b31fa6a0787f5fd358aed20f85dbed167 |     
      xtensa | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/850329cd0b13b9c5cd887e0d02d37687aa433f9e |     
microblazeel | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/9c1da50276ca8e9b73e6a4083c8f37c7af5cd842 |     
microblazeel | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/a34c4ecfd25cfc92e6f2360dabc5b69ee586024d |     
    mips64el | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/cf4e47e3b18a9658d1d74e6bc46dc67551aa1121 |     
microblazeel |            udpxy-1.0.23-9-prod | NOK | http://autobuild.buildroot.net/results/f592183efba60ab208af17fa805f1c2d39a93f66 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/1d755cee8e7d318e49757ef0a8c83aa2c48ca9ff |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/725283b33478bd6bed4d844931a72206fce96a2e |     
        mips |                        unknown | NOK | http://autobuild.buildroot.net/results/e52a27c01e8f82c051bb2dcadd296cc38d3a11a6 |     
         arc |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/4fcd96a8a8226ed7b5ff130606616b654e21ae8d |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/53b4f7ca97f60cee3355557267c5a08cef1cc87f |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/d969ff4eb8d6e9cfc9f6a2a60d82361617563e09 |     


-- 
http://autobuild.buildroot.net
