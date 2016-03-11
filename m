From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-10
Message-ID: <20160311073022.E36181019BF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-10
===============================

        success : 169
       failures : 100
       timeouts : 4  
          TOTAL : 273

Classification of failures by reason
====================================

              host-libcap-2.24 | 21
           libimxvpuapi-0.10.1 | 10
                     dt-v18.32 | 7 
                   systemd-229 | 4 
                 binutils-2.25 | 4 
                  ffmpeg-2.8.6 | 3 
sconeserver-c4b8e14f6e9e06c... | 2 
gmrender-resurrect-aa3d02cf... | 2 
                     mtr-v0.86 | 2 
                   mplayer-1.2 | 2 
                    owfs-3.1p1 | 2 
                  cairo-1.14.4 | 2 
                   lzlib-0.4.3 | 2 
                 mesa3d-11.1.2 | 2 
                 libraw-0.17.1 | 2 
                 omniorb-4.2.1 | 2 
             ntfs-3g-2015.3.14 | 1 
make[2]: *** [code/CMakeFil... | 1 
       host-erlang-rebar-2.6.1 | 1 
            lttng-libust-2.7.1 | 1 
          libwebsockets-v1.7.3 | 1 
                    vpnc-0.5.3 | 1 
     toolchain-external-1.1.12 | 1 
                   nginx-1.8.1 | 1 
           lksctp-tools-1.0.16 | 1 
               ipmitool-1.8.15 | 1 
                  connman-1.31 | 1 
                 lvm2-2.02.144 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.2 | 1 
               valgrind-3.11.0 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                       unknown | 1 
                  trinity-v1.6 | 1 
                 rtptools-1.20 | 1 
              memcached-1.4.25 | 1 
                      qt-4.8.7 | 1 
                     fbset-2.1 | 1 
             netbsd-queue-1.70 | 1 
make[1]: *** [libleveldb.so... | 1 
      kismet-Kismet-2014-02-R1 | 1 
               libsodium-1.0.8 | 1 
xdriver_xf86-video-savage-2... | 1 
  getent-buildroot-2016.05-git | 1 
               iptraf-ng-1.1.4 | 1 
        host-gutenprint-5.2.11 | 1 
       openpgm-release-5-2-122 | 1 
                  multicat-2.1 | 1 
             ipsec-tools-0.8.2 | 1 
                    ruby-2.3.0 | 1 
               libcap-ng-0.7.7 | 1 

Detail of failures
===================

         arm |                  binutils-2.25 | NOK | http://autobuild.buildroot.net/results/c1cbb91b1ffb357c520132a8e720bee54faa1a7a/
      x86_64 |                  binutils-2.25 | NOK | http://autobuild.buildroot.net/results/d502ed16002327e6434c37fccc826d121ff1b6d6/
    mips64el |                  binutils-2.25 | NOK | http://autobuild.buildroot.net/results/3d354f45400be7aeddcd8f6cebef13ad5b0ccf82/
         arm |                  binutils-2.25 | NOK | http://autobuild.buildroot.net/results/15f4c9cc070b81dc7a216ff25f740cda6e5fa819/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/05e6ad91ea56f5ce0ab72621ab6df4164fed9055/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/76753020d12798ec7fdf8a3c8f8684f4a7bec819/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/d3fa08481ebb9ba91903b94893ceaeabffbf339c/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/768efd0bb448c046a019c2ca619750c703f813c9/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/d33044013b461c667a8f5049168912ca04ccf13c/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/68bb7352e8c0aae19d5206fd0a4e9e3d55059c6e/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/b496772e3d3e0d9bdc100ea2cbcc710372994926/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/ae0242f3a6e507555f19fe0d9885a12e5b6bd61c/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/76b604ccf097d2388dc6e257e735ae6ae0e62236/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/7e9ef24516caf37f2f0fec667f48212413fbc43a/
         sh4 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/697eb5ddb6fd355e55ff277228ed392b016f9bb8/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/c2d790c452eb0d2951f2adbdcf17e6da0fb9d39f/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/94f812e333ba53b09a065caf8e4656948060742d/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/963494c603dc3beaff8dd2226eacbdc998334e2f/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/ab3864e23977330cba7e82f7128105537be73d43/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/4c379941d58a5609eed023902e9b4e2ab2bd0fe8/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/34ed73ef788aa9b560541d9f1fad158392fb9cb2/
         sh4 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/37a2ae9c5917da408942ab3a6e2477bb76e4abc6/
     powerpc |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/5d9f75728d3d644f0b0ec0fc6e94e4f408eb278f/
         arm |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/3c76f7fa2c0808d9071dc2940328431e620cd526/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fc604400e33815da00910ee61bad070495ddb60e/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5719aad7f02be262ef8d6543b3fc726bbf275e65/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a346e1f0ccce2907a3b891a8376f23b4892de699/
       sparc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fb0e74ce0ed35f71d50d315aa503a514a35b569e/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/01f5430705a63386a22dfe7a604c0351254baef0/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/10fc79767d24bf6b07578ea0e6deece30d6f10d1/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ab6b4c646b95f53da62f985888bf5dfbb2f70fa5/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0fd2e687915168b2ce95a9e26db7880a964542ed/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8b82692f8623121f07b20c3390b089faf99aa76c/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0be12673f62e06384de90aff0d8204a6a8fdf11d/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a74c858c6f50d65520870c4aa5d778a1cc466eb2/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dbbc86e45b77c0128abc15dc343fe47f757a230c/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1156b5f3210d6430fcbfbffb7f0a192d78b7bdd6/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9bcf1c57dbf8121d86d1bf4ef5bb25a8790598fc/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7b7b4ea34fff05b726fe10f584f5951c7b10f449/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ca9659cc3b4bd68afdbe1a84521017bb9f89ab07/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/41afcf3446fba1616a1a2fe395f9bc17abad2c78/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/630c21f0bbf9cefa6983c0d83c57196ec9850bb8/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dcb21f88b83dcafb581cdfe831abf2d17b3c3888/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4e119f4afe150a0cc45b684d880caf7d97207344/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0d1bdc8ba8bd6dcbaebe923927729750f7b3a031/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/f6b1baae3e819368c6b08ad08013a8fba9429495/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/b845c6f464bfc6c749a8386164d3b07b11bd82cb/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/c186a231183af847548db9e412f2a72a548b10ba/
         sh4 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/f6e4123c4c2e08191bb59a8d6e946da87f93b101/
       nios2 |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/bdb482265e05b573efdb5a053acd77bcf9ebe683/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/77717bca6993c238e217c1e7d40ae3caa87ba0ae/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/3e0321df106f54421d60b098be8cfe22be73d981/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ff4b56aa08d43ccb9568ec616564a07ac73ca998/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/26f2740fa5f1fcd80dcd2ededd9bdde494b76b65/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/6c51c3b4b06ae22e88ecec4d1e1bb114fca8ad18/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ee108a353f79426dff8c02121e8285374dcbb15c/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ead3c6092f1c9cb626e3263aa7d7a7e256cbbc08/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/b072bde824f4ad858cc97c32d5567f99b36aec63/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/1d66370f58c595e019aa1177c43ad096ffda8809/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e2200c2228de03ee5f9778e525150f2629699192/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/4f1fa0808f3b6ad82a66487f19806a6f9b93baa4/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/76ee1abed47e41f5108fd11bed107c6bf3f519c9/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/6fcaedce79b63a513cceb4f9ad77aef1ed1b872a/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/3c30e124d00ac7ec010d6bd8e30cbee2535a610a/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/35a242fd7a1957d13213ad25b341e33006938af7/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/daf9f9318c29fd06bd933dc649190bccc80852b9/
         arm |                  lvm2-2.02.144 | NOK | http://autobuild.buildroot.net/results/6db77a566c2d56d83e059bc32c0134b2bd777ec2/
         arm |                    lzlib-0.4.3 | NOK | http://autobuild.buildroot.net/results/f56040f2b3f529ceac6dad31aeefe930b7fd0fa8/
         arm |                    lzlib-0.4.3 | NOK | http://autobuild.buildroot.net/results/91e22441802209509984d785b1c4472998af17bf/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/14f03c450a7ea78f0b9aa220aaea4574cd0ca388/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/9121dc3305d512c4a8d9b39f726300d1fa2d62ad/
         arm |               memcached-1.4.25 | NOK | http://autobuild.buildroot.net/results/a3858d057341d0d9338f22c3b20ddfb0a3c643f1/
       sparc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/7f32a9577ee2e50af38d4f60de50d938792b66a3/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/28a3e926387b1151ca57d059060368a703faf7e5/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a5d322c782f42fe108b373c1b5c89c6071ae4c9a/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/be9e46cb346c3d14d893a680a4c01029b980e110/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/70b35e765d58e72045e39f850967df5661a1529a/
         sh4 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/41c904ee43e2072b8ad1fb753cb7f0ca6655bb1f/
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/e92177d9c4fa62fb8afb9572b173649c5a5bd59a/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/2b668a7db3929b35e2c3d12b771f0dc67ba54221/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/064c4b73c2c5d8a14e8343208567c79899bf645a/
         sh4 |              ntfs-3g-2015.3.14 | NOK | http://autobuild.buildroot.net/results/3b04f0ed11be37b5e65d63aec0ea62bd90ff4fc6/
      x86_64 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/fca33ba755d9fdf47dec42cbf94663f9168799c2/
         arm |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/79b99e3daeb60d24ecf8052590d05a6fcd3e9c34/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/62ea0dfa1e522550f5a32321e3799a483678bf95/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/18c2ce99458f750e46aeaaeaf11fbec80ecb3394/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/50603f059c26a494aea691d50294219a63b78572/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a1b8cbfecd1b9d35bc74a811fd1905cdd23c17f4/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/a5a5cdd61ede3286bc2359626a6ad78545ff7f57/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d2f61e4517330541fadd29e5590dbbae354891c1/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/e5c4f650a32aab5185b39064f73bb1e73de1ba10/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/c8ceba9e27b9e97b80e99274670871010740fe03/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/2baf6c2e5b5d77e2ca040127eb7756ce7a3ec37a/
      mipsel |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/6d50e466f0e7c60be4ca4382424d94781d41c49b/
        mips |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/cc040f9b6c008db1aac82c9c198bd509361046f6/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/0f263b1cb756ca83ae1be2cbaa58c7c9c10b2c97/
         sh4 |      toolchain-external-1.1.12 | NOK | http://autobuild.buildroot.net/results/476557e4722aeacb1be30b4c7cc1c3e485d7a0ef/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/b78a67bf326f5f53f6c5e9c02f0bf8e0e02b1ddb/
         sh4 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/4238d558ab43a8e1e8f1677fa5bd37c12522dcf7/
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/80f58b7264139dd82c690cb8aae97349aa412539/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/61f36272f4e82fe7bdfa1e262f7c29597042f231/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/9d86ef8e012bb61ceae3316ebf067e2e4611236e/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/73926746dbef29a936ef246fe391ee5087064b17/
     powerpc | xdriver_xf86-video-savage-2... | NOK | http://autobuild.buildroot.net/results/38c8637b055d1e6f68b288a079e22129c924b727/


-- 
http://autobuild.buildroot.net
