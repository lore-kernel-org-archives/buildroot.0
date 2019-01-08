From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  8 Jan 2019 08:00:31 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-07
Message-ID: <20190108070031.18E0E209BC@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  32 |   4 |   0 |  36 |
   2018.11.x |  30 |   1 |   0 |  31 |
      master | 207 |  75 |   3 | 285 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
       host-libunistring-0.9.7 | 1 
                  libftdi1-1.4 | 1 
          motion-release-4.1.1 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/613fe2a1f2990dfb9c964d2efb721ae724c2e1dd |     
         arm |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/cf1f6df4ff22a558facf2a36aa79f79d2cdcc214 |     
    mips64el |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/699c9f577fb7fb9fd19d59ac0cc70cbcda98a019 |     
        i686 |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/df62aab586ac55070d06532d78ed97b16cdafdd5 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.68.0 | 1 


Detail of failures
------------------

    mips64el |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/09fefe51afe29b5eaef055d335834e845330faf9 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 24
        glib-networking-2.56.1 | 7 
                    atk-2.30.0 | 5 
                   strace-4.26 | 4 
         libcpprestsdk-v2.10.8 | 3 
   libtorrent-rasterbar-1.1.11 | 3 
                  libssh-0.8.6 | 2 
                 mesa3d-18.3.1 | 2 
                   netsurf-3.8 | 2 
                qt5base-5.11.3 | 2 
             stress-ng-0.09.47 | 2 
                  brotli-1.0.7 | 1 
                 dmalloc-5.5.2 | 1 
           docker-cli-v18.09.0 | 1 
                  flare-engine | 1 
             gnuradio-3.7.13.3 | 1 
             host-grpc-v1.16.1 | 1 
                host-libsodium | 1 
          host-mono-5.14.0.177 | 1 
           host-protobuf-3.6.0 | 1 
                  libftdi1-1.4 | 1 
                      libgpgme | 1 
                 minizip-2.5.3 | 1 
                         msmtp | 1 
                          opus | 1 
                     pcre-8.42 | 1 
           php-memcached-3.0.3 | 1 
                php-ssh2-1.1.2 | 1 
                        prboom | 1 
          shairport-sync-3.2.1 | 1 
              swupdate-2018.11 | 1 
               wireshark-2.6.5 | 1 
                wolfssl-3.15.5 | 1 


Detail of failures
------------------

         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/c9781ab6d5ef4072eff77d053029cfa2617a29ae | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/1dd7ec0b43542933a5cf65835e96e87c18236bfa | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/ec766d6103ee4436d5b45e53631080c50257d26e | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/6cedbea83485c38f7e6f90d45405f4f8b1e1c574 | ORPH
        i586 |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/9e3f376e8ff72f7779a0d4f6c0d3a3190a9ee65d | ORPH
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/7200908887729a29b71b5775063ae288abe08742 |     
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/490c72335c03a2fa7775707d653238080e9b63f6 | ORPH
         arm |            docker-cli-v18.09.0 | NOK | http://autobuild.buildroot.net/results/d51888a6a8741561f3a98c629c0960339537879b |     
         arc |                   flare-engine | NOK | http://autobuild.buildroot.net/results/a7a0a76a9f5d668e9435e82cde46700c7e2ae387 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/02f8be069564b24d7f3d679998ce9d22b17e7552 |     
     riscv64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/dcd8d6b5b445fa8f64b6262ede268ed30f78e2c1 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/4d6dff758af8594f185217817a1ceac8bf853de3 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/efb8a4e19afb129fe638b4f6a855fa1d65adf3df |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/85b8c673033109dc6eef5906389cac417efe2332 |     
        i686 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/1974c25f6d0d2382a407419380e418f11d6a7888 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/55496a79c53f7b1c12b575f7b4675b8dd9a1938a |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d1076f4e4ed323404d5381a3b19cdeff33204b66 |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/aca2cbb3f51171f15eba0893a60b0c81a48cd2b4 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/c78c0fab4006393778265a0d3fb55460e76ccff1 |     
        i686 |           host-mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/c6201ac28b4635dbdb2f71dba8184a3a14e9f1d9 |     
        or1k |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/d593e1e3e42f41c97a87ae4f9ccaf67d004dec06 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/9085cbcc417aec1aeee7a317a32a0c4e5d7bb6d9 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/11dd728a9b8568379550a0a27ef2476aecdf1eaa |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/cbba6c5a79f03823db1227daaced6a9fc2a0f4b0 |     
         arc |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/2e9a707f18114c134c1d98c1cca280fa7ddd9b47 |     
         arm |                       libgpgme | NOK | http://autobuild.buildroot.net/results/067a094592393107498b7b3b1f611119ba92ca7f |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/f598bac1df83fdb40919357500ba52b7b1b1c19f |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/019bd7e2896ae4e05d57a2faa876697f6a2fefca |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/8672084f0e92252720aefb713e4fa8303d95c338 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/8c53cd228e26df1033ffab73d21d510b7dfb07be |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/128d5663434581372689a73089d9975c6ce3a167 |     
         sh4 |                  mesa3d-18.3.1 | NOK | http://autobuild.buildroot.net/results/7dbc0ddda8119908fc644589f8cc695c98d47ace |     
         sh4 |                  mesa3d-18.3.1 | NOK | http://autobuild.buildroot.net/results/11961189823d6724ab03f80c28fbdabf5a84e582 |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/9087257613fb9a00cc4dc714247b9108a3bd1dde |     
