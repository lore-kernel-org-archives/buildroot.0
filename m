From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Sep 2018 08:00:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-27
Message-ID: <20180928060011.6A14820A95@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   3 |   0 |  28 |
   2018.05.x |  27 |   1 |   0 |  28 |
      master | 186 |  83 |   1 | 270 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

host-android-tools-4.2.2+gi... | 1 
host-squashfs-3de1687d7432e... | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

      x86_64 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/84da49002f16c9b294ac8c896f53718b90543100 |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/e1b7d1a0c5927ce2efcc87c67b18600b33115513 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9ad7d7fe068f9c17e19a0100191f4a1cfeaaccb3 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 1 


Detail of failures
------------------

   powerpc64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/0dfbb7fcd0f039030d34d10d1bea6883743774d0 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 36
 Makefile:709: target-finalize | 8 
                blktrace-1.2.0 | 4 
                   netsnmp-5.8 | 4 
              ptpd2-ptpd-2.3.1 | 4 
                sqlite-3250100 | 3 
          synergy-v2.0.12-beta | 3 
                    brltty-5.6 | 2 
              glibc-legal-info | 2 
                  boost-1.68.0 | 1 
                    chrony-3.4 | 1 
                   dante-1.4.1 | 1 
     docker-engine-v17.05.0-ce | 1 
              e2fsprogs-1.44.4 | 1 
          host-libsemanage-2.7 | 1 
                host-libsodium | 1 
                libmad-0.15.1b | 1 
                libmpeg2-0.5.1 | 1 
linux-firmware-44d4fca9922a... | 1 
                 lvm2-2.02.180 | 1 
               nfs-utils-1.3.3 | 1 
                    php-7.2.10 | 1 
                    pppd-2.4.7 | 1 
                 qt5base-5.6.3 | 1 
                  samba4-4.9.0 | 1 
                  screen-4.6.2 | 1 
        wireguard-0.0.20180925 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/5528ab59f1939a7eff7e85318f3b36283019cc50 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/596cd8c419a931e2dcdc96e51d84ff524646f67b | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/17461209755038a30118d76acb4f43469a22a139 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/bd73a394e603b13d58fc14f2a5c558567f88fa61 | ORPH
        mips |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/eb21e75e2b5048d83733524d12674ace68919c83 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/523c9b50831db14fc12c77396ff4066eee3330f9 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/9d026c23ee156d79427404e9fb2715264d3faaa6 |     
      x86_64 |                     chrony-3.4 | NOK | http://autobuild.buildroot.net/results/f1fcae399fb640c19cf88c9333a92cbfab547932 |     
        i686 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/d0c048306b019d1b2f9670e0496aceda4f2cb816 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/c3c1806ec7d7cc5747ade2df88c9a4da22a60568 |     
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/27a68642a682d845cc8625ac40d98874f340ae50 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/f837a080ca5ea29468ae721d87642571a2addde7 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/a863edb29d1e1563edfbf995b904bd7a783e6b92 | ORPH
     aarch64 |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/4aef81c1e9607e91d6c15eeaf3f7441899a2e7cf |     
        i586 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/59ca03debf79f4725ff546ef90143410d5f22f0b |     
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/785d99dcb6144fd8865437b32677be611f484178 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/7ab0acc69dfcccb0848b21b505b07f169f4a0106 | ORPH
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/b0ca0fc57bdc8b45ff4c25bfa2cca60f13d55e43 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/a5dfc87f94b97135e5cc84f6a876114891ed9dd9 | ORPH
microblazeel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/f7a0f4ca52829657d6a7c9ab9ef3fa84fc45e9cf |     
      xtensa |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/581931f64bf4e21a6ed39d31f607bb945acae4c8 |     
     aarch64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/e79f07e46e6a83d404371a8087baafd422c9be9b |     
       sparc |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/9d307ff90bb903e54553185ff618c04cd4cb717a |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/5e5922cfd7ad6a921753804c2ec80c947ab5a570 |     
