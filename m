From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Feb 2021 08:18:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-11
Message-ID: <20210212081823.6F13B87117@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  3  |  1  | 20  |
  2020.11.x  | 14  |  4  |  1  | 19  |
    master   | 123 | 79  |  4  | 206 |
     next    | 34  | 37  |  1  | 72  |

Classification of failures by reason for master
-----------------------------------------------

                  perl-gd-2.73 | 10
                    mpd-0.22.3 | 8 
              netopeer2-1.1.53 | 7 
             libopenssl-1.1.1i | 5 
                  zeromq-4.3.4 | 4 
                  dhcpcd-9.4.0 | 3 
        host-sentry-cli-1.57.0 | 3 
                mono-6.12.0.90 | 3 
                 python3-3.9.1 | 3 
               apcupsd-3.14.14 | 2 
                elfutils-0.181 | 2 
                libselinux-3.1 | 2 
                libshout-2.4.5 | 2 
                  monkey-1.6.9 | 2 
                    brltty-6.3 | 1 
                        bustle | 1 
                        c-icap | 1 
                ejabberd-20.07 | 1 
            erlang-jiffy-1.0.6 | 1 
                           fmt | 1 
          fuse-overlayfs-1.4.0 | 1 
  gobject-introspection-1.64.1 | 1 
             kismet-2020-12-R3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
             libgpg-error-1.41 | 1 
          libmicrohttpd-0.9.72 | 1 
            lttng-tools-2.12.1 | 1 
 Makefile:753: target-finalize | 1 
                 mesa3d-20.3.4 | 1 
                    ne10-1.2.1 | 1 
                openblas-0.3.9 | 1 
                   perl-5.32.1 | 1 
                 pixman-0.40.0 | 1 
       python-matplotlib-3.0.3 | 1 
                  quagga-1.2.4 | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
toolchain-external-linaro-a... | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                       unknown | 1 
                   xlib_libICE | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6169461f5507f1f6a5b8a0a8aacc7fcc730b855d |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8f0e21e80018d396e845c16b32a966510c1ab61e |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/46a04b95f2e7d8baf22e4a23b3899863fbba2029 |     
  mips64el   |             bustle             | TIM | http://autobuild.buildroot.net/results/7717a61ad7a6d1cf99c171fe37306a3f08873389 |     
    mips     |             c-icap             | TIM | http://autobuild.buildroot.net/results/a381678c75a10d0020f4a6ddadcb834b29f555c9 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/50abc603443a426bd93c57af465d798025f1a9a3 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/84c875cd5caae6d3375bf2d6de859de3aead3271 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/cb0aa036b865cc8d4c349459ca88ca8069960e55 |     
   mipsel    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/c6ee34abb684fc8ca0c44ab9658e81a31592b828 |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/7aef5449dfacc5943aacd3e0adc75a74de38f7a6 | ORPH
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/ff18563b94db1457e4579a5e1ff13d7d59618b8b | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5292b29428575039920b42a11678980f292292c9 |     
    arc      |              fmt               | TIM | http://autobuild.buildroot.net/results/50e7441890e17569dbb6789ce12ce00770619c74 |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/20d40ffb3b194925289cd0e56bc5da8388d1404c |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/92e9472ce4de86f5a42eae21b9bdb6e2d3877976 | ORPH
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/394152b04c8b4926aaeb689d3b4caa157711bdf2 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9a2c4f38c045989da3a6ab711520fe3fce1fec92 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2773c7a9899df17714a4df9dc6954732f274115d |     
   xtensa    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/03ab6f15e5899f5ef2ff50769954032c1918e19e | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/fbe5c22f2ae837a9c48e06393e95b1130bed0fb9 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/3344c96e5627a9327b0eabe0b27f34490bbabc0d | ORPH
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/180b84010f2f3023a27c31cf8ff8b3d1742d5732 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/cf041ea04de0d7e4dfecf39f2e6795f1bc35fa6e |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/9fec17ac53427eedf2fb2bafdb5406e836394443 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/86bda7fccebcd3db5b9b3d9d8603e7909d8e3a81 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/045594d21b351a82e6b95758db258d0377e0a75a |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/6ab37df6031cd1396c3f8dce8f3dbf366f2ba598 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/7942cffbb98cee0053abc06458df3b16f110e16d |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/c0dd72506ac203a527ead107ffe184288b00c0d8 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/2c2ef61f6e1f01bfc16c1b77f96059a1823c5ce0 | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/ab599e92cd57a4c14af1d3283d0f55453896e9bb | ORPH
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/721cff1172c7fb8f69c0d7be6bff18093dd6f78e |     
  aarch64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/5bbaee733f413306aef0e5871df93b1b36ef2667 |     
  riscv32    |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/d2f5872abf774bce227b396c244b949e9d75371c |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/194d280973ba99d02d28e64c245a7d9f1939bfd3 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/ccb770fc5d62c29eabfc1b4f5eebf31f072e0abc | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/082be2892794eaa01ef46a708abee5152d9f934c |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b1f82f767dc3c366e1a774b0412e0f37a635a485 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/bf4d064e92ed176b2cc38d0f3bee6ceb4411692b |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/2cad105e3320d13599d47b075e5cd1da588707e7 |     
   s390x     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/5646652fc11d29c2bdaac4ebaa329c8768fb5829 |     
  mips64el   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/2096c9992b81bdb06da0cb28762b7763d4e6d782 |     
   s390x     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/8e24d694719509d85936ffd1fac368bb42f61353 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/3b3d51a4bcefafb9f2e50764a05d559b6a0deae2 |     
    sh4      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/079665562c4c4557546dcca8d1000242f400d5f1 |     
