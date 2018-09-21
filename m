From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 08:00:27 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-20
Message-ID: <20180921060027.B8847208D9@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  28 |   6 |   0 |  34 |
   2018.05.x |  31 |   3 |   0 |  34 |
      master | 172 |  81 |   0 | 253 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 3 
                  boost-1.66.0 | 1 
             host-patchelf-0.9 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/e66cfe4d1ec9a25e8bb0b8340ab7b076f7e6e3e0 |     
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/6a4c1f01d1aab57b568f3c61a4c59e1da37f904b | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/343310302c8ccec3ca7e62e6429e2f5c6b108d48 | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/23d49b751655252f3b65f103fdb55d435de68ab3 | ORPH
        i686 |              host-patchelf-0.9 | NOK | http://autobuild.buildroot.net/results/671d548acb0f7ba2133ddcc4d993bf814cc771a4 | ORPH
      mipsel |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1b77d6459033eaee2198e7711302e6c157a168e0 | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 2 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/f2b45d809c3f6397b16dd704aadb21e0aa3ae826 | ORPH
   powerpc64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/8f4e09e3acf04998f9c0e9260ca74638d19a0695 | ORPH
     sparc64 |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/7c3e2a6ebaca2bd7a7273c25508b370e02e8820e | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 28
 Makefile:708: target-finalize | 8 
                blktrace-1.2.0 | 5 
              ptpd2-ptpd-2.3.1 | 5 
               tinycbor-v0.5.2 | 5 
                    brltty-5.6 | 4 
                  monkey-1.6.9 | 4 
              glibc-legal-info | 3 
                   dante-1.4.1 | 2 
                  screen-4.6.2 | 2 
                  boost-1.68.0 | 1 
                   botan-2.7.0 | 1 
     docker-engine-v17.05.0-ce | 1 
              e2fsprogs-1.44.4 | 1 
          host-libsemanage-2.7 | 1 
                    links-2.14 | 1 
                 lvm2-2.02.180 | 1 
package/glibc/glibc.mk:134:... | 1 
             perl-sys-cpu-0.52 | 1 
                    php-7.2.10 | 1 
             python-lxml-4.2.4 | 1 
                qt5base-5.11.1 | 1 
                  samba4-4.9.0 | 1 
          synergy-v2.0.12-beta | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/f7e4cc5b2d32d9852cf30417c17dcf593fa7e0ce | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/33b1ee090502ac40032855493bec56083e9fd1dd | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/496dece415095c483bd5cdf83e3930c63e114d37 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/3b33ec1c8c19a34816894887da9f5838df2e874b | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/0fc65ae09d70149d227576b62241f6f61b58bc9b | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/51581ff77b8c04a8c61d2f1f8ef4f6c5190fc964 |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/111e95f6a3037581ec371766c2c7a0cf9668a59b |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/21a05e7a4a7ecb7bd9337c01eaf5a0364e43a5cf |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/c4e8fb7106305fb39e012312c71bdfd557735667 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/d82f603849ef46be02c2228ac28e16e90d2dc103 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/1bca79f3199289987451bec47dd6ff7fd70c1c9d |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/d35204016db5e5b6eb19db610f02f24501e9ce15 |     
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e8eb95ac529d949b4af10c4bbfac1bdb33ddf44f |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/8332042d68f7cb1b180f9e729c4414ea627cf6f2 |     
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/9d0ad0905261281996d8a56252296303565618da | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/a17c3cb1eba5c9c9fb0d1abe7246d756cd256fc7 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/20d614d351bfc22d189a80b073d725c4f4e8a9ac | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/aea342b801ffaa41ace53c94add7e0da9cbf01ba | ORPH
         arm |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/b8805a1f6fc9cec7b158017eec4593f6157737a3 |     
    mips64el |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/ac668f867b9de7a2c61d263a894480afc181dd9b | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/88ac0cdc0c5d19ffa1651c0566103ace2cc83ee7 | ORPH
    mips64el |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/adda003dc7ac128dc1e7e435c6b100f77301921b |     
     sparc64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/9e9fb3b33dbb9e5ab567c948ff14d8d0c4cce9d5 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/2ff3f1975d1484cb96741c69f4fb3961409962b7 |     
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/1976f869f40bed1c694f77191e7b504905278869 |     
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/9151dcac207fcff76ac88a95314de6abc966cf08 |     
 powerpc64le |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/4b4964fc88da923c8f7f082940d41a01aad6ba7f |     
