From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  9 Sep 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-08
Message-ID: <20150909063015.5E83D100A52@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-08
===============================

        success : 244
       failures : 84 
       timeouts : 1  
          TOTAL : 329

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 23
libyuv-1ebf86795cb213a37f06... | 8 
              strongswan-5.3.3 | 5 
                mongrel2-1.9.2 | 4 
libbroadvoice-f65b0f50c8c76... | 4 
                     gdb-7.9.1 | 2 
canfestival-7740ac6fdedc23e... | 2 
                 qt5base-5.5.0 | 2 
               libplayer-2.0.1 | 2 
                   dhrystone-2 | 2 
                  mono-4.0.2.5 | 2 
           libpciaccess-0.13.4 | 1 
                 libhid-0.2.16 | 1 
               valgrind-3.10.1 | 1 
             ebtables-2.0.10-4 | 1 
          binutils-arc-2015.06 | 1 
                   bdwgc-7.4.2 | 1 
             lttng-tools-2.6.0 | 1 
                minidlna-1.1.4 | 1 
                      pv-1.5.7 | 1 
                busybox-1.23.2 | 1 
                     rpm-5.2.0 | 1 
                  boost-1.58.0 | 1 
                  connman-1.29 | 1 
                openntpd-5.7p4 | 1 
                  fbterm-1.7.0 | 1 
             ipsec-tools-0.8.2 | 1 
                    ustr-1.0.4 | 1 
                           all | 1 
                   lite-0.8.10 | 1 
       directfb-examples-1.6.0 | 1 
                      qt-4.8.7 | 1 
                    vtun-3.0.3 | 1 
           qt5multimedia-5.5.0 | 1 
                 setools-3.3.8 | 1 
              libethumb-1.7.10 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  guile-2.0.11 | 1 
              drbd-utils-8.9.1 | 1 
             alsa-utils-1.0.29 | 1 

Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/9389fde5f1a6d037cddb612483ebb845b47958d4/
        i686 |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/3ba111b195e8d6fa2f35c96f45db40c15729a8d7/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/6cf8f0f77e0c5ef5cdd5c207772a873d9a21cfc1/
         arc |           binutils-arc-2015.06 | NOK | http://autobuild.buildroot.net/results/b1674d115e0d054e7bc474f7a93da42f6b21c686/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/7a1f2a4d25863b289adc709e461094bea27ddb3f/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5e9518ff071f41061d30834b0efa41b88d81f4be/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/7eed7bcad32dd60972873e494c7a65a12b9d4722/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/cb6d40efc8b6b0c231a9987a442729c520e8a6d8/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/72bd4f131f08945828607e4d3dd82242d8a99112/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/e92635bffc9ebec113070deb03398500e39bdc1a/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/83746314990f6ab76d5b1904a2c74b1cf17c4f27/
     powerpc |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/c057a5d59bece021e0e5fdcba9f4514953c26e96/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/7203c31e526e15ae941efe05f55291dd0570a0b7/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/9279c679b5f3875ac16b0979041bac822ab23477/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/f14035d3600cee0adda94d30ae5a3f5a12f98ea9/
         arm |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/ec88cb7a1a2ddf5dfaf8f688349ecd9913cca962/
        i686 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/c7588fd9edbd5e286799f17a8cf06f300dfe0544/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/ddf36285db2b939a0a6b05fcafca1f3cd71328fb/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/9cb8644c097c9fac8dcc42104e23964a09961dd7/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/9f6914fa275c538a10503a2fa65f43fa33aaeaf1/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f2dab7322074f50f4efd8faa8d4759fa4c0d0101/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/d747ed14b2bf9b44798e4a5e0492936c991a5615/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/2e8a8b465fd702fa4be20c6fef9b182911e04d7e/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e9b6b910f87da3d5dc9dd9c3acdff2046e62aaed/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/ca2f0648a33391e0aa532b16a3d7a035112caf94/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e840ef07db9983daea8e512a4f91191e21c71325/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/fb32371824ede4afb7d0d774a255d0465c848889/
        mips |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/ef198138f214adb1a3637d89129a0eaf66cafa9b/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/21c248ad20fa952c66591d9df504377cb1294e4f/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/3cb201612b8cc32015d0da12b5ec1b40c5fb860e/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/58acc366f5beee1979a74647916178fb3b8aa525/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/cb851d3a8e8e227b423a2fa5defa5fed8944cb12/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/7f7d283dde56bf802da8aa26e12f5d6aad62d85d/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/980ef509d0108ac7bc3e9fe9fc9ae5fa854a9def/
         sh4 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/cdb062af84d5acc6667f89579ac5a264331b4a55/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/abec8d76eb7b90c6f7deafe3d7857886feda5e85/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b9fa533770ac6f38a8803e2245e81ef624a9c88e/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/54386cd0ba04a029d75f6735a584702dd9c17f7e/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/3738c8de1c319f168f002d9767d2e9e4a04e15e2/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e05a34f5fb5c6aaaf0574b3af7c30bc024547610/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1053cc8202b4c99141b0711a4b8648c16bc14976/
        sh4a |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/6718fa00b649a6086189960717997fca66f4f36a/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/5b5c5f9f2572595a2fbf54947c44132c6c9792d9/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/613ad154d4b019c33e17ebe88176af52db6fbdc7/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/cc450421e7f3a6c8d90a620c70935f88a0e266ff/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/382c00eb29a7765d907aad6a66ce63aa131369c8/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/c621dc089cdaa325b85beb24c1c881991bfe73ad/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/2483557016e464095c3b43981b9e8c92dbdf4679/
         arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/1eb99d5c71ca05c5c55dd2a5224a0b127f02e2ca/
         arm |            libpciaccess-0.13.4 | NOK | http://autobuild.buildroot.net/results/0bf803654e7298d5cd0b31fc55b1babdcd2f8765/
         arm |                libplayer-2.0.1 | NOK | http://autobuild.buildroot.net/results/fd38f5630dac74b4eb7b650d4cd3f269c779c71f/
         arm |                libplayer-2.0.1 | NOK | http://autobuild.buildroot.net/results/0319842cdec7785080c9ad5992616057ddc8ac6e/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/67eaaab06a7ba854da5d9cc772722c50bba20455/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/412bb8a5998f1d77d64122ee27fd511c5ff02b1d/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/5cdd0fc2edb0c80d8fd47332d566a0657fd0915c/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/0f1e0a76229950da40e38b75084839748cc7922d/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/0ff20f96764100a8d12906bca99f000f97df6447/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/752809999fae0e3ddfa1d65b5beec842aec7f61e/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/e5b1795bbbafc21fa07ebc1667cdb91df2ea91bf/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/15703e70bf75187d3fb9cd641e81f980b3aae7b7/
        bfin |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/52dddc46e720833ce04067144e594bf5a358d77d/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/8ba461609fdd392acab7cb6094357449626499b9/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/2aecf90f95574a0a25d62c496ad5f7369da7fcbe/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/a40ea0b5564fa2010280ff89b4fde47477a78f33/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/e8b644554c5e92355a322a009ecd0e0064451af8/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/ae6968d1c38a589c6850347736b49207a8f55a1a/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/bdc717314b3af7b4c81f605a8d02c2483bcb3f57/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/b862e06b9fce35fb8deefc0d96c3edc8b0a6d601/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/5ac5e22d827bbd18dff964c59ec3437807ae0fc3/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/cfbebda723d8db39d2659d089cc6097d0e80671b/
       sparc |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/9ce8dc60504fff9210cd6af24a135dd05c912b6e/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/899bd19d2dc18de6590dde765aa162418d0c9edf/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/2f462377b5021ecfba7063cee6a460f3f0c50c1e/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/2de054e8c4d042346143620c2792781e2001fba0/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/f0b56687d9cd70950dc2aa4612abff6cab32ff89/
     powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/3d45e32c7234e7d2d44474455036ab924d7a5cdb/
        i686 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f3b05cf571becfbf62fea3086edbb3bc640b71e6/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/b32dfd121e4e4fbbffd4db169791723e5a2cbd44/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/9d3546ba31591ac92af706ae31e02ed4a465e53b/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/781574c313639c92e4b6e889fb61c92f618ef704/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/b2be11f8d432a7be23c8b84eca5b20d0df2cce6e/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/32efe096562751a42638186b03d0e50c6aff5a46/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/6cf01cbc794c7efeb5739d4ce577813fd1e9cf40/
         arm |                valgrind-3.10.1 | NOK | http://autobuild.buildroot.net/results/7b048ba58918f0a08498c61327fcf35a85a84837/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/eb9b9d5dd1776b680b2f41d24a7f2c1f73f125b6/


-- 
http://autobuild.buildroot.net
