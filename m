From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Mar 2017 08:28:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-26
Message-ID: <20170327062832.1606A207F6@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-26
================================

      successes : 113
       failures : 61 
       timeouts : 0  
          TOTAL : 174

Classification of failures by reason
====================================

                    lz4-v1.7.5 | 26
               host-lz4-v1.7.5 | 18
           uboot-tools-2017.03 | 4 
                 xenomai-3.0.3 | 4 
kvm-unit-tests-5731572b2ac2... | 1 
                libepoxy-1.4.1 | 1 
                 mplayer-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                    qemu-2.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                    sdl2-2.0.5 | 1 
                 sudo-1.8.19p2 | 1 
            xenomai-legal-info | 1 


Detail of failures
===================

         arm |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/68a933bc70086b70cff3bd42c3365d44acfc9a59 |     
     sparc64 |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/9904f95a4e7862cd96f1d866369dceb30b309998 |     
    mips64el |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/5e3130eb3802f4664fff0a5327d1072034accf7d |     
         arm |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/38cf6d0a3932503bb5979c25174357abba23735a |     
      xtensa |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/1cc4c8e24730049a00c0dfc56ea009a93116939e |     
         arm |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/9014a7114049214c2b2923aea8f36a0b2fb637fc |     
         arm |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/6bec0d5e6d36858d80879ee5c97a805e987e4a74 |     
    mips64el |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/33ff0a71ef9633431e2ac21b3c90838eec5c3cb9 |     
      xtensa |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/4ef9d2d3a7efa5b5862db681bbd7dccac831e3d3 |     
        i686 |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/dc58d77e1130600e9f2ac0d3e1318de15135f28b |     
        bfin |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/2744b6c077bd0aab426eceacf6e7a91c89ee6024 |     
         arm |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/93f0e16c5cd026240bd6ebd547c4f864eba6d71e |     
         arm |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/52ee437259a7d32b891a273dc31b96ae0e05ca87 |     
         arm |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/5af42f3786f157ba324b3e0d576352022eea42a2 |     
   powerpc64 |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/ad888e7a562fcaccd908dba226492f78387d1248 |     
    mips64el |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/f6d945211d67b688c8fe1cdace523c041a03e4a8 |     
        or1k |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/739ff4edac6d97efd67501f45d67f7d48b12c2ce |     
         arm |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/42151cdae24325ada7a8fe08d33b3e30d15b9be9 |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/011023fe6f023fab576a1da0c6b688f6c66ad192 |     
        i686 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/d7493d014ff62f6de97dc87dc42104b0cb99f3ff |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/1cf2f34606f871364752946e7dfb1be3a71b6d42 |     
    mips64el |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/98df1e21828aefb91e8dd0f629189f8d688b2d3e |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/f7dd6d96d9f503ef1b4f922789e9ba9680d4b78c |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/26efcd8f0c88d77f8d77a865e09239fc3331dc06 |     
         arc |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/189b69edbd775111d0778b8805bec1dc08463870 |     
    mips64el |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/951b0b3cf5ca11d4156648794bcfe28d4605b313 |     
      x86_64 |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/9b38d74a6bdc25705f0811039196f2f8fc81f2a2 |     
        m68k |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/92653cd11e497961098eadd6217c2321e5f9fdda |     
      x86_64 |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/2a578a9c462463fde802c999156723494fe1b14d |     
     sparc64 |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/18294b3de006237cd1cafec921efc0232db9e597 |     
       nios2 |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/0145796aa2893e6e5422bcfe748eb872e0acfed3 |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/36e7a6110226b4650d244f95901b9e94165961da |     
         arc |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/95206267fff6f46429cd28b4183e637f52eaa332 |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/4af62b1467d746da8ba50d80ddb7d7bfb520f349 |     
        sh4a |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/6f4b915906fc88e6a5e9516ae6ec3b713284bd63 |     
         arc |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/7685115d5e7cd244d9abfe3457f9483d9566edfc |     
    mips64el |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/24094730fc79453764a4cb815930e378242308b1 |     
        sh4a |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/89a259272d9d31e75775a499889c0dc3818de259 |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/35f29a99a1bc53f647acbe0c0fb01b1c6bcff5cf |     
    mips64el |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/18882da9029d45be5c50bc9947f8894f0d315dce |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/d0eaeb9e30a95fcf4f0682c0c239fc22108629d6 |     
      x86_64 |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/e276987f901da98b1fa703d2ec576de01cccbf72 |     
        sh4a |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/2fd55eb3b6308420898dfd401d442bf9f9002c1e |     
        mips |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/087dba9b718e9039292321a952347036199d00eb |     
     powerpc |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/644abf637dc1153bd77c1de539a950940ef1f05d |     
     powerpc |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/b39e18e58b2e25d2cdacba7550f1e93e399cf4b2 |     
 powerpc64le |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d2a0f749fc0abe6943771a03f5328f536749afb7 |     
       nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/f3f11274f67ac30513c6572efc0281295bbb86c2 | ORPH
      x86_64 |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/c299f22f3bd608353b6e4097fdeab4bb0a181460 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/c078f575ddf62062e6b44005505f3814d337dc0b |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/c849815372e262c5a814bf80622bd9e04f08240b |     
         arm |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/30a76190428f902f03bcf54ba9f1f4f4377c6fc9 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/ba1804df504270f6179462b5e076ef23227cd046 | ORPH
     aarch64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/3ed8c4062794e95c6746a6a5ce70b87687034984 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/15a0bf6fbb18902c9efae9211f00a3b1931cbe35 | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/1e1cc32b4a3d71b6afd5ad5934ea06db6f5b6aa7 | ORPH
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/cdcf030ea452159462099712976b41e0262af7c6 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/bffdf8a0f7b88fc3e196e7fe243c32187c88865a |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/03e45f57fff4310f9eedbedd1b8cafabacca7b04 |     
        bfin |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/69958e3e7e479ea98f0930707b82091aa8958e64 |     
         arm |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/fea8abce8d4d6e51d62ec6a4b8f812c830b4b505 |     

-- 
http://autobuild.buildroot.net
