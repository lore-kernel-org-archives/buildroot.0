From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Jun 2019 06:00:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-23
Message-ID: <20190624060104.330D4855FE@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  22 |   2 |   0 |  24 |
   2019.05.x |  25 |   1 |   0 |  26 |
      master | 184 | 108 |   0 | 292 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/b928eec13c5833aa6702a0e5021ae7e9d61b3442 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                harfbuzz-2.5.2 | 29
               libglib2-2.60.3 | 17
               libcap-ng-0.7.9 | 10
              iputils-20190515 | 6 
         xapp_xfindproxy-1.0.4 | 5 
rtmpdump-c5f04a58fc2aeea629... | 4 
                       unknown | 4 
              domoticz-4.10717 | 3 
               host-efl-1.22.2 | 3 
     host-imagemagick-7.0.8-42 | 3 
           libvncserver-0.9.12 | 3 
             host-cargo-0.26.0 | 2 
              libsodium-1.0.17 | 2 
       python-matplotlib-3.0.3 | 2 
                 python3-3.7.3 | 2 
               util-linux-2.34 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
            host-mfgtools-0.02 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
           oracle-mysql-5.1.73 | 1 
                    proj-5.0.1 | 1 
                 qt5base-5.6.3 | 1 
              swupdate-2019.04 | 1 
              syslog-ng-3.19.1 | 1 
               wireshark-3.0.2 | 1 
                     zsh-5.6.2 | 1 


Detail of failures
------------------

      mipsel |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/439a0764881bc6d1d723a5e43eae7e4459c58bd7 |     
         sh4 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/d496a6ef1579b81305040313216ce8eece468387 |     
      mipsel |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/1308e4c287bcf332d79a22e4fc1b2c1cb2ba86fb |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/1709960d02da7be8f65a3684d2e31bbb1b226b6e | ORPH
         arm |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/666b354d4fd58d6f5caba598ae648035944e89a5 | ORPH
    mips64el |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/ad72ccee6561b1e2cb3a497713f7c1d71094d9cf | ORPH
     riscv64 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/389f60558ea8bdca33529281f9318a80aa7ebdc2 | ORPH
        i586 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/5b1d442ecc217f243a41fdd4059fd3e159a367e8 | ORPH
         arc |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/ff968afcf4afed52372901bec535ea69744101f9 | ORPH
     sparc64 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/95a2e2db3a6b8e102d63eb3142a5b19955825801 | ORPH
         arm |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/c5e82fb26d166e78d4c6f5f23d6af98e8f25a3ef | ORPH
         arm |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/dbba5798957261bc3e3655fdf99effaed758433f | ORPH
    mips64el |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/92c910610ac4f4413c34d19e851fed3b7e78ef05 | ORPH
      mipsel |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/d6287b5f4eb23be613412cb4f05510d40b47e7ec | ORPH
        i686 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/842282589252accffd086372b04ceb5bb672bed8 | ORPH
     powerpc |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/66ff92640290daf83e110dc16cd05e40d5e75dc7 | ORPH
      xtensa |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/5efa74b13581ce00ee183aeba112cb60e2fbe750 | ORPH
     riscv64 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/bc7b41642591c31a0c96ab59834021de5508e698 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/684642aed2f672dca8f38d16746370de36c077b6 | ORPH
        mips |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/de57e08394c1a3472c375f6eebd403ccd9f94c9d | ORPH
     powerpc |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/fd709061844b1de3e9918227768590b1ab1c1553 | ORPH
         arm |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/08a2ba6a31d84a7aec3e0077cb27808d9f2626b6 | ORPH
     riscv64 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/a1873690ccf0ae1827c7ba12b841beebc4ad1ae6 | ORPH
      x86_64 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/10a2596a57a9582e817b7c44e6a762a2793389eb | ORPH
       nios2 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/de2fc079c3bdc3e10f2ba687f260859caa047b89 | ORPH
  aarch64_be |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/f4bfab926581f341596e0db52e45b8dc6e17bcf8 | ORPH
     sparc64 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/5ccc443dc55044f341ffb1d697b2c9e806620eaf | ORPH
        mips |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/f37a43265e9cf2fe307571df667a688506928ff4 | ORPH
        or1k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/da1899dbbb025c4b0097cb6b2d445dfddaf141b6 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/fdc098d3397bea8d76edbfdfe388fc82d98aa7c8 | ORPH
     riscv64 |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/a78c2915f67ca74d85005cd62564cfde3b47440f | ORPH
         arm |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/c106da99c68e9fa109c251480242006fffbd2dd2 | ORPH
     riscv32 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/ba86d9f8bb31c93d55cfcc69ed7ac06e0dc4f351 |     
     riscv64 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/8356369cd93de3c776b09061bfcf0ff0c6af88cd |     
     powerpc |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/c5a01e5727b545f44d7cdc96553713a38594b8b0 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/375b8b0d5d5ef7439f9ae4d452e35d28651bdb14 |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/dc25ca8b52c5a196a144078f240dabedc2a25c2d |     
    mips64el |      host-imagemagick-7.0.8-42 | NOK | http://autobuild.buildroot.net/results/bba0b11239174e8ed533bc34b791fa8bf8e5367e | ORPH
         arm |      host-imagemagick-7.0.8-42 | NOK | http://autobuild.buildroot.net/results/3bbece1d31c59f655378e0c39fc41325ab1e7530 | ORPH
         arm |      host-imagemagick-7.0.8-42 | NOK | http://autobuild.buildroot.net/results/8f109ea0224902ab67e3a61d7a7b84d979893e69 | ORPH
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/706fb2f0e702e7a2419312af086291d34a1eff9a |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/351602981ea01c2819464a5465b0ac28ddde0b7a |     
         sh4 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/927643e852763e42ff607a4de2c6eb0e0b2f1f88 |     
