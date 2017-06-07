From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jun 2017 08:27:33 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-06
Message-ID: <20170607062733.C3A7C21D15@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-06
================================

      successes : 193
       failures : 130
       timeouts : 0  
          TOTAL : 323

Classification of failures by reason
====================================

       libhdhomerun-legal-info | 29
                 host-icu-59.1 | 25
            python-pyicu-1.9.5 | 16
                     gdbm-1.13 | 14
                  cppcms-1.0.5 | 11
               gnuradio-3.7.11 | 9 
                ejabberd-16.01 | 4 
              host-cmake-3.8.2 | 4 
                 lcdproc-0.5.7 | 4 
                beecrypt-4.2.1 | 3 
                   flann-1.9.1 | 3 
               libupnpp-0.15.2 | 2 
                 mplayer-1.3.0 | 2 
                    mpv-0.25.0 | 1 
                 qt5base-5.8.0 | 1 
                    sdl2-2.0.5 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

         arc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/19521e7e892d6d19168fef6f03bc4bec86dbf0e0 | ORPH
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2ff697f766b3fa6ea369766070b260c11cdbb58d | ORPH
        i586 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2b17ff6492120235bc3eda2c2d09bc2dd6cc11b1 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/4554a8c0ae4c5b696a874b59696d79458cf4367d | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/e11b5683e74d54768a6810865c8b24cdaceeff0a | ORPH
     sparc64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/21a84917661109f2506574461bfb5a803268be0b | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/c4f9f708ff28447a87e70cac5cd314c765ef7bee | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/e96d1d4c77a03c89a1c628f1bdd635bd98bde2e9 | ORPH
      mipsel |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/aad6729e1375925609cc1b96df6eb90cb2d2a552 | ORPH
      mipsel |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/4dd9fbf748a010f1a89ec1e6902b34c0cac72f03 | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/c25b29eb8eef25ec1154465feea97fee4892cd31 | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/95c8c18f3af6818b884a49c701ac5d6657944143 | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f8f3776284ba0476a8599fc7f839f7fc7afd10a7 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/4e13c039e807f07e4b3913e5f9943a85320dcefe | ORPH
        i686 |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/270ccf3ebfc766098361789feee6d0d1d5339c8d |     
      mipsel |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/792fe14c990609e59489234b5b985c25b5fd0b86 |     
         arm |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/e7baa700805acc581463a0146fcbb09504d4d262 |     
     powerpc |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/8ce875b1013c85005fe3b34269d3ced64c5bc530 |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/8a6c7affeb7b1af58f89d006afb518c25f63d86f |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/c3ff612f4b2e83c8f120167717134326e6726144 |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/ca55a5ad00ecf36a0b31fab008b861035b499573 |     
       sparc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/1039a0597a57fa42ae22fae988c9da0f973959cc |     
microblazeel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/bb3a0e531cf9b7a403484b7066c990d3552ab403 |     
        i686 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/6b4be76a4fea5c4c7e6d8b9cdc752ad86160f4b0 |     
      mipsel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/c16818ce7655ceed2aee50c8c819348a05ee9b06 |     
      xtensa |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/20c2418ec54f7353a5bb0d65eab76a4a99a866a7 |     
