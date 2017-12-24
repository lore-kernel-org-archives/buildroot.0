From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Dec 2017 08:00:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-23
Message-ID: <20171224070010.58DF22070B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-23
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 228 |  61 |   6 | 295 |
   2017.08.x |  22 |   3 |   0 |  25 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         host-cryptsetup-2.0.0 | 40
                    brltty-5.5 | 9 
         host-ti-cgt-pru-2.1.4 | 2 
             libostree-2017.15 | 2 
                  cc-tool-0.26 | 1 
                  cppcms-1.0.5 | 1 
                  ffmpeg-3.4.1 | 1 
                  gqview-2.1.5 | 1 
              host-erlang-20.0 | 1 
             host-gauche-0.9.5 | 1 
host-mfgtools-b219fc219a35c... | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
            liburiparser-0.8.1 | 1 
make[2]: *** [libtests/buil... | 1 
make[2]: *** [Makefile:71: ... | 1 
                 mesa3d-17.3.1 | 1 
                    php-7.1.12 | 1 
            python-pyqt-4.11.3 | 1 


Detail of failures
------------------

    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/d47c3006ba04e561e6cf2da93e77eac9d77ac625 |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/6b45c99522a3b2f815946b572a26e61f1149da62 |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/59d2d3d71ea9d61b66bec3239e462705ae614e1f |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/698b114a01dad480f1088efa4bc751e8f4c4b826 |     
      xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/a2dad2c5f00a3c9a37a7718a827bb521a4efebe2 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/722ad0854f71da908fac85c478343321cc395dc1 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/4aac2ed466bacce4332331c2344db2084af7ab54 |     
        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/5e6bd37fd2d5a1440157c796b2dabdeb83a42245 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/03b2d3bc2890830481943839a0ad0664e1b0ad7c |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/76593addfa8458bc2acac36bd4f3003cbd1697c5 |     
         sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/5d25c9297380f49eab8199d55fe8313559876f60 | ORPH
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/60a11be4f2382cae2fa5f24500617362b4dfd6ed |     
   powerpc64 |                   gqview-2.1.5 | TIM | http://autobuild.buildroot.net/results/b492f6c90ee03c2812694a0f60b89c641e87223a |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/1d7b8653cae4010020d0d0d6724f4c66a86d617f |     
        m68k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/c081d2025a6a4c97a929af4960d5c3c0622e62de |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/8c138dc5b68bd371c1e9381c2965c9e4a9dabce3 |     
      xtensa |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/537f572be52087a48867151bef561676123c9c60 |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/3e0b19678f3fc605e98c98da1b765c2b87e37443 |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/c2901415345d94ef2135e460f4c78c21ae7ad09a |     
       nios2 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/38462d222f2a893d44de894c30dc1e53d09c377d |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/ecf5d87791e0255c3fce117447105db88749f796 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/c70cd0509d393ac0b253ba7e2d14ce9a44896f28 |     
   powerpc64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/5113953ad73b75d5f44f58acced5bdb70f565123 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/d901c4edecd3be200a8cb0cee80cc88363fd5c7a |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/40a33b2a4f2c4227b2bdc72b96399d52e2173b58 |     
       nios2 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/64a9b996a47a8449c33315886468281b4206729c |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/34a53b1bb8ed6c07ae62b950d6dbc04707f64f14 |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/8479ee3ba0c6e0634ba8e227275990e296fca50a |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/8b033539d20e90d21975eca859769ceb1182b942 |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/65330e6b1027112fe04fff1db8814a2e8f511da2 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/588cd6a3e34ef3ef7d3d1e547022643e8a43b972 |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/9175cbc220142342e920e51f8e125cbd215eb640 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/40e820b29cbcf10f92c9788a81005355a29ed8c3 |     
        m68k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/bc67255c92afeea2593ea920d1fac4772d7e8317 |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/6fdff283bb47eaeecf527bf2739d4c66d65b9e56 |     
        or1k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/2b607228688c9018567410e2da06cc8771bb4d15 |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/c771ddb92759c3ecca378621e273946188bd1855 |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/b0fb32332e9470434459b45894e07e18cae1aa19 |     
        or1k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/3839a54e67f6bdd7b9b0d5117458098b12f49b21 |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/cd0fb601aa91763c79cc5a73e396e4746ec3e2c9 |     
     sparc64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/a21257a7664fa95ab25fb52481f2127731a8243c |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/24a17329e7bb5d574053b7175bea47c04a8e0a2f |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/ba79c432f1ed5367d0352302fa1054831896018a |     
microblazeel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/af881522851151011ebadfb48a3a481671dc3d37 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/20615717b5bd84d50718ae150dc6e526c44c30a3 |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/a09160017f3a206e92d3f55287c05b088ae55c15 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/f280e329f6dd2c695dafc283cf5067079d5323bf |     
microblazeel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/31acfdfa2ec999d3f708389911db8fb26ed3b69d |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/6619c58f9e027f7094ac41728c4ded953e9de693 |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/d15c4117e0e286868b41d39db2e629136ff0cc9e |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/bb31f546b16f34bd6948782bcf39874fe2b31981 |     
        i686 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/1d4bb75168eba509d34b1c0b491375b15474c357 |     
        mips |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/610fa00a18298488ea63db578aa14224dcc11a81 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/3f8a6613be0a1b3e5d30204f691fe33f8bf774f9 |     
      x86_64 |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/0b6336c3ebb2540fef592c68a26c8f1362e842c9 |     
         arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/7c2bbbe13ab315684f3502afd96958a76879b1d5 |     
         arm |          host-ti-cgt-pru-2.1.4 | TIM | http://autobuild.buildroot.net/results/6458f64954e6622ba6251bead5ee945ca4524adc |     
         arm |          host-ti-cgt-pru-2.1.4 | TIM | http://autobuild.buildroot.net/results/48200a9b8a79c1b429ae69ccbd71a558accf2007 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/43f562f3ac610ad1ab5b140cf3be436c7d65fb43 |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/407e2c9805e9ca065194d7cb80f24a032ed7d804 |     
     powerpc |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/f2405a97818a82628b5b24c8c4ed576f35c6e4a5 |     
     powerpc |             liburiparser-0.8.1 | TIM | http://autobuild.buildroot.net/results/e7816d6a15d2a96ca9a401e95955c75d54e7d6da |     
      x86_64 | make[2]: *** [libtests/buil... | TIM | http://autobuild.buildroot.net/results/fded34f8e5da52737f4c40107e28ad77a223d64b |     
      x86_64 | make[2]: *** [Makefile:71: ... | TIM | http://autobuild.buildroot.net/results/52f9379d98a1826e1d0faa60ba89a8d5ac09895e |     
     powerpc |                  mesa3d-17.3.1 | NOK | http://autobuild.buildroot.net/results/57a8225e7e5b6405eb15dc8068f4c7212f048c37 |     
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/aa46c3f744e6414857cd4e313899dd7a04c6c3be | ORPH
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/a8a640f296d17cba74f4f6b496da21282452c60e |     

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

                 host-icu-59.1 | 1 
                 libcue-v1.4.0 | 1 
              wireshark-2.2.10 | 1 


Detail of failures
------------------

        i586 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/a0c0c3c6958ae7aeb5b51a3203f8952ec63b8891 | ORPH
         sh4 |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/51d585cbf387fb514d04304aa0ea38324a02362e | ORPH
     sparc64 |               wireshark-2.2.10 | NOK | http://autobuild.buildroot.net/results/2c7aaca61f36ca324bade38f514fffd0960e26a6 | ORPH


-- 
http://autobuild.buildroot.net
