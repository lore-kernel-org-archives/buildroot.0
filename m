From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-10
Message-ID: <20151211073018.CD5E2101A42@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-10
===============================

        success : 232
       failures : 103
       timeouts : 0  
          TOTAL : 335

Classification of failures by reason
====================================

                 libeet-1.7.10 | 18
                 libass-0.13.0 | 7 
                  ffmpeg-2.8.3 | 5 
                 mesa3d-11.0.6 | 3 
             lttng-tools-2.7.0 | 3 
                   libnss-3.21 | 3 
             host-nodejs-4.1.2 | 3 
                directfb-1.7.7 | 2 
       openpgm-release-5-2-122 | 2 
                    faifa-v0.1 | 2 
               read-edid-3.0.2 | 2 
                  trinity-v1.6 | 2 
               wireshark-2.0.0 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                harfbuzz-1.1.2 | 2 
        ltp-testsuite-20150903 | 2 
               arptables-0.0.4 | 2 
                  c-icap-0.3.5 | 2 
                libvips-7.42.2 | 2 
f2fs-tools-fd32210229d4ad7d... | 1 
           python-pyzmq-14.3.1 | 1 
                oprofile-1.0.0 | 1 
          sane-backends-1.0.25 | 1 
                rt-tests-v0.89 | 1 
                pinentry-0.9.4 | 1 
            libsemanage-2.1.10 | 1 
               syslog-ng-3.7.2 | 1 
                   glog-v0.3.4 | 1 
                moarvm-2015.10 | 1 
                 x11vnc-0.9.13 | 1 
                   perl-5.22.0 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                 dropwatch-1.4 | 1 
             bluez5_utils-5.27 | 1 
            mesa3d-demos-8.2.0 | 1 
              alsa-utils-1.1.0 | 1 
                  boost-1.58.0 | 1 
               libcap-ng-0.7.4 | 1 
           libvncserver-0.9.10 | 1 
               php-gnupg-1.3.6 | 1 
                 liburcu-0.8.7 | 1 
freerdp-17834af7bb378f85a3b... | 1 
flann-04b4a56533faf8c8228d0... | 1 
                elfutils-0.161 | 1 
                  weston-1.8.0 | 1 
                 lvm2-2.02.137 | 1 
canfestival-7740ac6fdedc23e... | 1 
                 setools-3.3.8 | 1 
                      qt-4.8.7 | 1 
                xfsprogs-4.3.0 | 1 
              squeezelite-v1.8 | 1 
                  gnutls-3.4.7 | 1 
                   hostapd-2.5 | 1 
                   mplayer-1.2 | 1 

Detail of failures
===================

      xtensa |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/e795a4fd55ccb389a24bdba6c7d4102a0554ec43/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/9cd02b18888b2bcfaeae072a733f9c71555a4986/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/878aeaaa31d4123dfdfa7a46d07abb29a9640aca/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/1b7b30796eaf7151b4a1653e96271fc4349b7bb6/
       nios2 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/83100ea12b9448d3d8b20a75d250c6bad9620b2c/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/52f387823185bd8ce4bc82abeebbefe9408df49f/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/3a7770f45c8a92e118dd511b480938a6b51eb957/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/b917f2e5dd23462641a8b668016901e369c1ceb4/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/ae2bd3fd84e96f31ca5c99b322a1e8d03c7f4d9d/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/72c0532b4954e754beebdb7bec14ca58d32a17b2/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/89e7c34ee0d6b0da40e8a8694239f0453cfcb05f/
       nios2 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/63e15f250efe93c7056e73a62b17e1d382d7a54f/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/a9db69a2522e8fa0ceb82c2b9e8ee39f94719da3/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/553e40b685d95762e5f84e0451d4fe64f1bd8416/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/eac76ba0570cc11be9c239232934a47299afd579/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/3534a94d69c93e3a1d95099364991489eca6abbb/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/f75526e416cf935e574ed9e2d778db6313058d2c/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/75b46ef0890bd13c924517be8f98a711d0ce3974/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/8723711ad80cb29c5ad876fd3f31479c595ba176/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/ea53aa7f68418371ecf77ca3d020e0eda6a8d658/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/39595b7b8651dd502ad144405952a97fe1567fb6/
         arm | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/70ca82f32eac912f18c0a8b3f592e1b13831ef8d/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/336fcb377827a4bf5fbc3c812d3588690ee4e9c4/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/6a807eefa7904d39a0d043dd2ed5352072f7b88d/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/6d49ac52d210ba4b0393b7730362b0bbc100fae8/
      x86_64 |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/6706a4bfd0408ba62a02ee62b3373afbb7f67b3c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/067e9620d31d096b5a054a409df0efb3dbaf2583/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/4cdfb4a2d2a7bda1c8664dcec95c34c8c5d372eb/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/4882f8da9871a94b25e755ee78172b1f380869b6/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/296e06d2a9760a46f06013f4e3a80cc38bba6e2a/
      mipsel |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/2d09db39f972575f9b8c0efaa4a9b6668142a891/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/3c565ab5ab49b5dfbd8e7f43ed00a44c00c0121b/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/b3ff3006320f3b89b06b6c7e68883374e79acdfc/
