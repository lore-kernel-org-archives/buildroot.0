From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 06 Jul 2019 06:00:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-05
Message-ID: <20190706060054.7784786356@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   1 |   0 |  21 |
   2019.05.x |  16 |   0 |   0 |  16 |
      master | 124 |  30 |   0 | 154 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  dnsmasq-2.80 | 4 
                       unknown | 3 
                    atk-2.30.0 | 2 
      gst1-plugins-base-1.16.0 | 2 
                   gvfs-1.31.4 | 2 
               libcap-ng-0.7.9 | 2 
          modem-manager-1.10.2 | 2 
tvheadend-8f1de1621d78c9143... | 2 
        glib-networking-2.58.0 | 1 
                     gzip-1.10 | 1 
           host-nodejs-10.15.3 | 1 
              iputils-20190515 | 1 
               json-glib-1.4.2 | 1 
               libgpgme-1.13.1 | 1 
                libvips-7.42.2 | 1 
                     lxc-3.1.0 | 1 
                    proj-5.0.1 | 1 
                 python3-3.7.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/484bbd81abd3b3e297b027b2604dd59b8a86bd9e | ORPH
      mipsel |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/7a983e064866ba3299fd83f512fb2b9a86ca43db | ORPH
         arc |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/102c8f0ab10837436e2e3465005b706d3cbd0957 |     
     riscv32 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/1550372d69716923d30eeea1a9b963fab6c727d4 |     
         sh4 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/1ee4c34087147ba06081a99ed6bb7524f48731e2 |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/0732b4c89f947b0d7be5ecc0476156895d313735 |     
       sparc |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/e233f9a5693e18bee90669910007e122857c7f77 |     
       sparc |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/cf28db1630b04640895e7f74a307e2a0dd57d9c4 |     
        i586 |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/cde5b44930b7919477b0450f1293223da80fa7cc |     
         arm |                    gvfs-1.31.4 | NOK | http://autobuild.buildroot.net/results/2200adbfd92a92959660688f734fd89bae44a5e4 | ORPH
         arc |                    gvfs-1.31.4 | NOK | http://autobuild.buildroot.net/results/fc8ffd79c216f4d29539f9448251c3fe46dd00f3 | ORPH
         arm |                      gzip-1.10 | NOK | http://autobuild.buildroot.net/results/0df97e7231e35750e77f1bce1e984394c23e2366 | ORPH
         arm |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/fc61818228b814d37f3f13859f7c65de897b2f45 |     
      mipsel |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/d6a7d67faacac3fd33770eb6ec5cf8c5677d4a96 |     
        i586 |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/3ae03c152f80e6b4bdb603bd30e0e13bfe53f750 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/96e4cf46cead4b04dbcf4c99c1f21bdcd890d6bd |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/e08946b03f6dde66fdf05571782215b4c22648e4 |     
         arm |                libgpgme-1.13.1 | NOK | http://autobuild.buildroot.net/results/767a0988a10b805a1d2921e260b7b5f53cfc7001 | ORPH
         sh4 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/cd61be84dc9781ea645f7667c2bd29908484692f |     
       sparc |                      lxc-3.1.0 | NOK | http://autobuild.buildroot.net/results/c0a9565ae65336d55cdedc67adff221a7fa1a2c8 |     
         arc |           modem-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/dec75dc77b65a59dda2dd57cea8ba8c8fde27bc7 |     
     powerpc |           modem-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/14e11c6136db09b36d84246a7472b77bb4bfdd19 |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/ee792bceda733afd09b9d17176df835e85868bae |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/9e50dad31af4d4183d227c489f97973af9519431 |     
      x86_64 | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/627e7080e655005d6724b9977670cc73059d6281 |     
      xtensa | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/fd3477c40e9b2b1278df450955c7c43903963f7c |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/82ca519d180b5afbc8e96090871d53f272283abe |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/e00a9b9978822c49178551233b3abf41e5254658 |     
     nds32le |                        unknown | NOK | http://autobuild.buildroot.net/results/17c8335d5f3ad68dde0ac67419f2f1ef418de5e3 |     
         arc |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/caf71455a42269ea92b332eae1ef51a2546a0f68 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

     aarch64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/74b03f5af7d286491a66c4130078464e3993ef0d |     


-- 
http://autobuild.buildroot.net
