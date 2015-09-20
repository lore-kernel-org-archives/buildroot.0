From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-19
Message-ID: <20150920063017.5E1E6101C6F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-19
===============================

        success : 222
       failures : 56 
       timeouts : 0  
          TOTAL : 278

Classification of failures by reason
====================================

            micropython-v1.4.5 | 19
libbroadvoice-f65b0f50c8c76... | 4 
             lttng-tools-2.6.0 | 2 
               iptables-1.4.21 | 2 
                collectd-5.5.0 | 1 
                  weston-1.8.0 | 1 
                   erlang-17.5 | 1 
              host-cmake-3.3.2 | 1 
                  gamin-0.1.10 | 1 
rpi-userland-b864a841e5a459... | 1 
                coreutils-8.24 | 1 
            libserial-0.6.0rc2 | 1 
canfestival-7740ac6fdedc23e... | 1 
                  connman-1.30 | 1 
               util-linux-2.27 | 1 
                busybox-1.23.2 | 1 
                    faifa-v0.1 | 1 
                  mono-4.0.2.5 | 1 
           host-openssl-1.0.2d | 1 
              drbd-utils-8.9.1 | 1 
               polarssl-1.2.14 | 1 
                libnspr-4.10.8 | 1 
               libupnpp-0.12.1 | 1 
                 dropwatch-1.4 | 1 
           qt5multimedia-5.5.0 | 1 
                  guile-2.0.11 | 1 
                directfb-1.7.7 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
           libfreeimage-3.17.0 | 1 
             bluez_utils-4.101 | 1 
             webkitgtk24-2.4.9 | 1 
                  tstools-1_11 | 1 
              libethumb-1.7.10 | 1 

Detail of failures
===================

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4d8997352ffb7d8ebab3d7607aeed1428aa544b3/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a312c68183d0efe378bc25ddd7ae27efbf368489/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/b5b9496c102df9d7fd856967e21728bb535db185/
      x86_64 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/4a90ccb19af3b378c2173a81541d08d9dbf2c78e/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/556ff0e024b715936031e687fa051ee6034560ef/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/77be3b2e21fd2a4b195fb52eee6d6586ff50e458/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/60c445190f855d18f4d90a19274271334f9866d1/
      x86_64 |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/4e0ed65b2e06f4ccadcad5b4302e6334667ecbdb/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/f1e555ec525943cfe5ee6d568383e045857e5ff9/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/701ee329da265cf15f7139bf8e1f61b90ce5886b/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/b0720cacca0bd9aac98814ba54f9949d1ad9a1a9/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/f1f8b1ae62b3b40288ffe15155c0b21303039fdf/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/9299bcef135f6b3b03b4d1f6fde2e7539b578ed7/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/4ebe827d4e362f6ccbc94706ff3ce81253cb93cd/
    mips64el |               host-cmake-3.3.2 | NOK | http://autobuild.buildroot.net/results/2bd81e2ecb09e64ccf9e5c35f1160a9b9e7bd079/
         arm |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/240a7c71de9aaac619743182e4c7532ec0a844db/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/d065ab10ec28f6da2dfcf5f4fbcc078cdcb557ef/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/741f9962b7d0fd582bb4d6f5e86e840ef1638b55/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/f8b77c6be6d22378a746a098bfc6ad06996f828c/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/4e5929ba555e3c2d95d0dcd51e5ccf6c85731920/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/a0e79c4030e7682ad50bc506247d22263fbcf95b/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/fe8e62856d82fb7a6035d243dddde8484950eb48/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/4203338303d32793549eedd21a231eaeac15df2e/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/bc0fcb39404ba0d51059ffc998092373d84a4162/
      x86_64 |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/c9a372327babfabcd0a202f93bc62d85b274e708/
       sparc |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/42db3f01941c24b3444c98e9e54492c7b4b432db/
      xtensa |                libupnpp-0.12.1 | NOK | http://autobuild.buildroot.net/results/66689008940acb8824fbfb6f43b80389ce90ebff/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/1f11d5d4cf19e5a1b1b2d854b34f804bd7543ba9/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/431902e95fd43374f62b2acab766275489d034e1/
         arc |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/d4a386fa3f3ed826da0c50c31bd5e99671fe6201/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/d21bdc389597d5f76c955b8e169c4eb30d596bc8/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/87cfa910b1f43a878784ab3208a9921a5ebecae4/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/fcb011950f1a641ea4855752f3b7873b2b646f30/
         sh4 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/c91967324a36349264e102aa3230181076d06c3b/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/5df00a696ff7e5b53e40f561176d90c23a4a36ab/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/a941a0fa6345309f3255556af652b417c7c46796/
         arm |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/388198dae8a3855345a09e3b5791e835993209a1/
        sh4a |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/de6cb00101d945cf58e92bb223913329246b307e/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/b2766b10b18070407f305728ad776588ac06630e/
         arc |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/a9e6fbdb3820b05433de74928ea3396b26ad1b2c/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/5bf8e1e5b605367858078b85617f9e329439f593/
         arm |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/75f912a5fa797e3d9ea4204d4a862c15c4f74e1a/
      xtensa |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/16563fb9fb7bf4878563b7d14dab5b6f97904224/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/78b7586751c038668902aa4862b8848a5c94c4ee/
         sh4 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/a570ffd7c22ce82784c2c4d54796d81b180e5a4e/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/1ff9269b41463d288c16d5b21529234757929eca/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/966be87623e12835887be5a70f57c2eb0d919b69/
         sh4 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/33ab763180b3488c72e589016f3476e8b961dd70/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/e227021145ccf7ddcaf8a8ef746ae25fb41a55dc/
         arm |                polarssl-1.2.14 | NOK | http://autobuild.buildroot.net/results/96d5849997e7b8eb81cc2ce4d93445590e6f9db6/
        i686 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/523a9224bec97ef3cc89e42cffc3f2893b0cebe6/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/7c1687d13b4912a771d0350c060aa9bab7e3a0b9/
         arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/15e869677c9a9e2b982061fd096e2e48b5195ea7/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/7e42e4c7171caef60098dce6df2f0fc7de5de7fa/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/f4fcf2935904e17359d5badf7aa038302d861615/
      x86_64 |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/7907fc3b6dfd1728e7f69f0f8791a49f8441a4e0/


-- 
http://autobuild.buildroot.net