microblazeel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/509f3c3844fac7b95d771840921b60d788b7104b |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/60f85b701c0b4642aa448f6522b08872b9b5c819 |     
         arc |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/b1165ef9aaa7318ac19b80ba1ef74e1c0d3b68f8 |     
      x86_64 |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/f57ca63b6f3494a9967cbac484672c3eebcc7028 |     
         arm |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/1cc3ae74231f0d8c4ef337a3f981ebe7b68a6bda |     
        or1k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/c930b38b2a5de3a007103feb317a7d67473b67e5 |     
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/b649e5b4680cb2d939ddef5ddb02c26ee9d29d5f |     
         arm |              perl-sys-cpu-0.52 | NOK | http://autobuild.buildroot.net/results/829d874141dc5cbf4ab0403f8c0b23694d604b6f |     
         arm |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/cc86a1aeb32b839e6029c7bdc73c16f77c0762f5 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/87f4045f3e91294974131626cd884a8aaac731c8 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/130030f66fa63f753a90141da780e51b0ceb5416 | ORPH
        i686 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3ff23869c8dca2932ed1ed13ea01e3af4ec13212 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9eed9d9292ba2e1addbe106c2f78b0b969a17019 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/f39435a5f848ef7080ccc965a1210946ba9b5bb8 | ORPH
        i686 |              python-lxml-4.2.4 | NOK | http://autobuild.buildroot.net/results/9b977ae3be00e7e392c6c8ecb6325ff41e324a1f |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/9d980ce4b8a1e4e547080c76703a96cd7de34d3c |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/23016986c16251b72038c630d4d7667e8c6a5930 |     
         arm |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/1e0bc3f01c0e25ec9f7c52b78f818b6224a3cec3 | ORPH
         arm |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/049608bfa638877881334314d3c8c3327e528693 | ORPH
         arc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/85e5561d25d560e0d5619952c6077918a47cd3dd |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/7a2b2a1bcb086ff98ce393dcf9cf1a8d9cf82355 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/44096b3abcd622041e8f0015d161cf92f78ff903 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/abac1f49d8c8375aff6dec983b0e1c56a8f455d2 |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/74a96eff09dfca5658254b92f88cfd724e541915 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/944417ff26243b4fe29e14570cd470bdf308e494 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/f66e226c1195b9a7ab46fc754174fde9481fb8ae |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e3241700463def9b6c6d37505b73e1c2a6f24beb |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/d6a48c5d16be4a0ba933a163325767c466ede5ff |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/10a19a6f5c691cd2c4235af85f3bf7e2db1c0857 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/982dfcb7155641b0e232b19b999ced555562896e |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/96c767bec036e7fa95db107bb833f8c850cec848 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/822f54617e9f8b876e24e880299be72a8ecff910 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/21453ad7fc21e7e3c608c832950a7ffa31b6c6b2 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/b76f0be075e380c60141fb92e7ecd60dacf944bb |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/197f23b47ecbfbdaf27bd2a88c661dc1951e2792 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/69fabd756523003314cef2f3f1d2f7bf966de754 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/724140198ae38fc2c6469e2c245a4d318106e60a |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/b261a6cd1e6fd76d2962181363fef432148747a8 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/def012e3c85d518d1ffe0f331ec2538ad0c5104c |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/35caf7d230c4c9644040d7c73ea469f79633d6c3 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/a4bc693e529662b040f85b478fb20d52277a6c84 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/bfca652497f70e6174842d22da71593543df5e2a |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/d6ba6e0b38107d0564f179db258389854396ab3e |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f8dac441267af1b2ae5d900abe37a350c57e9412 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/aa55a899884dfe0b33b6fd7bd195227758847794 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/86e0b0ca38f05d9742463ff315737274da85d26b |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/75765cc0c70b84ef6b7fa4849f3da894412a3426 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/67ef2a93315ee8e63128fad404bf9259e4c18142 |     
    mips64el |                tinycbor-v0.5.2 | NOK | http://autobuild.buildroot.net/results/b52242f3be75757c3e63d573481b8c35038b9162 |     
      x86_64 |                tinycbor-v0.5.2 | NOK | http://autobuild.buildroot.net/results/a2dd3a2f33b1588234b943ce988c95b21ef5a515 |     
        or1k |                tinycbor-v0.5.2 | NOK | http://autobuild.buildroot.net/results/714393a9ebe80fc7be3b7648ee9baee49160be5f |     
     aarch64 |                tinycbor-v0.5.2 | NOK | http://autobuild.buildroot.net/results/6a9b7b7e294cb9dabc5212f118815fefeeb5d8a4 |     
microblazeel |                tinycbor-v0.5.2 | NOK | http://autobuild.buildroot.net/results/afd8d24f2a4e501264abff618cf421d4bd088ebf |     
   powerpc64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/25e0b5995d969d19725932fc54c337ec58054241 |     


-- 
http://autobuild.buildroot.net
