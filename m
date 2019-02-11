From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 07:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-10
Message-ID: <20190211070049.9583F86786@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   3 |   0 |  32 |
   2018.11.x |  30 |   2 |   0 |  32 |
      master | 267 |  77 |   4 | 348 |
        next |  28 |  12 |   0 |  40 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
               host-efl-1.20.6 | 1 
neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/38a79d1c22931fcab4a45b3413f0a45ed1795703 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/05e8fdd28450a5961941b18d4f13827ed05b3aa8 |     
         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/7ae0a9f887d79380581ee8331f871bc3040fa7d5 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                     efivar-35 | 2 


Detail of failures
------------------

    mips64el |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/0b9ae8e039598bd533ff586bce7c99f5de450f1c |     
      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/3dc9438feab7f90f9aa16f1c6c516dcd38821748 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

 brcm-patchram-plus-legal-info | 13
                 qt5base-5.6.3 | 12
              sqlcipher-v3.2.0 | 9 
           host-sg3_utils-1.44 | 6 
             gst1-shark-v0.5.5 | 5 
                     efivar-35 | 3 
                 ibrdtnd-1.0.1 | 3 
                ipmiutil-3.1.2 | 3 
             libva-utils-2.4.0 | 3 
package/brcm-patchram-plus/... | 3 
                   luvi-v2.7.6 | 2 
                       netsurf | 2 
                alsa-lib-1.1.7 | 1 
                chocolate-doom | 1 
                clamav-0.101.1 | 1 
       gst-plugins-bad-0.10.23 | 1 
           host-cryptopp-8.0.0 | 1 
                host-libsodium | 1 
                  libssh-0.8.6 | 1 
                  linuxptp-2.0 | 1 
                   netsnmp-5.8 | 1 
                   netsurf-3.8 | 1 
                     pcre-8.42 | 1 
                qt5base-5.11.3 | 1 
                     squid-4.4 | 1 
                   strace-4.26 | 1 
                supertux-0.6.0 | 1 
                   tor-0.3.5.7 | 1 
                     vlc-3.0.6 | 1 


Detail of failures
------------------

         arc |                 alsa-lib-1.1.7 | NOK | http://autobuild.buildroot.net/results/4ba312d0b006a1068a7bd304e265da05994deeb9 |     
         arm |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/b60917454f545ba193753f609dba4b3d7cc1035c |     
        or1k |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/083ce1c3100b10e40480e6330ce0c29dde51f5e0 |     
       nios2 |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/31f3c2d62e11bea72eae603b39dad7f89c330563 |     
     sparc64 |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/7bbd6e101865c18eb2c0e81cc05a0ab7457a9a7c |     
      mipsel |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/2732de045dc67ea14cda0b9f94a43492bd8fe149 |     
    mips64el |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/55a2117f12f17b76e1dc81384ba4c6f2b1a5b2e9 |     
      mipsel |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/73117081f07b2a7af68ef5096ba51520d0339aff |     
        i686 |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/a13abf28094e182060712727d0aa72d3644f0283 |     
    mips64el |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/ef48b7cdcb4b5c6b31e01cee93630dbb1caf3a99 |     
    mips64el |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/c5c2987fa302b8271a71577cf2a6010577ec4076 |     
         arm |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/93c689bcbd8d08b1a168c7bb096e340f0816bb51 |     
 powerpc64le |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/3447caab532bd6bf9c03a9eec4f9246227b1bddc |     
         arc |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/22f0f51f1e464855a1150f15aed80b7c9836f347 |     
microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/52566fda33d43d91c3053852eec7530866f96d69 |     
     powerpc |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/bfa8791206a2ed672da777f50156cde4838652b0 |     
      x86_64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/286050e5ed4851b911707e7c551a5f1edd219bfb |     
    mips64el |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/dd5e135fa25cb447a5355c3c04de20001cd2fac3 |     
      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/24ef31be00b3f1c2dfae7acf684bc0470586a58c |     
     riscv32 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/6bd1a74e889d8823103c051bf99b503a5ce1d576 | ORPH
         arc |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/680ab38628339abbcad6ab319fde2fe15b088d45 |     
     riscv64 |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/7a4b30b9865c56395f6ad78c1195116f33947ebe |     
    mips64el |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/9934ca490a6afa3d5a00c16d6883f248580c6797 |     
     riscv64 |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6588ad4792d63f1182ebdc6aec50e6fb92a4b141 |     
     aarch64 |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d493dfbb6a4cc210c85a5439eec4b1d5a6c4421c |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/6ab1c4c131efcbb92b6da0569343728442f67de2 |     
 powerpc64le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/70071dcbbdfa1d4512ee9632be8024eae832a902 |     
         arm |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/2f43f547878027c2157c57fec222c5c238d9e015 |     
