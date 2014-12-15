From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Dec 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-14
Message-ID: <20141215073015.CF36E1018C5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-14
===============================

        success : 267
       failures : 163
       timeouts : 1  
          TOTAL : 431

Classification of failures by reason
====================================

                     nmap-6.47 | 27
               xfsprogs-3.1.11 | 23
                   mono-3.10.0 | 18
                  guile-2.0.11 | 17
             libxmlrpc-1.25.26 | 10
                blktrace-1.1.0 | 9 
                     gpsd-3.11 | 6 
                pinentry-0.9.0 | 5 
              host-swig-2.0.12 | 4 
                libexif-0.6.21 | 4 
                   erlang-17.4 | 4 
                     faad2-2.7 | 4 
zmqpp-36413487f05b165dfc82a... | 3 
              host-mono-3.10.0 | 3 
                  thrift-0.9.2 | 2 
                     gdb-7.7.1 | 2 
              jpeg-turbo-1.3.1 | 2 
                   ncurses-5.9 | 2 
                collectd-5.4.1 | 2 
  toolchain-external-undefined | 1 
               w_scan-20141122 | 1 
                gptfdisk-0.8.6 | 1 
                    php-5.5.19 | 1 
                    ruby-2.1.5 | 1 
                      qt-4.8.6 | 1 
                  zeromq-4.0.5 | 1 
                poppler-0.24.4 | 1 
                 openocd-0.5.0 | 1 
                       unknown | 1 
                     eudev-1.9 | 1 
        gst1-plugins-bad-1.4.4 | 1 
       directfb-examples-1.6.0 | 1 
               libcap-ng-0.7.4 | 1 
           python-pyzmq-14.3.1 | 1 
                     rpm-5.2.0 | 1 
              spidev_test-v3.0 | 1 

Detail of failures
===================

        i686 |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/97ca8131fd3fbdc04f0bd7c94bc97a58cc6abbf8/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a842234fbdc8f65d48089b90ee23523540a7091f/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/08ac6ad722929afb88f8363c4260c68304e00a17/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/e6351692ad6aef397e68ffdf107f3a85e4490015/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/dd47b3ca17bdb597d6b12de6b381cf5f25abaf71/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c7f0b22c6d256c75ade223af702c5f29c6c677d8/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f3bbcedf1b648976ebbfa3d4c56a46f4cfd73756/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/4abb0d2590528c634766103ee8ffd648ad5c04d3/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9700f00c6fb7146dd7bb6412e4f38575721ebaf9/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/8caef97bfa74d445ccea784d3465a50764035a1b/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/65e69738b1b199834ba18a09dfe755599790108d/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/82d7dbb5e85e8ef5d09e05722597df8d71b6bfa1/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/501a12da25615071fb6197a898456cfe41a6451d/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/7220c3905ebe9e081f1e3b90641b0859d996c2ac/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/34e2fbb4d39737fd7defa5bd607726d52ef38568/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/fc9904446553e67dd44954310fea26d751a0df5d/
       nios2 |                      eudev-1.9 | NOK | http://autobuild.buildroot.net/results/32af7255c276570c0ba5d960ea42807e364dfe86/
      x86_64 |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/2323f72f9b08ef8e20ec67a5aebfadd5b469a298/
         arm |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/f0a36c78fd910bc0aea54df4b76ab8a0f82f7ae4/
    mips64el |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/b9371dc8f5f1fbf11d197744dd55ff2f8c1d4e51/
    mips64el |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/3d6134c71e57238d4d865040eac9f34e2d17844c/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/c1096d0bd22de5c6feba848f743601ad0416a944/
     aarch64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/21979e730dca1fce5bdda9a4c7fad4485e788866/
     powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/3c44dfc6e3f151bef751f39cac336fef3d6a0099/
      x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/38c81407bb8d0677e87b3a01f9a1fc1372ab4738/
         sh4 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/49a55ef26fa0e0c051d63f17047c3273d7b395e8/
      mipsel |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/aee305bb06e6743c65bde1e075de7a10d1ee65fe/
     aarch64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/3f94d80fb720e2ea5a1761aa4b07fffb41dd26f7/
     powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/bdead45968b876b63df0ba72b5bfb5dff6066fa1/
         arm |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/858a8a3a92400837dccee12ab8fde67a980ec32f/
      x86_64 |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/ef2830921b4d4b47aaab03183595d17e46104493/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/06b7c22be24d61a4d66b5015fb1ab95561eb2369/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7cfcbc4e22f4062e9e1a46d44088ddfd095581db/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/eff343eaf858eaf6b2b002f615b7c762c498c944/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f1be7fc783a1484a6fdd9127a0804b3abc58d98e/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/3cc4f8c19ddeee7785c999c84f159ad50736c1cf/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f7e31d7fe24156244361d84e653c9f7e8471e13f/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2df2a58831870bf558e628333c734c248b6e7e5b/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1b40d1dd54f87fb002b6191ea4e4a35756550f4d/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6e4d8289363ccdc11d84ea53c1302fad51eedc0d/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/af66a603114cc169d62eefe2e84e11c420398f12/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/cfc1fc9e85c5ddcd97092c679cd71e2435c4a54f/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/84953f679b3b14af006c5665b51adb11c5047133/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6e436f9376469709f738f28b7f0f6ed25f458de6/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/12c94ebc928b775e539e5eaaf0f44d0af0c612a0/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ccd591f05063e633727c2b798137b3d4104f99fd/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/49877ecac04b116b9eca7e736b753e845a6361e8/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/093a084b82640714eab9810cf8bfb9ce0e3d0d22/
     powerpc |               host-mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/e0860ca6e4d30413952e13905fd617fa670df039/
     powerpc |               host-mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/77d9e4d5069878d7c6f018d7bc9c71e4b7d2058e/
         arm |               host-mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/de317f11d2269be422e8cb21b28ac27ceff128d1/
     aarch64 |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/5b53386ecae497098d3a741603e20d32f2cf97aa/
         arm |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/16ab359659f0bb0332a02253d8da543c89254d4d/
     powerpc |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/ef672c8f6a153955ea4be72847f8f366b1dc805e/