powerpc64le  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/fc846560a323b4613d8e0bf3dc89062d2bebe240 |     
  mips64el   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d67533715cb8b892d7445bd6271b1deab17bbd70 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/fdb70238dbe44344d539c68407f9b06935aacd54 |     
microblazeel |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/50de7cb47f3a2e316ed9a50e06d61e3339f2536d |     
   mipsel    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/8c241a6bf22142a17bb2c0355fcb86e277c2d48f |     
    i586     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/83c7472fa9b4813d9b0c20c49543848d421cb279 |     
    arc      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/5411022bab7e08bfea41f392c39281623781fde8 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/cdd98ef400f3080bac1aa20189b101c279f75c8a |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/ffdbe4d44db7f7d54d6b247ff95dcf816d9c2005 |     
  riscv64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/95c42429a0677df3eb2c237d975cd4e78d523bdc |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/0aa735f80421740cbee95663b6df19bc39b339c8 | ORPH
   x86_64    |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/ef15173a745b63a39ded5f74ea75be8c7b6f12e5 |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/32799ef20cf1c223f9a311cf8aaebd6a071d1a47 |     
microblazeel |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/0688deb225795f59e29dd37acb226783351844f8 |     
 powerpc64   |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/43a5e8996d0d23dd8f3119370adcf815b47e4f46 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/5068d98a905786a62a8c263083bf829418f74485 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/340b10ca504ff18b85191adc5f96e7cc5ef1ef45 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/ed9aca152634aab1623137d39e7f7a20b81962bb |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/cbb491657d7a60b607cf32cc06657a37b7a90f3a |     
  mips64el   |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/f5615ea4ca37f256b0627747f5a0004c004e5947 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/5b85a998452eb6d99e860dac0886858416bd94dd |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/f0c1967e11324ba4593febcb5992d658c74c780c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a5ef6a2223988ebaa6b8e4e154d5ecb623bd84d6 |     
 powerpc64   |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/6ca3fe98d1062c72f80dd8d7356cc71034cd8d1b |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/7099b09c45e26b286b72e16b3ecde0669ce6ff07 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/2a45dc186245154fed215967152705618839baa8 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/5dfd620551900658e3287e230a54d573849203ed |     
  riscv32    |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/1d6b12fcaf3849944eda014571b5d71bf953cefe | ORPH
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/7ce70cdb1470b748a48a6e0a3ade3de18ddacd53 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/fc5c89a40baadf4f8410830de17f031ab612528b |     
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/a9027e4e981a370b8343bfdd7e5db73bb7b9663f | ORPH
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/6e52c1dfe12c84a2e89aebe06e6e2bbd06d0efa3 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/7a8bf7bd927de660edd8a3b37f4ae4a38fecc4b4 |     
 aarch64_be  |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/c013b1ba24a6550c1a41bad8d1b18fd22e7dce4a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fd58db55b1aa199186138f0f44ff3f9d8780ec24 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5e5db1b5527bfb681fedd95e4c5f30edb4d74255 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f4e15748b1562679f30c650aac14138ce88a61c5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e790a0719ab15bc6c0fdf18ec49b82f5937c99c2 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  gnupg-1.4.23 | 1 
         host-shared-mime-info | 1 
                   mimic-1.1.0 | 1 
sox-7524160b29a476f7e87bc14... | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          gnupg-1.4.23          | NOK | http://autobuild.buildroot.net/results/9a51caa83ecff2992a161e2d1fb4c34996459b84 | ORPH
  sparc64    |     host-shared-mime-info      | TIM | http://autobuild.buildroot.net/results/c5ea784f5ce99fb78fef71f89e1be2792cedd969 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/2a87df9c367ecfd9efcaaffa65c53d0ff118af5d |     
   x86_64    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/362e232b29bcdecce53605ddd2b3d8d00a68edba | ORPH


Classification of failures by reason for 2020.11.x
--------------------------------------------------

