From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 May 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-01
Message-ID: <20160502063023.D85AB101BF6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-01
===============================

        success : 152
       failures : 67 
       timeouts : 0  
          TOTAL : 219

Classification of failures by reason
====================================

android-tools-4.2.2+git2013... | 9 
                 host-go-1.5.3 | 5 
                    mpv-0.17.0 | 5 
               opencv-2.4.12.3 | 4 
                    cups-2.1.2 | 3 
              gnuradio-3.7.9.1 | 3 
                  boost-1.60.0 | 3 
                  ffmpeg-2.8.6 | 2 
               valgrind-3.11.0 | 2 
        ltp-testsuite-20160126 | 2 
                      qt-4.8.7 | 2 
                   systemd-229 | 2 
                   erlang-18.3 | 2 
      ca-certificates-20160104 | 1 
                 jack2-v1.9.10 | 1 
            host-python3-3.4.3 | 1 
                wayland-1.10.0 | 1 
            webkitgtk24-2.4.10 | 1 
                grantlee-0.5.1 | 1 
                 rsyslog-8.9.0 | 1 
                blktrace-1.1.0 | 1 
                    mosh-1.2.5 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                pinentry-0.9.4 | 1 
               wireshark-2.0.3 | 1 
                 mpg123-1.23.3 | 1 
                     vlc-2.2.2 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                       unknown | 1 
             ntfs-3g-2016.2.22 | 1 
                    owfs-3.1p1 | 1 
       openpgm-release-5-2-122 | 1 
                collectd-5.5.1 | 1 
              macchanger-1.6.0 | 1 
          libpam-tacplus-1.3.9 | 1 
           linux-zigbee-v0.3.1 | 1 

Detail of failures
===================

     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e227ba2ed1c5160f3e2f85eb9092c9fe3f0fd0f8/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/773aa2e4a92587ce7feab170304713674b7e811e/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3333d62dbc237134632ff213da1bc428ab816a5d/
      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d1e079eba5030963888c56024fc88163c53aac5b/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4e92679397979917dd492b4108a3a91d694a8e6c/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ea5fce0d526234e86eb226a513cd17e5c32b356d/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0dbb98ed79504c95622440b8969a179dfbececc6/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b734b021d00fc2ef34d127f58baddeab799ff8f9/
      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/95f488517b3f8663de9753b467e067b8f60f9cb3/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/8ca40b0e2995c7e178288070ce5146b6ac3f5d89/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b3b46308310f964407e9aeb6fc09e5eb2a734955/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ecfc91fb19dac4ddd4db3cc2c702c03a98039ac5/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f9761d85d767bec5741f5aa6cbffc5efe771ac78/
       nios2 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/cb276a1e3889b0d6f32b65383f4abd476a1f47fe/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/ae2a2a4f8876f77cdbc1dfee80ae055539ee5f21/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/262e5dd4b30476ac058bf917419fa0d9f531fb27/
      x86_64 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/72580bdf6b41703a7142c04d5745b19c2a64332b/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/9ed46db070de3d570520fd4ac268199250d01c35/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/5ac851a4e40329628334fdfc7a227376ca856bdc/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/32eda8dace6dffc374cec266d3c391db5abc1a24/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/c140a5d9359eaa505c3752ed0dce5bdf607acce4/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/63c8682e661c69c8f7780d2233e0ae79199e6de0/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/6c6763735a592f35f87168b0ed596b0ec4cba9c3/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/63ab8369119242cff4a3eff4264bc0ad7f85f5de/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/48243a7e69c2a0eee069da98a84c3c01ce878705/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ff74bbdff4b29cab87710c8bbbc3182351098a1d/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/43bfb81ae7b5d936dc3291ffdbad4ed8e88add4e/
      xtensa | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/9fabac9e03ecead32cd0bb520e0ece78c574fb51/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/5776c6925e3f057d3f22d55c4993c22b64827cf4/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/d8ae93e3dc986c2e53329c80ae7214b2b7430e65/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/30dd5ae98e6f4b9af3a3528bb195d033401576a1/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/4ac79d51778db1644e24029d4ad9ebaf87c6c499/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/f33c6d3c0e3df424c02d39fa7fd0ff82a35d9879/
      xtensa |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/3eab97affdb825268c172dc624f3d3011942e42d/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/ee992b9ca42c602f65fce39350ad147b8f65c4a6/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/897ed08f3c491794d60b854007178e3681870140/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/95c898d406f5e9a5003ac30284c595010965144e/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/90aad6a808db5590bdf280eb0e35ff9ead9de9da/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/a315629b2fa7b241ef2c1d1ec66bbf4238f095b0/
         arm |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/177db3c7cbb59e4388c6742e987f92df53a23fc3/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/f76d7379b43da017a4fc25235b85fa519c5238a1/
         arm |                  mpg123-1.23.3 | NOK | http://autobuild.buildroot.net/results/60d56b0a75d209f2cfeff0727c2f900abc89d263/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/54e1a66f5e2ba1150ae4dce7a60976bec491c641/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/760df5a104afcb21c6d5a72d7383f4de358a37fa/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/62900617d9dbf33bd80bce7e130cfa9945f6b2bd/
    mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/5d012eab6a1228909b4b0e528e582ae151855069/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/dcd51c8377937f0aa2088c2999ba3abd266d8a25/
         arm |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/d25b73d19978fbe607894a8a2ec117998f755b1b/
         arm |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/63adadf535b8b74fb25fceb6abb91e03570f49eb/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/135812ed273a712d3b4bd609c4750962ad2f09ac/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/2208e34a504ad8d070a1e2423a26ecbdb9fbd447/
         arm |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/46e0191f554847a12a499efc0089e7b805021e80/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/e3f3ebfd947ccfd59022274de892a8a78c9ab609/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/9e00e5ef69651df28abfaeb9d44d35df620a3893/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/0d5e0a7d8a2eac96b342e034f96ffcd97ffb550a/
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b6cb56d4c23013b81f777152af6aa17d35b8a838/
        i686 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9b0ed92984eead89d148eaa71aff6e2f1e117837/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/f3f461d58a0fdbde3873af722db65bdeabcd0ecd/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/149580a798556d6e6f4b7f5abfd427c708205aed/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/23981f4c54cd846c6bc1b4626f41825aad31166c/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/44bf042ac5b59c64a9d09487a42743a91fda5890/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/0753073947ea42fe262bb080355dd33e604b1820/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/c844124152be9e87e2e5e2452dd927090494c7a8/
         arc |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/cd45838948ef1c2f44bc986c754df825be949db3/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/ac99d1c2c2088873aa53aa036f54aed6dd556c05/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/7bc599983c8550e62175dd8e7f2737400032a932/
         arm |                wireshark-2.0.3 | NOK | http://autobuild.buildroot.net/results/c602001d792e326d74676864873a86e70ec3f14f/


-- 
http://autobuild.buildroot.net
