From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-18
Message-ID: <20150919063018.4152F10185F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-18
===============================

        success : 200
       failures : 52 
       timeouts : 1  
          TOTAL : 253

Classification of failures by reason
====================================

            micropython-v1.4.5 | 10
                busybox-1.23.2 | 6 
                 sudo-1.8.14p3 | 5 
              strongswan-5.3.3 | 3 
libbroadvoice-f65b0f50c8c76... | 3 
                coreutils-8.24 | 2 
                      qt-4.8.7 | 2 
freerdp-770c67d340d5f0a7b48... | 2 
                  guile-2.0.11 | 1 
                  mono-4.0.2.5 | 1 
                  boost-1.58.0 | 1 
                oprofile-1.0.0 | 1 
                  libftdi-0.20 | 1 
               util-linux-2.27 | 1 
                   erlang-17.5 | 1 
mjpg-streamer-730b5bcdc378b... | 1 
              gst1-libav-1.4.5 | 1 
         conntrack-tools-1.4.3 | 1 
               iptables-1.4.21 | 1 
                     tslib-1.1 | 1 
               dvbsnoop-1.4.50 | 1 
                 dropwatch-1.4 | 1 
   150K ..make: *** wait: N... | 1 
sconeserver-3b886c3dda6eda3... | 1 
                 opencv3-3.0.0 | 1 
            ibrdtn-tools-1.0.1 | 1 
           qt5multimedia-5.5.0 | 1 
            kodi-15.1-Isengard | 1 

Detail of failures
===================

    mips64el |    150K ..make: *** wait: N... | TIM | http://autobuild.buildroot.net/results/8e59f20f5d9c84477ab20a21bdf2de86d4466d3d/
         arm |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/fc00d7aad0d34c4d47c6dcb97f2556f621849503/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7339cc0637ab9fe2e9ffcde03486912e50ae8676/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8cfd39327fe18228942f56c19cc85eaa220864d4/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ef29b1d6f4d259ad57e98812fc66f338c3809404/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d11225b44ee4b550c1326a7d6dd9b3716fb1fd7c/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/443ce162ac140d8877b9799f17139fef44277794/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5395b5816f2fbbcc7c8b8601b77f7ed539e98f5d/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/66b8022307ca643d218f6673ebabeac8f1b1e625/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/783b21c8d355b317926aa0e1f774912a3ef35002/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/017f8dcee720d466a2034af2f2f1e4b7b792b5e6/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/4d745916f4f308b0ac46ee3aa4407c5d575ce606/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/831e7c895c85c49068623ab0cde7a3a32f6cf14c/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/660ac1bc3b8501e04260d49f17d594730507fdbf/
       sparc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/760e20b0b38bddf0b132a8b823a19c9471622fc3/
       sparc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/a431cc261cfe0648390d934e63087a2d2ff5be90/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/77c095bafb79b006dfd3fddff94020f39079970b/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c628b5b7791239c864709ac757b01ab5e483503d/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/e49cf73597a7c538c84670c9644529ea00f9826f/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/c4c6c2413dd6473a5b0fec0d720e729eb9596b4c/
        i686 |             kodi-15.1-Isengard | NOK | http://autobuild.buildroot.net/results/8f30771d0dc56a1174c1a6a477ca72cbb2f876b7/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/81d30f52fd2062c74484b68d13b97d6f13db2743/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/c0b9ae32f8f330e7ddaf57678bf643f6887c5310/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/df18eaf4f7c341e44f4e5ec88c180e5d57be45ec/
      x86_64 |                   libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/4393ca3951ad007acac768d292ebe507bb273de9/
      xtensa |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/670907760d6b3e7eb46b433647b392cec3bafdcd/
      xtensa |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/82f9117856a04d40484bd65a731efcd8596875ba/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/4af55c0a115409f8347350ed55924de0c5c0260c/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/a5e54f8969ede81073c26a06567e2d3c2711eb67/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/dce01a3b9224361e464e65bdc9671a3785689b0d/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/99a610c72877fef53d93e1a923bd5c71b3376618/
         arc |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/006b330be90462a3197f78938979e9d27a2f2b2e/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/936232bf86a7831ee5c900586b1bbfd5a3590790/
        sh4a |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/f5a2c563b8bdab9e345960a5b92d31f3f92dba00/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/d912d52477754cf2863b73c9680af21bd89ce82b/
      x86_64 | mjpg-streamer-730b5bcdc378b... | NOK | http://autobuild.buildroot.net/results/74c6006c4d7a97fa69c6feee204631861daffea9/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/3493047fe351e69a0ee3f4df28d0e9514507de5d/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/0af24bd0243b633a99a85e8419791832922382f8/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/afa99241ba408cadfd8e12f1f23e530cac783da7/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/35670f168309b9a41d212c75355b9c645f458e76/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b8f34afa8686e890a1a3882a52081bb6a3b9c13b/
        sh4a |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/54abfb9a258549c1e2fc47452f8b406c1fb8c47b/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/c1409484773126a9449e8ce62f0b8e8f832c6233/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/14e0ec7465f3968047fbf323959532104ebe5665/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/875be1fc8ff2d9f0e2145c2a4d870c0c7d25b6f3/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/063c31adfb2733d8d10de52763e9056bfd0f5149/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/a4c3a64b87d04b9b876c8f38c9bbf0416ecdad4a/
      x86_64 |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/ff8474a6828e0d30553e65d57e3ba68a7602c196/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/0167e4001f4e6325b257ccd14e2535e495b6785e/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/aa1bb63dd23d679bb4011d6e046ac88cb5cb9d4c/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/ed38aad78ef05884748e9ce581838b9fe5d384c5/
         arm |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/b068f9cbfa1d704e9ee0133942ef3ea67aa5f8f0/
        i686 |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/b5b22b006dee6795372a7ddc11a36fe47288e1b1/


-- 
http://autobuild.buildroot.net