microblazeel |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/1c10a219e4a054b219df11e94c926f5f1ca3e5a7 |     
       sparc |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/99ba2b8f9c4fe5305bf5fdf78a4c005338e1e17c |     
        i586 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/f0d227b667323f7e338e9693a25cb3da69de9e92 |     
        i686 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/c3c588b20fb3a7da39d5724ff429d4b2cb4f8365 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/5fcd92a7c5673b476cd6d4bb9ee0eb97214689b7 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/50ae61100493be4261c6485eb034e99343349865 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/0417a3c21d6d571b8168754c8544e0d36dc6ec72 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/f94234c21bbf10b66513c9b35c78b4d6afee6068 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/0c7cb1474ff87bf0911ae2d2d1b7ca4788aee7f4 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/f697cd0c2455401f9790f1b78610f76d782ed143 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/864b3545b9c8dff70be3c5b530a2db2a424c5999 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/4fceec92964ce499b2c48acd0e0c701b8d75668a |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/8520ac97f29dac83c976dc6d0076521929c714d0 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/ad7e1b89e8371b603534401afae1073a621847a5 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/c74a429865e6e7dbf6d24ffab7cca7c7456d7c6f |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/6d392b72e34cff0e0e9487071c52708ebe44d3c9 |     
      x86_64 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/0006369b41592b2ef2b14a7b42d8174d424b2099 |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/3100fc9f1be142d00904a66c256bc8388516184f |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/30bb79b088a0ba792c02ef95e88cb70a04841c0f |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/08b90b36bf3eba159ce7e3a587633618cfcc6785 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/92b393f1e27cc77cf0a877743144975df76fd97e |     
      x86_64 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d2518a787d48cfea48de7dec0841ae5e64c7ad96 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/6b48f6109564984a6a7564a3283a9939a8e6e838 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/0a64512f9a0cb79932c5d3cbe9508f7bae04ff18 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/7e06dba9f69439322a1283efc2a819335a9f7f64 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/c0d3f6ff67185aa60ba7ed100475a0e2d9fe9981 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/f4dcf742231137fb0c08f4ff29fab589e37059e0 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/6f642ad7a7c12e05ee1887e71a5fc163dd1f3d03 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/965696727404910cceb997a53505aac06b9c5d7f |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d303c8548a600226d7bda6506ed215ac8d7d1a0b |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/6c1dbcf6f988793e75dacf78b15f7e7b542951ae |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/e277f41e44f51d2ef8a844ef0adc74397b64514d |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/11dad34c3fb11d5d40c2ef4cd50249a1730b84ce |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/1b595ed95365a0d9d87e7185a4c188487518c6b0 |     
         arm |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/c3f75480cb4b8b042cdf6a34cc5568ea13e51342 | ORPH
