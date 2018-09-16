From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 08:00:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-15
Message-ID: <20180916060023.946D5207B0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   3 |   0 |  29 |
   2018.05.x |  36 |   3 |   0 |  39 |
      master | 233 |  97 |   0 | 330 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

linuxptp-303b08cbf55096aba5... | 2 
              host-bison-3.0.4 | 1 


Detail of failures
------------------

      xtensa |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/0c6d7b641e88d40f4b1735b90ba0690c844b8532 | ORPH
        or1k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/a31e0a5ae15e1164115e4e5981ef5fb3c3284bcc |     
        bfin | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/e60a019ebb32d4fb4b2199d47ff526932792e996 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 3 


Detail of failures
------------------

    mips64el |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/fca57ac4e658b6d41f060fb7b38eadc11423fcf5 | ORPH
        i686 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/3e0ac6e23cc30acf6585aa27cfacfdd6bdf6a4d6 | ORPH
     aarch64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/dd2cde8a3257594801499524189884f05be53b31 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 30
              ptpd2-ptpd-2.3.1 | 12
 Makefile:708: target-finalize | 7 
              e2fsprogs-1.44.4 | 5 
                rtorrent-0.9.7 | 4 
          synergy-v2.0.12-beta | 4 
              glibc-legal-info | 3 
                 lvm2-2.02.180 | 3 
                blktrace-1.2.0 | 2 
                  boost-1.68.0 | 2 
                   dante-1.4.1 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
                libmpeg2-0.5.1 | 2 
                   netsnmp-5.8 | 2 
               nfs-utils-1.3.3 | 2 
                    brltty-5.5 | 1 
     docker-engine-v17.05.0-ce | 1 
                    gpm-1.20.7 | 1 
                   gvfs-1.30.3 | 1 
          host-libsemanage-2.7 | 1 
             ipsec-tools-0.8.2 | 1 
          libcdaudio-0.99.12p2 | 1 
                libselinux-2.7 | 1 
libssh2-8b870ad771cbd9cd29e... | 1 
             perl-sys-cpu-0.52 | 1 
           python-numpy-1.15.1 | 1 
                qt5base-5.11.1 | 1 
                 qt5base-5.6.3 | 1 
                  screen-4.6.2 | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/25d9414b8a2b6009903001406e30bf0ac1c565d8 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/182ed340faa1624bf885f90079efce9a69b69a77 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/72a6b629590270ee4df6c207a97dae852f750c04 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/8fa371d2196ce788414e1f6dd7f1d2ba0863150e |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/0fb2c33f00990e471736c4180f23026fa9adb982 |     
       nios2 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/70206f51ffd78086df30fdacc0d7ca2905d9eec5 |     
       nios2 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/0f6bf9138d39c9bec54c5aaa8ab8c86b99b30a30 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/1a26e8756d9df34acc500a2ff13f2b442bfbbb19 |     
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/a683ffd61b0310550ac74aa6da7898b41267b55a | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/47d723e8d35ef2541ae54174e2380812c63b574b | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/5b407e224864926f99210a96024007de9b3fca31 | ORPH
        i586 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/849950e852d3c7a45dd990c3bb5553686a531f00 | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/9929e03a342ff17e07b9d365afab9bd210e9a253 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/23a2ca6b319a3bff30713d9d2f52c23853a29a97 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/523eb933746396fc2407f699e6a3b92bb0fa222f | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/8e4ec0243eff052520706d1ea6db398afe670781 | ORPH
         arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/f5373a567de619375746f1dcfe312971b85bb810 |     
         arm |                    gvfs-1.30.3 | NOK | http://autobuild.buildroot.net/results/05f57121e63e525af58708a490d65768484f2941 | ORPH
     aarch64 |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/da3a0b70abf972b917593f5522b4c4ab3eaadfd4 |     
      mipsel |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/88c8bba943300df98b428646387c240f4522f40a | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/82baaa93ab9d03944ef66200bdc1caf0e367147a |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/150753578d2be439128b9fe7454040507211b428 |     
