From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 May 2017 08:28:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-03
Message-ID: <20170504062805.21F8320C54@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-03
================================

      successes : 202
       failures : 86 
       timeouts : 0  
          TOTAL : 288

Classification of failures by reason
====================================

           host-protobuf-3.2.0 | 27
           uboot-tools-2017.03 | 6 
                    mpir-3.0.0 | 5 
               acpica-20170303 | 4 
                 libqmi-1.18.0 | 4 
                   luvi-v2.7.5 | 4 
                    mpv-0.25.0 | 4 
                 binutils-2.27 | 3 
               ifupdown-0.8.16 | 3 
atest-895b0183a89c15f5e2305... | 2 
                 mplayer-1.3.0 | 2 
                protobuf-3.2.0 | 2 
                tinyxml2-4.0.1 | 2 
                  arp-scan-1.9 | 1 
                      bmon-4.0 | 1 
                busybox-1.26.2 | 1 
                 efibootmgr-14 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libcdio-0.94 | 1 
             lttng-tools-2.9.4 | 1 
        luasql-sqlite3-2.3.0-1 | 1 
               opencv-2.4.13.2 | 1 
                 opencv3-3.2.0 | 1 
                poppler-0.54.0 | 1 
               pulseview-0.3.0 | 1 
                      qt-4.8.7 | 1 
             rabbitmq-c-v0.8.0 | 1 
                 sudo-1.8.19p2 | 1 
toolchain-external-codesour... | 1 
toolchain-external-codesour... | 1 
             util-linux-2.29.2 | 1 


Detail of failures
===================

         arm |                acpica-20170303 | NOK | http://autobuild.buildroot.net/results/89077c248570046c8285e9f689c684ef936d2b3e |     
         arm |                acpica-20170303 | NOK | http://autobuild.buildroot.net/results/b9ebec1df2a6f54b1311b8936cfb3a0095eaa6b5 |     
         arm |                acpica-20170303 | NOK | http://autobuild.buildroot.net/results/45749c63ef62c91bc7120a35960b4683db7f5fd6 |     
         arm |                acpica-20170303 | NOK | http://autobuild.buildroot.net/results/250451b52c23c4d6abed80d93945fe4ee4c340a4 |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/a4ea4d04bcb7bb43074e93b11b3e69909be52305 |     
         arc | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/f25db27e15a784b91e33fd51ddd10f268b73d56c |     
