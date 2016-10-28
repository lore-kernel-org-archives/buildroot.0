From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 08:30:35 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-27
Message-ID: <20161028063035.1E352102A37@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-27
================================

      successes : 198
       failures : 105
       timeouts : 0  
          TOTAL : 303

Classification of failures by reason
====================================

                bellagio-0.9.3 | 33
                    ngrep-1.45 | 11
                    owfs-3.1p1 | 7 
                     vdr-2.3.1 | 5 
                   assimp-v3.2 | 4 
kvm-unit-tests-5731572b2ac2... | 4 
                    mpfr-3.1.5 | 4 
czmq-5205ec201e97c3a652c17e... | 3 
                     xen-4.7.0 | 3 
                  guile-2.0.13 | 2 
host-mfgtools-b219fc219a35c... | 2 
                    php-7.0.12 | 2 
             rabbitmq-c-v0.8.0 | 2 
         rabbitmq-server-3.6.1 | 2 
                collectd-5.5.2 | 1 
             fxload-2008_10_13 | 1 
                ipmiutil-2.9.9 | 1 
libasplib-f7219142e790a329b... | 1 
               libepoxy-v1.3.1 | 1 
                libmpeg2-0.5.1 | 1 
                 mesa3d-12.0.3 | 1 
net-tools-3f170bff115303e92... | 1 
         network-manager-1.4.2 | 1 
                 opencv-2.4.13 | 1 
                   perl-5.22.2 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    qemu-2.7.0 | 1 
