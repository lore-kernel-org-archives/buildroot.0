From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-28
Message-ID: <20160129073021.EBB0110487C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-28
===============================

        success : 228
       failures : 78 
       timeouts : 1  
          TOTAL : 307

Classification of failures by reason
====================================

                  boost-1.60.0 | 10
                      icu-56.1 | 8 
              host-cmake-3.4.3 | 6 
                       unknown | 4 
               libcap-ng-0.7.4 | 3 
               nfs-utils-1.3.3 | 3 
                  gamin-0.1.10 | 2 
pifmrds-0bf57f9ce0d954365a3... | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                  trinity-v1.6 | 2 
                    mosh-1.2.5 | 2 
             util-linux-2.27.1 | 2 
                    ruby-2.3.0 | 2 
                   mplayer-1.2 | 2 
                  iperf3-3.1.1 | 1 
                 lcdproc-0.5.7 | 1 
make[1]: *** wait: No child... | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                    vpnc-0.5.3 | 1 
             ipsec-tools-0.8.2 | 1 
                sysklogd-1.5.1 | 1 
iputils-c8ff6feaf0442f8efd9... | 1 
            host-python3-3.4.3 | 1 
               ipmitool-1.8.15 | 1 
                 setools-3.3.8 | 1 
                 opencv3-3.0.0 | 1 
                rt-tests-v0.89 | 1 
                mono-4.2.1.102 | 1 
tstools-08f6be304040e7b8476... | 1 
                      qt-4.8.7 | 1 
                     rpm-5.2.0 | 1 
                   erlang-17.5 | 1 
               valgrind-3.11.0 | 1 
               tcpreplay-4.1.1 | 1 
flann-04b4a56533faf8c8228d0... | 1 
       openpgm-release-5-2-122 | 1 
               wireshark-2.0.1 | 1 
                    sox-14.4.2 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
                   hostapd-2.5 | 1 
                 mesa3d-11.1.1 | 1 
                     mc-4.8.15 | 1 
                iproute2-4.4.0 | 1 

