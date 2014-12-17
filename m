From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Dec 2014 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-16
Message-ID: <20141217073016.930AA1014FC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-16
===============================

        success : 278
       failures : 136
       timeouts : 1  
          TOTAL : 415

Classification of failures by reason
====================================

                   erlang-17.4 | 23
               xfsprogs-3.1.11 | 21
                  guile-2.0.11 | 12
             libxmlrpc-1.25.26 | 10
                pinentry-0.9.0 | 7 
                  perl-gd-2.53 | 6 
freerdp-440916eae2e07463912... | 4 
                gptfdisk-0.8.6 | 3 
                  boost-1.56.0 | 3 
                     gdb-7.7.1 | 3 
              host-swig-2.0.12 | 2 
                  libdnet-1.11 | 2 
                  thrift-0.9.2 | 2 
           libmemcached-1.0.18 | 2 
                  sispmctl-3.1 | 2 
                libexif-0.6.21 | 2 
                    strace-4.9 | 2 
                   iperf-2.0.5 | 2 
                     radvd-2.8 | 1 
                   ezxml-0.8.6 | 1 
             libid3tag-0.15.1b | 1 
              host-scons-2.3.0 | 1 
            host-omniorb-4.2.0 | 1 
  toolchain-external-undefined | 1 
                 libsoxr-0.1.1 | 1 
                genromfs-0.5.2 | 1 
                     vlc-2.1.5 | 1 
                apr-util-1.5.4 | 1 
               ipmitool-1.8.14 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                  cppcms-1.0.4 | 1 
              jpeg-turbo-1.3.1 | 1 
             smartmontools-6.3 | 1 
        gst1-plugins-bad-1.4.4 | 1 
                    libcgi-1.0 | 1 
                      qt-4.8.6 | 1 
               libcap-ng-0.7.4 | 1 
       directfb-examples-1.6.0 | 1 
       opentyrian-2.1.20130907 | 1 
              wireshark-1.12.2 | 1 
                  fan-ctrl-1.3 | 1 
                    vtun-3.0.3 | 1 
             fontconfig-2.11.1 | 1 
                    fltk-1.3.2 | 1 
                  readline-6.3 | 1 
             util-linux-2.25.2 | 1 
                 libjson-7.6.1 | 1 