qextserialport-ada321a9ee46... | 1 
qt5webkit-b35917bcb44d7f200... | 1 
                   slang-2.3.0 | 1 
                  squid-3.5.22 | 1 
                   strace-4.14 | 1 
               trousers-0.3.13 | 1 
                 weston-1.12.0 | 1 
                  xl2tp-v1.3.6 | 1 


Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ef3d3e5db6b64bb8620391f6332b625d087394bc
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5d6887eb410d951d9579490b7ea028c1632859a4
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5c78587375b74a5db86e5e462aa1366b52870295
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/df22bd066fde385cdbea9c0154eee90f808f5c40
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/37135ba0f58a2a7a8d4feffc3bd66004ad37361a
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/efbe157fd103a979cae91de2f6574c68199f9e48
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/a76c852ef11a0257e04c610c441c655f9e0490ae
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/384ebd46fa58c3fa663ffe1c40690417f00ad098
         arc |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/cb923d22a236d410624ea0ad4e96ca8802a1c29f
       nios2 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/8c727f7137f63bf8c8e3501b927b7db8c1ed5950
      xtensa |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/da78fb13298edd2b9e739d5b2a19fe69abdd3c48
        i686 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/17575c000c7976f416d2d50e70cd2268817b60b8
      x86_64 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/92d933e49f75e7886694535e1b42dedda13c1464
        m68k |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/335d371996b8517eb224dba4eea2a361366c463d
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/e3e8ef561c96213d2e683c3184c4010d50af1dc3
        m68k |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/58b86ad385f965e1ab89201e2dc5414f98bb38e5
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/d66ecbbf15961ea8ce6476585127b49bec37ad99
     aarch64 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/5a6c128c7adb037a6a55f611cb1b07b4b9367221
      mipsel |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/e91d1d132ade1f576fa521598aad32566033affb
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/46fc809f126db4428d402dc7e3d9ea23fc0c23f2
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/b554d50371f35d387f4241e64169ebef28f4c164
        i686 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/130226c5129eb58b06d2d6a68db4c73525d6758e
        i686 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/433829d39989172e691930e4cbba416ba2c74845
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/41b98211f911e58b35898c9713c82dda2cae3f79
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/f1d2017dfd7e0cdbd16b6f14b9747907641ae2c4
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/fe93ebb01a78e25a22a479a06105f2169d1afe1b
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/25864ff104beff41cfca0bd7b6df4d0a00e22a8a
        sh4a |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/e290f74e7307f0fdd4d8a890042cf9768771e19a
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/bad9a85d1fc49e2779660bfa0ca5ded1e5fca7c4
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/45477dd86222ce65edbc610583bd5ab19d766d8f
        i686 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/9079f5b6d6539a0c04cff8a8befcac4605eebe68
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/c21f0288d57fb1fc80177981d8cd967bf85ec338
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/a68907678d09b792bd306814a3db863d6cfd67b3
     powerpc |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/e4b090e831f291401ac7fcf327fec313c3c0ee80
        bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/2209956bc153c24f221e5497a92763479852740b
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/ff90bca7dff841a6f64f57cb323a35a50ead9a96
      x86_64 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/f0b90c940ca883b5c2710c62e61c5524318b40d5
         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/8c32562eca8fc18ccf763146a4aa1e0fbe9c5bbf
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/359270ef29b3c868b3f54e5e197ae5a30b64a2d2
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/7c83ca92d626119644ee4499d814832501fb6e68
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/0679dba95ba54bd4ab42e4d4e1010585a33fc599
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/62901df2a3eac3166f386ed20b1cf1692d2b9ac8
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/aa12779b359fa71f47b7aba3c3270b64519a53aa
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/386c3d77914588d1a4f2527127f7e89e3f926fd8
         arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/c8cbc4e5296af91be5fa8b17871bedf08b6a2697
         arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/fadabb38d8dde6f2be85fbc286b060e2f3e82f65
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/c076e98b9f067c676563b7c93793d30907bb9406
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/fc1cab2bb5a544cff5ff376e8f60ca39ad0a55c9
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/43d85cebd910c07e0d4eab6f094af20491549e72
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/a3658cc465314b5e03397865734f43cc305c626a
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/1b33eb32f7927e844ca1100c7869d891d774c206
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/1aaba12cbd58f42998a611e0fa3264952604f6ec
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/8a9bba85cfcec2c577eed5f6969421ef09c33a45
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/e6e2510a3aa74e9620065aac3f24a4902be1df23
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/5a2432d81bfa685efeb2172e1e337fa0eea5bcf2
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/2d47f1a55106d70230045a57808916d37fb612c0
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/826d738d6f5419b214a795c613cf5912fc1b1f90
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/a897003950081059ebfeb89fb8fb989aba00ea30
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/3882091d04987f68269f03522bf86650e1da8b30
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/832a74712c283aa58ddde8ec8e70ceaf0bad29d2
        sh4a |          network-manager-1.4.2 | NOK | http://autobuild.buildroot.net/results/a1149931092faf5e0d76252705041568833dbc41
     powerpc |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/56076caede5c7bfc8a57da3a9dc47d0d22309e79
     powerpc |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/91e67f076e42e67984ca4c49b160a805b6190191
    mips64el |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/6f54522d1e3e3636defe64dff9b33f3a8f66080a
         arm |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/bb0bf74c3814aac728e85727fec929005a000e9a
    mips64el |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/cc3d698d503d244145a90ba38da18684595c8f6a
         arm |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/b297b24a09706ebdfedd292d91374f910229f5b1
    mips64el |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/647061a6fe8cffe3b083c911a986fa7683cdb8f6
      mipsel |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/d90e4d7c62e5b860f1f0ffb5e4dc545928f91734
         arm |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/8e63e60c967f5d33eb373246340d556225d4d5c2
         arm |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/fb48a94b7cb9d2efeeafdf2d5389fc76f27c7059
        i686 |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/bf0012c9b2e6cdd0c87057a9d6ac052124f18065
      x86_64 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/ca18db60a9a80f50844324273096cb19c150b593
       nios2 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/b3868cce710edbc64f7313d9d3d94d12f1f39d7e
     aarch64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/f13eeea59e97b226c1870f69d62f42c800c1ec51
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/a96f984fb355fd98b8aabdc35dda8303307bda02
      xtensa |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/696c75c41a02f73729147446385e2b94be705f9a
        sh4a |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/a252c5cf8b69ba52c9627aae0229b52d108b34ad
     aarch64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/9905394300c56599575e3a7beb4f3ba0931a5a54
       nios2 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/3a245033c47687d7e04e07061bddccef841d69b4
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/d2989f05f47cd1bc6d8bff1dfaccbf2ca8d9cb7e
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/3da7805b320d71f61be8fa2c5dbdecc6791e07c8
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/e7731116be13c2a6eeda8920e4d658d49a9547c3
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ffa49d90c3a748d7757242e732ebfaadb69f9156
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/4abbdba61402d843c5358639b82410366be73dbc
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/fc516e84aba8e7f0ea2f5b5bc34fa5ce09720842
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/523ed3cc8b7ad2576a68a3c751f54260fcab2576
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/10e325afef51e1a6cf90633c8d530942cf43829c
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/6fe40c3c58a886e308b78081f8c4dabc9f8762bc
         arm |          rabbitmq-server-3.6.1 | NOK | http://autobuild.buildroot.net/results/a35949b4fc9946d0decb1b0a53c69e1fa3494403
         arm |          rabbitmq-server-3.6.1 | NOK | http://autobuild.buildroot.net/results/924ed17b1497c9c1c19239f7d79b19d01d1c2b85
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/7e4db248caa790180b35705a9c2fd33daa4c2a36
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/cc5ca1686b31590ac409e9c71a19165d34e6d658
      x86_64 |                    strace-4.14 | NOK | http://autobuild.buildroot.net/results/6709f8026edf603c2fac0666facd8c8d0941f16a
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/fb6bec750c4827e025acb5b3d7bc4c8c1075e9a0
        mips |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/78de61ad57231e6e70f6c20c5a7a797096db02f5
         arm |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/b99a5f565fdc74a6450df7573ab75987336d1b1e
        i686 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/d797c9fd3dfa7f20e4e4dc8ab6616edccb87314b
        i686 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/ba4a7777292be0b77b48437037c61b6857e91cca
     powerpc |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/a6d12f36c850627f2f58e45c6578c5023a33d518
     powerpc |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/6c5aa9ab027fa46e23ea6aa40d5c59f124b6df97
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/afdac708152773d22d6d20f16cc4b75d2ae736e4
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/ab49d46891e15ee095633a6dd4a2cd14c5770cf5
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/8b31d7e58f9c2bd0fcb55ecdd0a4f50e878f9bcf
         arm |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/a9ae0605a83ed32dc7e3ae8bbb678bf222cf4496

-- 
http://autobuild.buildroot.net