microblazeel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/76b71ff728da7dfe2853e72b5d8f9eb738b834bb |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/76a5e5f083c71d36f9680f6e22f34a4123798c8a |     
      xtensa |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/855cfb1cca1a9205b0338f6524d3eb4a7c57bbed |     
        m68k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/aa29b512edd7249094110015b0f67e309ee149a0 |     
         arc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/261003aa28a752678e3e28bf8bf4a2993896a953 |     
       sparc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/d3b0a18b9a620488991bb629b2ad560e8bf50066 |     
        bfin |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/ccd3640da33cc954a4f61d368b0bb8071c6f1fe5 |     
      x86_64 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/dc649bd2912640557fcac09692a259fedf9dc858 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/764a999baf267b561e8064de572eb4b39ec272c0 |     
         arm |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/b4a06294e2fcd60b55430ba00d3776d2d5b08ee4 |     
     sparc64 |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/47a77fdfa87b520e1e2d01b0ef0ec0e348c8d6a8 |     
      x86_64 |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/04b0dc1cbce445734cda55ef827025afbf4e9721 |     
    mips64el |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/1d6c81fc34d4fd275163e7a46c5fb8caf35225af |     
      mipsel |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/c2e39d7591379a2430ccd43823c79bd59ca968a0 |     
     powerpc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/d2638904a8630f064dda709e57128a48f48b49d5 |     
     powerpc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/c8c63ba2fe2bea5014c5afee2afa45ac24f0c524 |     
         arm |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/5f1ad4fc7240e3831704bac956b1ccc2690f77e7 |     
      x86_64 |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/37a6f237287f2cfa611f4d014ed19eb3c2c9a2da |     
        i686 |               host-cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/163ce5596e4f242695138164a7f62675c0baf868 |     
    mips64el |               host-cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/7acf1f1894027a42f5550cbb4db2a47c5fee376d |     
        bfin |               host-cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/cdcd7df89ff3f6ceb4176804700c5f9e2c6b96dc |     
        mips |               host-cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/3d1042960da887584547eecca13c1817fa93b401 |     
        m68k |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/5fb19160101f5495e186da66ede094f30c6c2a60 | ORPH
     aarch64 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/c1f4541a4e18c1e021daaa7457ae01d639f3d2b3 | ORPH
      x86_64 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/41420890e1c2a6b9df0897d1b5228833a93a4e27 | ORPH
   powerpc64 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/aac8dd1c9f80a7d82a20919668ac29cf7843f6fe | ORPH
     powerpc |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/fb06a48d45c3b8faf1377ffc2c8c94ceb3d1c451 | ORPH
    mips64el |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/aece5c3af577b3f7244a7997133604f7d0d5ed0f | ORPH
    mips64el |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/9754366abf3846ef8ab5d17f4c664575119a9fe9 | ORPH
        or1k |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/cca25c5cca1c69fef103f3dff4a03fd81ab252cc | ORPH
    mips64el |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/cd845656c7610925128b04770a1fecce51acaac4 | ORPH
       nios2 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/2e61d5195c97ee854bb8136e54e6bc3498789559 | ORPH
        i586 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/a5ac07e5809dfed31f5be4e341932f5be19828c2 | ORPH
   powerpc64 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/15d77630f5637eeafff1b18328456781514716f9 | ORPH
         arc |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/5629d87c3b0b8f4d497f9d72145f56f69cbef0d4 | ORPH
         arm |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/5ec21ee4ec8881e00ac9b89bd2d938f2df5e54c2 | ORPH
        i686 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/b159cd8651a0e783d6820dbc6c532ad72a3ef3f7 | ORPH
         arm |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/5144dbc7096d0b8eef6aec0b24e96b00708a069b | ORPH
        i686 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/1ed87e38565c613a3dc95d7ba52656b782a08afd | ORPH
      x86_64 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/23ce5a685b742a359a0fdcb78203b928ad0ee5b1 | ORPH
         arc |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/90884a9e865369bf65c2dbc2d895259e67dfc764 | ORPH
        mips |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/ddde5510d1aa13b6bcf8fb98ffa0fbd46c815d17 | ORPH
        i686 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/50f849ceb614fc2f52371f5e1e56e500b0e73ad2 | ORPH
      mipsel |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/3fc156ae346115616a9782b3f790db0cde5e5b8b | ORPH
         arm |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/ab620e8f3684e3fea832a8c2df0ad5942a7afb51 | ORPH
      mipsel |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/f5fa2770619f86a721d4415e0808f25dba520a41 | ORPH
       nios2 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/64a663e9537d34ea7b22a19e9b744840ff491442 | ORPH
        mips |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/50de848393871074c401050c79f60b7ca1ff0f0c | ORPH
        i686 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/7bdaeffb1a3f511d10e819f307e04ff8b1643566 | ORPH
        i686 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/c36546291cc41632ecf1edd763e6968b42a9e214 | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/fc69d35aec6efb6016e2c4c816907930382c0bff | ORPH
     powerpc |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/4ccfe19d975dfae3f1a1dc640be93017b263813d |     
       nios2 |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/b25a6d211354452ea502b9df3acbe45139bc48bf |     
      xtensa |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/a0d6ee50ee70ac1d1c5ec3653e1a326f3a10f117 |     
         arc |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/5c593b500cdcfcb990566cb436c216a5646e3404 |     
      x86_64 |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/a697a38cba99cc6f5937c2c4c444e320545af9f0 |     
       nios2 |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/fdf2a07d67d38d645442a00b73dd56353d9dd2b2 |     
     powerpc |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/4a4d57f53847a101f8be39267443bdc4d3f33479 |     
    mips64el |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/7b8ee7dbd73470652ec1bebd7fe96257222dcbd7 |     
         arc |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/292c9d1723265d01f93fbbaa215e5e7eb181cc1b |     
      xtensa |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/965c77de167ee496346e2b6e623a7ed244dd34ca |     
      mipsel |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/4aab823d3f2eb5ebcfe66e846204c26bf6f47559 |     
         arc |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/20297984bd1698d610aa90888fa398fca23b8fb9 |     
