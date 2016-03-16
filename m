From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-15
Message-ID: <20160316073022.B1D2D101CF6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-15
===============================

        success : 208
       failures : 212
       timeouts : 7  
          TOTAL : 427

Classification of failures by reason
====================================

              host-libcap-2.24 | 106
tvheadend-3927788bb71ad0041... | 15
     host-shared-mime-info-1.6 | 8 
           libimxvpuapi-0.10.1 | 7 
                blktrace-1.1.0 | 6 
                     dt-v18.32 | 6 
                  multicat-2.1 | 6 
  getent-buildroot-2016.05-git | 5 
                  connman-1.31 | 4 
                 setools-3.3.8 | 3 
       host-erlang-rebar-2.6.1 | 3 
                  boost-1.60.0 | 3 
                   mplayer-1.2 | 2 
                    owfs-3.1p1 | 2 
                  gamin-0.1.10 | 2 
      ca-certificates-20160104 | 2 
gmrender-resurrect-aa3d02cf... | 2 
flann-04b4a56533faf8c8228d0... | 2 
             webkitgtk24-2.4.9 | 2 
           quagga-1.0.20160309 | 2 
                  ffmpeg-2.8.6 | 2 
              rabbitmq-c-0.7.1 | 1 
               tcpreplay-4.1.1 | 1 
               linknx-0.0.1.32 | 1 
       opentyrian-9c9f0ec3532b | 1 
                    yajl-2.1.0 | 1 
          chocolate-doom-2.2.1 | 1 
       openpgm-release-5-2-122 | 1 
                    cups-2.1.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
          libwebsockets-v1.7.3 | 1 
                    ruby-2.3.0 | 1 
                collectd-5.5.1 | 1 
code/CMakeFiles/assimp.dir/... | 1 
zbar-854a5d97059e395807091a... | 1 
 make[1]: *** [all] Terminated | 1 
               libsodium-1.0.8 | 1 
                   systemd-229 | 1 
          sane-backends-1.0.25 | 1 
              quagga-0.99.24.1 | 1 
                 opencv-2.4.10 | 1 
               libgtk2-2.24.29 | 1 
              gnuradio-3.7.9.1 | 1 
           lksctp-tools-1.0.16 | 1 
                  trinity-v1.6 | 1 
