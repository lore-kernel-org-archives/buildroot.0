From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 08:00:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-17
Message-ID: <20180918060009.5C38420898@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   6 |   0 |  33 |
   2018.05.x |  34 |   6 |   0 |  40 |
      master | 225 | 107 |   0 | 332 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 3 
                  boost-1.66.0 | 1 
                 mesa3d-17.3.6 | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/b984220cb65921abaf0bbea5448a8ecb3363a166 |     
   powerpc64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/ce830f1c3e5615772dad692c1940660b7165414f | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/4b8d431a034ef3980d535ca0925da9273b5ea5fe | ORPH
      x86_64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/0e569ac8fdb95e9d60d7610d68e18661a1112357 | ORPH
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/f2f979ce54a8d56b351ae73ec0aaeeb285f98d9e |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/bcb7362f22b221c830898c0552434db9c145aea0 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 4 
                     php-7.2.9 | 1 
            qt5location-5.10.1 | 1 


Detail of failures
------------------

     powerpc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/9fbbd71ec2fd7911673af011fc4cce67e7c8f97a | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/98a34aaa151ef909e42daa38176b3fb5f032ec35 | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/65a9256acbca968d9e01fe0f5bc4097227b9426b | ORPH
         arc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/ce96fc8ec56842a46f2672b81d071e1d8312090f | ORPH
     powerpc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/2a8a165fab3b6aac56a31b722d4be0569a7fdd1d | ORPH
    mips64el |             qt5location-5.10.1 | NOK | http://autobuild.buildroot.net/results/eb1c30086e749d74af6538306026b1c2a1b139e3 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 35
              ptpd2-ptpd-2.3.1 | 10
 Makefile:708: target-finalize | 8 
                blktrace-1.2.0 | 6 
                   dante-1.4.1 | 6 
          synergy-v2.0.12-beta | 5 
                   botan-2.7.0 | 3 
              e2fsprogs-1.44.4 | 3 
              glibc-legal-info | 3 
                 lvm2-2.02.180 | 3 
     docker-engine-v17.05.0-ce | 2 
             perl-sys-cpu-0.52 | 2 
             util-linux-2.32.1 | 2 
               boa-0.94.14rc21 | 1 
                  boost-1.68.0 | 1 
                    brltty-5.5 | 1 
                cutelyst-2.5.2 | 1 
      docker-containerd-v1.1.3 | 1 
              ghostscript-9.23 | 1 
                   gvfs-1.30.3 | 1 
          host-mono-5.14.0.177 | 1 
                libmpeg2-0.5.1 | 1 
                    mpv-0.27.2 | 1 
                   netsnmp-5.8 | 1 