Detail of failures
===================

    mips64el |                 apr-util-1.5.4 | NOK | http://autobuild.buildroot.net/results/6a915e5053e3a66dbf2e88a3befd317d9c36dcb4/
        i686 |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/d706534a8de2caf80733ddcdd97ceb74c693d4c4/
         arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/4740fea24ce80d591b2ad35c9f19738556e76fe1/
     powerpc |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/680d318904946617604192b82d41259d897f0989/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/2713acccb33aff05ca5b1f856e6032f5877d8c73/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/d4769f8dc73f90366466140e95fe1d13b5c616d9/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2b3b10e739583acd9b87f8c4d8de25af7f453a92/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/8eaceefd44c646c9e50322af5d815e0216c17bad/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/561d0fe4821dee5d3e1ee9788b8df5443f51f245/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/bf52b68a9bc7753809aab6eb9e91a108a3a62df9/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/a1523cc3e0b7c2e22b77158dd7a96c5c032a5b80/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/c27f7b6674d487d7902a0f78a4bb98d95b628cde/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/47d8645000db6a10d1bc6a5a293f4d360f67be8e/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3682432cf53f70f629819afa40becb702625740a/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/67f565b949acdbd2ed97bfd71a310084de31975f/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/dd3d57298f46ee20a87faea4f2025295c1060699/
     aarch64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/de97a7acd6c984ae93541d6921a7ba52c8942baa/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/20ce4df88b7a5d52c8ab1538de566e5a0c921250/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/f2bd338fe06da4cab1e461ff28bf9b3151477cf8/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e3e623bcba2cef101d2e351eedec99cbd8da34d4/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/38c0a133033c78e32530b56a9c2df90d8e25751e/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/f51252130ac1881ceb0c039dd73e5bbef80dcf46/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/c16fb1b373a921a83cb3048f6d0bfde75ca5664e/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/0d1e4c7d0438782bdefb7740ee720d23c6f06153/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/41595760990255828f15c1ecad58b2803e95e1eb/
        i486 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/5844ae12d600c5408600fbda5516d74c099f2e34/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2ea801dd0a3c396ed32ecc74f1b213dbb7b4e8e7/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/26e36821a507ac839330e45aa48e3268639917e1/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/282e478feda204131bb2817638f26ce217dac32d/
     powerpc |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/e0c399d7f2cd836eb110146ca2cbcb4bc0329ec8/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/1014d43f25086463d4c3dabf9dc15720758ce97f/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/75a919bd1cf6c49a02b850d6c40022d6c5c3e40e/
      x86_64 |              fontconfig-2.11.1 | NOK | http://autobuild.buildroot.net/results/e1286aaafaa057b54c787369b05823b33f704b89/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/6e6652930a8a7cfd853fe1868a9b41af3bbedd53/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/43581c73b3b5e6d3691370cba78b6158f83ece71/
     aarch64 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/24e0f84e542b51cdc70a70cce4ea86c1dd18643a/
     aarch64 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/013f02109141b7daa66b129fff2469a57f528d88/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/7adb0aea4a7538d0cda75e22c892f38a88edcfaa/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/c7e4a8633abe13f0ce82ee84bdfe57cbb85f1518/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/a93eaf379d411608812cad7cb1bc161baa43d275/
         arm |                 genromfs-0.5.2 | NOK | http://autobuild.buildroot.net/results/a47b11cb56f9e5eb3f0a164a45d35fb717cff92c/
      x86_64 |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/6ad7fe1e4a80bb6c74f3f11f8955615d6832507d/
    mips64el |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/41e93415757e1e79e88976be0590acfb873d483a/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/4f49a679bf2212e9b969c8677a0b701875861ead/
     powerpc |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/63e4bb19b277412c453a8ff73f009fb7412993a6/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/4ac176be67d476689021b5a5e9611558d8b0dfa5/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f6980006f41ef2b103945abe6cc7ad8d300f28bc/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/4d4e0876f323fbb47e50f6f0e69bdb4469094ec7/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1745e973292d664490be1ab72fd014fd2cde8223/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/266a9a6787a6cfe5db40f972df96d7c754a5a52d/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/24d95d84f7df70ea6ceaa78604e45344cfba86a0/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/4090beb8443e68bcc3fb782b2960a0d0d30da42a/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/85fa2bccbde90dcac099a6e9eaca2fcce3f65893/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/be58894e7f19f628a4af87787aefbb150f89ea20/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/00b67b1fb22232704b8054220005008cea9dd528/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/33b63d8dcb3397d4c9ec397abcf825c6f529338f/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d83482ab23e6675d0a3e6ce48c94735cad8bde8e/
        bfin |             host-omniorb-4.2.0 | NOK | http://autobuild.buildroot.net/results/7b87eb362c25e5d4e32ba981e8b825aa9e8b2a63/
         arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/dc277621030b4ca8d8cb1f02e913a4468aa50be9/
         arm |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/819412341722d863ab6012fce3ec10528166d6ce/
         arm |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/6066959ca2d9ade2d52f463a885c4fbba284ea2b/
     powerpc |                    iperf-2.0.5 | NOK | http://autobuild.buildroot.net/results/8e39453cde79af1ca6e64d33fbb1b9183d8a6878/
      x86_64 |                    iperf-2.0.5 | NOK | http://autobuild.buildroot.net/results/533f8c9c93c3e905e7571d224b018f2152820ad3/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/1edca6c72e7153dd9292aa77da8ac488bb7d0558/
         arm |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/5b22c92e0110d85a62f8f03a30ba33d35105e268/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/a6a1906772757f50227fadc239e6e01e7509fac6/
      x86_64 |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/d0846df6061ac7f04016962a0d44426a1864c73f/
microblazeel |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/7eb5545c8eefbb01cf0c6285f8d60fa305ebc078/
    mips64el |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/e8e9d794f5138a3a242b9a133051b2c3921783ac/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/f30c64dd2a9b80412692a61a000ecb6a0a87b0c9/
    mips64el |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/9fba5bf086a4e7a29e5f7156ec43847db7aacfc4/
      x86_64 |              libid3tag-0.15.1b | NOK | http://autobuild.buildroot.net/results/df8cf23b792b9eb3df8360431a0d411d01074014/
        bfin |                  libjson-7.6.1 | NOK | http://autobuild.buildroot.net/results/9fda75dcf5bdad8a854b356d3ecdd4a00037faf3/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/729479617bed44fa0052eab7b2c67c1b38dc3690/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7b588ca68db1b2da2627f24cd9cb661b72aacfbe/
         arm |                  libsoxr-0.1.1 | NOK | http://autobuild.buildroot.net/results/48830d3702e4105fb34165d1aefedaa5cf2e6d25/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/86ea94695a3721f59b6c7e1e6be5ca443e29a1f1/
    mips64el |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/5f19f60462fc76f408b1387fa48e75921e445ad1/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/0c55b6d40913482127732bbdf5df76d19b6e6b07/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/6b032210b5860974298b6ac71c14eb1ebf4bf499/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/16bb6571aec26ff8c66d3c3ab58effef4650635b/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/2a874ed80b31797fbaf0e27b0537002fe6d4fd54/
      xtensa |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/1c478aca7fd3b3466aef245cc61bed6b497feea6/