microblazeel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/48f28b19664cf86802b2e9179dac00855d29219e | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/3e7c48edba2db9d1e3033a3f38f59584e541cd3d | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/ab0494fdc97781a7adc5e905b58ae8be1f792fa7 | ORPH
     sparc64 |                 libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/8d00b352e0cf005c4858dc43185935f05812cc73 |     
         arm | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/25f8e8a1986cb2359059488a7fa2100295c6c3ff |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/561dc318c4ec22f4e5d3278b7bd1582ebdca4992 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/b95831b8272dc31aeb8004c3815f3c37d5669e2c | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/422d8f4be4f1236650603e0a2a29039efbffb172 | ORPH
     aarch64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/ac4b0e028c0ec3b99610a47fb8ccc117a73bd951 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/46956b9d0d6773fab1a6fea5f5d21413e87a4b96 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/d7e81cc72011b91365dc378a7f484e791e7193a9 |     
         sh4 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/881347fae37c8448155189e080d282fdf2036b28 |     
   powerpc64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/9e4362c1f0c5ee2c6180e98707355e1b52c6acd5 |     
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/0edbb9af66d950c645cc370ac5ce7ca2f28f646e |     
       sparc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/b6e28040bf1dd3ffb96194948c1881f024e6b184 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/4393ce8ddee294f91bdc3e6fb53e08d56fe52184 | ORPH
     powerpc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/da6bbbbb3a8d8193ec1389b9d976164181e88ae2 | ORPH
         arm |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/e5841d57f1af4ec54cf46261ca4c4d6a2e345ea4 | ORPH
         arm |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/c559c4b7b23d1fa634a1b3ae05a6afdb672e4e79 | ORPH
      x86_64 |              perl-sys-cpu-0.52 | NOK | http://autobuild.buildroot.net/results/f13bff8b5eabfa5c3aa941bfd1a59194012f749f |     
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ef5ee181dcaf306fb9279dbff57e6627e2197048 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4ee8526ec42863e0521e4b99ab3ae907f888ccb4 | ORPH
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/f3fc960f1736a2726a0b50001df5b1bd7834bde0 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/589b46c9ccdf69ab5db72a56a19d518446ac6864 | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/532a71822189985bd28ce4ada2612b848bbc2ce1 | ORPH
   powerpc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/66477ac24729ee1734248092b9f8da245ef2257a | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/b450f5f8449d33c6376a20ccfb1f5718533a12f3 | ORPH
        mips |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9628d800816e4da00765c0e9b302f1008d5717c8 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/eb665b78b85f1ff8eca9fab19c3f866cc44c346f | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e8cecc4284fe25b8dabbd416b293142dc71c403a | ORPH
      x86_64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/63ec9d0f513f957771f754175027c0b2b7e82064 | ORPH
      x86_64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/10534e1a0541d86eb34f6bd040a49c03fd02ceb9 | ORPH
         arm |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/dd227fa06ee28402fdbdc12201a6b0d4de442c7f |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/362a954464b7e871e96a8b965cd0a3d259d86a1d |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/cb3575741a025a9e09b79d30afb9d140fd16fc14 |     
      x86_64 |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/c7de60b9c53b7956510661eb57049811bcaae51a | ORPH
    mips64el |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/414c1d6731d71ad7400702d888a7532c7a02afb7 | ORPH
        i686 |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/ce5bdca48662f22b5bd4c80bf025ad52662ef249 | ORPH
    mips64el |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/990c9d62f3d275bd4e2ffad41bdb6d68c483cbb1 | ORPH
         arc |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/e0dad36228f1a14f0aaa036d919b8ef041e0a64b | ORPH
       nios2 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/321b49e39355adcb98466d3086799cdd651a263b |     
   powerpc64 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/b8533f104ab349ca8cd2139a1a605a800c41d334 |     
         sh4 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/e8db7c0d9619858e48d9a6533a8dbb9750e6ee94 |     
     powerpc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/59646f4baa318a7de6a277480d680258611a5e1c |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/db671e0a0d2263d98e0ab53d1a58995abe183c5e |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/13e884253b02673f16729a5f9e58b61043b4af72 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/4698f0ec2d2ac7a3a9cb19045eb77e2f04fe2ae6 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/5a4b2a019089dd2077880686613357fb576508f9 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/7c3c3fc5466b51dc74ba55b424d778eaab470609 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5fbc5dc09423931af48693d6ccecd1191031f8af |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/e9fd9214fe3d8c2d72c0c05eba71770abe86fda9 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/6cdeb83b2c145368a6ac90064106aead6378f236 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/684fbba33e4a3f8687f017956528d50a98f17832 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/a40127db3028020bee8da6abfc3a2af088b01c44 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/bb4422fb4a30de3e61d54d285129805ef532a01c |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/1a73707ad85b5b5136f393f6ca362f10d48d9c6a |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/273f63bde4fa2520581c221bcbd8cbb655f0ec2a |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/a4f5320395e9f7d81caef7b106cf85f85ffba4cd |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/3f0d227e0ab296c5cc5dd3be1f0fa2bf32c0ff81 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0d23b5ede111f47f009d5bf05d2dfd9c6a4929fb |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/955ff7b39dbccaa9b4c4d42d8ebef7c7ab09bc9e |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/3e904da56ccbb834104e3fc3fb52a5bab93d0c7a |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/dea3a162dca330a70326b498e3fe9b7741923fdc |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/7cc690a902b133167809edb125f123cadce5911e |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/592f2cf1fe9646d9759503cf6c0083f3d31f4b47 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ef6e6a0ac274d7f251e0a73bb5f2b39b62d399cb |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/3a4859f602c5f0eee1941252576c0778b8c08421 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/0bb3a0fdf7b574ecc6983ffc174f827835755f46 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5d2ebbe9581da9c2b3a3dacec2396371320de65e |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2930cc199d274ffb2abdcd0b0b63c3e5e20f329a |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/02a0588ca852ca6bc7d0b519065c75dc221f3674 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/a7e66853eb6408072d456c6b5dbb3ae6d872bf05 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9c59671e783f9c406f34eff719916ca5236d1ed8 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/e43a8ec0b8e6e06118e1a5a215f089d3f3f45afc |     
   powerpc64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/3db126c8f9aafedc83f7a08c877fedbb31280500 |     


-- 
http://autobuild.buildroot.net
