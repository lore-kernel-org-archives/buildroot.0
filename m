From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Sep 2018 08:00:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-16
Message-ID: <20180917060013.C3F5720733@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  35 |   3 |   0 |  38 |
   2018.05.x |  25 |   1 |   0 |  26 |
      master | 213 | 100 |   0 | 313 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
              host-bison-3.0.4 | 1 
linuxptp-303b08cbf55096aba5... | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/9f537dd279b46c543f784426fe04b1304888b386 |     
 powerpc64le |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/bf0bd861ee3abf16c372df5a597f574ab0452632 | ORPH
        bfin | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/2a8faf16fea57935f8dbeab70993e4b2ce1c5897 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 1 


Detail of failures
------------------

     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c6f51d96cb0c2d0aa87c12a1f6f7798e068a8c0c | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 43
 Makefile:708: target-finalize | 8 
              e2fsprogs-1.44.4 | 6 
              ptpd2-ptpd-2.3.1 | 6 
              glibc-legal-info | 4 
          synergy-v2.0.12-beta | 3 
                blktrace-1.2.0 | 2 
               boa-0.94.14rc21 | 2 
                  boost-1.68.0 | 2 
                   botan-2.7.0 | 2 
                   netsnmp-5.8 | 2 
                    brltty-5.5 | 1 
                   dante-1.4.1 | 1 
     docker-engine-v17.05.0-ce | 1 
               domoticz-4.9700 | 1 
               findutils-4.6.0 | 1 
                flannel-v0.5.5 | 1 
                    gpm-1.20.7 | 1 
                   gvfs-1.30.3 | 1 
          host-libsemanage-2.7 | 1 
             libid3tag-0.15.1b | 1 
libssh2-8b870ad771cbd9cd29e... | 1 
                 lvm2-2.02.180 | 1 
                    php-7.2.10 | 1 
                poppler-0.59.0 | 1 
                qt5base-5.11.1 | 1 
                rtorrent-0.9.7 | 1 
runc-9c2d8d184e5da67c95d601... | 1 
                  screen-4.6.2 | 1 
                     squid-4.2 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/4b745afb7113e82e9e779a5ce4db14838fa68cd3 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/81e070483bae942c3d644a34ee0d130ec089d0a1 | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/051e022a9ba8fe113592573978d45a5ab5891d25 | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/da6c4858f680be95d8bb145b4097e56bc9792baf | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/151f1fe08d0dbc3f446e55b9ce074bf170b39b0e |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/98cdbc99a0f13fe60c62addcabd1bea900431eac |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/aaa2ea8c3fb5fe954c0af0061f83ad70e0a862f9 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/5c15fe739cb1b6079dacf234699ee048924b74fb |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/167f90cda62e8e6964985042620f9ee7a222f009 |     
        i686 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/5f7b520817c4493200056475f33e2e6c685b13d4 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/ee28e66521e5560cd5acd8c6d1d06e54bfc3b272 |     
     powerpc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/0dada8dd727f32a4500670f6620adb05943ed0b7 |     
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/947c8910790f81fe1f47dd1ee705c83410751721 | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/f4ce20036fda65aeff89ff17a89d5d532aae107e | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/683169b387328d3dbd1eb72a0a16f36a17ef427d | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/02aa11c3237bc618b893611ad9055662857d319e | ORPH
        i586 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/1b50937892b76786fee122634d1828f965774274 | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/c53fff1afb7bcf82f6a042bba71712b0984c3ce4 | ORPH
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/c7bbd19a6d25f0efc6a9cbe25b47d138cb9ee1be | ORPH
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/64110332fd7bc3b1f0e4f98995a57778d1be5963 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/95bb27117de633ca57c910c79595d2c97f0c4f14 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/ae09d45a86df899a85a2146849c7612d45aec42d | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/7f959177b28640371c4970122eddbd56af3f55c5 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/49ef4540909699d09b6b50b2831a88ad422dd32c | ORPH
         arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/6c68cabaf031ae4d249de4887b468780caf9f7f5 |     
         arm |                    gvfs-1.30.3 | NOK | http://autobuild.buildroot.net/results/5158f07517bb43dcbd02b07b0826daddf43fd5b1 | ORPH
     aarch64 |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/ed41f0c109bc772d984230e2ff98b865a713ef26 |     