microblazeel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/cc25c89f914eb6927f4e95ec24fbb1c90c9ce1ab/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/b033d7b4ca5f4cfcffdb7ec0b2bf03e6931f1be6/
         arc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/5d4147f0788d8d9fcab8d76002361418bdb545e1/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/bcef7ec0f3aa5e3b0293cd6107cee3de376d1202/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/8e94c60b77bfe002d2e79a4e356303d6c6e1c1d2/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/7afd29fb5a81dddebd7aaeb2ac03a4ad58979718/
        sh4a |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/25f086807ade4250ef2197eec1242e1e4a0ef6fc/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/e2589f193b29255efeaccc819c80c8562339eafe/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/5953b5e3b01c86d83cac05a21e9c41465efae05d/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/b94c1f07a47a9bbdf5e8941cdebabe7ae038e2b4/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/7a82a8101efd26f63a930227af2255509a4ffc75/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/1a3fce67dab4579bf4a8d3af3cb9fe359c529d6e/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/343faebef00f2d2adbf350bf1c4690540d7bf5f6/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/ecf39c9c659e7c299037033d0a478eef6c5ac29d/
    mips64el |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/942e9489f3ad68d1cc1742c4bd7bd0f89b8a2da6/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/92c921ba6e612d696c72f25dc4f4773123753331/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/a316f09db70b6a20ccad8e3e1df348760335a6d0/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/7464375079a576ed7256d5420488237ba0d37699/
         arm |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/8daafed00348b4498c7dfe2b34e060338b2f10eb/
microblazeel |                   readline-6.3 | NOK | http://autobuild.buildroot.net/results/2e2b525415c063bf4fb920b5af0fc976ad735dd1/
         sh4 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/af5780a0f070a1c33fbe6528769b25cbe9c0db29/
         arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/3eee3e5752d0816edb17dda1f50057c6ee732282/
         arm |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/b42e56b496121135c21516278e524c752d8c386c/
        i686 |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/0b258d19d5ac00f619220b7cd43be553f1d46ba4/
    mips64el |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/b0f668f4655835e8899d5d42b26acc472dcec9b3/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/e65876177d8483ac0f4d93b36bcb75b83b5a0f19/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/b120fccdb968cba302b04570df9e6c1d0a636fba/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/65771ac7ad1c7ada416824d0494bb2e9096e7892/
         arm |              util-linux-2.25.2 | NOK | http://autobuild.buildroot.net/results/3f90b83fc97aa6186b0fbde33adeea043a41916e/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/073dbf3ef74a9b06f4a8f4fcf996afd3d6cdad29/
microblazeel |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/e849e7683f71990b7889fb211c10f160bdc8dd7c/
         arm |               wireshark-1.12.2 | TIM | http://autobuild.buildroot.net/results/811b0ff9a82ee5a61439511d2bf4240507323147/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/7b04c8928724ee169840a4727b3e3ddb4daf39eb/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/7b4f979b2e33c91dfccbf7fc9ac03a9efc6bfa10/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/5840112d318992670a5d8319963e39bf21c59537/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e52d9fed12354b652d4bbc4245b9b2f3f4e88289/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/7775cd7e8df805c220ba5b8ea858e36617174973/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/0e9ebe7fc8e9707a334f1d7720f22348068aefda/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/befd2271c9c5fc75a49d378e6ad88844994909eb/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e2eef5dbadec555756a912a24978c78c0013ee70/
        sh4a |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/6a763ded12af4681563688dcd00d34006ee68206/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/139fa30756d35a24209136068c818802074908de/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/af17a443aed04680c48156100f6b880fc7a9e8e9/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/50676dc461193f313e4cf648d68c4e9875139b4a/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/c6f3e3c1b463bbb0c9bb6d2f42c8a79c60574dee/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/bb05756ddbe07e64c9d4430145b88cb2e310038e/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e36bfc80c9da7f8d3087159f2d8c0d39903f0897/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/08c4bc5037379a8ca312e3e7574067235da74030/
        sh4a |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/a80d95b0d880e131320ccb79b9dabbec92e17a3c/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/2b8429f33fbd506557e7bf51d75c619c6e09ad95/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e8d5babbf8d77a7da10c7dea71e9965cec13e845/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/2c4d6b726388272aa17ca5b11491653d4d6ea932/
     aarch64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/4568b29f9de1c81078dc28e7c5bdafdf198e6d7d/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/ccbe9989e2f838087fed549ca21fb46adc8a1b68/


-- 
http://autobuild.buildroot.net
