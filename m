From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Nov 2016 08:30:38 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-31
Message-ID: <20161101073038.5BFF2102D7B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-31
================================

      successes : 178
       failures : 84 
       timeouts : 2  
          TOTAL : 264

Classification of failures by reason
====================================

                     vdr-2.3.1 | 10
                    owfs-3.1p1 | 8 
net-tools-3f170bff115303e92... | 7 
tvheadend-50a370707aedf5c12... | 4 
              bridge-utils-1.6 | 3 
kvm-unit-tests-5731572b2ac2... | 3 
                   ser2net-3.0 | 3 
               trousers-0.3.13 | 3 
                     xen-4.7.0 | 3 
                  cppcms-1.0.5 | 2 
                  lcdapi-v0.10 | 2 
          libmicrohttpd-0.9.50 | 2 
          motion-release-4.0.1 | 2 
                    mpv-0.20.0 | 2 
                 openssh-7.3p1 | 2 
                privoxy-3.0.26 | 2 
             rabbitmq-c-v0.8.0 | 2 
                 weston-1.12.0 | 2 
                   assimp-v3.2 | 1 
                benejson-0.9.7 | 1 
             berkeleydb-5.3.28 | 1 
                    cups-2.1.4 | 1 
                  guile-2.0.13 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
                libmpeg2-0.5.1 | 1 
                 libnss-3.27.1 | 1 