microblazeel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/0a806020a9f27b7350770344f60f0c5ebe36c9ef |     
  aarch64_be |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/78bba809ee47c9297d8def833eb72836edd709a0 |     
       nios2 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/ed8f6792724d8db53787e9376655b2ea32717bfd |     
     powerpc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/fea0869b8de8d453bd51987ac5c35ba3997d4784 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/7011def684e6e36295df480971d1f282d9b6bb55 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/c7650c90c409213581e84ca41b36c50b5f816869 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/bffdee3c4231c30aeed7c89ac0c6a825cbd08d28 | ORPH
         arm |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/1a880d00fc6210a268412f03c308ef3423735e93 | ORPH
      mipsel |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/d30c038bfc306b2451d21e81a89cc9d49719ffba | ORPH
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/09e018d65ee354e85dd0e3d48eb1288de4d82188 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ee170c5a5a7aba0cbf20d696d5a4d0c25914c744 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/38a08f4ccfbb5d6c910de973effb1944586f0b99 | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/84d352932f71526bee922b29d29033a4125b0ce1 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c3623aabbb6d03cacb1633c00d95a7d3bb1d593d | ORPH
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/78f64fbe38fffa32306709af04259697bd111fc9 |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/5d9a154c4a1ce436424c19516fcf9cbca5c07f19 |     
    mips64el |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/47f4ecbec1355285633df287fc9c4e7cccde9378 | ORPH
         arm |                 sqlite-3250100 | NOK | http://autobuild.buildroot.net/results/faab3d1583cbfd46fa95600bf6aacc6dab97a59c |     
         arm |                 sqlite-3250100 | NOK | http://autobuild.buildroot.net/results/99f52b0cddcde128ffa5754fd53827819e54789a |     
         arm |                 sqlite-3250100 | NOK | http://autobuild.buildroot.net/results/5010e4a5d3994feb79d47841d55458551d8cc03c |     
    mips64el |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/9f707b779cf426cf8e09f2b44f9baa3757cbba0e |     
    mips64el |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/229dfa3b6263eb8aa097513f5f8b99608dc8c483 |     
     powerpc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/0d4cb074511786177f7d0d8399c7b61af1632afa |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/57d334265ab141a0512badf69cdad42a4362712a |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/59d33ebc3c5ffabd96b4b32ebd07c4bf4d6ca141 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/59dae717c39a7e905df275d300a9fc204b471a52 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5d76c23c394e3a28884d712c3cb757a13be3e080 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/6511077bd3d4212b4eac985c31d06ee0ff2b0ed1 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e621d7add3940099ed593b2754c544b5b42d3ee2 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/c4097257b65afe548251ad9162977ffcaf390b6a |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/7627b91a41e0eab098771a4bccd833ebc27e8df0 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/98d0240c8cbf33b957285f93ab8da217cf567558 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d2fa732b424b0f4b4c1243be7c587e06dae21048 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/5f4ecdde6ee9fd6efa9d2e3d2c920956893fdde0 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9f4b943d4ba8629ed49776a2f1b0e588c63c7fef |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/a97494093976ad13284ae794980b791c30d47601 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/4d71af7784225653731ad1d3e99f0703c25ea846 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/270852bdcfeb55321a849a12c245e64698c917c6 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/354f2758241e4fcf20baab3d4196402b7c452da5 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/7220baa1fa54172ca4240147614641b9529c55f2 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c0fd576847c8187879913ceef5165828795e65fb |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/1341e9bb23ed6a3729dcd9d743ed18137f724b6e |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/4b24938b45cc05b080e162488cccd6e99344b71d |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b37ed8420b62e39ab45341e449031dba09f6a12a |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/903ae46643f523fb0d5649f04347c443b362763c |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/411e466665e149fe161e860aa6c8592eecf82422 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/f03482dbbafaea1a3ea53efc5ea871e06b53efb2 |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d47546caf38dc992f5d07ab2a82239bf171b1264 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c8eec162a6b5fb6811c7faeaef5c60c102e587e7 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/0d7a9c48569948c4e661937d15438e4308de0459 |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/93eb95cbdac6a2ec72d0beb737961edcb3b47328 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f367516b126f2eaf5e5d61b9b60f1ee589751ac8 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/cceedca7f3c73dbe21f1277e63929a5925e0ba51 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/9b945e08e665d51b68671bb4bb5c4214c8cc4b0a |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/04af614d4d35e2d3d504527c04c80de28618612d |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/45b4c8d1c6b3a05c5a2d17e642516ebb299190c7 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/ea45351c776b0a0dab20ab319b8d148dabc51c12 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c0ecf32488e6680d92d43988faa3ce1fcec9ca10 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/1f7ed49cacd8f901b91681ad6ff998829d2e0e18 |     
     powerpc |         wireguard-0.0.20180925 | NOK | http://autobuild.buildroot.net/results/f5f05a18eba1e344551967b1ca99f7d5ea6dbc11 | ORPH


-- 
http://autobuild.buildroot.net
