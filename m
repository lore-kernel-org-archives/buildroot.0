From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-16
Message-ID: <20151017063016.8F916101BB3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-16
===============================

        success : 196
       failures : 78 
       timeouts : 0  
          TOTAL : 274

Classification of failures by reason
====================================

                busybox-1.24.0 | 14
                   mplayer-1.2 | 8 
                  libv4l-1.8.0 | 4 
                  snmppp-3.3.5 | 2 
                  ffmpeg-2.8.1 | 2 
                 mesa3d-11.0.3 | 2 
                 mpg123-1.22.4 | 2 
                   attr-2.4.47 | 2 
               util-linux-2.27 | 2 
              strongswan-5.3.3 | 2 
                  aespipe-2.4c | 2 
              swupdate-2015.07 | 2 
                directfb-1.7.7 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
                  mono-4.0.2.5 | 2 
                    sdl-1.2.15 | 1 
              wireshark-1.12.8 | 1 
         qt5connectivity-5.5.0 | 1 
                    ofono-1.16 | 1 
                libsepol-2.1.9 | 1 
                pulseaudio-7.0 | 1 
                coreutils-8.24 | 1 
                      atf-0.21 | 1 
            mesa3d-demos-8.2.0 | 1 
                      pv-1.5.7 | 1 
                gettext-0.19.6 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                     apr-1.5.1 | 1 
                    vpnc-0.5.3 | 1 
ltrace-c22d359433b333937ee3... | 1 
                mongrel2-1.9.2 | 1 
                   perl-5.22.0 | 1 
                minidlna-1.1.5 | 1 
           argp-standalone-1.3 | 1 
             webkitgtk24-2.4.9 | 1 
                  apitrace-7.0 | 1 
                rt-tests-v0.89 | 1 
             lttng-tools-2.6.0 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                   gvfs-1.16.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
                    ruby-2.2.3 | 1 
           libfreeimage-3.17.0 | 1 