microblazeel |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/67b890a41d05497820ea4f44e187257dd6818b0b |     
     riscv64 |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/3bacfcdbdf3f31b8a155cb091e3409cac561d39e |     
 powerpc64le |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/c549829895939ec2522eec61131fa2be1a2ca3cf |     
         arm |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/768007e3a5d0485ebee408e32d81bcee4161ce0d |     
      xtensa |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/ac448ca7183ee821f5b2f3f7d724d4ce2bfe3b4e |     
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/451e3f1a0770089b3695ca2a1a49bf717ad32c55 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/4fea24e6c44306ebd73335226e3d27be10f5d9c1 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/1a7ac4949a7f0a032ba52bf2168ded678516ac0e | ORPH
      x86_64 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/80927dd3aeabad3aa7c647359ab922cf9b3e6408 |     
        i686 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/3490af997906ba43063b3e3e89cad73344912f03 |     
        i686 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/37be2f50b57e407ca885f0e27eba8885ebaabd43 |     
        i686 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/d334c83977868e8aa79529f6b72487c8dc5d444e |     
       nios2 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/153506dad8932b99d108cb7ce79cbab708caab2e |     
     aarch64 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/c24fb07608b86adfeb2e171203f134da1cbcb719 |     
         sh4 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/9bb903956be695a40cf5d9bf7c14f84603dea557 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/9b657c42da5ea855a0a4f88248c03b2c01b97eb9 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/de4daa1b930f907f06640dc98a708016217ddea5 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/7e1e8d2c269343e9b3140f79d75302e886ada989 |     
      xtensa |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e2834022cd99d6bcdba221c4275f9fcf4610c39d | ORPH
      x86_64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/ade3d742a4c30652ad6066dd8e32d146d5a51bad |     
       sparc |                        netsurf | TIM | http://autobuild.buildroot.net/results/48c8bf69dde62804ec04833ed28163a3363eec52 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6feb0ba83843a97fcefb56dee0dacc934e566fb2 |     
     riscv64 | package/brcm-patchram-plus/... | NOK | http://autobuild.buildroot.net/results/140a9176472c11f1c2e39bdcbe6951726374c370 |     
     riscv32 | package/brcm-patchram-plus/... | NOK | http://autobuild.buildroot.net/results/d9633c06c944d223e91d2475c8ac40db05f04959 |     
     riscv32 | package/brcm-patchram-plus/... | NOK | http://autobuild.buildroot.net/results/00eec4aef253c8dfc897179def3544ea1aa4fab4 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/bb31119000a019d4a5cc78a175527561fe68aec7 | ORPH
         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/655c639801a49daa029a39a02461e16fdc0177fc |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/8b20f61a12126ddb9b9a9a4ad37f828e28bb2f0e |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/54c1a1ab8f0c997e48e351791190e3855a3895a1 |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/45cb675653fb075ed0565fd96d82732268c2e3a2 |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d8097a5ddcf03469f7b8eb7c86a95c72ef7033f2 |     
microblazeel |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/db7f8d398c1377b402e26ff7033eecba24ef9f6e |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/4c3097052675f55dae75956c34ed2bf8281b6d00 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/4343af5d63f279c6ed704c4eaaf03f82ae898411 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/93412367b8f34c5a68c04bba0da4df85ee906abd |     
     aarch64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/a77450e9ba8ce6d4704e5310a2b7f552656e9d9d |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/7bd583af20fe5cbbf78fe638ffec0706108c72f7 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/cb0ff71c7d0e94a97e15b4fcbd861df407775e03 |     
     aarch64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/8d6caccf8ee71accccfe9d3e7a5b3e34357eb382 |     
     aarch64 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/9936ba9b57460caa9519e3c0590bb22699d8107d |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/0cdcf4b6b7cc28509d94057d62aec97063587e39 |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/05529151776dec7b2fd177083e2be59c1d88cc68 |     
     riscv64 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/ed4b88e2dea0270167ebed80074f5fc44801d5ab |     
    mips64el |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/10cc9c0f6a9734415313286bb851a078ad1de0d7 |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/2942d9d1c70bb526cf4da92c04329b713a3a2223 |     
        m68k |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/6887683b3e8810ce7ede6570d1e8c567449a50e4 |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/b92f11bc90d0086324b53ef34ce8f6e25bff6089 |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/bfd1d36e14c2149f884f3f8e090f0ecbba2fc1fe |     
         sh4 |                      squid-4.4 | NOK | http://autobuild.buildroot.net/results/88df436a7f606214ea8895e8be892fec50e121ec | ORPH
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/1fdcbbee4987838b3d3566be5c977d8f3e4fa205 |     
 powerpc64le |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/d1a3f9339176c08bcfef73f4401b85687deb21df |     
         arm |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/bdc94b35409fc9f85ac986cfca0c818aa9f00f25 |     
         arc |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/2450a819a0626615a85eae99c3f2de8784c8ae1a |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

 brcm-patchram-plus-legal-info | 2 
           host-sg3_utils-1.44 | 2 
                     efivar-35 | 1 
               host-qemu-3.1.0 | 1 
                 ibrdtnd-1.0.1 | 1 
             libva-utils-2.4.0 | 1 
                    ncmpc-0.33 | 1 
                   netsnmp-5.8 | 1 
                 qt5base-5.6.3 | 1 
              sqlcipher-v3.2.0 | 1 


Detail of failures
------------------

       nios2 |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/a870dfee8d2bd9f77de17d9b3fcd4276e6748a9f |     
    mips64el |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/43d56f47b560ec316b2bb8a9ea20342bddf80c07 |     
      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/e2095be999ad378091ecaf76873c2bf5c6928515 |     
         arm |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/c8535a9f5acde32a10f83a67218c9f090d568041 |     
     aarch64 |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/512cff1c7dd267eb9f1bd5689726e2b1d5277b02 |     
    mips64el |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/d5d27b10eade60e37dc2898d2f361cdca7cba03e |     
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/c65c98e08b9f588425550db26162b23a6f05408b | ORPH
      x86_64 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/6e7249c2644bb1640519b7e7f04d4ef565d282e4 |     
        or1k |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/fcf0bb81013557f073f38ba299550a8a8d8c413b |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/3f5bf8128af6fdf983827f29b3dcb49e34c51c2e | ORPH
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/bed2f9b1c33f4206f7d2ee1a1606fce8f2012722 |     
        m68k |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/db64964fd7cf6b9ca1b45bb8876de8b1015ad986 |     


-- 
http://autobuild.buildroot.net