Detail of failures
===================

      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e0d91e4521af1531c145d341b9b8844935f855c6/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/02c615c15c23732b43136fdfcb7904ba896e5d09/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8a048f62a718ba6b5c8abe38479d27d64ace04e5/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ea3feff4208e6713e822b4e22a4d78b45abe9dd6/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/baed9453efa0a863bb019f9d482acdae5d393d51/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/19209fbecd7d49bb55125a2d4e4978ba31ead089/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2ebb132c3c2da7bb1e6872f844860a904ea1007b/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4ffee37b0a88837f2460cc09fe62c57b05d6229f/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/720b228a016ef4185af2448d5d8c60ae2da1d529/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a5d4e1f61393613a9e6ad2b69194a5c839b738d6/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/56a305ba5f70bbe260e99789e1dc759108123282/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/9920f9d045a180736e7500d78ca96943c2827022/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/19fc9734c4617e552e34486bca499d1df8d8ff42/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/f3d24d0c2d87dd5c52bf8f123797164a22fd0c25/
       sparc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/51b30f076803d9f64b857813437c3f8d88e950f6/
        mips |               host-cmake-3.4.3 | NOK | http://autobuild.buildroot.net/results/b4bdce658c9c3ffe17406053a6e8d905bc07bede/
        bfin |               host-cmake-3.4.3 | NOK | http://autobuild.buildroot.net/results/ab8cb0952f11e232daaa04ec42c0fda90567adfd/
        bfin |               host-cmake-3.4.3 | NOK | http://autobuild.buildroot.net/results/8f125a408a091c167448ffa6d02ea189bb3e5700/
         arm |               host-cmake-3.4.3 | NOK | http://autobuild.buildroot.net/results/457a61381019e61f5f6f68df464fda78c88ddf9c/
         arm |               host-cmake-3.4.3 | NOK | http://autobuild.buildroot.net/results/78a941d2919c380dec1f9c17b42f36f3cef1b290/
    mips64el |               host-cmake-3.4.3 | NOK | http://autobuild.buildroot.net/results/8214aab93ade499648981dfb8c86aaa1834afd74/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/a55690fb5fb6b3b8b9bb83519205aceb7b570b47/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/2280b33f223341a411dd3e2660bf6986c359e014/
        i686 |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/02f9af623678514456be799d99edfbf93b42282f/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/2a37eb1ce09181a617ac8aced7f3a4fef840c568/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/c767df1bb287a1bee5358f31720fac361db14906/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/caf102e6b3cb7428b2f15bcde92fa704ce8f9174/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/50c81d797c2af7efef2968f2c41b316b1ac120f3/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/c1c608f5dd8c8013323b154eba48411f60ab3891/
     powerpc |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/da5cf79f4731811ccf5178f4f2ffc26bae4d2c3d/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/dd34255acd62ed6173d5e0fb706c315ec3beed7f/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/975cb0f9512e7b096d54fd76132f0f97e2bc1ac3/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/60822bdf367f778950eef2a296674a945365fa62/
      x86_64 |                   iperf3-3.1.1 | NOK | http://autobuild.buildroot.net/results/4f8f40cf2070e7434f735868c36bf9070e0f4c2e/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/3e3ea0ddd004560e935a684eb70922cf7ecf7651/
         arm |                 iproute2-4.4.0 | NOK | http://autobuild.buildroot.net/results/70659d0d83163c85e8892c3a1b73607602601c4f/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/15194303cad43f83db71b518c1c31e0bb1aedb33/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/41aaf293c1ff437bae7eb894463870c47ab3a7ed/
      x86_64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/9cec3bea99f2aa10313da38c1e81655666c774f7/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/7c157cc93503743200949d24f112b050aa1dd8ef/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/93f6f1f577b56c5cebad0399c4f793b2c7d52544/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/de1c4860ccce8310929a80a607b0547e6fc20dbb/
    mips64el | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/62f48a81f06375ed906a06b32b3a3906cc4aec07/
         arm |                      mc-4.8.15 | NOK | http://autobuild.buildroot.net/results/74fb2ab90a25f377e82f6dad89d23d469716008c/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/8c410722600e239eb2001e9b1afa67d716320fc9/
       sparc |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/6cf7fd48581083d0f452ee5bcdac27d253d2f45f/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/89fa0809311673f143e829949bb0d42fe68f4bb4/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/c6e0ea62d5872d972dc620d92bab78d3503f89d0/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6c0189e8a5b220e2eedc0c980c8d847805da03ab/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b6e9e808f15a2f911485be92eda5c7193414b00e/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/6765e4f395f93059750fee420b49e8784d558dd3/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/ca1e363c0e6e8a885134a0553fb5c861d5295527/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/8ddb74e59c908d45897ab9a81d019eb7c3a78165/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/f368e6b7ac2911b62176a43e5a5944595139046b/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/3ff1e8d92b59aa2370a526b71f7a5c30a1adf694/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/ae3ba616657f56c1384abdfb39070836704472d0/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/1bd3db7b50a5fbdf14e3d6e5eebdf5b23e9fa0e8/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/bc7d5e26a491f5b73bdfdc0457cd441102d494ff/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/e46859a77bc5d403ec321ff6e609d37cbf21a51d/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/c6f260cbf2407b719b1dd60f376379bcdfff97c6/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/e5151e736692875e1a82ea355b48c14a1e0078d2/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/6683a9aa431dd63997246a5b23166f72e26c9ca2/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/6d9ffa7bd60a38fd6bf8d20d1689c94a38a241a5/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/45fd08bb533aded58643ae51d329d0c802557b3e/
     powerpc |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/137586ef9dec51a4682871fecb6306263a39d5fe/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/dc32270d3d188be3e748833fffb23354a9c83a3f/
     sparc64 |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/0e7cb8fa6b2b9084c83d19a1dd48ab106730e388/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/3553271593bc9453a5bd560b362af6ace2497416/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/7ba8f947ca17cb5f61847c2ad3133593d5c664a5/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/e0416a412f86becbffb02ac5d5e809a689e76fcd/
        sh4a |                        unknown | NOK | http://autobuild.buildroot.net/results/2dab7d3b4b19ff5421c62e1658a2b307e937bcd8/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/8f8ba43918719dbe494709ae7bd91201599a2317/
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/b258a1b21aaea679ecdcaf7650be12deecea16c7/
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/c89374676268f548fef6fc69eaa693431e714ddc/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/8ce2c8e5c5bc02281391c057e5e6bbe5d2817b9b/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/d234cf231dc5f2c21a290f21ed6eb202a5c3b34e/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/391cd2b91414e9877d47ef2669ff77d3e58a66ba/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/33efe3325936a068931d504ecf02368d1cfe450e/
         arm |                wireshark-2.0.1 | NOK | http://autobuild.buildroot.net/results/330e25ab7046db8c4dde3373c8ee4c524c603f18/


-- 
http://autobuild.buildroot.net