make[1]: *** Waiting for un... | 1 
              gst1-libav-1.6.3 | 1 
                  zeromq-4.1.4 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
          shared-mime-info-1.6 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d415018b74f05ecf02f25b5de34215cedab39b57/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b49aa32e5ac9933435f7f6fe88c49e50ade43767/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f77eb54d58512c09d7167d6d2875fd9d1632be46/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/46c3b7e19a5935081226d77d0a742c60d5215575/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/30148a82e61fc8ad0210704d41dd703110fcc57d/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/817d35f0e272664046ebab6877b241d291136aa6/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ba0a476559b3cddef9e76df29eaffea6d24eef89/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cd900e28ff67ccd1ad4bcfd0a0bb3f43d06055f4/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6c5f8c20714a3f3ba5b3ac1c1aebdeaec4d549a2/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/f7d7af4ee40870c9112b761b4a70d5433555caa7/
         sh4 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/5d3490166b2c0a39af69fa304d3dd05b79dc2db7/
      x86_64 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/62499217eeaf3228b46652e3f65776d7ece8fce6/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/07b8ee0096fa1670fe376d5fea2875438937db5a/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/c94bd1374ab050abe4cd97b7f9ccd3d144995d6f/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/6b3ac57c9d8444e8d84a414eec3ef4d44ad766da/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c2cce40ead23083e85700d48dd875138aa64360a/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f8f07ba92d44fd1096801841684e0ab6f1403e20/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/8582318af739e70e44659456d67e67017bd49e67/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/2188573021e3be7807d92a39a30204f71de9c062/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/97d8f83590e52d0096c422458225213a1afb9d53/
        mips |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/ec21978d151bb512c70d79e276bd8991696df190/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/4e18a07cf50d2e56929e5562afccdd95d52a967f/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/c792f6c94880275a7b6f69ddebe1bbe489976cfd/
        mips |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/3f56d40425f1223710dd726bc00cca1fde3ebd1c/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/c260cbb017e33398733fa84f81a74f0dee9dd914/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/dec4781e45357500d5c149aee6ee6ee45c85290f/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/b4ebec928c5458bab3182c5a23ed90158e04b1d2/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/b90453f5588ac7e086b629b3744ebf2adccda5ac/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/36dafab83b8ac99c1a8a733f84c879b49748f11a/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/1e56a1f68cea72ef71976c06ec98f9e1f8a09cf5/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/4f5072d92c7a730e4829017057f9dae2612fe7bd/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/7ed31c4648e13e0ed1f22a719fdea2e0d100589a/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/bc5961f548c6ebbe408f0cc918e040c1011add04/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/537cfd4724684e0959e93c51a33a946c0571f75f/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/8349ed1d1a8c192d97213a62994546f34219567a/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/e4ff55cdb1c1ef5d751fa3169f345b60d82340fa/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/978ddaa6aee77dbfe930086d4d2c9f56054f5c71/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/d44471efc85e077bf8abce5ac01a773d646c883b/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/a7a96e36c56416fbe4695e2bfcbb06fc4b0d267a/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/28ec4aa90b86abeb33eb7ac265691366aa5b7b96/
     powerpc |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/25910662152b466e8ef7d3a11fc699550b57828a/
         arm |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/cf50f39c200460a36b097a83ded61d70de63e155/
     powerpc |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/e89156c287822b51ecb5734e864dcef18fc0f472/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/48e6ebb14e9c91435e380196c12372b2108ba451/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/19495ff7ab893b2d0603e4c3453110f80c265e2e/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/044470fe04656c12cce232dc72526867b59f79c3/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/15fec933a5f3b8627ca39d2111a9f4c6e9acfccb/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0f1b27c9f94ef7b820d5094edd489b493f3a8adb/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/119d1f7d48dc93df27adaf4ecfae6379fc028fa8/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9a38506fca73e11fe6b9009aeec03b3602ebd234/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/585cb0735263f8f0a905b4e879a49f929eb1ca0a/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e46b536941d45c84eda1999368848a02dab3fb2a/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ee76505e15ad7b1b343031e2f172e36160f1440e/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ad9c58e6c8e18b891d603fca18ed3c6a24490d59/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bb4366babb942fd1c1943dc9c6b745cfb8b9306f/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/db85055baaf39baeb454b7c0c1848f0f2e4d046e/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2dc8af653093ddde11ec9e3012e93fea0be25cc8/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/708273c0ae6a49726b8c21d76c2676b6c14378d2/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/02892abd52f281ca5cf8458d3ed7782167387992/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/df6fb56a6c4a45263327c899ffa90f1c5d6b808e/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3a50a4a5bd527faa123f279e5ea306cb956685e9/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/31c6913e9abb6a3228783d2d8db6e10c26c5a63b/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/449c65b5c3bfea8d6745308699f61ded800b0954/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e2b0ed74c020b8e4b812e07e1c1b753b7d6631d6/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ed08c92db149140ef4c58e5a6ed897f13ecdd197/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2d3a396af4e77eed33d1263be2c68bda185255f0/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/191036f5386d37e802ad39ccefa6a551002a6b19/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/30a1484e55891550bb0a9bc4cfd8bfde66b65bfd/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f50c4d6e36ad042e4ea3bf156d22412200107166/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5b773efab7157b8478272272a246fa6126bf35a6/
        bfin |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e9f04044f56632d796e07d56c651e06e3bbf0148/
        bfin |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/98dbfde5393dae42dc5846d800cd74f3eb9f264b/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/656f4995c7ee4f135d0697d91b9f5feba2a5dc4a/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c3620a90c2724fc3dde4a6ae1812be5e32930fce/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cd608e6191113ab489623bf8d71c7327a6c583d4/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8aff71e93802f6dc3f8c205cce9bec771020ae61/
       sparc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e03795821f6b045341b687d00e7e42225de2df9d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d4964dd0c2c0ae2384f7dd2d256ba1a1485f4be7/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b82a7640b0fe11529d5611d241db1e792e7cf312/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ab3e6016ef63ec5ebd90da44bfd6c866b25d20b7/
        bfin |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/49a4210caca8ebb9a29fa97f9a5efb76a9106728/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e629faf0b779583e5141835d4a50d7b73dcaf581/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/051284ae7ab37a86b3afb2dc2d88e151b6c435af/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f363e686f3bc131898aa42e33c87a029ba4b6ffb/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d97d498c2d15c4769f9c53c17e652d0f15449dd6/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/223323786499c9ecd7ff71d69e88ccac81cd5800/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1da8cc3f100939faa6d7857aca7cc769c87aac7b/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4d688427b8b77efad885c2530ce307e0a5cc669d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/92ccf880f070c460612c8c3b2969d2f45a90bfe0/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/468b220ee693cf5b741074e1425f37c02f60a472/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e9553aa70c5e5e2e00fc39a669a94fa521f706a9/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a86a1e1d2bb9ea40675b533ce7e3bf637341b774/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3f8535ca0bcfe8a775bacda8e669e0fa7d409401/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4753fb3445126640ec5f2e7c7f04cdf19dac7f94/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b8ee52138e85f7c3242124f43853286b563b7ea7/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/aeb683461d18c5b30cf9142ed07c69cf2880a55b/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1d41c157f817cef2efda56a7dd0583a6e5287ef0/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a94cfc943833607bf489b4eb7b1aab91167827ff/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/307f1af7ab9f77b44826d108fbe3ac64b62304f5/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6703cc3ab2e2436b498e109486bb6253a820c3d1/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/588fb54225375e8a459a76e7180963aabcb42512/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/58b001fe2b246f8b0c7bb10f7b00dcdac8c35078/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/32fa3a5834caed356fc997c1b5525f17bced285b/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0b036223cf6a33a47b62b14ed54e6b9e448b4af4/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/34edcd2c4c3d98012eb10a75b48865d4d33597a0/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7475294638eeea141dfdf9b1344fb17479c4c998/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/791b86d66332782435dacb4ad7cc6386ba318285/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ba441a141d6e7fb0f2307e987837544dae86851e/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ea3fab6af11e6737a365a6381b6efd2c2d576e67/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/adc8b6868cf0df62d69c80a98dccf67331223c2c/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/50b6b083bb7c8e4eeb1bbfe2dd87e9ebccfca8d2/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f77bd0d0842441852c28a7909b614408432c68ee/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/64b83d5b996a0e5a6f1b80caf2c5271293493617/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8d1fea9b867daff5cb98405073615ac3ff25d1cc/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ab600ad223e49847aea1e9f1cf697870607e69f3/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d4cc66d5e75ba4f1e46767f0c10895f30506fd16/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3581dff13cf6c3ceb9f05a03b3b2ecc0db1205dd/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/743ab60a5fe22a0b78e1926c15c26e0759cd353a/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/292f1e109f9e9a45ea22989df70fed40ec4bac84/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e0c94aee8e35fc5ee76139f21a2f9479c3fb79f2/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6fc35e1e7eea66753775802fdcfed11d69cc9b9c/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7480ef3f16d23d1512552d1e996b4f001cc9d83d/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/43975ba93818a48f1e56296ae2d0c162786f9aa4/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d28b7eadf472257bf7a5178b33d40a6463f85458/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/14e24dca338c173c034815970738e222f3b53317/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d033c5f942e3483aa1777a42ff165cff46cc4ece/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bff1d8573aca76c685634164d737aba332622121/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1b106393f0bc28e838357de6cc21f9c6b7694888/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6d4515b2df621165d2842e0a737af73ce62839f3/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a65507e3cfa2346db522be0eefe94b3f8df8e1c3/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/61da1449643e8b4ed1d0665bccee06e78d746398/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c6e0d14e3c2b8a1d1148030f6138c3ba27788190/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ada9cf7bc6421541e13268bab86fa62290998a96/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b423ec7999a616cbbd87339da2076c5fbae39d43/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9d6de23c1e5c9b35b35060e362c7909dd0007b0b/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f5e40a57831b4e0c9c2c5ce98cb0ee3ad5f06a71/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/392083fb7218c6bc3bfc260d9acbc99dabf935f3/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/63c5373a2648b1e6dd7c757f9491b6fbcd8b267a/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9a723e82c8b8a853280bc6189af0d8e2c31c431e/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ad0c19930c291146a807ed345cf29643fb342b6e/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/43e3fc5db2aed070e23b2e68939bf99866181ca5/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/19bd86733c08d80833b8fe58b88fe2682ca0d76d/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b72158c168248a286a2a52f09a06ac58ffb0d820/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e5c9efc74e9f63fb92716048dacdef83774506ef/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4a4183ed383b127bd42bbeb081f751c819367314/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e67c61e9cb6e2c132aafc7f4660fa23ee42e1faf/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5e0c9a1af00a90d7754ca9a905ae5a6ce62bfad9/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b12ee7dce5c31ca4020123acdb5daa59a0ae28e1/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9947c21fe492520d9bb4eb7349ba3a2cccaf2168/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b7490cb665f623c50c830cef9f31e72caf063a94/
      x86_64 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/33df6f0c4c113a3eaefc15af8a554c9892b618d4/
      x86_64 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/ea5577bd1121fbd8d0e2aa378302d9c76322f98e/
         arm |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/6f7294b776ea57e6fc3d039b4e88f7a642d8fc67/
        i686 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/1054f00e8879c2dec8347e7ed5111c8fc5c7f6a1/
        i686 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/86a247b6d938940cd8b04ea97cce4b2f09fcef65/
         arm |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/2b32b1529a8be6a17959d81e64a52e871a673023/
         arm |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/d769216bb4f6b0541b3cdbbf9b587261d2409cf1/
         arc |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/19c2fbc22251e54b2e4420bfa219acde8c04918f/
     powerpc |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/87e744c250bf51d9ea421f5a2d6a5ba68cf0fea8/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/2ac81d75e56a864df31a7f89c21a37d65d5b7a29/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8cf80ed5e286bcc4b4eb5d55a73ada49f98c7bb2/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/3d658f402411f87fcbdafb391441f33bcb51593c/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8d9cd2845f6b15e5e81544b18cdd79a794b76028/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/dbe1a42d9ee87ade9c5833707ecf3e5c55dc54d5/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/d37ff6ccff877447c1a4df8a7300e67c989bfc92/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/c112242ff028cad1e2546ed25525eaf564064089/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/936a131e69d62c3608ced373958f8cc286beff2b/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/25d75f27bab7c4afeae6899acf342ef57e93bec4/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/2db8a0d35f841636f766b6fd177adb22f96d8560/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/3ceaab4bb03c33ba0971248f3895a5501cda19b0/
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/47de2672f9c86385484fbc5f0cf6d44b04d8e578/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/640795da4b469b7b08d2086ed5e52d1fd45ae2f0/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c4c265dba5e1225fea3ae42213bca24daf848f02/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/46307ce24e53e3f667f0bf835f83459a3fa417e5/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/896b5b9aa2bd8a210a266db6cd4e2c74bcc5db42/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/54b2a391398ee5c10158b98b5a3fdee986d52508/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/948617784f4ad5a68fbbfeda52d9b32d3c6017c2/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/e4556f4440814e8ac93f65d3f3d1357c6841d3a5/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/991e0388493a9a5c05a48f62f9b930822ddc7bba/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/7e3a587b351bcafa431e8691e15a650e9c8098e3/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/490c82d50224c618346d5b3e103b9f187af60cc0/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/8fff85fc22e24507473c1ff036b3091dd847cb30/
         arm |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/0d719761357805c8608987f7906a73da94a8fdff/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/4a1da39fe31451d06fbf44295b247f20c7d55a53/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/9672cca93be25711de949871f05fa789a4d83be7/
         arm |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/bc3121aa76390ec844187d54f3b1a58710c30615/
      xtensa |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/b6cbaa2c5e64cdd67f25e75869cb41bc9814f95f/
    mips64el |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/16b1863d9ba1492578ef5bbdca6af28a2c03c7d4/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/91c45f140401f13f6d5e84070734fe4b6766c9af/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d5cffc53fd4fb308279ae1e70c1a9500d49b2874/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/646eca0e71a8e18a24c8e70101910fa759ff427b/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/e7e170103cd200746f3fb7483fb857740b8d219d/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/e45e646839a6d722d4b3300de58dfbe4f2b27128/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/bf5d337f973fa65fb423c5f7b12aeb50624ff551/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/55cdcfe3c69f34e44757e33a39175c8964cbc79e/
        i686 |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/ba53190fc10a8b0a5d35b1300f72b6d0f5c3d5ad/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/3f9da2eb66dfd7118f743b49f1ee2530b75a506d/
    mips64el |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/44e94eb97783c6e81c84d9701edd2bb2fb2f9f4d/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/95f4f7cd10c6c33683b1212154be7854caea5e18/
     powerpc | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/6961c742fea911d9fb160b5ebbe24e693172b1d6/
         arm | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/00236ff4e7f0e14dede41adb273e1511c36a901f/
     powerpc | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/c7b93714458d38b53aa6614e8f1a966dd507828f/
     powerpc | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/008ad435590128a23a7d7c083c8d78d5f3b67fe0/
         arc | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/7145167905433865bba593f16ccfc2c9de800586/
        mips | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/7c2b9c3206f9e77d1786394779839fc33e333ace/
         arc | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/18654ddd30a3049c20d21aad41c257877c64e3b4/
         arm | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/709924c5bd40e7726aa5d52da159e89f1b85e252/
microblazeel | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/1dd42b4534b295577c844559f5f90ffb76c8c713/
         arm | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/23d2e4f3442a3dcb35019470a5a788f4972942a9/
       nios2 | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/1a29f05ee9a313894ac9461e0295d46ce81ad72c/
       nios2 | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/eeca491ff0681f7c42dfcf9de8c228af567d06f2/
         arm | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/5f9c88b7c4b58aefcad34170451c476b76170006/
      mipsel | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/f9a0aae956efc1598a6c028b8dc88fd322f25ee3/
         arc | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/f17b7112fb2fc374624caa6b1423f743d206d589/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/40639fa541b89ac4e61f83a7b333053210f57622/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/2bd0ebd007e01fe352bd4ff55fe64572aca468d5/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/41d8f33593b246af2b317922372322eb0a89d56d/
     powerpc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/9499d9c95f3c90d1f9d4f134bf1f8c03f61586f7/
       sparc |                   zeromq-4.1.4 | NOK | http://autobuild.buildroot.net/results/dbdb5ed0dc8df3586b5060d6974bed17a8c22f6c/


-- 
http://autobuild.buildroot.net