microblazeel | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/56fd7e8d4d6b422cf63ff50eae06268660253080 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/ad6b264bf61f2bf9654198cc7e0c587c9499e3b1 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/462046ff091029d1064dad5b2bc24a2d06d44c50 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/277c8143322b43e32b9a7d58923448939a088b71 | ORPH
         arm |                       bmon-4.0 | NOK | http://autobuild.buildroot.net/results/8bae854a574083b1007d9d9ececd8b2f2c643ace |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/cf6bd48143e3350b6b420929d7b8e4d492984563 | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/bbebee9e0170f6dc4e22c11ae68ba076d72b0df8 |     
       nios2 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ef9f8094964572067a2761a14ca15348e7489950 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f2f451bf208db662930e2a2e620a9aa9138bb212 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ff8c98c855658c121f4683e30631cbcc603febc9 | ORPH
        or1k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a24621a48e70cede84ed13458bd5be2f5ef4cfb1 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/379e3757b3ca809f0390a2262fad71beb56558b6 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d1f57cbd84a0a996da709279d0ca6b8e71118abe | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7a52d3b55b2371e5c80de804a608a6316800e7fc | ORPH
        bfin |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/836f1b86499f63adc66b8cbae54fb1eb26486ae1 | ORPH
        mips |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fe2cd93f27bc429b26e959f878427d925fa2bebf | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a20219ef134855788903daf6882885bebef0e9e1 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f8fe71a742c217f234ce1d8ff173e41ce8d5233e | ORPH
        m68k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/77b1def3b5d550e53dfe59773afb7b2ae7ca5fd9 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c2f756d509e585b86220b85b74fd91d349a7602e | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5f016bdb38cf16098124d7cbfced8059240b179c | ORPH
         sh4 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4aa2831df047c1f52da4753481ef7f61689758c7 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/730ea3529eb75ffbf8fde9095b7e427ed037601b | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/677828e08a9239d58b219a420e1590d980498466 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/bfd7972d4dcfb637542d8de7ed2eec1625ccbb85 | ORPH
        m68k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a8952e824af19609decc4a820e2e60efb51fc13c | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0e639e366a9ea6a2281693e5ad647153237b20a8 | ORPH
     sparc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/9ae66b2cd8608f5470f16c45a51be2d2b2c1b9f8 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/53ab12eaa9bce93003ea449ef8b6535220fbc5c3 | ORPH
        i586 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/54807c9ae328f5f51b88d8ed6169e86564200059 | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b0479011b5abb60e371c73bbcc134c196d330437 | ORPH
     aarch64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4410551110440d3bd6a6b7a178710946fd6ad2cc | ORPH
         arc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6d3d9a8906ff7660fd13ecceaff0b8359720f14b | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3037775c39566209bb18a534d34def3a992d0568 | ORPH
         arc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/067e5272cfdf7f66dd76db92a71cced8924ce962 |     
         arc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/35b540927a43672f84b14116dc5deca742ba9eea |     
         arc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/a0314570381c3e37945244393042d4094750a899 |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/af85f76a4e85b9067244feb9c32952c29b065215 |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/9d1d0daebd92b251645ce774b5f9760d331aa734 |     
         arm |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/8d664a41fad5c2488dc266f532033505048d6bdc | ORPH
         arm |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/6d4e3fd13cade397dd7fae38a65d4796516bbd62 | ORPH
      x86_64 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/d6ee9cbb1e2968a20362892241f2d7bd74b9949a | ORPH
        i586 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/bca2007dbbf4dc3216b0bb78ddd0a9e9781155b0 | ORPH
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/cb2cfcb40e742a46b8cdeed75cbcd811332324bd |     
      x86_64 |         luasql-sqlite3-2.3.0-1 | NOK | http://autobuild.buildroot.net/results/63ace7923a8abe425b9a40a449146120026fd6bc |     
         arm |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/d0fe97b9d1ceec911fa1eddf504d615fc09478b2 |     
      x86_64 |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/b26bd7a39d7c2b40d4c8f8de7615c36841bfec2b |     
        i686 |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/fcc289c05a12217be9b76e5829261be99b054aa1 |     
     powerpc |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/1c666f1cfef63ee75cc0298bf7fb7fc05f482d53 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/dc7566898aec9639fea4c24aa50abe8dc7026811 |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/4817cf37b27d7d8ab324b67b165ba5763e536a8f |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/de2f3b7576bcfbbe7034322d15abd8c0861e986b |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/3a297177f7fd701a2841910f00b5cb83aa8a9ed3 |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/185e41c73858d9200c3688fb7f74dd3c03d32ed0 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6a63260502f1794d9fd57800f64f5c94357515f0 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a321fe1bdf5857059fe06c9bd506f9e0c0b0af4b |     
      xtensa |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/35f02d3f14703e14da6b03e792105a1f0820eda9 |     
        mips |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/839401cc2bd7cf1ea7d86b7f6ab50fc8cec434bf |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/e3684a8ddb9475bb8427db663915024199d6da4f |     
     sparc64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/f0dd9195b7e85417d812ef99c21e6388901c7620 |     
        sh4a |                opencv-2.4.13.2 | NOK | http://autobuild.buildroot.net/results/9d0bc0a1552b732a2e0e153d17016f1fc65ec686 |     
      x86_64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/af950c6172a578c4eeeb9440b6990ceb48263fa6 |     
         arc |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/54b787cb3f21dd0afbc877cc6d60fd6da7c437c8 |     
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0cf510e47640463afd3882c8a066cadbcfd0f9c7 | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/68828f6bd254a39ef2a80594980b964f2f9cd6ac | ORPH
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/593939a5ef8115be8d0367cb4719d4ac4ca50ea9 |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/24ec59101f13f5681c2ff7633c03301abbc24604 | ORPH
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/4b05a512276ba187e9358eda4df05bb01be895d0 |     
         arm |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/05151c4ef7f0b3702a6cd5e6df4888d826a37431 | ORPH
        i586 |                 tinyxml2-4.0.1 | NOK | http://autobuild.buildroot.net/results/79c998bee6236ba5a2c39e832068c59a049c7216 |     
     powerpc |                 tinyxml2-4.0.1 | NOK | http://autobuild.buildroot.net/results/d301bcbe5db26068b35eaa94bd816ae8cf8ef2e1 |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/bd4159c5c6d74cc0c9d73d263dab88c1d5eed6bd | ORPH
       nios2 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7dc5ac0f53992e674078a6aadaa4d87b0b1b2f1e | ORPH
         sh4 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/cf0a13b7015b044d148f562d154b96535ecd6801 | ORPH
         sh4 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/34434c72bdc075aa73cde8c561c5df253638aea4 | ORPH
        sh4a |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/579dea9c03a217d27c9751c2c58f7a15b6502e80 | ORPH
        or1k |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/a8da20f1d67b013c2c3c4e95b2398904be1cdf36 | ORPH
       nios2 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/d9462941fe93e8af22b262c953dc15cc60db5658 | ORPH
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/7aa9b15fca97a14f98e62bde5c85f3f58dca9c08 | ORPH
         arc |              util-linux-2.29.2 | NOK | http://autobuild.buildroot.net/results/417d816bd8c13b04301973326a301b5751f207bd |     

-- 
http://autobuild.buildroot.net
