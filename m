From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-15
Message-ID: <20160516063023.5A89A102996@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-15
===============================

        success : 179
       failures : 52 
       timeouts : 4  
          TOTAL : 235

Classification of failures by reason
====================================

                    mpv-0.17.0 | 7 
android-tools-4.2.2+git2013... | 5 
                grantlee-0.5.1 | 3 
                 jack2-v1.9.10 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
                  connman-1.32 | 2 
                blktrace-1.1.0 | 2 
                     lxc-1.1.5 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
           linux-zigbee-v0.3.1 | 1 
              strongswan-5.4.0 | 1 
                oprofile-1.1.0 | 1 
                iproute2-4.5.0 | 1 
                  boost-1.60.0 | 1 
       openpgm-release-5-2-122 | 1 
                 igmpproxy-0.1 | 1 
make[2]: *** [all-recursive... | 1 
        lttng-babeltrace-1.2.4 | 1 
                       unknown | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                    ustr-1.0.4 | 1 
                 mesa3d-11.2.2 | 1 
       host-erlang-rebar-2.6.1 | 1 
                 libdrm-2.4.68 | 1 
            qt5serialbus-5.6.0 | 1 
make[2]: *** [code/CMakeFil... | 1 
                  squid-3.5.19 | 1 
                 qt5base-5.6.0 | 1 
             stress-ng-0.04.16 | 1 
                   assimp-v3.2 | 1 
qjson-ba273682a9d33a7b3090e... | 1 
                    ruby-2.3.1 | 1 
                moarvm-2016.04 | 1 
       gadgetfs-test-undefined | 1 
                collectd-5.5.1 | 1 
                sg3_utils-1.42 | 1 
                    mosh-1.2.5 | 1 
gmrender-resurrect-aa3d02cf... | 1 
               openswan-2.6.46 | 1 
host-gdb-6be65fb56ea6694a92... | 1 

Detail of failures
===================

       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/be8c19995a8aee7651710dee4700705e0970bfa8/
        mips | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b95f06e945e4fea0652dd6ca4e1f25a0e368e043/
     sparc64 | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/70cbb8ef195191b348792d8827cd9f32e78c8064/
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a98f90c001fd1941955db14730a902b776a1211f/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f0e77386b34515dc6b86797cc19040d9f2b83114/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4da6f0728d9172aef51711c004440908c778de02/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/afe66178091a689c7f8283f97517c52ea8426563/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/35ee727100e74a5ce5154eec4214049c353740ec/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e4da1bfab976ac81fd92ff1776fc34dd5a7ae705/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/0791ab37f78453228267caa1c8ab2ee5eed168da/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/c46f69b51ea883faafdd5763608320ef1a03130a/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/a634c969fd5f9b1ecbadd0e7a5aa054a4383834b/
      x86_64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/c5dba501c72220cd030db2a1f5b5df6877a5aaee/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/6479ba9fe7486b1bcd8589d9f0e175629dfe5a3a/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/00f3d7c36d3890f302d45dec03b56ff731a583d5/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/9b436037e758e55bebbb21c988cdcb79eb673ea7/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/64f6eb24995b2250893845710a3e7c8be2084f6f/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/d7fe4b490d0b623bf21f7c12bc4fe41d8db9895c/
      xtensa | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/012031e76287b458864fe4ad60a4eaacfcb251f3/
     aarch64 |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/4cbb52b018cc7fcd98f46fa03f58ad3ca58b09fe/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/d0b4ea85f1e965e2c869990e28b7428ef7908ad8/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/6fca328ddf7847898df42e5e7c55875ab8f22c42/
         arm |                 iproute2-4.5.0 | NOK | http://autobuild.buildroot.net/results/403bcd9d4c9ae8db7dfc4fc83b9cd6f96143aa84/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/bfa54ce6b90bde794eccaef0a56ba20f5648af2a/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/65f199dde4f816c3559060258dcef8e77a49f24d/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/af4cc0c5c9fae1b8c0e6dc1d0e82c08bdc65c14d/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/eb28034d54cd8cfb8872ac4c7ef51c44ea41a5ad/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/98e103fcbd7da646d0c20f27e73bb4d0facacfc8/
        mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/074bd6efe38fe1603e0535dfa5a1b290bf5e8a6a/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/65dff0197af94cab6e8c5d1b33222ac078beeae8/
         arm |                      lxc-1.1.5 | NOK | http://autobuild.buildroot.net/results/8ab2dc8e0634fbfb582db94cdf94cee5712711f9/
microblazeel | make[2]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/8997f5a4be31468666e2b32c53b37442a1645530/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/43c4e971ba47fd6a281b8779ec6ca29990724275/
        mips |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/7f1bcbcc83be94cfef2f8dd165233f71e30588ee/
       sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/0f518f4875b9e84131ca1b9fe7628a6381c155f4/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/a4fca158db82d1e8838d31837a1a61e7aa53ca3c/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/ca28c24958565397f35abecf59478c66072d205c/
      mipsel |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/f3cbf13c7ba8b494c442b1637862053a906711dd/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/31625193ba178248a6395992613f8ada2c9fe8ed/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/26683181745b67c4321a2eccf2a9c0a9a21a4183/
      mipsel |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/a8e68c724b85e9cf8a6e5054ef9a50a7bd314c49/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/bf983ec8be0ca110b6ce240171b74f1fdfd12619/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/3f725e32a7d15745c6de391b69b8b67becb1e506/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/f7d50481f91885ec91bca6821880fd1a1eeaa614/
      x86_64 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/ed3e3fd2328a5575c2fc786f0f2275ee61e78d7e/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/b99cee38a4e8c195d04606daad04c7c6fbca4652/
         arm | qjson-ba273682a9d33a7b3090e... | NOK | http://autobuild.buildroot.net/results/3ca05b777789c58b0621a100490373416846aa87/
       nios2 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/b5378efcc5d6308abda5c489de83e3b3e8d6c232/
        i686 |             qt5serialbus-5.6.0 | NOK | http://autobuild.buildroot.net/results/79f2aceab4a57f5a10366b8d048b66a7df458619/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/af66f967722b17984013b2406382a54cc9d14e08/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/a959fdbe62b087d6598549bf9879a25cee64d7e1/
         arm |                   squid-3.5.19 | NOK | http://autobuild.buildroot.net/results/ccb1265fef6f04772da1c4021ec76aa1797868df/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/258bc3506ccbbe5785eca435c97ea721b1182ba9/
       sparc |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/a394a8ffe2c8442996f3609e491d6b019f499553/
        i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/19d693e272be92692841e2252cb3a64a41f7de6a/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/049eb4abba406d9b91b601c62ae675039691d72f/


-- 
http://autobuild.buildroot.net