microblazeel |              libid3tag-0.15.1b | NOK | http://autobuild.buildroot.net/results/cc18397f38dfd4f1e6605f7a6f58edab49b396ac | ORPH
         arm | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/1d2bae01f59075174f8e710b2c2e48b5ed894026 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/f7f178b08a511bee1993b326160e4355a8bf6774 | ORPH
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/d0c98193c0f8c49778aaf01e79deccfe4ef732c5 |     
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/517489c79d527a8674628d3ba1b6326a3faff38c |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/a715892e71272585d88ff8825c173768f48d1d41 |     
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/b4152867b317ca673f98225240c896f1745a2d6c |     
    mips64el |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/9829c7c0882e02012aeec9807920de58cc2d2cee |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/8b02bdf6a819446470ebef14e47b4670674b4ae8 |     
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/2ce987005d9442bf7b8b53ac64b7799e40f33060 |     
    mips64el |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/2fa382e8ffc1d4fd67166b9788c4115fac880333 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/2a7020de6a4095cf9991d09fbe8f6e364783f63b | ORPH
      xtensa |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e2787d15f72949cbb347e8a1d344f5f80b4d7697 | ORPH
    mips64el |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/faac32207cf5b995672938256410a4566f46e8cf | ORPH
     powerpc |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/e6377c09779b92a31e20dabee9d517bd4e1eaca2 |     
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1f6472275abb6c56930eb058d6dce71fb8fab02e | ORPH
        m68k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/80acb75a74e409479549e2f1c6d05ec2cf7b7e0e | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d3a729bcd97c8c929ca3f1bdc69d035315be5517 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e0bcdf7cd57672e393f469134327755dec9740ae | ORPH
     sparc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/f86fd0d403d7e846388076ca7bd42cb7751150ac | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1f1d6e9cf9db8ccaf389648a7c7d36ab85e7a68c | ORPH
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/544ed2782755642f8ce917de81612b99b5ca9665 |     
    mips64el |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/b596c3456468e4457fbbedeb47fa694c1a29355d | ORPH
      x86_64 | runc-9c2d8d184e5da67c95d601... | NOK | http://autobuild.buildroot.net/results/41d6272342723256a27dc61bb891b018e47cbade |     
    mips64el |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/13465722a1f28ad10b7faafc8715642732efa7bc | ORPH
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/a783bd0964152e577cbf6df1404fe22397d112e4 | ORPH
 powerpc64le |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/4fc32eccaf14336bc2ac801668faf93c428c27ab |     
         arm |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/d420d70bd0a9c0d369070a14ef0dcb1dee763995 |     
        mips |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/43945858581612441a0d11c3d8437b2419c12c22 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/633bafd41e82c552fdc9ef9277e8812d57d3789d |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/19cb0d595565aa7fab700aa5aef9a2f0fa95b1be |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ed0b3974dcfbf93006be784c9990b79a2beee0b0 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/81167eeb3bffdf882337337b7a5049cdb8dc9b41 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/f48ec53e178b6bbea12802e280bfc684aae75be5 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/18102be3b76771c9ad21b05deb12c71e0baaf839 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a0f7f1e5231e53505c024395c34c9b681040aea6 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/179201d569435031482b18d8763e35a97136bff5 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/4e9367f43ce94d0c17fbea9b6d61cb491a67779e |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8d5512bcea2dc741f5170d4ebce0940bd8693f59 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5d536a72033205deea9230ef7a6b377190dbdf73 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/323cc2593714f97752ef8bbdcbfb8a9d37a0dcae |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/d950266470f508d644ca7eade4ece98a56ef0605 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/555ca753b69f6ba75294db0f73e61bc4fae3c0fb |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/351b166dbe54335aef54391ebc49ec56a80bf37a |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/c81435e1f917caaddcd61da3f9436c65d7ae86fa |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c491090d52d6c7eb1948700fde205d1082e6d6ee |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/8d2667431a0784fbc0a0af9fa64d3a7d9b41acd5 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c8069c28d04eff0009ddae8b77db76bf291c370c |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/df75f40147bfbb6d52e8fe81bb5880cbe63358e0 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/3948eaf662a8dd10f84e779e2d65abc1de3e45e1 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/89486a533f945e5aa08ca30c220710fc46c0a0ff |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/6e328849dde57d2b45cc4896e762cfd8f7b3c54c |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/7878e1127aa2a60a3ab6b652cdf0c43991adf5b0 |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/a5c90b49c43b8e8e557d3f946888a5ec8fd979ba |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/8780eab641e7c2374df27aad48f84f118ec337bb |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/23ca6d090d9104c450ec1b806a7c37dddfe340a1 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/c7e1f89c0b1839dff5aa3be2af3f709e68220012 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0dcb91bce277571461333a64f440dddb2b34ac3f |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d6f9f3ae5093d44cee401c97a2a37a20fd8f0f79 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/dc4a94ad63a65c6070c71b634b5a243eb75d8a21 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/2484df586ae04896beee287caf9ca9ccb1ddf54b |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/b9a3d3182cf17694426a92d58816c9fd64c24ff1 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/325816a7bc248c0f960d8c1395a22469aab2f94d |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/ca8189072f61c6bbac51e340c332ea9f09e5dfe8 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0d47a4c6fec6a82dc32c6b24c526fd873743dd7a |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/343a10c9ea1ef0dd6122fb2ecae9801da578b301 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/ed577cf7395e7aaa90c096a7f30a505f4c5f6962 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/0082568c5d5a5883c7ad283a90b54b6151bce40b |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/fee9954ff8cad350d0c08e913d8edef1b6af935c |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f9e64a17c6fb0f8257e59c6d1df12b1a5f285239 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/fef2ccf1552776baa31994f568ec05583b659bdd |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/290ce6402c31614eb308176eb2d44b1ab811ce67 |     
       nios2 |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/8340d4cc8f98b75a3389df542170c54bc07e1be4 | ORPH


-- 
http://autobuild.buildroot.net