make[1]: *** Waiting for un... | 1 
                    mosh-1.2.6 | 1 
                    mpfr-3.1.5 | 1 
                    ola-0.10.2 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                   slang-2.3.0 | 1 
                  squid-3.5.22 | 1 
                  stunnel-5.36 | 1 
                 synergy-1.3.1 | 1 
                       unknown | 1 
                upmpdcli-1.2.8 | 1 
            xapp_sessreg-1.1.0 | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/299d2597d8d9dcad2035a6cf9532bc65589d3aa1
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/be5ed617d92cc2812fe6e9d8313401c18e7043c8
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/27fc1429646416baf3e3dcd4f654bb9a5d9bb0e2
      x86_64 |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/1a3f1bc7d7bef7d86ae1dfa34c34de43b57534e6
      x86_64 |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/eed30811604f9541953b048ae0fae3c4cbf3a9f1
      x86_64 |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/bff5767fc7e821a7674ee022111db84e4a9449d0
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/fdd4cdac3f95996af53d0a74bd9a107456c362f3
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/066bd938aca53392f6ed8cd1e0e63dd43d308227
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/0df17febc1c9c7f1dae2a1edfcfb37095156bea7
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/0106084aaeadf841580d4f0eaed6ac3a9ab7822d
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/f2464b964e97c14428d9b8ef35029c6c63f21429
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/832f135bfb78458b86ab2fdbaf99fd570fe7f538
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/74a7b67d30f514129ac99d3773ce15c8f8752728
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/1ed7f25f81b14b81a4a16a8b9a9892045d0cfb0c
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/ae3a06174300922ff7a8b42fa75cefbd42e8b421
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/d8376b4c32d2de98c64097d7cb0296a8490b4acb
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/f3633d6d942f2cc282a1b8513d9765bfd0ff7b98
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/614868dabbce7439487809bb6f2c3046a5b0ad4c
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/c6104b18cf13f16f9d1af0bb71c11a8cf4ae0e72
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/cc64cb57bb618848d0f0ec9d15691101b70fb8a2
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/c363729e22b1eedc29e80115c5f20b6e75a0591b
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/ae96fedf0a1fa79dbb4eaa90358607989a470247
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/6d1d742bc6707d219ea2d3826b48d32d3da9c04e
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/a74642c3edc2832f845b4e896a05fe849b3d48b3
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/9e0f4ec2e7347a1ec76a1b0da02b2b7b532dd36c
         arm |           motion-release-4.0.1 | NOK | http://autobuild.buildroot.net/results/765a84f985944fdef840d3a4dea9645473607d73
         arm |           motion-release-4.0.1 | NOK | http://autobuild.buildroot.net/results/e6f3c020ebc34adbcd375ad2d946100ec68b043d
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/5ad9aa0c2a421619f2596b5b7a6cb55bf73a93ad
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/12a5db7647d00aed5ddb3d76356d11648734af22
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/dea81449399c4fed96ca8f4d8d219c6c9201a6b8
         sh4 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/bdc4d61d165e4b7aff3fcd0e9ea692a406f1793a
      xtensa | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/0a244f0b25d1845a3d8ab93b4d0530920bcd29bf
      mipsel | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/b7a6e06b72a7c0a99f2622f1ee93803cd35cd555
     powerpc | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/dc41b50ca1563ad11c843c6223ee74f168e7be4d
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/855a2fdfe7b3078a10e7e7c2ded417972be1bd16
      mipsel | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/287874ac736120ba39a0c7cccb1b35cf6d43446a
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/f69aba0b41ba86e73360cf15239c443081eef694
      x86_64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/26e37538a21a8a5dfc1e39b67985b5d6551921dd
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/39019edd8e548074783cb51b858b5a5757cedfdd
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/733087364e76c7d51ef5b47d754ac5333bebc473
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/6d11b44e0d0550be574b4f82dfb7a15444180b63
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/1a05ed6f36bea26a191f5ff4679b69ad8324fda0
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/5817a03c093bdbeba9efac35c3f5ad25e8d58555
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/f1d31511e291cecad68189743e70a21c65e68ed7
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/6d48fb003fb99194df7bc6a07f29619862fc2e84
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/cb8884a66d1d637a937a0886504756fc3bbb943f
     sparc64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/cbe186f20d23b41f6ced5e5df406b3661cd51202
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/14e1493231b8ddf9a6b582e5bb5fd2cb200a5e74
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/538eb8c07c7e946633ae88864f406fa8008acfc3
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/628671c46a092be589174054b2d1cb6d63e1d5a5
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d111e017b848d504ea57d6b3f56ff655e4e3ea47
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/236832ded2986c1d9503451ef949ee5246ab764e
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/53786f18f2be59e0184761df51efc6f8c6e8c85f
        sh4a |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/4e6072c1f4df9053fc9ccdc1d810e9a3dbdc4ecf
        sh4a |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/de9adec33a68e5e17588a62089d9c53c297d3375
        i686 |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/021d7b32c670eec500c5a4287d59887b276608d2
         sh4 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/6fab567d393104247e6bdabb715be0f11733646b
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/64c5288d99ed64c081a5eaf872a37338709eab20
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/3d82f6181fc786acdbf273d0e242401fbb2fa033
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/560e6cddb3f6402e03ecc0b1e4ffb464b9a885d5
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/babe7a0fdb072b4f6cbc561369b6f56607cca943
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/0e3ced4b6c81eb60df70f7f2bcc20a174b2bcb03
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/7bdadb6742bb18e57453231eae579d8dbd6adeda
        i686 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/0856d2e5035dc778749f6cab7d07dcb133fd1b2f
      xtensa | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/66174dfc99f91d65af505cc5831af8c6d5238b37
        sh4a | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/585e32e7ca70f21503312257563d92d95725a70c
     aarch64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/c1a011109259adf158a09834343765984bdd2f81
         arc |                        unknown | TIM | http://autobuild.buildroot.net/results/103c818c894f0ef0b91b3f810589cc780becdf26
         arm |                 upmpdcli-1.2.8 | NOK | http://autobuild.buildroot.net/results/328a10cb382b618391f62115c87209395e6c64f9
    mips64el |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/f6e8f5910f46e3fa277741c363d37d0e9a431a03
       nios2 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/d84861925049d66259d2747d94bcc0cc7cf58beb
       nios2 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/484011f6a56159a32dc7a2728afeee3f430bbbdd
         arm |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/254cdde6aa87e30fedb26781ee857ad7f14a4ed4
        i686 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/6a743a871f006782e29801aa842fb1f5441a74ad
     aarch64 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/58d51a7b28b063022f13997aa97b67a1cd116e54
    mips64el |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/80c597aad956b52ccab9b27db067e29217d2be40
         arc |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/1c45ed7e9d246a3305c50c28593d7c3110332ae6
      mipsel |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/f6090ee7c4d136c4afbbe192060ffb3e4282c08d
       sparc |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/e39a897cc70773991f729405809ca93c0099eaa7
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/b0afd0a4d84eccdc71a7ea1212fdb259cfbed0aa
        sh4a |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/d4bc27ce950f68d9b6a5adb286d2d8c96d9405ed
      x86_64 |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/b41a49b1f8f2c262552654961a37f8c922282849
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/5b69c123647ddd2c5065e2b7de04e8f305de067d
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/41d11f9a4e232b589aa8771296c164ca7e11deb3
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/73042faa42704fb7c26869a3b0d304371179709a
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/3a8ac89fefc1cacb665b0ffccb999b8bfc87226d

-- 
http://autobuild.buildroot.net
