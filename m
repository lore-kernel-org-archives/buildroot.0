From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Apr 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-23
Message-ID: <20150424063015.83CB7101238@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-23
===============================

        success : 150
       failures : 131
       timeouts : 4  
          TOTAL : 285

Classification of failures by reason
====================================

  toolchain-external-undefined | 47
                libtirpc-0.2.4 | 33
            python-pyqt-4.11.3 | 7 
libubox-5a0bbefc8fa44044625... | 6 
                  dhcpcd-6.8.1 | 6 
                numactl-2.0.10 | 2 
              postgresql-9.4.1 | 2 
freerdp-770c67d340d5f0a7b48... | 2 
                 cdrkit-1.1.11 | 2 
                    qpdf-5.1.2 | 2 
           libfreeimage-3.17.0 | 1 
         network-manager-1.0.0 | 1 
                 python3-3.4.2 | 1 
                     php-5.6.8 | 1 
                       unknown | 1 
                   perl-5.20.2 | 1 
softether-18b120e5f747a84d2... | 1 
                 rsyslog-8.9.0 | 1 
                libcurl-7.42.0 | 1 
                 clapack-3.2.1 | 1 
                  boost-1.57.0 | 1 
                    webp-0.4.3 | 1 
                     vlc-2.2.1 | 1 
       gst-plugins-bad-0.10.23 | 1 
                host-gdb-7.8.2 | 1 
                  hwloc-1.10.1 | 1 
                ipmiutil-2.9.5 | 1 
              strongswan-5.3.0 | 1 
