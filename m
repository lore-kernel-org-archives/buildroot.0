From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  4 Dec 2018 08:00:29 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-03
Message-ID: <20181204070029.6ECBE207AD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  31 |   1 |   0 |  32 |
   2018.08.x |  14 |   1 |   0 |  15 |
      master | 156 |  98 |   0 | 254 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/26ac14a4c5c0523e0eb778aa48152beeb53c776d |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/61214422f512b99957996ddd7ec6680e5abef3ad |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    atk-2.28.1 | 20
               dbus-glib-0.110 | 19
              tpm2-abrmd-2.0.3 | 7 
            gdk-pixbuf-2.36.10 | 6 
                     lxc-3.0.3 | 6 
             fontconfig-2.13.1 | 5 
             host-grpc-v1.16.1 | 5 
                libsoup-2.62.3 | 5 
   libtorrent-rasterbar-1.1.11 | 5 
             stress-ng-0.09.47 | 4 
             gstreamer1-1.14.4 | 3 
                libmbim-1.16.0 | 3 
                  linuxptp-2.0 | 2 
                 pango-1.40.14 | 2 
                civetweb-v1.11 | 1 
       gst-plugins-bad-0.10.23 | 1 
               libiscsi-1.18.0 | 1 
                 minizip-2.5.3 | 1 
                poppler-0.59.0 | 1 
                   strace-4.25 | 1 