microblazeel |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/44ae35429248b4b248f6f5b4246e3d9193c0f598/
         arm |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/13384f6e0dacabe68dd845f3aefae7a63a16d37d/
         arm |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/552bf7db5e3dcf39ceae64df7659cabc43784319/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ae544115b4812696331daa6bd8a1a44bd1dabcc2/
        mips |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/5ec081b534028239eb91b758b806a2351e29297d/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/f0d571944a9aea8f587c758b57a2b92842329b62/
     powerpc |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/5fc54736b4e9490bbc5e232d03564a88490e36a7/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/2d70ec433caa00e5529a5341c1bab37404ed212d/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/cc5ab4972486013c77eea510d96e847f119b8dc8/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/cc2f33e576bc7d9653bf6b8ef3505d3a265db8a8/
    mips64el |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/f5932e18f6cd7a3beeef8c815d735bb3857cc82f/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/94675c287b21035d297c044900726c8b9a901167/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/db8a90dec4ca03c374a4f54c128672709ba1d24f/
        bfin |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/a1993cf45d04b6eb20703831e4322d9c462d0a5e/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/b73b3a3e70eaf5f1c713392dabc864b815f6bbce/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/72659c40ca1ed35a42a7dcfdca62a5d731ddf669/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/72fb15d54c9478a7587fc3ece205e50c3d9d4bcc/
        i686 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/e55f24989663a171d103f18a53cc070d9d636e55/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/dd8c1937c99581936644cbafc78bbf8c63b15c44/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/be0daafcc59961d4c58e5dab2aebb7fa092c8b34/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/e6184205486fe2998efd1fda7bf882b1e58ad8bb/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/919a32d01c3ef4329c8a7c4bdde1dd86920a763c/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/f74088a0c91ea4b469e74ff6440a5bba1a06737a/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/a9ead5a6dc8ef89273ed352a1a0b1dc8f56d01bc/
      x86_64 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/88056bd0fd65522eb0d78e01a3196917ad5189e7/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/8bdd44731bfb88f2b48459fd515bcd5c83ff42bf/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/085133c4ffb4569a9087c8139f0457f28b6fc2a8/
      x86_64 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/d47e2354c9e8641915e995e68afa94c9c9c289e1/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/88d11192b7b5f26b3254ed05aa5ab105b97bc272/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/3629c5e254e766091f08f7260dbf91730eb4e8d1/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/6b7ff86b3fa50a3c02cb7e673841f82933d24b08/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/1fabd1eebb340f9d25cbb0e3c313aa788986c045/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/6f8836cf7363ea7801edcc5e90dfb5ee8272686f/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/45be4556febc75957b01e4d06190945a7a0af5f9/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/0a5818cbd7e21f0235d2d22602182d094005be32/
      x86_64 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/57ea244821c616d20b2bf1cd68ed8b808445c410/
        i486 |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/2775066e6d85a3b19e929c516d0619c8a9a274d7/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/1de87d2622446f1e39d8feb331195424f991c310/
     powerpc |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/117ffce2c854e6c60326ec62211dc4256cf53ab0/
      mipsel |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/fbf6dedcaedb0106f812bd914f9c98b57794d9c9/
         sh4 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/63c0dbe0b99336cec1d4569ea8b4afc4e539e4e8/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/daafdbc5c45a39f3f6f18711d6a7553142e981c2/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/098a7ca62d4497b048498222c83db198451b92ae/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/8c7f82b4e16459331dda701579626e71d6697b3a/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/e038e758681024403193e4642ee0ecca751ebfc2/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/f525afbdc7eb5f808352518a6e6802ec34533961/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/4f72f738ae1b4223a95f0be159bc671df7a117a5/
      mipsel |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/dba870fff909ec0a549e4a58057e4c50f20486a7/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/76b1e8bf22d668932e9a2f04473544df29437fe5/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/0c864f03c91671181ea0b71e8d46436d6aa27c3c/
      x86_64 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/e3d85620cdbfa3b4d261f34b0ee890ddff55f41b/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/ac4c90db6d82a0239a70d48b56bcfd256885b715/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/09100690c2c747860e898184bd45600ff57af224/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/9ea0ab9fab933fffb1ec185b2a8d036d95b38970/
         arc |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/9bc425e54d31bf3199d30df86088c658936ac051/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/49be6f2a2da51710e616816d9dc0b735d4e1607f/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/284be79f038fa3efffc1b9b6e271d19306af160a/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/c1a277ff2dbd19e9baa06d1ee960a30ef24f5024/
      x86_64 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/f3484497095e3f0172dbb1a63d3928b558d8d292/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/1f9dec4e31e81861b7afe79faa4439a8fa87d8d2/
     powerpc |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/7792a21c289c0e1d89dc4d6f91a7da9c47c7cc97/
        mips |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/4e64bd7ed2043050909a5881fbe1ab12680e1c92/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/b1f0d2a942b72b4e5802675a0b48973e14519f1b/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/217012d759c347f6091c2a05c7f5182943da75fb/
      mipsel |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/f9c77a45194c3a2595d7418bfdb9d29ded1be07b/
        bfin |                  openocd-0.5.0 | NOK | http://autobuild.buildroot.net/results/6ebdaa7be9c4cf4869b22d13da26878d1c34bc4b/
        bfin |                     php-5.5.19 | NOK | http://autobuild.buildroot.net/results/cbed850d3da64e83ed53a9b4d2c97a1c0ac26aae/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/4debd694f723982d82dfa442209a170fc9ab10ae/
        mips |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/96c68e9a6c528e15016cb10f0f73e52f58815bec/
         arc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/e7d1e974ce6944f62d2201ae6ddfdadd7d6d4200/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/fcbe8b971ef37c0e7c458bc32295a89be9872b61/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/50ecb6b347ab4970c701b1aed7b42518fef9a52c/
         arm |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/5a230f95fe251b20046056402c4dc2953248e7b6/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/77ad31957cb2bf2aa24f3301144b646f86465f11/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/7bec25bcad1a6eb96c23db0eb6ce71cc0372a8a6/
         arc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/dfb133e6566b7e24002f9fb7fce821a288bf9160/
         sh4 |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/0fcac7ecbcd3c136c8a3b1fb551d6c7d24d4e86a/
        bfin |               spidev_test-v3.0 | NOK | http://autobuild.buildroot.net/results/69854e94a3e8223b0d2453da60fa6a6313bc4620/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/e2392450bfec12609beff359d00aa089c220672b/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/899978df776ed267b453176375aef0f93c00866c/
       nios2 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/87c7a8b4b6fcc93b8b4e9b97d4aa92285674ffd5/
     powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/bd4aa0af9bee616f400a3803a67edd0d1fd16753/
        i686 |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/bb97bff1bf7774ebd43ba2107d84520538e530cf/
       nios2 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/951f8c05a9074af18441d346a9f5b3a76f37583e/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/153d75119f9d2f539b790b87ae6e3cf2f7a763de/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/b04a431b5eda912c8693c36db1d044eeb5f26205/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/50fae28422da7068b9a1fb35c5526e18194ad72d/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/6e65fb4bc6419b2d7e0fec86da9b721fa084e8df/
        sh4a |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/62218eae632748e085499fe67f6f156a22815e2e/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/fbdae224b007a81ea32ca4370276f53096e2d7c7/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/844f6925789a7c36fe7d7b0a413f4499c5d4081b/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/dc94baea11a8dd634f5d6537306e9bac6732cdd0/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/6d809cffbb9488f265834129256d8e86367ecf16/
     aarch64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/aac528c6e0060136a44fc8cbfaab6531fac4c3ff/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e636fc696f647cc08266d6ecdf227588c61c6791/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/1fe0f6a32139f1260014ac1af0a05d8ef11892d6/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/a0df1d0a394b0dd10ee5b3d3247a82469ef44dac/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/3423b3f491a9ad276dafa4ea631fbc5bcc093bd1/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/544623703dadf0197bb9a0d1974060b9d223c74a/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/b831075f6e040cc371a073c7c440bcb71e9ee82a/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/ec496d7c05b82ad8c10284108220848c27748885/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/2f2c5135bddda3348ac5c956ec83c8ba5f4bc1df/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/c046d273846f2f00e83382f4ff05eb252f1ea2a5/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/95b9559d88f300f85591dc3975b60fc6250a8dea/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/179e8bc9cf2715bd9517aa4925906c3bc42cf3bb/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/d0d0731760f055107d5727133b40ab2fdedb1e9f/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/efd5bde7ea89351a0b3bdb575576c01b8b51d472/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/717198a796eb95513bc647d63a9eb8f9e32808db/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/dc1122e07567d917b278141a959d251b3db6af2f/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/f9c67e11588067adc98d4354b7699f60d2345cec/


-- 
http://autobuild.buildroot.net
