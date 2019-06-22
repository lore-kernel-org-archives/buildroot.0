From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 06:00:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-21
Message-ID: <20190622060059.33807862A0@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   1 |   2 |  23 |
   2019.05.x |  26 |   0 |   0 |  26 |
      master | 185 |  35 |   2 | 222 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.3 | 13
                       unknown | 7 
              libsodium-1.0.17 | 5 
                  dnsmasq-2.80 | 1 
                    efl-1.22.2 | 1 
                     host-llvm | 1 
           host-nodejs-10.15.3 | 1 
                    instance-2 | 1 
              iputils-20190515 | 1 
               libcap-ng-0.7.9 | 1 
           libvncserver-0.9.11 | 1 
              qt5enginio-1.6.3 | 1 
                suricata-4.1.3 | 1 
                     vlc-3.0.7 | 1 
     xdriver_xf86-video-voodoo | 1 


Detail of failures
------------------

         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/c0b27754b7ede024c095bdf0b3616e6f6be48c6d |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/df7f709c4c16a48e6dfe8c8ef8c5039fb963ffcd |     
         arm |                      host-llvm | TIM | http://autobuild.buildroot.net/results/dc28ced907ebb9e404965dc438e103bafc41d380 |     
      mipsel |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/539c73db26e7ab09721dd2be5d1ec7ac30b6a268 |     
         arc |                     instance-2 | NOK | http://autobuild.buildroot.net/results/eaa4068dfcc4ac1114cace026024e8843f2d2e59 |     
     riscv32 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/4035d7e344a1dd55817bfd512c47617c2426f4cd |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/7ea8fad90e47bcec4ad9fbfe53505746f8d5b8fd |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/5a6c0f09767bc433756ba0d555eb981640faf466 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/eb5038927abd2ea2ea8661be79048a75cab4932b |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/af0b0233e814c4193e5cd18e1148d4913b7c0df6 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/2a5e0f55b2237ba0f1a7a94e6c47f5cc9240a1f1 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/7c5f413f667b81e7bb95e3e56ebba988d70c4b59 |     
microblazeel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/a56b2cb5ad666afac47b1719591a9563c24439d6 |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/73096e37b69d05b76d64d68abb209ed43cf47580 |     
        m68k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/33df5984c590b192e91bd4eff45c8d52c8991e08 |     
         sh4 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/5f9697f7fa271b3eb33841594a96c7bb752d6e60 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/08dceeba209f7bbe4ff7c46c8c4863d4cd524b64 |     
         sh4 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/aaabf98a79af66ac18a8282375ec970862a6a682 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/59ff48668bcb1fa404c580bca3b3edf86089c60f |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/0485e6337d8ed22e31ccbfd98ca1012cf600f7d7 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/01758c6aa8b42eb7c5eac96404ea7fe50f51abd3 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/4311bb9d283f9697f97199ef2afb13e44cbb083e |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/cd78bc69a4418fbd0af72917e9828db82b0a37e6 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/b6dcb8c0c2155446c3bce1be6e0a0a3d7db07c37 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/d4b0ecf4f742c24e26049532df1e592d3dcb237b |     
         arc |            libvncserver-0.9.11 | NOK | http://autobuild.buildroot.net/results/e5f675eaca765c0a41fff9c245e21c6b935fca73 | ORPH
       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/cfcdde5a9aa63f24523139f11242cc5983a55ea8 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/96c48d2eb467433e9eee89e88863530b477a8920 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/afd7d112286d1c0c327e62da2801b6024493df13 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/1670d2399f51c3b00659c4803748dab4057fea95 |     
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/8ec723b3fc85f54eb0db3b21f09e3911a4622aeb |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/fac201fa874d4fb11d72553a208f76300863b955 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/6bea4039057a26f6f9bf6a8cd039cf07ee3bc592 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/66c075a4161c8c3c2daf2ed0b1dae5e5bed7ab24 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/ac806e22df00f396d7a4f17c430b12c9cdace723 |     
      x86_64 |                      vlc-3.0.7 | NOK | http://autobuild.buildroot.net/results/d37e0acb9b9c19d297c97a1cc4700eda6079d083 |     
       sparc |      xdriver_xf86-video-voodoo | TIM | http://autobuild.buildroot.net/results/aec1f5c4cbaff1848e89a52b33baaa81a71b9eab |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                    gst1-shark | 1 
          libtorrent-rasterbar | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

microblazeel |                     gst1-shark | TIM | http://autobuild.buildroot.net/results/c79bf46614d4d25119937b2111d01de7ebaebb78 |     
microblazeel |           libtorrent-rasterbar | TIM | http://autobuild.buildroot.net/results/294ea4ff207ce47aa81f2f77aeb595bbf0375fc8 |     
microblazeel |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/aaf86074dee758410b15067c7cbe701e3feeae71 |     


-- 
http://autobuild.buildroot.net