microblazeel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/78de46d62e7367f37031b4d9bfe740bcb32c88b0/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/a9db22019b50975460ef68b63b495bffcbdc9383/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/9d8d86011e81b4ace2bad7a69ab6d4f1f15ee2a2/
        sh4a |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/4a5bf5d13d64ff7303fe8454e5f4d70aaf9c40b8/
       sparc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/62868726e72fdf23d4c7385e8afa183622455890/
      x86_64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/dd0b896db611d305510b8f64f58da7337e7881aa/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/eb73036d00fdd0cfa02265fb2dafe60aed58375f/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/e405dbd09f0fe4a21c556adecea443bbbf831d8d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/84ca964bba8c85afcfd094334a111aaa3e5e9515/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/25699b4d06a07a279f01b6547f4f8040f5bbff47/
      mipsel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/f3bfe31998007148e9719ab64d09374549db4fe0/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/aae29b66748e0ec54ac3721ba679b5fff49458d6/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/3726945e0dbe42bbe2bff32d14ca1bbe545829cf/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/3fd9e1f2f6c7ea522287a621eefc7848c38cdfc3/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/2bd317544f72fda791a333e92c632e7feb90be76/
      x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/4e6f483c06e0c8579774f6608b5cd641a1ecc69f/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/bf5fd457445020dbeb12dbd490c91079a020fb21/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/ad6161e95b8774c99d107bf22f74547daaa0de0e/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/3d23d2ba20acfe020750190e6e646648fc0d106e/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c912982216e1ffa81dc26e8ea28bd4d80df3dbf5/
       nios2 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/880d092bb0b39c5ce195035aed98943acf96829f/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c15917dc7865cbfdabddd91d8a00575bcd0db900/
       nios2 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/40d1a35678fd22c3718c96b86df019d713e699e2/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/576cbc2a64c4ee1b467a79e621fe34874fb404ca/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/5a7c71f03233c2e6425d2215cbf78f2b29c2cbaa/
     sparc64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/e4fcd00ebe1d1c18167b902d9da961d0ad4152cb/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/082c01b15b606f118487f3f5f289b271de2bb70a/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/ec4a842406756a8725223bf085bfcbfbdf760d94/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/fc5c68662b277b271263152c9f18da79a5745835/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/52e52338e48572c47a544cd8ba214a2585a33e0f/
      mipsel |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/c7b4ab8f909eb35905cf7d298b9431b38f604788/
        sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/f225c58a99ad5573a2d96bd0b37bf565fcbe8504/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/32f494ecfbdb69a51a12cdb0509a98f89c3d8e7c/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/995b0dbe55c6e036016323a3245a49a86f9bce9d/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/4a6e239e85427bac7928023a73e33f92223de157/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/a89630a8c44c33d254de4ff1a814e348f1318898/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/b0a925dc59e12ea5ced6f86d9a2ed9993f572234/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/f0e257bbf2ab8bd057b9ba950aca6b57bc360861/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/763a4d4dee9cd685742cfe38b5dcd4325ca3079e/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/ad5619ee2523d2c825740c79b0e7d411d3b25e19/
      x86_64 |                  lvm2-2.02.137 | NOK | http://autobuild.buildroot.net/results/083ae5d35bc7e0a36661a813bd679aadda2a7e45/
         arc |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/4e905496cf7c513b4f0acd97e5563dbc8bfb45d2/
        mips |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/e2bc8b73614d9f84714bc6f1ece47befcd272657/
         arc |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/7a7321f11c5b82af015f6480ad760992795e6239/
     powerpc |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/fddd3cfe9554513a670e6f74aafaf3c6df35975a/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/a1db3ca85dad6f7465bcd3a1b491d8e41ba61a08/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0e43c92c06022d9a906ffd032cd06f431cb47c28/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/89fea6b73ed8e5a9ad64a65b610f3daf01f18209/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/e605d0f3708412aef3fe909185ddec10e6ea3bf2/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/e87663d068764bab52fec1d59107653117102e84/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/2e5273dd32053209e521c720dac6d9a6dc58c336/
       nios2 |                php-gnupg-1.3.6 | NOK | http://autobuild.buildroot.net/results/d1e550c2dc3c50312011224f956f3cbd45633c63/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/0686d3772568418bbfe322f3209ad5ced8d22f69/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/8e4407ac52c2c31812c670cfc90f1916043fc011/
       nios2 |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/0a6423f7fe5690fb87922dcc710ae8ed5a56ac98/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ef002940430a88646739dd53c7d302841321dbe6/
microblazeel |                read-edid-3.0.2 | NOK | http://autobuild.buildroot.net/results/87e873a9e46de4c010b21cef4aeb5671ca111091/
         arm |                read-edid-3.0.2 | NOK | http://autobuild.buildroot.net/results/4f32feabb06cdd82df5fb03da43eb3eb0be7e127/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/14c1ca20725af439a7c7ce56a2401cd4b2df253a/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/c8aa92026ba5d230a5dd87011079e886ff035315/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/d8fe580850c7e701692bc3a7d62a8a009749c667/
     powerpc |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/0105b659ab1f5fa033f6304b1ee55e56154a5b38/
         arc |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/941e26ee40e577e103899887351c355d57d5ff70/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/71b83fd52b1935d35530300dbd31f132d3f9bbd7/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/a00d2c8ed44c37d5caa9eac841652c8c794fa0a0/
        i686 |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/62a426f7a035458db9f687eb3e3034765ec1759f/
     aarch64 |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/b987ab3014bd5828b883a4825448dad7ec595cba/
        i686 |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/56fafb6ac0600ffca83501ab8bb98edc410513cf/
       nios2 |                  x11vnc-0.9.13 | NOK | http://autobuild.buildroot.net/results/a4d334191f5fc8491ac5d5b82b72e09da54038fc/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/e72b974e5e38ddc0f448fb236b9b013ef71bc8b3/


-- 
http://autobuild.buildroot.net