microblazeel |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/ee0364e932a43efe66df27079d34fb127900c912 |     
    mips64el |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/3381f160c46bdbb44cde4eeb3d33d6fcc255e5bd |     
         arm |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/e97175e076ddc80eda8d65d7685ca6068987f5a5 |     
      mipsel |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/03247af64d8751328033001068aad92f56df2a09 |     
     powerpc |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/7ca84e74c1773c3cd1cf70aba3fcb5a95d08ea0e |     
      mipsel |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/2cfe5182054a47ae1db8905bac7b0443c6c6665b |     
         arm |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/efff2087902ee9a78040f668b101640678f80d58 |     
         arm |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/26ac9e0f5d8abbcf113e2b83c34134c31dfe0471 |     
      xtensa |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/19b9195bbdcb0e14759e3e5daad751035bc94cd2 |     
         arm |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/32cd89bf6fafd16784a7cf4155e3e3678d46c976 |     
         arm |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/54923ad41ef96086ad70be4e3f031d1754bca0f6 |     
     powerpc |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/20a5cf594c65e2a050d10ba33c142557fa4e6805 |     
    mips64el |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/f1e0d7baab625d216bec0428d88706d62a8bfd7d |     
         arm |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/1f909b3fd71417932d66254cdfba0c0ca20fbca5 |     
        m68k |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/efb58d0c4418f5f176f4e1a9f4088b91d64593f6 |     
         sh4 |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/84c30ce64ddfd036b55ddef4a36568f39964b13a |     
         arm |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/4fdd23771999da47467b399188a7c34751f307bf |     
        i686 |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/50670d8119b4fbd26585d3d9bd646adb1d904dbe |     
        sh4a |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/8b021648a073bde25dd6936ed1ea1e39977bf89b |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a0ed349261df07768ad2faabc2da52ae94dd8d60 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9b68399d4518858b6ec8db7779808943aba94ffb |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/7ed94371af6f2a288a131dc78728dc13542a4788 |     
      x86_64 |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/55818fae84333d45cf291913f40fd274a61bbb47 |     
      xtensa |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/06f0c78fefbc9df297c11df55587a52fc48abd43 |     
         arm |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/d124930a1442cd9ab8cef1d9d3037e05424c2d4c |     
      mipsel |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/5c9d4a2251d8d54c8cc6318a6be39676d8c752ae |     
      mipsel |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/afa4ee3b7adc171ffb78cbcc4d31cab5d064bd89 |     
         arc |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/7279e695bc381ce6cedd09837146d09011486ba1 |     
         arc |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/ae4beb04e93a8f2925f66825c33c1a021423d1ab |     
 powerpc64le |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/7c9b522c7604f8d5db44ff279b6cb51ef2b6ea61 |     
    mips64el |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/fe4fdd950fc887d73bb02cf31f42dfd1705cd842 |     
      xtensa |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/453759d0447f950af977e2d324c14f33363c7d87 |     
     aarch64 |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/611ebe3e0c106aec26ba75c55d6a6e98a7a5f86e |     
       nios2 |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/cd11dd4edaf4ae1b55c29377f2d621ec0270ce8a |     
         arc |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/590d5a19657807f94a0744cce1e97acca4f98b6f |     
    mips64el |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/556d49ae49c5fd9875353c0d37812d08b64140c1 |     
    mips64el |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/878808fca6faf2e4e64abab4b5eb3515b889f026 |     
     aarch64 |             python-pyicu-1.9.5 | NOK | http://autobuild.buildroot.net/results/1873a90b99a02f9048c1f78aa8dbf660abe4cd58 |     
        i586 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/b6d92c8eeb5121d6709999b9d10517b7b4352908 |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/f4894c688f187fe3bba20986a19a303334d5b19f |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/4590c7b546969d52d484bc4ac564aec98ad80f04 |     

-- 
http://autobuild.buildroot.net
