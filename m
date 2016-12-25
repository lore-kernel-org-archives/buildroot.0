From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Dec 2016 08:29:53 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-24
Message-ID: <20161225072953.43ECA20722@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-24
================================

      successes : 180
       failures : 67 
       timeouts : 0  
          TOTAL : 247

Classification of failures by reason
====================================

                collectd-5.7.0 | 27
                busybox-1.26.0 | 8 
               sdl2_ttf-2.0.14 | 8 
                    sdl2-2.0.5 | 3 
               libepoxy-v1.3.1 | 2 
                 libnss-3.27.1 | 2 
                 openssh-7.4p1 | 2 
                 synergy-1.3.1 | 2 
czmq-5205ec201e97c3a652c17e... | 1 
                  guile-2.0.13 | 1 
             host-nodejs-6.9.2 | 1 
                 libv4l-1.10.1 | 1 
                  ltris-1.0.19 | 1 
                    mosh-1.2.6 | 1 
                 mplayer-1.3.0 | 1 
                   open2300-12 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  stunnel-5.36 | 1 
               trousers-0.3.13 | 1 
               upmpdcli-1.2.10 | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/9cd3c9b446d23511bb8d5c0f9893f0a3a8106eb5
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/7f3b09bd07c9664b09ec9b778815d0b7329b02ee
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/49498069423927237d3c378f66d071409d78654d
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/d49832123734665ff35de21b714c4a5b3ff41ae6
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/e22b91b1335d330b5c7c499e681c0a84bec5610e
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/910fb00d2d37705533d8adf21c84074207a55ff0
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/14444e57ce5daed24141b100fd2ffac06c16d0c7
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/b723ad7d4c6b82ffafdbfe1b9382c90453762b88
        i586 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d04af56a582853699f98c827e81edebbbadfec98
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/870f9b26dafda49072c4cc36f09161607cf19e65
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/08b7a90a6365ea8a0098704ddaefadeb6107e337
        mips |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/215f3d252b6ce8396c3a3e7a914813cb4baa367f
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e712b89739c3e210f7ff82814017f1a277d9a02c
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8bfac4c8effa83b4e8003e51b16e99c58ac5f089
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/6e9f2ceab7b1622a9cb6dd65ff8f798bef1f5393
   powerpc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/687c209ce1f289654231328c75722e4523e1c61b
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/42953e3cbd85fa6abb4f511a01af5c82f1da614b
 powerpc64le |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/798beddfc1b5a1af77e9bf42ab63eb1094557a3f
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bcd81f721875be009c8c1790cedaeb52809fc461
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/37ea1961ca53093f7ee6bed4b7fcab1bf45b858c
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e04b7ad40d686f903b705f8a10a76d31de03dbde
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0da50f02e2e5d86eb03c41865bff2cec0a3792f7
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ad46d4b54b40b5527dbef88188cd65e4c6830f5d
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/652b974d98fac36e2ed359728e2703fe708110cb
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/cb8604001ba974e88dc9ff9c3f8e9299d66d88f2
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b0604c10f72686c6580210eac5d49d5542397213
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/536fcc945a001f03fa09f48f234084694890721b
      xtensa |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/cb317bf62abfbbd1c15ed1d12ea699f7bfea25c1
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/77a85c3c9783a298be4aec7abd059595410f9433
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ced7a9b1c4b8f9e61a1f420295f3b73389260a56
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/aca3b1f7919efebf3253a0bcaba2237ae7ffd9cc
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c4aaf75c7aca686c139af7d979ff0b5e60f4c168
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/6f7a76b510d3d2815a809acdf887e7d1bc247cdb
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/3d2f0076462eef0ce35744a57aa1e621cca1709d
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/95d00347cb744c2fdd3fd8e8898efbf3bf87094a
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/516c81ff8767da4caa84b5bdffe6b50974775e54
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/f39a1e892e0b4e5d106191f72e022c2c1977cd87
         arm |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/2a38464839e10f28930d0721e6a7967fb06ba97b
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/5941c4140247fba9ce1343818ca332a3b34ea1c4
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/e945f695f536a23533f65e878fc8f9a36efd00ca
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/6d69d320c027aa2071859de842e8855c84debcbb
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/e7398e1a5053afdd4704fe812cde0429d5c254ce
       sparc |                  libv4l-1.10.1 | NOK | http://autobuild.buildroot.net/results/435d7057b093e0da2c7a8888ad317aad50c7bef2
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/d9ad2d0e91ebc232f42a5bfbfdc271e78c05592d
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/99144c4eae665c8fb937cf2176e3c61e9748b029
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7f36e0bf0eceb75f8b3cbdd2a236d084e17b4115
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/b538228ce2751d611a53184684f914c9eec7482f
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/e263696160ab3da7b9ded0d71259da44744b4221
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/fb52f792672a980273233d0375310bccd6a697a3
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/db61315f931bd68db9065fe92206a9bea5c85f62
     powerpc |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/b80b7ba2bdc7d0e1fabf62f8b49440c870b7f129
        mips |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/06ec98ff2e6c620bcb4087e988898589c1ffd732
      x86_64 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/515aa48890a7449784d2ee770a4338c5d75ddf2c
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/61b2154b0597f8bcc771a2fd2b9fe33a1b67eaa2
        bfin |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/e0eeaf2dce3ab7a63fc6514ac8cd3660036e3906
       nios2 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/422d66d5d9a7bc8b01d473182291edf648029af1
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/bf732c08f970039705a30a3e84f07ccd3328fb42
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/11fd578f689ead91ccbcdda89f53c572519bbefc
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/b020abb773825f1053651d70fd8bee1cc946b2eb
microblazeel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1a60068f5315007092cbb13a241e0902d6f4754d
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ba3ad365354c992521b23962f41ef772134f81be
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/7e861550ba9a5a49cda0541eeb214f8e3e1ee843
         arm |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/4686deabc09c915061f27702000be8a6f8f48f98
         arm |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/6eb1126441105f26d4e47c1b207ec29c75f6f130
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/79e6a04ca3fafdbb303242900860e6fbf9588966
         arm |                upmpdcli-1.2.10 | NOK | http://autobuild.buildroot.net/results/3490df9b3cf1e52d4fa6735053e826051d4dcbb2
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3fa372e000e5bfd6e568b86e48d02dfecf13a3e8

-- 
http://autobuild.buildroot.net