Detail of failures
------------------

     powerpc |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/d8819e876563bd2eff6636086dfa969fd1a89f66 | ORPH
    mips64el |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/0bca19ae3e64f024eeb69c6a4f690382d94f626c | ORPH
      xtensa |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/1e07a355d44e9aeba15ecce429bd42bb523d3826 | ORPH
         arm |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/6cb1725ad24fd2c563636ad0ada8ca92c07d0709 | ORPH
         arc |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/4060d2b7d89f2bbada926ecbd70270530706ee01 | ORPH
         arc |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/4f3fc8aa2b3ef40dbbff60f63734fdfcb1f84e89 | ORPH
    mips64el |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/1ae2862827162be347bc9b52697ead7384f9c8a7 | ORPH
      mipsel |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/4dd26031a6be6fc36e79b3c3c9979b33126351f5 | ORPH
      xtensa |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/a752abf69fa17283065780f4351389e913f76f64 | ORPH
         arc |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/2e8086dece43dd8f3e74624a2511c567af716134 | ORPH
      x86_64 |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/b2b3fed7ef66542c3898ee866050d70e3ae7b4e5 | ORPH
        i586 |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/4ef4078bed13092df5f36451aa1c2f32a6cdaa85 | ORPH
         arm |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/1f6f9c2b173c0c23ad66b69774a658d21a3d59be | ORPH
     aarch64 |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/b84f4c683c7914bc58b790413de541aa73bba8e9 | ORPH
         arm |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/bd005cd2e147dcadcbf971e21c503b4a8c3bccf2 | ORPH
        i686 |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/23cf5227c21365cda0babf1922425f8adaa97fba | ORPH
         arm |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/ffe77c04aa934e89eafd68e56d65052ce6bfc4ca | ORPH
        i686 |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/528778f8908fddc79bcdfc61b9e25c51a95cf2cc | ORPH
        m68k |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/9666a6876a1a5660bf529cb010328d6a3bc49fe1 | ORPH
      mipsel |                     atk-2.28.1 | NOK | http://autobuild.buildroot.net/results/ec3bb66c5bd66efabd20bff0934471b0511d2d5e | ORPH
       sparc |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/2b6cdcd2349143955024e138e6ae02551d91cc21 |     
         arm |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/c63a33ea69101e9b90d30627f937ea6f9698b2e4 | ORPH
    mips64el |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/8978269c35ee8a8e37a7f0081f2f1bdf49bc0db4 | ORPH
         arm |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/25c68c5e00172bf7b4746df1c84d35f42b1c26a5 | ORPH
         arm |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/ad935627d07c5db1c1b978537cfbbba43be4e6cf | ORPH
     aarch64 |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/286bb9001d777ecf2cdfb533c566f2faf5214c75 | ORPH
     aarch64 |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/16397ec0a969386d0afb48a6fc0f98675ce2eaaf | ORPH
        m68k |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/c5b3c2be5d402abe79873168f34205af9de3504c | ORPH
         arm |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/1203b85ffc3f77cdf4cc52ca966eb88f473b6a83 | ORPH
        or1k |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/bc5bbb4d1a73980011aa9eaf6323cf54fb6c2c4f | ORPH
    mips64el |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/de2db734fb7cd6e887f55363ea82f038da071d36 | ORPH
 powerpc64le |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/562712e25bf6ffe4bf067032533fcfe42b148c7b | ORPH
      xtensa |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/22571273040b5ded12cdbd7501ea40c42be17e41 | ORPH
  aarch64_be |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/ae887332e889984ac144cc7507e117a8a66fce46 | ORPH
       nios2 |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/e6304329cbaf021385ce0a9d59e4842f33d73346 | ORPH
    mips64el |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/3f0e98473bc65eff7b1f10a64b0ae65f5a76c491 | ORPH
      mipsel |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/05513928ac4d97fb8495436b532e7740103bdc10 | ORPH
        i586 |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/4d1f6cdb3684ea3fa1682a5caab33e8992a5ad17 | ORPH
         arm |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/5ae7556a7fd647281542ff1fff31299cb59ddeca | ORPH
     aarch64 |                dbus-glib-0.110 | NOK | http://autobuild.buildroot.net/results/95690edbcbf4a84bb2c94260d2133a4d9baa339f | ORPH
         arm |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/f0d5cfc31cf885ef6ea492c6b934a364127e87fc | ORPH
        m68k |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/163579eb6f86cad513a1b73d55d45619b3bc1e46 | ORPH
        m68k |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/59b3fe3d5359c89a197860440c8b693b7e9d6a01 | ORPH
        m68k |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/e656f0c0932bbd0e8effc32634bcc7935927e25b | ORPH
      xtensa |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/f5c029c6519ff3981b523833454684369fc20804 | ORPH
     aarch64 |             gdk-pixbuf-2.36.10 | NOK | http://autobuild.buildroot.net/results/168ca6db96cef527954bbfd0ffdc2c99ab7f9b8f | ORPH
      mipsel |             gdk-pixbuf-2.36.10 | NOK | http://autobuild.buildroot.net/results/1a43c8c4a51aa4ca0d2498ce2963b6382dc7072c | ORPH
        m68k |             gdk-pixbuf-2.36.10 | NOK | http://autobuild.buildroot.net/results/607c230f2d45216b8f4e6d29ffa87fd68fa242b9 | ORPH
     powerpc |             gdk-pixbuf-2.36.10 | NOK | http://autobuild.buildroot.net/results/7051f5fc46d2c8240870a74dda4c00f03e3c40b0 | ORPH
         arc |             gdk-pixbuf-2.36.10 | NOK | http://autobuild.buildroot.net/results/43228a498fd3837cc40eb1e72e4539a53d2b8072 | ORPH
         arm |             gdk-pixbuf-2.36.10 | NOK | http://autobuild.buildroot.net/results/af09fb527661a3f7bd8e8397c0b9d7c720a00658 | ORPH
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/bd6ffd7de66fbbdb9ad0d01e791fcfed3e9b27f6 | ORPH
    mips64el |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/8fadc03944703eb9983d096897500103df8f3a24 |     
         arc |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/7cc525a61a5af9f4b51cc470a6493131f02734a5 |     
         arm |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/f4a70c781d9c2334512ad5335f3145b97c687cd4 |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/9aec1a70759c594110720a6f977c1c95cef99e17 |     
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/fbbb81f6e079e2c93fcb39e5a1c9d759e25da4cc |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a8dc1edc1d35a8d8daca173a6bc11a468d91f1d2 |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a25ac2ac077240e186cb76aedfeacd6e3ae58eff |     
 powerpc64le |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/5f7a2fd8619f30340f5fa88ff4a259768fd89f3a |     
        or1k |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/55bf50fc7dcd465b71b5757434887dd3d0b25abc |     
         arm |                 libmbim-1.16.0 | NOK | http://autobuild.buildroot.net/results/9fb7702dce1b89772db83fce4f547ad969ea1cc1 |     
      mipsel |                 libmbim-1.16.0 | NOK | http://autobuild.buildroot.net/results/c8c7d7168c1453909542173d012f53f1e70dd505 |     
    mips64el |                 libmbim-1.16.0 | NOK | http://autobuild.buildroot.net/results/c1cec17b9628de3aaff916ff688b4457f6aa50e8 |     
    mips64el |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/dd870355db5a27d8bc6c9e6eb0718752bda192ba |     
  aarch64_be |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/1c90aa6c38065dd42328c3d3294319d001b922b4 |     
         arc |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/06334b043076a2bdb3dd814a24efca047001fa68 |     
      mipsel |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/e5d9fd9a1cd6895cc738abc09d925d8f86b5e175 |     
    mips64el |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/3d9d55e730c1c24c9ee130b3f836f1c790a3ac09 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/753059dd52da9ec2aa1b06f3b64b0ab5ee3e059a |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/68bc30ca2db62f588ce4d1b0937588f6adf0a03b |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/7f24052c1bd50299bce0d6111a128f0715839222 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/e4b934e5e2e6c5f3e4e6cd60640a9de82f8b7857 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/38a5481dff972954c02a74ab19f37e71d5f6510e |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/db380f8cf3fe308231860154f3057398656706d8 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/98ea8b5a16a0af0ee3696854782a6e539bd4d4a6 |     
      mipsel |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/24135c917c7d632bcbeb3411c819985738050c57 |     
         arc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/56b379d360b4bc140fc206c17499c252ef55bb83 |     
      x86_64 |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/0b90e7dca2984652842832a41abad93ac49a9b86 |     