make: *** [network-manager-... | 1 
      host-gdb-arc-2014.12-gdb | 1 
                minidlna-1.1.4 | 1 
                  snmppp-3.3.4 | 1 
             armadillo-4.000.4 | 1 
               mongrel2-v1.9.1 | 1 
                tinyxml2-2.2.0 | 1 
        host-util-linux-2.26.1 | 1 

Detail of failures
===================

         arc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/98a2fbcc163e7df7829fced8f66a6a13f655c44a/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/ed0b942644852a1ec005a6895e03dfbd4141cc05/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/1e9b15273454935723838ba7ee6e8fdd3443df6b/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/f248988cc8394f2f6bf3ba19a12717d0b77e19f8/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/a7780bcc8eeae122b9ccb553a17e682645cd4dc2/
microblazeel |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/539bfeeb76219117514d42bf3334abcd64ba3592/
         arm |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/3e77855f6f739ceeaeea52ea153197496a08bd6a/
         arm |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/3f147cee8a02c16837570c863e9c2decb174508f/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/a070025f2094de9bc36e9fc1318925045f528d95/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/7c3b50884ecbb87736d8cde54d767c5cd59d0640/
         arc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/58496777e1047ad6f4aa1654a7e5c9e5eaae651e/
        sh4a | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/8b85a60a13a011c7b4a6c45498f2bda3b7bb19b7/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/7bcd5e571ad82956672a2c37f84a922f35bc3ad5/
        i686 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/2237369f8f29c7d85679fc700cbd9f5d2ba5c128/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/c0ac9d2dffc1fc26d884bd82b83a89c39c4f6400/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ade1dc83dcb87b05ef783c864d58073fcbe05d3e/
         arm |         host-util-linux-2.26.1 | TIM | http://autobuild.buildroot.net/results/14c65128d875503782c17284222d03d3cf1c952b/
         arm |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/8aed34bcd848f0ab78e6491210245336dd614c76/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/9457cfc5c4e25e7c6fb91796e5beb12659147c9a/
      x86_64 |                 libcurl-7.42.0 | NOK | http://autobuild.buildroot.net/results/a3f00ec4ae8469f4ca732529b0a8a9aac84e28f1/
        bfin |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/a786eb526bb7bcbf21e5b04040616238f9f094b7/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/6ee35cb467dfc8f83ac7a71e7c36d93b5e4ad087/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/bac61492e312338ba6f146b37ea0992ed4176df6/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/3819e97c099ac0420ed46348c003ab5e34b74232/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/88defb351500fe3228603af047bb9bd86f19c3c9/
      x86_64 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/d83c2e6d736d1edcc672ed9708cf451b657e6e11/
    mips64el |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/3a2c21b1089b25c290ace609ced4661292ebe1e4/
        i686 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/a1a20fd93727a8facbde036837ca4c0953a04123/
        i686 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/33d84fe1c01fcbc28f4f8d543ef83476a057c9e5/
     powerpc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/0ad8c9e331190f72280c3a1e3cd8d42728f818de/
        i686 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/326462a666cd47de2b3069769cb3fa5b6efd210c/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/6db5014692ea4092912a66aea82af5c3108e1235/
        sh4a |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/70f1dc21e48dda89b1d0dc0f9b76afb5f1c96193/
      x86_64 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/b75131a772cf68701c719a54d61df23dd0556aef/
        i686 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/e91770c9c59a84e74857b2adc86f5a401df236e2/
     powerpc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/c4565a169c42dca9b4ac3ee80a5943542604fec6/
      xtensa |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/f87a786935b790d6cff52f988ded021d368815ca/
     powerpc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/192ff1899e93cbf94d6e7b01f1d9dacb666801ed/
        i686 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/d078e7f50e4ab39826cb58ff9e2edf803123998b/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/be8be39cb2c73ef1b46903cba15a56f786790130/
         sh4 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/2e077d244ebe7b8b95a6cdaa91588eb84b863dc3/
         sh4 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/57e0491c789d1607525bd8d9fbca829367334114/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/79dbb9b4e58e5fe085847ce7314ea855d7cd8bb1/
     powerpc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/72b052406f99e521ca26ee444a01f4326491a734/
      xtensa |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/d1bf165973a0a01a973bfe882664f9e3d9093871/
    mips64el |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/3ade0c3883e371daa15b62d32b512c6a56683a09/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/fcc55625694dc27c25c19f0cba5df6a817864c85/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/8fc8306e445ab4f97e2692046ca5ae9c2837e9d9/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/9a4845ce6effcfc61213fea2b9893362e76168c1/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/58646a15999e77bede4070f5a6d5b5728b77bfcb/
     powerpc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/e1b34f09a3ed038aba8cb3d6c0bad857f56918db/
      x86_64 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/fe9cbe860f638b837c2d4fbcded9079d504078f6/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/401dd18e2a88474900fefd5db5911ca7085d7684/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/d6b4ff1b12bb8de63375ae5daed69453473ff2af/
         sh4 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/0157fa48ca822ad9016a53f837545b9aa371d011/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/ac0d05488f67753cd65132de42f2c213af7992bf/
         sh4 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/06475bc08da8247b5b54067e48a3ecdacbad78ee/
        i686 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/e16e4f5c01c19cce98288b2f42b9a6279640918f/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/c360403c04bb7b64f40da2fca06b11e8f5dc2819/
      mipsel | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/bb6e77e4413e211d10896b89260d2487ec3c5a2b/
        i686 | make: *** [network-manager-... | NOK | http://autobuild.buildroot.net/results/4b9826f540b8da43c0434769ad9485529cf762e6/
     powerpc |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/39a68337fa71f4db68452d00bebe18a572e190e1/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/33f35a5625fef018ba015d069940dad8e8d8cb3a/
         arm |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/704bff70b73e77f552dc6b91732afefd846a1f50/
        i686 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/ae95b31567b3b1f79938915b622c5ae407afc50a/
    mips64el |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/375a947e5402c6ef4d80e97ba8fd9831bf19d156/
    mips64el |                    perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/9002bff14306aa87016a2aa686824426b18c7aca/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/03104f5c8833d3cee4e2430bdad8cf61d4d088fb/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/dcaedd4bd955395b277d56554646abbfafe5d181/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/2f5658f8599ccd139552cb4fa30192da31e1f4fb/
    mips64el |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/9bbe417ac45ad9449ad1c22bbd3ed87f529c58cd/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/dfaee421ffad04f0745db45658a33633fad1cc3b/
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/ce89ad1ca6aec9f7bb5549301bf4c0dcba9e0e37/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/2ad45f7cc3d8018cbd782e57779dc88e3e85c118/
    mips64el |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/76cbe92dbb01778a8dd16a3f34be166a02d86ae5/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/cf7de6cb5885ea740229ca61b2be9c86a2954c35/
    mips64el |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/ea0c844ef34696fc205db67a045ba72ec9a58174/
      xtensa |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/e3a71f5d05a3e176a9e641e758b1ba64c9560991/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/10e90c7c93aec92f0e13de50ecc861d56750dc8c/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/69c4522852e0b634723aaacd57f192db7ad6aa58/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/ae4f74ac2bcd478bb8370dcd6d503cb23c4d950d/
      xtensa |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/8ba3851a5e889c4053fc0fcd73ca66e18fd2fdd8/
    mips64el | softether-18b120e5f747a84d2... | TIM | http://autobuild.buildroot.net/results/66b8ac5cb708b083f23f592b7c42ec099f6f0172/
microblazeel |               strongswan-5.3.0 | NOK | http://autobuild.buildroot.net/results/bae380c2192c48b7cbaeb598fb6d6ef43352e70c/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/1a308a0a3ac0ae352e4382fe8d1b98400dcec636/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/35462a050df2a3c0176684f2ab5aef7c29378a66/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/aea4af116d25863f8cae7150da929e9089197f31/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c7e22fae61394bc3013601f84c6144a84a0f1020/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8b28afc2b411886208fca502d18455a44606c92e/
      x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a5c7732e65786fd5d18ed3a2b89b2f80996f90f9/
      mipsel |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/257643da6a4cf05f5ebc5b7b31073c30755bde10/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ed6275f0a964be2d98b88a54ada7ba88ef5a1dbc/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/2a86733308da2af051620aa8cbcc5f50ff7dc812/
        i486 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/531335f56a416a136c2cca1aa43dc5a182d495ba/
      mipsel |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/12817067480c4114c1e504a79fd484d8dfe602af/
      mipsel |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/2099c0ee949c5152db08a699786e1287b1ff807f/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ff0bd14fe55683d06a550326a003f44a30f6caf0/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/85221cb2d7418f8642c4f1f9bb6519141c23d34c/
        i486 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8bd7c1e9f8a9bf1710b7b80cc7ba9f1000c0b3cd/
        i486 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c99e9490ab01ae162eab384f4580b1bd8ce36a96/
      x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f5503eb650f34baffe66284f9710470452a595e7/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f3b339522b15543221d68ad1c4974cf279d438b0/
      mipsel |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/1195fefd461479d9b854892cebaeba37fd2d2f21/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/efb8d752a31257ead4a4cb0a89a71231bb3d3dca/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b141c99e52f87567696e4cad5066360f55bf1e7a/
      x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/62e48f1fd031b15958a62d1b5e06818546a6149c/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/fd7f10ec462d4c801ad3756f90bd1d8d92f84ef3/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/38f0a238f472a9e0325deaa0ad73a4c0b4ac7b4b/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/45d25aff2ace52f84dbc687747a946e471f88be3/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/4a3df40488226fef4bd05d02fb40253e73cb990b/
      x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b571ea6edb4513b2508f59230e7c03d7ec93afb0/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/263bf6f72016b265e4c3d522ce914ced6c4986ef/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ea2fc09f494bd491a0ef985d1e1e7dc093fa98ab/
        i486 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f3a3d965314839db2081d2a850b88f8025d6af6b/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/18bbb295ac916f143b9d0558f5f59a214075bd83/
      x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/834c0d89a16d62d29be60d6f4116405403018ba1/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/6ca85749d7a55a74c39bd95925da5e0eea948d6a/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d98e2023bec1d9b0e3d9e152c3b6e26c8141e24f/
        i486 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/60f30ff164e1f3788a1110e3635e5155ec6e55ee/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/736bddb8a0e4de3a6af38c013c24b7e2f4d09679/
      x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/49e0f2fd2bc3814b9c5c4a652da76f01f5e417c2/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f80f13b91937c4bc99ffc78f7fdf2b86fec895e7/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9d8c8bbd753ee8a581a4860b87a455ac36b3a084/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e50e1bd596ad54e1b95692022b9261e0803b99e2/
      mipsel |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/69d8ad8089fe34c2c78a3af0942fe18dbd9b480f/
      x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c809ccd52e44bb023e38e0bead5613d4189ea5bb/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/137228afaed2540187c27f63d837d26de1df5190/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d3241d5bc4f8fc486beeb584bf15d8e4d6d0032c/
        i486 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/48f546feb56b8cecd92639d6c650e30567bed240/
      mipsel |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/96c69fff0291e2a15b8f6c9bcc1008c73ffb2e3e/
        i486 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a2adbb192b29444cde1992eeb0aa2b02b0cf347e/
      x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/10eb3bdf0281768d49b84eb3e7acd8ed6f5ba53e/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/ed71cddb7b5ae3e4ccbf00183cbd846bfeb800b4/
         arm |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/8f05242257a0ed059d5258c4a83ab26095516917/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/e2e627dd6fdfa58ee07fd3aaca43e1731cc8b6e4/


-- 
http://autobuild.buildroot.net