sox-7524160b29a476f7e87bc14... | 3 
                           fmt | 1 
                  monkey-1.6.9 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |              fmt               | TIM | http://autobuild.buildroot.net/results/28969224279411ef81274f74d82c1ba6655e2651 |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/2a70f211e118af394019e77fa0ceb4c748edf469 | ORPH
  powerpc    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/de297a3d307ee9a5b56c09babf6d16d46b9c4a1e | ORPH
  mips64el   | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/96c29bef8189ab23bda042a2300fd023d259f8be | ORPH
    sh4      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/5d7e3486359e940c70fbb3c39f85f25ce2b73828 | ORPH


Classification of failures by reason for next
---------------------------------------------

                    mpd-0.22.3 | 6 
                 mesa3d-20.3.4 | 3 
                  perl-gd-2.73 | 3 
               belle-sip-4.4.8 | 2 
             libgpg-error-1.41 | 2 
                libselinux-3.1 | 2 
              netopeer2-1.1.53 | 2 
                    qemu-5.2.0 | 2 
             babeltrace2-2.0.3 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                  dhcpcd-9.4.0 | 1 
           heirloom-mailx-12.5 | 1 
                 libgeos-3.9.0 | 1 
             libopenssl-1.1.1i | 1 
                libshout-2.4.5 | 1 
            lttng-tools-2.12.1 | 1 
make: *** Waiting for unfin... | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
               protobuf-3.14.0 | 1 
                 python3-3.9.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/1805e9be238342f6572d7ea506c419aabc0f1000 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/b969aae197044a2255be467f974414b9b11629f2 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/61cc3694b66a763324ec846c72b800b62abdcb8c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9cabfca2ceda055e437dd1529f92d77c719ca5cb |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/416b049ad6b5e55153ab15dc8d48420b9c4e3f8d | ORPH
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/ed70c65d8d32ea3905df68bbf969e42b30e3b196 |     
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/7255312c42a773e945a7183dce360570d344b2ad |     
microblazeel |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/0daa6b259aea5381fad86d01e6dd026b1c8ad073 | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/b35307afc29d41c517924abf9c95cd2173bdd31a | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/0e352c09f7cf27097bb118d37e550b9f1a1c0a1b | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/9516c146415be7831010a40a3404b69acb0e90b7 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/0b50e8612b339fc05bfa6ba2550e42e51fbeb4db |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/daf2bddca97c256a56b1c3ada62e525583f7f5e0 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/c83ea33cf4dda727c2a9f5ead6abcee2ea44b1b9 | ORPH
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/d275ed2086e275c35a7d67002d1a542e892fc25a |     
   s390x     | make: *** Waiting for unfin... | TIM | http://autobuild.buildroot.net/results/cfb4e07ec7fccfa9933f426f23808ce26624cbfc |     
    mips     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/91f6ab007e9ec2f8b79020b85644389570ff5d5b |     
    m68k     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/5697077ba3423943c770220447d4ea7951742d78 |     
    m68k     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/c28401254a983cc76050ea3e813e73df77819aa4 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/223196d590766d44d317109dd5b808b39d32a293 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b902782edd896e7c9f9ef5d3002505786f6f7a33 |     
microblazeel |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/09f495eb718ef70f5d3cfa94b2f28a17f76df7b6 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/c1fcd734a9310f1c400efd8f831f182ad4a84688 |     
    i586     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/2d274a4b5ef2d32a6a29a7810915f8c99dd8c8f5 |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/639a11559fd222cea643a106e240934b4c2d7e38 |     
    m68k     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/299ea30be2ccfdc274e86e0ad1e29be5d9ac8717 |     
  powerpc    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/17978fb7bd5cedf6c9cf75133bacd307ece6a414 |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/c236b5e7492ee7272c0dc395e8957bcfa7e4c3b5 |     
   mipsel    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/3be9d84bf5b1a5bcdee4dc282a37c0b2957957c7 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/bdd91374ab8e44d4133ab15564b9f8554ab4272f |     
    i586     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/dc72051a2c01504fcc35b8b539032e79aefcf99c |     
    i586     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/bf6a296b7a326ea8f63d33f33953e8e30fb94965 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/5bc24c16979a33c8456493ae94d2da084f2a457c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/49ae79035af2266c206feff13f939c4f8fac35e2 |     
    or1k     |        protobuf-3.14.0         | NOK | http://autobuild.buildroot.net/results/6e9f4ba8d48de44ad9af12090b568a57484e5a86 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/fa95db4a0eb091316470ea651fe36593b9e04cc1 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/839ab694feebe0864f48d63a9128c0f2f78621f0 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/d4295a06ca63155fd4fc3145a41aa1051ad08c1f |     



-- 
http://autobuild.buildroot.net
