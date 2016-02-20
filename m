From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-19
Message-ID: <20160220073017.2A200101DA7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-19
===============================

        success : 210
       failures : 81 
       timeouts : 1  
          TOTAL : 292

Classification of failures by reason
====================================

                      qt-4.8.7 | 6 
                 mesa3d-11.1.1 | 4 
                    ruby-2.3.0 | 4 
               pax-utils-1.1.4 | 4 
                  boost-1.60.0 | 3 
                   mplayer-1.2 | 3 
                    vpnc-0.5.3 | 3 
        ltp-testsuite-20150903 | 3 
              gst1-libav-1.6.3 | 3 
                  cairo-1.14.4 | 3 
                    sox-14.4.2 | 2 
                 libdrm-2.4.66 | 2 
                  trinity-v1.6 | 2 
               libgtk2-2.24.29 | 2 
                numactl-2.0.11 | 2 
                moarvm-2016.01 | 2 
                    mosh-1.2.5 | 2 
                  c-icap-0.3.5 | 2 
iputils-c8ff6feaf0442f8efd9... | 2 
             stress-ng-0.04.16 | 2 
                  gamin-0.1.10 | 1 
                   hostapd-2.5 | 1 
                  ltris-1.0.19 | 1 
               valgrind-3.11.0 | 1 
                   tor-0.2.7.6 | 1 
                 setools-3.3.8 | 1 
                 rtptools-1.20 | 1 
             ipsec-tools-0.8.2 | 1 
                   fio-fio-2.6 | 1 
tstools-08f6be304040e7b8476... | 1 
canfestival-7740ac6fdedc23e... | 1 
       openpgm-release-5-2-122 | 1 
               libsodium-1.0.6 | 1 
          shairport-sync-2.8.0 | 1 
                 x11vnc-0.9.13 | 1 
                       unknown | 1 
                  qlibc-v2.1.6 | 1 
              macchanger-1.6.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    cups-2.1.2 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
      host-gdb-arc-2015.12-gdb | 1 
              procps-ng-3.3.11 | 1 
                 qt5base-5.5.1 | 1 
                  psmisc-22.21 | 1 
                  stunnel-5.29 | 1 

Detail of failures
===================

         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d6c77cf3f6ff259520a376f8329a03c5025c0663/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/708672aa84416c4f4373b6e50951ead95b481626/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3e03eddba4901b3b54333f5cf721cf147812114a/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/5fedb27ffd5cdeada1b170a39703f9ef7a3f55ec/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/b09650d27dc243826c4c613666b1b8f5e3220da8/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/eba0dae5cd8d7ce24b0e559d87c41ee5c3fd19c2/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/9f696d51d4804daad95308584b1d8d8e07a7a7e8/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/8d0130d8b38a603a6adf14a1382e85dca1d1fbd1/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/4654ebbc8e94a194da870f5a01b67900228f2387/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/7bfd32c4423662bb5f5087f086200987c248da09/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/3cdd956ed65408bb46df25d0eaf13ef8852357e5/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/092ac7380beb8ce403a1a6fd8e4176e9234413a3/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/0f5f9251d378b167e4982bffb97dfbca6c97cf5d/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/1e09127092008e208988a810475abc432725562e/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/9f3cc6f33f7a047621789ea7becc53b5ef278574/
