From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 08:30:26 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-16
Message-ID: <20160717063026.71356102EBC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-16
===============================

        success : 138
       failures : 52 
       timeouts : 0  
          TOTAL : 190

Classification of failures by reason
====================================

openblas-f04af36ad0e85b64f1... | 6 
               acpica-20160527 | 4 
      host-uboot-tools-2016.07 | 4 
                  connman-1.32 | 3 
             bluez_utils-4.101 | 3 
android-tools-4.2.2+git2013... | 2 
                directfb-1.7.7 | 2 
                  nginx-1.10.1 | 2 
           uboot-tools-2016.07 | 2 
                  rt-tests-1.0 | 2 
                 openssh-7.2p2 | 1 
                acpitool-0.5.1 | 1 
                    libiio-0.7 | 1 
                  ffmpeg-2.8.7 | 1 
                    pppd-2.4.7 | 1 
             transmission-2.92 | 1 
                  autofs-5.1.2 | 1 
              lirc-tools-0.9.4 | 1 
                   dante-1.4.1 | 1 
          modem-manager-1.4.14 | 1 
                    lftp-4.7.2 | 1 
               runc-v1.0.0-rc1 | 1 
                openmpi-1.10.2 | 1 
                openssl-1.0.2h | 1 
               openswan-2.6.46 | 1 
                    owfs-3.1p1 | 1 
           libmemcached-1.0.18 | 1 
                    quota-4.01 | 1 
                  boost-1.61.0 | 1 
                  babeld-1.7.1 | 1 
              alljoyn-16.04.00 | 1 
                  mono-4.4.1.0 | 1 

Detail of failures
===================

    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/288d4035f64f743200c5058a1d63e21b47f001cc/
        i586 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/716d4714e2790c04473282fcac6470ddc3607058/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/6e88f2253074b48874dd9152d99410e574d4ed6f/
        i586 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/b2a7141a8ed9e3030162996d91d7c26127fcc6c4/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/2f195cdc1438b4dd4d4b374c9362bb6e76dc5777/
       sparc |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/cea62a7ed7f1eda6f817d8e27fd645942def25ec/
    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/498fb25c74d97b70e06e2d4bdd34be8af0a498fd/
    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ef581051b7ea877fa67cd1df94851fe2fa7930c8/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/152d917b0078aeb3715cd562cdecf7d0debf924b/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/31d98793cc6fc7b6e9800353aa1bf4fb0a33d5eb/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/708333804d01a8f69b4fcc51661b98ecfe507552/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7b0d37f030bb6cdfcb8657b82d905a0e9c6b01c5/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/979aeed20e48af527e19b8751c623f788a71bf79/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/5e2a9b6a322ab2da2b98ed76d30edcb1f3f0099d/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/1959ad805ee03bc7630af36efbe8a72ac3ff3f7d/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/e4b2e60ef392a3313b2d112cdf5dcded922dec72/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/7b40cb714abe825cd4d9e1546704f1a924ac1762/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/c41220715b1cf8997ff7f75180c5b86bb5a4de94/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/6d3c957967f520459103c3359ff16ba8fd07ba88/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/3b53edc79ce95a14503b389b4cc61f0e692fed44/
        bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/c3e5d5ecae1eb603be510e0e1848d1a689af1517/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/51f0d45331a7e5ca302c78227359e95386eb87e7/
     powerpc |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/dfed81f46e31c80b09f9fca3badba074b4cf5e64/
      xtensa |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/c3d9ad5007c30b695a6cfb4ef4631d2f460b7b8e/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/39fbdba7f8990216b633112b9cabcb8708520a37/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/223dbc0ab6aa0bdbd8483cb668361be6b7e60ba5/
      x86_64 |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/a6dc2743c7e0d57e98d1344d7a752d9559e4c886/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/0a1abed60af586931fa18af3a9da9baf9f8510d7/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/50b8173b96ca6aab4eb225a12fb8f40c2d675b62/
      x86_64 |           modem-manager-1.4.14 | NOK | http://autobuild.buildroot.net/results/fcce95bd13407535bee336e34288b55142ae0bb5/
         arm |                   mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/37d3d6d45c375e8843c8213525403760459ca212/
        mips |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/64b1bde02346ca67b670f0b095bd3acad707e8cd/
         sh4 |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/0b5240fdf0612f016c67fed3bd4a7adc879ceea3/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/ecd4960e262c85d40b65b59ba0c41af1d967cc16/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2bcba0feb0297ef7f9027c257b629d6c54e4477c/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/85b4690b8ccf8a5ad4cdd03f03420549ee463cdb/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/1956f78d0684ca990109f99d8e7ed74fce461c82/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/af5e9f10287aaf9b9be6228ad7d12b2d926f8051/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e0759fc77a5f74adbde1e009e8e9a21289f1a2da/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/2267287453449a1be0e890ec4d5bd0d2f01a5765/
        i586 |                  openssh-7.2p2 | NOK | http://autobuild.buildroot.net/results/71b6ba9d3ecef4ed3b6f91c69e5ebb37f154b967/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/c74c575c756b8ab2321031ce04c317361dfde72a/
        i586 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/98836d00f46cdad461303fc33b47de3594fb8bbc/
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/ace306a812a085d3380fcb98978fb2667415dceb/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/dd7f6534ebff3c269e8f543874a902f5ddca2275/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/2de372d1262c3dbdc3112f73477f7d333763dc39/
     powerpc |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/51a070a897491d3b7083efcac0e8c231922f0333/
        sh4a |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/6facaeb10588bdf3ff029b882a8ae6ffba815cdc/
     aarch64 |                runc-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/690c2a2a05e9e2e6a2e6638c8f262e3a1538a62a/
        mips |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/4174141a4c3fdb0baeed1c3c5197eff7e81b736f/
     powerpc |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/4b2cfbf7b5ecf9e881a2a49e61c26355651474fa/
      x86_64 |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/801b704e015c9fdc212f68cb3aa1198f827eed14/


-- 
http://autobuild.buildroot.net