microblazeel |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/aea5d27ed2779f4e3b5cab452bc4277d5a72f4f0 |     
         arc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/080d9ed14b1db34220ee1d57c7bae614a2d35614 |     
        or1k |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/ceba79348d60f40cfb284660e999803c489f5336 |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/8abc0b2a64544973659d1413ba47b1a265b2fa0c |     
         arm |                  pango-1.40.14 | NOK | http://autobuild.buildroot.net/results/02909c50f1403b8f69581e71656fb9cc4a391223 | ORPH
     powerpc |                  pango-1.40.14 | NOK | http://autobuild.buildroot.net/results/0b9c3f31504e382a4e3e840dee5978e19ecf213d | ORPH
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/d3586514f903a5619820c72687d08708dd41f3c9 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/051f6008d9266e6e4e60c9b7b4de3e7dc269a58b |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/8cb3321d7e9f6be3293804890a761377a27f51f1 |     
      xtensa |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/af100a101ab3387804649057fc29b929b74c4083 |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/4ced4dc827fd2a1e439920c8c6118d64f67235eb |     
      xtensa |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/31b0615a75421d42c14a69a2ba83e5f24be1aae7 |     
         arc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/f3c2f687d29c5351b70c3e644040d61abfb28f01 |     
     powerpc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/fc001264725303641b141cebcdedee239af1758f |     
         arc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/13e9881c7562c4a5c7010917842e118066f1bc44 |     
        m68k |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/fb77f82b6a18d674ff71d02d8b7e2421200925ff |     
    mips64el |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/232e3cf596b8567c695aa6340e657ca4cd2c95ef |     
       sparc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/2fc8c0d7b3f2cae9d747078c485b389d08e914e5 |     
         arc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/82d85a0f07b97f791a117d1f49a82d57f35d6207 |     


-- 
http://autobuild.buildroot.net