package/glibc/glibc.mk:134:... | 1 
                    php-7.2.10 | 1 
             python-lxml-4.2.4 | 1 
               qt5webkit-5.9.1 | 1 
                  samba4-4.9.0 | 1 
                  screen-4.6.2 | 1 
                     vlc-3.0.4 | 1 
              webkitgtk-2.18.6 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/dd139265fef31fbeab0a45b405dc81313059b830 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/01e697f8450a9168b0cd1c51d1839eb1a1fb7042 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/0529cfd5d46bc8a2cb6baf2e9d681e7697516c92 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/104e7702e0950d8e02a36b3557f7a775abf182ee | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/1aaf270b1f8fd66d355c837e68dbaa09099e60d7 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/6af05ff5a67b2094f9192bf07d25aaf1c5237cf9 | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/d25f2ac7d996d500d1213012dd7bcbe64ea44169 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/4ac3ec82933b22b2a11966078ae0c8cd7fa0eb05 |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/d4806c31f7e5c96c86e1996513b49e43b7115a4a |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/afef55f5d6c500a904d67f585f34edeb09aefaa1 |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/8d0d8e0338dc7003d5beeb1f54d5160fda7ec5ec |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/17b3188afd15ebda40466118370fa7cd4cde3ae8 |     
       sparc |                 cutelyst-2.5.2 | NOK | http://autobuild.buildroot.net/results/4e6ae22444843f1ec49fbf7b710385708a169f3d |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/a5f691dba2f96db13c1646ba75ade0bbca577047 |     
       nios2 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/708d19a48a05eefb21786d8d6a5696a576b6d61f |     
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/98d14bc289c9240fa25ddf57a74cf90cc25add7b |     
microblazeel |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/bf373a9af94bcbb888f7a981851443744e5dec11 |     
  aarch64_be |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/18829a531c747cc3758f813d3bdafbcfd4be1ef0 |     
     sparc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/93c1995ed11220e116c57e66f220364cd97e8482 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/14b9fc74d23d13396c029ff1ef7ba470ea7e0d21 |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/b7afedb95086b600c9ad991bd5fc86f8a8084e51 |     
        i686 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/6029d2440a191aa5bf5b41a0d35716943fd9afd9 |     
        i586 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/4ad41ccf2d8d487261247e7b69c74830e6f06a3c | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/f995a7c8c04ecb794420633bceaa5e4b6650a1be | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/a42c1364db2e9192d655a08a05e4fbf582d6259a | ORPH
     powerpc |               ghostscript-9.23 | NOK | http://autobuild.buildroot.net/results/e77d19166568bc1c574bd3d0f758ad482d2015e3 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/b3272f8d10b20794943cfe50a21bb8583e969ab2 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/ca856ad1b2fedba5082b6a7c33b0044a73fed1f5 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/fe507b6cef23399c7ef53632af367d698016b908 | ORPH
         arm |                    gvfs-1.30.3 | NOK | http://autobuild.buildroot.net/results/7d0b38d64eedcd001cd3993eb59ada7eff372043 | ORPH
         arm |           host-mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/88b07f20409c22d0b106cc9fc0ecc62b4febe73d |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/65cba1be7b4305f366fcce8000165b191432790e | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/51f615bf0ea618351350535641d42cf7ad374f6f | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/0bca58e9c3b5eb625546cd1a361d5c1195d3420d | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/b6e678fee5d8d6efc19ec45c4cc32478475d1100 | ORPH
        i586 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/bf8670219514947a910062e19ddb9127b63c25a7 |     
  aarch64_be |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/77535f438c37a7e5db378da9a7c2701270eb891d |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/24067f627a01e231e181ea701e5f4b62b65b53f4 |     
        i686 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/ba4839844e926166ee9b0247afde129281afa442 |     
       nios2 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/1cf5447be53b1761c299e08ee53772c7e8ee983d |     
       nios2 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/b3241676b171900e11cc4ecad98637d4f65c0fec |     
      xtensa |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/38c591da4bbc7caa009c0b1599964d0293a3dbb4 |     
        or1k |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/6f775f76a89273186631d4098dc4c830bd85eb2e |     
         arm |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/2f00d838c2b561a44f42c0de985d6b98ef2f24da |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/ece7af756c910f65f618c1d04a5de70cc574b5f4 | ORPH
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/79b938ce5c9133213f932c3c9e774ab054387ad1 |     
         arm |              perl-sys-cpu-0.52 | NOK | http://autobuild.buildroot.net/results/f29d8ff42a0493fb84870fda7d8cdff79c99c118 |     
         sh4 |              perl-sys-cpu-0.52 | NOK | http://autobuild.buildroot.net/results/ea64c2d8022932162d36301ca4061f61cd208c11 |     
      mipsel |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/d9ee4f785462c8a58d450ad9db0e2a23140aac51 | ORPH
     sparc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/98174c0c1c58d1499e9fec258dbcedd0b0e7ef11 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/b35a747334c56b374446f4817539e2aac62ad664 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/059482cbe92578fa2dc6a9a1399a6b2e03d9f0a5 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8705a74db2098a27fb89ebf9fc884eae4a9a9dc0 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/fa77051d372906178d9006da9de54a8501e25d9f | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/32704e47cef1424f3624bbf39b33447a6426376a | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c51cc9a9fc22f48d074e85ffe3ac7b6ed1795c0d | ORPH
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c01e9a1c9248755891192b88789584efcc2aec33 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4165cd99f3d5c15be8e97391f59a862eb132afe5 | ORPH
  aarch64_be |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1b49c0f90b8e24df2cbb7fb83016b62f9ecbdf17 | ORPH
    mips64el |              python-lxml-4.2.4 | NOK | http://autobuild.buildroot.net/results/b93383a71d9c64a897f85031e410fac612520abb |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/985523e029a2bb836fbf44b9e642f1d516cd6205 |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/553fc0d49034e4d5a31598352a0019c87046ab65 |     
         arm |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/f09f1f19415a0d6bcc0f1b9f1c31e72e4732da8e | ORPH
     powerpc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/15ba87b8069020baf243c41d4c57e0c209853296 |     
   powerpc64 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/6a92cf242c05b0b788d2db012d0d06e8ffba9e8d |     
    mips64el |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/0255e195937307540b2428947b4cb1a8791419fb |     
         arm |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/261c7205700073615695c0ed37a6b5f29273d31e |     
        i686 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/aaff43aeff5f5d6e10225d5bc33ad192e1600e50 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/987441b4144a4bbf211692784789e54081d4ee3f |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/4b5a769587f1c444e31a9910db99b3a29e8e4347 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c24cae3d76ade5c939540924d6af6ae39e5187ac |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/e34f0b2dbdde93ab61469930769a57accdc0c53d |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/576339645d95909345edb92b9f55313c856d2337 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/a34e29e6fb398e2557e6f15a09b01246926b8719 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/74c76beb49262eae977ba2388891949837bc759f |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/6468e3d5b8602b4eea02e4296a5b6ca455ba185e |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/351db809d294cc4376ac0aaf6831c6df5504938e |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/6948fbec620efb2610a819af739ac35e2d5e8f28 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/66ee9e0971aab96fdfc415f962af9c3ed3c0a459 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/d2e103e48b2c01cf9d3ea973e476e172d80bc27a |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/bc2c2eb88813b39fe5fb7775b1323e150ceb5a1c |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/436a4a8027d341043fe49dbcfb8f678dbadf2f87 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/b5bbeb0f8ae8876c087ff77d6167538f6bd58ccc |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/7490c59594644e5b4e8bbead1fbdd0101d2bfb9b |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/32602cae44a707f095c3feccc700f526042bc375 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/39c94ef662ca8f5a642cc99c7482a042c3c5eadf |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/27e533e5efbfc3cff97549a8a76338c121c28f04 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/1f560e081bacd1f14f05b16ba38bfd14eea1a000 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/65bc7a3fb68bcdcc3841a342a5a7b01d69162833 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/cc86842948e141317f9965f32c132999e74d90f2 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8c725ee3bb06809d2a919225ae95174f2f469a1e |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/813a27a7308fe05e7d8b56178f5623abec4fbdc5 |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/5ca0f1fa69878a5dd83dcd2752eddbe4118a607f |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/7e57ba52f39d4f0bf4b650b02bcf70127eee2075 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/34d1b9ba2d032d188b89776627d25ab2d529d4b9 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e6e4b8bcfb51b77e6c7f092e6d3fce81f749b619 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/cd1d06e2a17ad496735d6b83f3bf60fc492049c9 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/d87c6f9f11db849d9329e9eeb056cbdc9a70edbd |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9e9ef56a3e578db53676ea9da063f187876c9553 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/b99214b2063ec6c7b5e7c26cf0c78f4afd72e563 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8eb3d38af4c929a2dd3662ce90f44c8fb5632f34 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e730178304b00505552813b167a57b46a17e3a3b |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/a4954813a9e190145198ff3680e62d7ac598c5e7 |     
   powerpc64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/39736f79a95570f5d1e9ebcc4f768f6d9e02646d |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/9d937f8ea7350d028402825941b8ae73330afd3c |     
    mips64el |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/f5d9f3df78626178274c1be878a2ae0b90394885 |     
    mips64el |               webkitgtk-2.18.6 | NOK | http://autobuild.buildroot.net/results/b418e5ec07da905356d2eb0d1ebc982261b5aace |     


-- 
http://autobuild.buildroot.net
