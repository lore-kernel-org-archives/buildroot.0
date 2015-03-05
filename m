From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Mar 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-04
Message-ID: <20150305073021.0D0DC1014A2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-04
===============================

        success : 207
       failures : 65 
       timeouts : 5  
          TOTAL : 277

Classification of failures by reason
====================================

              host-cmake-3.1.3 | 17
freerdp-b21ff842ef3de583751... | 7 
                  uclibc-1.0.0 | 7 
                host-gdb-7.7.1 | 4 
                   perl-5.20.2 | 3 
         lua-periphery-1.0.4-1 | 3 
dvb-apps-3d43b280298c39a67d... | 2 
      host-gdb-arc-2014.12-gdb | 2 
                     vlc-2.1.6 | 2 
                  thrift-0.9.2 | 2 
               alsa-lib-1.0.29 | 1 
               host-wine-1.6.2 | 1 
               wvstreams-4.6.1 | 1 
                collectd-5.4.2 | 1 
                gptfdisk-0.8.6 | 1 
                  poco-1.4.6p1 | 1 
                  python-2.7.9 | 1 
           libmemcached-1.0.18 | 1 
tvheadend-7006b9fd88ce0cf54... | 1 
                    wine-1.6.2 | 1 
         erlang-p1-tls-53f0478 | 1 
                   duma-2.5.15 | 1 
          host-gcc-final-4.8.4 | 1 
               batctl-2014.4.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                  zeromq-4.0.5 | 1 
                host-ola-0.9.4 | 1 
                 qt5base-5.4.0 | 1 
   libnetfilter_cthelper-1.0.0 | 1 
                 openssl-1.0.2 | 1 
                       unknown | 1 