microblazeel |                          msmtp | NOK | http://autobuild.buildroot.net/results/2dfcea0ff07e13cb736897d66be385b7ff9fdbbe |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a292054081e4e6b5c78ff216d47c735523c0c2b7 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b4de8cdc45a51795c1db422066edc3930e5861d1 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/a8a9cd0ca36788313446f40ae18be64edc75fb29 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/7ed5e3cb6774de2b266f1052cf47e7cb64be9b45 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/a425891a8975360895a14963f50d345a7d14887b | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/fe397edb1a721f968357c47a72d3e8a32dc0d1d4 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c618a599ff5a7972cfa0bff5ff8a31381e4d38af | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3fe4d1f7a9a44390bfd39cec8b335630ced3d24d | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f1710e0a612523748f10a64ef7d5039a8f7a3e58 | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/dc49612d3165a16c53054401eed5e04277e1fe22 | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/53bae19123d328af44e797ce12cf03185a51b3c8 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/557ac86d7ad5e55a21af666621f673f46c9da9a4 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/11603b7b5289ae686199bcae296e8ec9f21da350 | ORPH
       sparc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/570d01e31c1e6ef7be4e605ea736916f7f83662a | ORPH
   powerpc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/a10483aa822a9ad9fb9d44e84dead9a27ef987d1 | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/623700a565e4f6f4fb3e3406c3225dfbbbb67a68 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/a1367a18f2b5c71cd34f6be0b6028de97bea47bb | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/6af2083af0947159ba4001023acfdd8014d6af4c | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8e949b5bdce77c96ac091e554966086e92fb3696 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/cc9d7c426126d53a3efebb9ca5df5fcfbdaa7ec3 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/22598284a49d31fca8dfb6a5ca7511dd05c76112 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/e7baafb043601bc1b8bf9a719460375f05096920 | ORPH
         sh4 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/5ccfb8583d548885175dc1499518674f8f4c19d0 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8610e41fddb44e47284e6d4a9c8faddf397ffa22 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/899a46a084c92abd79162b9e85b25a95da665cb9 | ORPH
        i586 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c8c62c51860b2362762f23b61cbad2e1a01ede72 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3e7f865363be6276b7bd3bfb3e296b89168b6d32 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/5010614d17adbec9d9264d009752ba87b34254aa | ORPH
         arc |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/5f0b377aaf9b1085c4d30f229818f32e3d9bdc4b | ORPH
         arm |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/83c65f293ba9a6ae6c2880f98cfd5fc32db71e3b | ORPH
microblazeel |                         prboom | TIM | http://autobuild.buildroot.net/results/e72a2070ab7e9a093c3c70002ee94ee57a6154f6 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/16c8ad2bc7e0dc4fccc405a9c628645daf9a07df |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/526dbd3cc474781b284357ee349a8d63cc344b2f |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/c20f526761df89a1d00d946c080bb9e7265511d0 |     
        m68k |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/74711084a54dfc17ad0d4d1e5faabf6d8a605dca |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/de1aa73827d6625e99954b67a9a05c1ba2bbb920 |     
      mipsel |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/0313245fe555e0c0890c3f475bf6586db23535ed |     
         arm |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/4a0e2872b27be93f73137c7550eae1c1f479c160 |     
      x86_64 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/f99722848a3c012e18ee6daf2ec8d1d276e4ea4b |     
         sh4 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/b99639a416b7be6aab454896b6074478d8da1011 |     
microblazeel |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/759eacc77d408a3bfdd0759e9016d603fb8b4594 |     
         arm |                wireshark-2.6.5 | NOK | http://autobuild.buildroot.net/results/6308c20a1c3c6cd3f6775eeaff1db56cc9c5d094 | ORPH
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/5fede277eafb9e12ea1974536276d6a52fdeb34a |     


-- 
http://autobuild.buildroot.net