microblazeel |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/8e767a44bb1ba5581a25200b798b287ceac3bead | ORPH
         arm |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/16aaa4e86a2dbf1acf95f10d5131b0f7b8a3d61a | ORPH
      xtensa |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/546bf24a9c08be3b65d39def41229de2080ccdcd | ORPH
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/e61bd55067071415223e523a81de3c2e9cafea6f |     
      mipsel |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/0a05f8a08e5ba5fc8ded9508e42e69b3ea029f2c |     
      x86_64 |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/e16e6e1cb6aba29f2861aabcbb6f0785f984ed91 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/a3c81334851ea11d75f472dd891ac63eb0779768 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/8523d92ee3ec288773bee9a049a926f6402b05d5 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/12037a0820c506373f72a1203305720e5ce1e762 |     
     riscv32 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/9c2844e5f8f864f833dbefa3d6250e410d1564c0 |     
         arm | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/006af85d2d0d5382b5ce6d0ee81d5f1e1d0204f5 |     
         arc | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/dc1578d954a866a7b64f59c9e23855e2331969b5 |     
     riscv64 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/01005b5ef803dd7cebdf2f9def606354582fbca6 |     
        m68k |               swupdate-2019.04 | NOK | http://autobuild.buildroot.net/results/9bbc5c493ad05813b1edeb350713d89c89560c79 |     
         arc |               syslog-ng-3.19.1 | NOK | http://autobuild.buildroot.net/results/0577044cec0792c51359445fa08cbced2a8dfd3f |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/83bd5bc66ee9e2a3689fb47e3421d35a290c4a19 |     
     riscv32 |                        unknown | NOK | http://autobuild.buildroot.net/results/17bf8f69f3b607d531943fd2f704ad1569add447 |     
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/f74efdd8818037452472a967fd1ba65a492c7e64 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/70c406e891c77e52cd1481ab5c1a215036d8e63d |     
        m68k |                util-linux-2.34 | NOK | http://autobuild.buildroot.net/results/89a25c4e7ee34d1ce4aafa0ab4d5934fd8a61dd9 |     
        m68k |                util-linux-2.34 | NOK | http://autobuild.buildroot.net/results/87801e1a3c628e00ccb0c57afc2b46cc735c6018 |     
     sparc64 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/f87332e80fe4ce3f11b0f9fdb814cf90070bfaef |     
    mips64el |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/f63dce13824f7b3773447363961f56b02d8b3205 |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/c8ea3a556ea3a449366aa4be95fb1856f9fc3cee | ORPH
         arm |          xapp_xfindproxy-1.0.4 | NOK | http://autobuild.buildroot.net/results/e5d93d3c92a66fd5e5a4091af8d1aa413d38290b |     
     sparc64 |          xapp_xfindproxy-1.0.4 | NOK | http://autobuild.buildroot.net/results/706c437caa4157dd823b4b99927ca90b02be6268 |     
      x86_64 |          xapp_xfindproxy-1.0.4 | NOK | http://autobuild.buildroot.net/results/4b21400c36e8ba7a8222f9da962f79e42c6146d3 |     
     riscv32 |          xapp_xfindproxy-1.0.4 | NOK | http://autobuild.buildroot.net/results/894b63f0858cb42622e0f847e8b5197e8dfb6c19 |     
         sh4 |          xapp_xfindproxy-1.0.4 | NOK | http://autobuild.buildroot.net/results/ba61339e2b63e300cc77370e385fff0d68d5bdd3 |     
 powerpc64le |                      zsh-5.6.2 | NOK | http://autobuild.buildroot.net/results/19389ab12ae82743c587ca76cded9461d140ad52 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/0c5fb0f083b3f12baf6532dc56d237b1cbab8d9e |     
      mipsel |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/856a264ee46563246c6dbd4123195ac28f9f13c2 |     


-- 
http://autobuild.buildroot.net