microblazeel | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/0dc4a34df570c777ea52309d1e60e1888d9c265a/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/01dc0f258cdf58c2fb9a64065657e0790a236696/
         arc |       host-gdb-arc-2015.12-gdb | NOK | http://autobuild.buildroot.net/results/abb5715df851a3f92dd2468a4500ff0974860245/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/252513cc5ce8e41cc7ed9d8b4f1c95af80e4ada8/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/98387d454ea50218b2a9f888864608f2dd3f9018/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/018c295f494cea23a168436554870919ec0f8165/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/341e1e2e9a9090421ddb56b4000520adb83e22a3/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/8f33d6586c74711a495e8fa7dc557a0cf9db2934/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/221d13e28d95e369ee21fed7ef3ea064f8810919/
      x86_64 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/25be9f977597a847ab2f67e080668e3721877597/
        mips |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/77438011a7ee7192d266fbc63272d4d285bab109/
       sparc |                libsodium-1.0.6 | TIM | http://autobuild.buildroot.net/results/8f3929913a3c3a98b073c546718dedb6dcf04454/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/2cbc70e88abbaedf8dc245f100bfaa889410bf3c/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/95f629c498d51de5bea8f14de2d305d04ecd6f53/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/a46e7897cc26a2f9b51f16a4adabb6741cc93c4b/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/65e7fd1205e30fae59bac452404e9c25aee2e19c/
      x86_64 |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/50c2c602b87985369d57db0bf14246c478a63846/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/99955c9ebcb5de20464db9905638a4130489d553/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/ba50fb58c6065407716c45af5f51209d56f58d1f/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/a958e9d9e9f24f10e199d94bf7b24ecfc63b0448/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/f9cb79963bfedd10058ec8929c55f19cd813a76b/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/c55e1c2e2e0e34a98e3a760ef4d3ca07470a7b8b/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/45fa9eacda457390f0764db26275b0e9744908ab/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/317a2dbbf75c8fcca99099200a5ced2b4b9dbad9/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/d231981e5b26f3c021f3ffa598b3ae6bed22fd01/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a06b489c592ec97770d19634d7a83d31e6faf4e8/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c98c3fd9439f8ab5abb4a24d975a8bcc6835e2dd/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/f78da54979bd74ef065c8041fae9157c36a15156/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/cb2c60d2b72906a2df961041cb53277d0c337b3f/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/ea4f0db78d4ebe37d3bf6e9db7b76e7563da15d5/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/db1b29ab5bbc93db54032c09ca2576ba2cc2847b/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/27359620bb874cdced620940fddcbd7de5bc143e/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/e4a33241a0fc3c72e89f3cef96c81cea158a6bb6/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/e63da53a0058d9f67d5b0af0419f63d06f93dc66/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/5702ad71164404aec187db6261084d233ff06833/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/c28895e04d938ec46f2b4f6c1158a6168358b3d4/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/08393c20286584ee6a25c96292c027b757ec3fdb/
         arm |                   qlibc-v2.1.6 | NOK | http://autobuild.buildroot.net/results/79098fb27ef2d5b09df777cd7365a61d6de55c52/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a06bde4e2fe0615e3c159de5cea40bb12e072636/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/269b7457161043b203fc67c3b1fd496fe11c1c6c/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3d215b4dc47b13ade914bd08d7ef597e4dd6b12a/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/82400702d595c9aa7ccf742b53cceb92aca4fa6c/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0825c308aba2b4de0c1b7415968fcdb3f217f0ea/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/243aa63891e517dc746fef32d7209cf550ac533e/
       sparc |                  qt5base-5.5.1 | NOK | http://autobuild.buildroot.net/results/e5ad0ab435313f4e2a94979ca759a27bdd52b8f1/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/4969cc1fd755abc0dcc12e6c4dfd6a0496b2cd8c/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/b15dd3a02112cf42f893417cccc8d4a4789af1e1/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/8fb96b8c27be29586576a146368365f17c454a43/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/1c7a56b2612e88b7514198c0fbb105c2312156f1/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/f38fc1c9610217453bff214fd01c99c40809a87d/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/3e6658cbe190c7d1cac30bf662c8fd3d6cd847f7/
         arm |           shairport-sync-2.8.0 | NOK | http://autobuild.buildroot.net/results/6821605cf12e1a5393c29b30baf00cb0f1e1a451/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/43b2eea45edd0dc1295af5173ae9af9bf0b5560f/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/2c582a7297958c4269acbb9d07ebdbd07827abfe/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/88de727f2a8e8f98a3c1cde10a8aa51625497655/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/40a48319dc03c4c48ee8734663f84d8123711f5f/
      mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/7d81b2ab19c6647c3ad4a1755f454d574d80855f/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/c961424d094461f1067110076fd678ff63a37611/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/b3c505070d2f1d4ce657560bf0b9baa5cbea878e/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/5a2af2124e6b7c09e7445d2a16b9728e7a76103f/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/c3cf37ab69016d72271b119518691c87352e43ad/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/b079d94b88b9c39a6d4a647d6aa220cbb109b1a4/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/e1a18097641fec8952a616a331e45cc3443769b1/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/6496d82b9ef78cca83e25b9fa5b9a6ba04ba4712/
         sh4 |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/f957034c5b85372b4ae5de4c775b49eb38434826/
     powerpc |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/f75261f6f983893e6bad395700ec661c453eb991/
       nios2 |                  x11vnc-0.9.13 | NOK | http://autobuild.buildroot.net/results/c3244fe995b629c1776ab357cc98801979f914d6/


-- 
http://autobuild.buildroot.net
