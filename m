From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Apr 2017 08:28:39 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-25
Message-ID: <20170426062839.7446620CA4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-25
================================

      successes : 126
       failures : 70 
       timeouts : 1  
          TOTAL : 197

Classification of failures by reason
====================================

                    ola-0.10.2 | 27
           host-protobuf-3.2.0 | 8 
                    mpir-3.0.0 | 5 
                busybox-1.26.2 | 4 
                 xenomai-3.0.4 | 4 
                    mpv-0.25.0 | 3 
toolchain-external-codesour... | 3 
                libmpeg2-0.5.1 | 2 
           uboot-tools-2017.03 | 2 
                           all | 1 
             bluez5_utils-5.44 | 1 
                 efibootmgr-14 | 1 
expedite-0529ce56b6fb01e965... | 1 
                  libcdio-0.94 | 1 
           oracle-mysql-5.1.73 | 1 
                poppler-0.54.0 | 1 
                protobuf-3.2.0 | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
                    sdl2-2.0.5 | 1 
                 uclibc-1.0.23 | 1 
             util-linux-2.29.2 | 1 


Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/967206f256ea8a5a499c1927dba65dacf5f726b6 |     
         arm |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/9bd8e13ddffdd0631ddca30ec40cc4664729b0cb |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/6d9af2ed401ecbd7dd4b6ecf13516d141a1dc207 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/2c11b0d6a3a74acedfe05fcde12ccd145285934e | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/678ac309a56294e6df03ee96f800b155213a3142 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/42928b15f60953cdb19008ae7e312077046af698 | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/b574715be370bd717ac07e4c1f9cc9062fcf4d9a |     
         arm | expedite-0529ce56b6fb01e965... | NOK | http://autobuild.buildroot.net/results/d2700158e75b56e8846a12031e15a5e33f717fc6 |     
        or1k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8cf1c00d18e73cd30a266891de97cb11ca085e2f | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d821f70088519c7f2098c5dd2f6cbf988bb0b71d | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/914dea29fc452247370019f11f78b05300e1f2dc | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5bec05f42d4ee8cc5e9d67227748dfa43308ae5e | ORPH
        i586 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/24c32ca98dfd90ccfbba9ec1126a3f92df5bfac9 | ORPH
     sparc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/16587815e5c48f2e9a71997842e9b3345ca2686f | ORPH
microblazeel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4f7a8693f3087a016507e7f7a225ca82c5f61705 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/e385322db908e5c923584df9a683577d969eac7d | ORPH
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/e6e71b100b06b5f7c97a8889bbb4de92c0535bb7 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1e62a740096f14a1c95136c1369743ed0a6332f1 | ORPH
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1b3158b03f7eaf5afb5a4dab9526091888f6c9b8 | ORPH
      mipsel |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/a33faaae3a84f3adc621a27fbd2d8e56ded33c77 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/1e6ab2844f9767ca1260aa46af5a516d80471c27 |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/58bb99c40ba793cbdf6c9cc4457999fcda0330c6 |     
      mipsel |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/2e3566349ccc73ec31cbd849513bbd2c9dce3711 |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/aeb581f8b9022c078cbbff3c26e0cfc6f41959c4 |     
        i686 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/cd4adb18e923093e9fa14029c92562c9774eadf9 |     
        bfin |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/4cc7b8818423ce8d29975b1718a5fd60bf891d48 |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/a12e030b8f036eacd3fd0602bfff3bae2d536edf |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/98d58ec1db0ac71d7869b2d9767a1871eb8fa9f5 |     
        m68k |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/378a18e6a795a834744264782373f500b6a6674b |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/07abec627074bb8deeadfabc257d9171f3465e3b |     
   powerpc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/fd6e4588da10c27bfeefb231c48ecd2b1a48b39c |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/dc88420788156fd820a8e8537bfcc2272609d8c1 |     
   powerpc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/606cff9c557f40521b5980803cd7305111df4dca |     
         sh4 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/566ed051b3011a6fa8b38f16c69b454885a2fbaf |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/e5b73f4a24be00ca2fa8b7baad7448ec96695de6 |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/3768bc4dad7d9b02e2baad36eac19b086d2b84b9 |     
        mips |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/14a9a27794ef310ae3dda944333bd0246a117682 |     
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/ac06a31a4e986f25caf8d8562b7eea63522d1c7a |     
         sh4 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/42b673cb141febdf69318a895fceafc0f4a669e5 |     
     aarch64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/65c618056d2d2b00d9a4b5a1a821853a0633e9a2 |     
     sparc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/fcd4a2578fbcf144e8e48c1d2d16574b2fea3ccb |     
   powerpc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/f319009209ac9767685092279ba2926c75aa758c |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/cb58b960b7f69d2746b9149ce0b8f5d54113c967 |     
        or1k |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/8f12cb1208d0f4d089de4d412d1dcf19533ae020 |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/d037720a5229777cccb6f476002de094f4392840 |     
      xtensa |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/ac45ee14cd38947a4d760b1e77ef1a6432e6e04d |     
     sparc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/fac2a914eac910967e3af3ff7823b3d99a926fed |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/aa373ee63c1578d123299c2d04c7e390e43d5184 |     
      mipsel |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/a4fa475a8ddeadf633dce864be927cb86c4f9d03 |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/343cc804a962e0f8dfdbac6b5ed8f90d71aca99e |     
microblazeel |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/22b80e3af24e6008349824928e6e7bf79d44969f |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/00b12bb5b85d278698ca9855591d2f418e76aac0 |     
       nios2 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/884ff07eb02395028b3968dec561a82727994d7e |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/b0fc4292e80e3fa291f1911c11d9401fe68525c8 |     
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0d3609408e8133b2f5f2ccd1dd9c112a8940ac97 | ORPH
     aarch64 |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/02fb2adddf576bdbb8a73841f4119cc8528d6226 |     
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/92769c1a02dbe56ebf095b82c9951c6c2bf0acd7 | ORPH
        or1k |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/3f78cda631c96ae6b04c3ab700f32c6eb2cdc86b | ORPH
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/30cce284283c3425db53e4804137feb3f61dae25 |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/a37daae914ae55a9a445fed4e37b66608499d5b7 |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ddbb891a35cba9c2885ae6aadb440b46fa5dd701 | ORPH
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ca1a0b69e98406fe7b2df7c487ae91c6f85fa057 | ORPH
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/bb64b98b2011f2d6a2aaa3dca897c6b088fb4c7f | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/f28d091b8accdc630a32a60b0d46fecded9231d0 | ORPH
         sh4 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/dbd6f356e9f7655a9ec9449efbd109610fd79891 | ORPH
         arc |                  uclibc-1.0.23 | NOK | http://autobuild.buildroot.net/results/f92b5cdae0a389d911a12d309edc2871f84f994b |     
         arc |              util-linux-2.29.2 | NOK | http://autobuild.buildroot.net/results/9bf1c9e84cab64bccc3c86a8a2899cd71b8f91d4 |     
        bfin |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/d5999ab2ad1d3cc73ab3bca7409cac911e48aebc |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/9ce54f8532d96aff8a0d38e6e6b4c9969e4507a9 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/12034603c46c8bd69590c88bbfe85261460b699c |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/653ae5108930003181ca3e44703316834076050b |     

-- 
http://autobuild.buildroot.net