Detail of failures
===================

      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/98c3df2a8b9e6e2283833b252fab72811721489e/
      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/002e26e93df7fbe8ae06161e7493c71fd9bf7e20/
     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/7825f54ce3a527fe0055e0b74090e99574b1188b/
      xtensa |                      apr-1.5.1 | NOK | http://autobuild.buildroot.net/results/17d90a26e941eb1601267bf4042598665e43c67c/
      xtensa |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/609b1027383d73631c7baa9b405f4d7cdb42ce9b/
      xtensa |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/6e99abb6da2c9eada91fcbc2b87ceff13526d7a3/
      xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/f72da9ad92edf0cbfa91fe7a5ad0d432e6befc54/
      xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/c518e0022bd47d8e9e3944b3a21a0218118aeafd/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/54e27c66d1068180ce62352e960ea1d47b3dec0e/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/4964d7e7b31add81e823c31bad11a9df6ad48eea/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/9885ed8786373f03bc73e0482667019888cb3f11/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/157ff74728a11d3a48f693e1dec27e744acf155b/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/8fa391d520b0095f15545918da9a64890c9f2be2/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/15d07db1d6908bb4ade45806fa64a2bb133d9bc3/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/d45fce4609a5f7363a985dc7c76d31c0bba3e194/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/18fa95e145ff1124bab3cdd37c7eca77156da4fe/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/e8ed11d93a37752087ec074c9c80f413a1b67537/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/d2bb112a7df71090feed0198e826f4da2deec039/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/4492a8bb257a962ad66c6e4c857b004d3c12dd98/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/26377d632467bbb7187a45e29b1f90953074d90c/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/52bd6b95c56ad827797db4b5fb921354f56a077d/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/6af9ecb929c8b441e00aed5a8cf140f79e640617/
     aarch64 |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/ad43bbe2f82b4a47753e80bd5b47cb5f3348add7/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/9814c6d3140c74d893aaf5b97b09ef1434bbddb0/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/980b81f42b2c7750000f3cd6dcf747be0200cbf0/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/25524752f7efe9fa5f8e4e04abfc86d2bd6649da/
        i686 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/029695a022ba12ff177521ebc3334d7ac2373ddc/
     powerpc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/3ca5b88d9974b235b97c85bbdf840ae23e3fa2ab/
      xtensa |                 gettext-0.19.6 | NOK | http://autobuild.buildroot.net/results/05313ccc8ade98f3785ea36e4370a8e376b50470/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/643c42c619b3c684ae0e8fe610c5fdd13be66a6c/
     powerpc |                    gvfs-1.16.2 | NOK | http://autobuild.buildroot.net/results/434f50dc095cf58c7830f6cd41dc6c78530cca67/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/9bbbbca9bd09eaa5dcc1738907f9c5076226539b/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/8b3b8dab5f139c8486f40fe63ae8a79baa1417cf/
      xtensa |                 libsepol-2.1.9 | NOK | http://autobuild.buildroot.net/results/75eca16f661753177777df443680f4a9fbbe3ffb/
     powerpc |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/be0daa642d290c033d233f6506f48bc2e16f638d/
         arm |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/f3bf1ef83e52d8a41005617c996edfd0da0859f4/
      xtensa |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/01b581380c1f7bb81154b7145760147885cbd805/
    mips64el |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/80f79347cea22ad98d7d6fa15c9eb8bfdca7de18/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/40038f1fe52d56f9831e6930525e3a43a88bf75d/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/a104b2b902f48d3ec587dd0fa6b2b53c92342236/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/e5672bac81b4c7368f254bd3eb484b5a062746c9/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/da0c701589baf2248889d2648fe5b8fdf40cf604/
        mips |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/2c8e440873d75a68fdfe323383ad45f7601e908f/
       sparc |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/e99e0a350def498da7d6c834f5dca424385ad13e/
    mips64el |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/806b83e2da47b3d4c48388a581392ee90ff061f5/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/113db9f803e8888d09a9d9ac1be94dfb992a6e93/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/5ed2cdb370770fa9cba13ff0806a47c583317e5e/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/d6e00d613cff55e5e360e65b5400c58610daa110/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/62915fa90118d85ee2ade3271215df38a89ed39a/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/62581cbf084ce8a915227d326d376209d357c95f/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/774e6b4f49ab76671ba10e69f8b306ba2e17b7a0/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/86095711db3c85b3b7c7abb32cf9e420a090971b/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/f5addaefab8f7f860c994d0427c9b28d43fcbf1e/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/243493dfe24439cb230d81aec258ab321cf87ceb/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5af0c821ce80cb73f9e1bac17305537261ced005/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1652c2b9e6bda8cc9cfd0f81a2ba96b97a6d6de8/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1701655bb72ae7f59ae31a72acf1b484a4ffff91/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e30e0ed384d00b704801030c91477c8575cabd6a/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/431de44dec4cf6bfc82327e096d697fa846218d6/
       sparc |                     ofono-1.16 | NOK | http://autobuild.buildroot.net/results/5e7ac04fa56cad72f3a3f6184affddb506ee716a/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/165e21a189eb2ce811b8640b9c47c8dfca14af8a/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/5fd441420b8009c3c9b5171854fb0450c6d6a474/
       sparc |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/d236284807f9087b19bfd843331a7e573611933d/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/4f67fe7e77eacf20bd682f6ad42c82f631d67143/
      xtensa |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/647d8c4948c0b0b275ded062632fe64a227bdd65/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/a2956acb6ae7e298e7bb93aefc7a4e85f096ea37/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/b0fe87c68801a38837f1e4373560cdee0cfba828/
      xtensa |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/7c1ee033c5fb886225571141d3bc02f7651bed0d/
      xtensa |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/b7b973c545cc4e364726894fdf8bd5592e7f0311/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/ce5f3717af52a19dcd8704eca80b50a5fb5a114e/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/c218cbbf808ba1b5b4314ee1d116e5baa1377175/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/627ea6ffd0212f4433333b2705b0255f5df3b4ec/
      x86_64 |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/1e73c39048476b079e1fe2e1918764e2f831d7b9/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/66b4ea5a69df7f03226c232c776e23f04d1dcf00/
         arc |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/33b178fdb3e5663fa1488576ca00f042ea480a52/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/798a88c0918153fed2c274c84e7dd5b4307f38d8/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/d970d364a33fad0dc51c5a6cafbf409f83e70463/
         arm |               wireshark-1.12.8 | NOK | http://autobuild.buildroot.net/results/75b85ef4c3d17173130eb26763ed642a2964d7a4/


-- 
http://autobuild.buildroot.net