Detail of failures
===================

        i486 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/302d65b3f521107fde80c17eb3a0b351c6631f02/
        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/d241e63d28f9e8f956e62efb8e3cce1be8ca0739/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/bdd7402741ff6f3a1e7641b7cc30e9a668655872/
         arc |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/0491a0f2fff309d0ae345353c5f9b10b47cecf40/
        bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/010453b4c3df8046d062bc2335154487316b5c9f/
        bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/bccdc1f8fa38a424fa8d7a3818132a700c1847da/
     powerpc |          erlang-p1-tls-53f0478 | NOK | http://autobuild.buildroot.net/results/4c5f12f9766cb0ae9ec7e76d2c3a97d0dbc2042f/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/b0839b44e0d5850c0e975e1d486acda10a4ad012/
     powerpc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/ed49d62468ebb076f1796b3694c3e5dc3a84b898/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/779c051330de4e82b1ca8ef902dac89239926dfc/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/37a46b61a27cc40bcd3d59f5b5c0d1ef8bbf3b8f/
        mips | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/013a3c51eed947023a43e78b3cc34e5c15b7c4d7/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/4ba112945aaad23748586f8bb315e86713c7f2d4/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/6ee19821266701175de67dfa1b23e3ec66473cb0/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/0299cc1a92b75da6a72fd09df6cf98f49ad89e97/
        bfin |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/3e6ea34060a479864e30e5eaa29f5a128a2625ec/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/d74668f7e2dc6dd61143ba6f7f8d2e59ec1364ed/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/39d331742debd1eb546054b5a2ed883e32b8e8ef/
    mips64el |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/6c89b2a97c8aa43c968ed46b45fbe31b4f3e1cfd/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/6de49a5018cdf7accc55261911fbfa07f2e97e65/
     aarch64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/bee6e55e1170d90150a36b2198d50592ca698d77/
       nios2 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/6f3b19a075cca990874f11283c4dbac8ca29238b/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/0a3951f13057b6e1a41c558d33b019f1bdcf92b8/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/efc36f0e767f2a7ec9a4fa85a7da8c55bf87117a/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/52b6c6d4f0dd7e0b8e54a9c50fd0efc60b50038d/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/1a6184d9ab91be99333656f5d22d06ab4aa1cd4b/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/e131e917e1431330fbaf47c9c6f64eaa9039c3d7/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/a9ff38b22a36a2f8427d33085d3263a8cbfbd746/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/e70056b2f072aa86183a1d5a7257607777655c06/
      mipsel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/ec1fec65710c668ed784b19fc81020913d4b9db5/
     aarch64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/3487849566a1983902d6eadac8455bc7111fca0f/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/4edf6e169dc4a00d8a8bd16a86eba2316cbbd9e5/
         arm |           host-gcc-final-4.8.4 | NOK | http://autobuild.buildroot.net/results/c250e22d375248bc66d55f2bb5e3b4b1dbd1f6e1/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/9b6170fd564551f21425f7852a9b69a0e18543c1/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/9e5fee183f6b530e8196d63920fd3201abf4fbb6/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/ca26ab9d806b4af10d831994a0d5a5a282dc2844/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/a331a72cc590be566ee3997f5462eda22416ac36/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/d62f472d70f60281dfe94cffc46a3e0566fd4a3d/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/9269435ff08dfba71f8f040858fe06dd1b8e08c4/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/b20a529891dcd40436bac69266af7bf983420a8e/
        i686 |                host-wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/5ec3bfe7fa85947d653ce624ce96a4fe0d0e5f19/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/0a4d2f7d2563fb04356dce0aad388b77f9fb865d/
    mips64el |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/83a9cb6b153167fcd094ba26d6b08d94d9ffe61e/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/8b3d0c35a4fa9ec9d1bcd73aaaf19e97e28d6e9f/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/f1319c80046194f710479d65f32e22a50ce9d58c/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/edfe2ae2ead3045610760e3c886683918aefd436/
         arc |                  openssl-1.0.2 | NOK | http://autobuild.buildroot.net/results/ed381b838a15f3589ba186095861b692f59e2cf3/
    mips64el |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/025d79af86c62eb07ccd565bd6b44ce6a41acafb/
         arm |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/4c687d53ce09070e8936dbd9e15c3d926c0effce/
         arm |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/4d55c8c72bc4872ce98c43afc8e11eaec3af037b/
        i686 |                   poco-1.4.6p1 | TIM | http://autobuild.buildroot.net/results/55d7c23ff3928f4bd304d5fc6d870891bd5bdcc1/
     powerpc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/324ed52bf053a5027d1cbcf309726c4e2df37877/
         arm |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/7cabc07499c4658edc792e34a48a428453fc9030/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/213ea3617ad9b1cf50e31e402314e7d67ffb37e6/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/7a427da7351b11f070d5a18a8997eebd99745d41/
        i686 | tvheadend-7006b9fd88ce0cf54... | TIM | http://autobuild.buildroot.net/results/ac284f9690a6b98f1726724b9f55dd53d541f318/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/d9f7b39807595e7355cdc9a7ae26442139cd3529/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/f1c18da95890f8b3a623c6a44bafd1b2ee8a0a3d/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/2f575c7f1263b9930cece733abf8f6970cbf3f1c/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/8e6c3f3de5ddcec55ba367bde2cba542312c12b4/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/034af26b203312fabed7a0e76028381bf44022fe/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/18c6ed51dbe3756e2dbc78e60f4b01d0d2ada470/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/b8bbdeba93c01d4dd7d55de8c5dfc2a63a7cc61d/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/24bbe122573ac23e3a9ba2da8752f1f4bc301a09/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/e1f6526d1a4ac2c95998793efea2188faa708e29/
      x86_64 |                      vlc-2.1.6 | TIM | http://autobuild.buildroot.net/results/b0a7e72cbc96e6f170ab298c8f97288ac5b5bb0c/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/018391c5e70d33bc0b5745ad7a2a273efa9be0d7/
      x86_64 |                wvstreams-4.6.1 | TIM | http://autobuild.buildroot.net/results/d31ae1faf76434a2ff567a9af0de8394f792b746/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/394cf96cc0ab9029e5baa84b19e2b4d7a553f077/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/163a612b52b3ad9a0897ff8973e6ff051ac8df1d/


-- 
http://autobuild.buildroot.net
