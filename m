From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Dec 2014 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-17
Message-ID: <20141218073018.1A028101076@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-17
===============================

        success : 290
       failures : 123
       timeouts : 3  
          TOTAL : 416

Classification of failures by reason
====================================

                   erlang-17.4 | 21
               xfsprogs-3.1.11 | 20
                  boost-1.56.0 | 18
                  guile-2.0.11 | 12
                pinentry-0.9.0 | 7 
                  libdnet-1.11 | 5 
             libxmlrpc-1.25.26 | 4 
              host-scons-2.3.0 | 4 
                    libcgi-1.0 | 4 
                    vtun-3.0.3 | 3 
               ipmitool-1.8.14 | 3 
           python-pyzmq-14.3.1 | 2 
                  nftables-0.4 | 1 
       opentyrian-2.1.20130907 | 1 
               qt5webkit-5.3.2 | 1 
                     rpm-5.2.0 | 1 
             smartmontools-6.3 | 1 
tvheadend-388f57ecc32a3b631... | 1 
                     gdb-7.7.1 | 1 
               libcap-ng-0.7.4 | 1 
                  zeromq-4.0.5 | 1 
                genromfs-0.5.2 | 1 
                  perl-gd-2.53 | 1 
                 libjson-7.6.1 | 1 
                   ezxml-0.8.6 | 1 
                  usbredir-0.6 | 1 
                xapp_xfs-1.1.4 | 1 
freerdp-440916eae2e07463912... | 1 
                  sispmctl-3.1 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                    strace-4.9 | 1 
           libmemcached-1.0.18 | 1 
            gst-ffmpeg-0.10.13 | 1 
                   lame-3.99.5 | 1 
             bluez5_utils-5.25 | 1 

Detail of failures
===================

        i686 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/4f2c1dc2d8eba3968deaa74a832475651e75e861/
     powerpc |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/3435a6b6883649f8781f125ca2517f4b3fdaf2ed/
         sh4 |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/6f5d9b7db1161c5b9ad29a92e2fd2beb43e35628/
    mips64el |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/4cf429f242792b2a82d1833169323f652e2cdf1a/
      x86_64 |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/c05dad9ec67e13163dd5f0679a412dad891c990c/
        mips |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/0b6812874239d3e8855415576bddaaa9eec149b8/
      x86_64 |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/3f1e9f9f329480ab64fda9e1c1280d8ff5885c2b/
         arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/bab3b9997f6fe5f784bf5430581e09a702b198dd/
      mipsel |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/eeca1a9ae65807f4b5982b8cd46db116441c9917/
      x86_64 |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/e5f72b8bd068b58b0ea0e5656456078b18e8d91f/
         sh4 |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/ea9778986eb5766f43bd8594bdd540ae554a598c/
        i686 |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/a52abd75c5066b2597bca8c5f498951442f55455/
      xtensa |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/ee99d2997046cc736d372203b0139a9badf1b9d2/
    mips64el |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/9ff6f240f86a172f5b637d96a82ab2abf8707c4a/
        sh4a |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/bc0ebac17a8a9c98c5b9e95d74a57b0b186af047/
    mips64el |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/60386928e31f8a2410f02799c8d900873a69231b/
        bfin |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/1d10dac19802313e414d6de84749006f6c72fc25/
      mipsel |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/f761dec9754da65194322ee76f7d18b80396d85b/
     powerpc |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/834b769ab512fef2b45d4a0d90578786e96d7297/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3499d688dcb699345cf150bfe4f44ef5a91bd3c4/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/cf45d27def483e5c5e544bf6356cbdfab8cf1660/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/c60ecd12c65b48087fc90937e1085a0153aa7bbd/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/dfe001e0378ad706a7454fc5031a93e2fe26e35e/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/900fd4f7c5f73b1b052d7af962b1232b36e0d20d/
        i486 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/ace5a43241222e07ab0c908cff8a85ef7b78ac24/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/6f745877c1bf3b0b8e4f779bd6706dcbdec1a46b/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/99241edf5d83d23598ff79b06a8729ee4cec7ee2/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/675f88431c30b5b93d84b04dcaad98d28e08eeb6/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/209db6d5801a0644e99bae05ee46483e5e19abb6/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/c946c3596f1c9bc37d92e637c32cc8a013c41342/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/826812034188c130f529338e2179e5f73e029bde/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3bef7450c3e56be7f644d29330cd262763a4079f/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/389bbf365eabe20bd5583f2fa0701fd2b8cbd1af/
        i686 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/aa7efc1c656ae3da48c5b3886cf03d3bfee727d9/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/9b6be08c8f1e4501bddffffc10eb96e4bdcad490/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/1896b706be4745663b57b3f581178a97b0931e04/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/10d46670a6c856fae09759cbcfd9bdf51a39a1b9/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3c62ee995465958e5581020d586a02b1d238b05c/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2bd1a58a9a0a7a95639585c6284ac8af0bdce9de/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/0b57beb7293b529ee8297610187f8ab66f6d6964/
        bfin |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/8047c1ab1049eb49d314328c0a1e5819414191ef/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/59718927b4c7d80ed572efc852dc258521fb6e65/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/a0e70458ac2af157c83201494c0cdcc52f67a416/
      x86_64 |                 genromfs-0.5.2 | NOK | http://autobuild.buildroot.net/results/e8d8506321211e866fe489720b781672407d3ea1/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/3c313f6d3d4b34c0dd2c06fc0e06f97af3bf54b9/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8167274b68592898a455a5d642acd6f2ae8462aa/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b050132f26be800b5d03f9583dc12c94c29de15b/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c3c45f32b2e2662425d975d73e0326fff84167c8/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a4ae2582b02ce539c92386ff02cb91270469383f/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/9e99ee7d64dff98b8c18b202b07cc65e4c034b84/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/93a308a36e2341e91b073cc4f40a7af0ad84b452/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6221b34ca202694236b125304f72b766055d634b/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1be07c5c5dd0f3f204eae7d058f87875eea00fbf/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/fe0424fbf15759926a3b15996534eea57d165c79/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a3f624551346143fcef820f44812cca2e565502a/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f8f063fc0215baa0f298187d474ebc9a85cedf89/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2a2c22f841e39dd83067d3d101e734b0f6490afc/
         arc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/1751c8c3099956046b5813f83fead1476c7b52b3/
        i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/bd131f8cceed47b1163a752165a463add6bde358/
         arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/c1f012a2f072f8f19b4717c8b19f0285205ded37/
        mips |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/876aff2bc8fedf0ffdd724ab7e21ed27a6718d5c/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/ab255c93ccbad9d9d4540139d6769afbeb1de204/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/1c52ee9097eace330645686a76690f90d08ef7df/
     powerpc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/215b196b20644789c3fcef88ca35130979d6056a/
         arc |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/6bc7b5ef1e81d76c5a524dc174e5a97878c6e05e/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/a534a38d6b150ecec0c06e9ad56aa4cb99ff5184/
         arc |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/aac3066791706c4acf9e47530ca6adb5293bc336/
         arm |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/2ac2387134844b161af7a8aeafacb1ec643e12c2/
        i686 |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/65a9d022eacd71c7d5c1a5dddab34cc710eac924/
         sh4 |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/94571aeab0615eaa338ab668d8dd4e590fa3a26d/
      mipsel |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/b0dab4fdbe8e3898c6aada08430c63fcf4a93d91/
        mips |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/61e305c99c88eef874aa90f401b7a2ab9cf632f9/
         arm |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/6f6db97e7a79bf0399b9ebc398c1e54d51a73598/
        bfin |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/8264f1f0378462e30f38a4595d430eaa1f2fcbfd/
         arm |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/794247f9164345ceeea3909f78462b67b47c39cb/
     powerpc |                  libjson-7.6.1 | NOK | http://autobuild.buildroot.net/results/4d52c009c1643fc242d9d8955b37828ac530b7d3/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b039f2c1436eb11da1914aaa72443cc7f5f68dc8/
      xtensa |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/aa130c8ff364050b72b0fb9041929f72515f2f8e/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/40837adc4b7e9987aa5110186d1289524337b260/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/20276c66f65923dbbec9edd3a708d4f151c30f1c/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/6d8276de58e242e6dd1b68effceeb6bce5c2f033/
        bfin |                   nftables-0.4 | NOK | http://autobuild.buildroot.net/results/cbed9f008a62b0e94cc7c4464884bb98b3e1875c/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/a637bae4fca88a4146109854084335634301f19a/
        sh4a |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/647cff89b436ebb5efafb6ba718578a40fb4a633/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/d03dafa796ef6e84e89bc47bd2fef2848cea267b/
        i686 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/42c57e1dc5f5f34c985b5b8f5bca338e84cd7c47/
    mips64el |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/c1a592548c21c1e6d45fe7473eed76c73028a02d/
      xtensa |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/36beb6928807047d1494155287cffc1f1ce31d6d/
        i686 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/872648d11ac1af878673463894c2b8bc81c24da5/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/a9b85f0a6129fb7fab0cf51933c4787254ebe00f/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/dce1407ac1a267f212cce21818b59bbc6991b7f3/
      xtensa |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/d74dbff13647412000ab243401e4a03df7871926/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/e4a4195753b98134341a7d83628ddfb923ab4e77/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/a05f1cb9e6a1dc41afd257935fe7889bce12481b/
      xtensa |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/056adac2de477913a00814dde63c322da4146551/
     aarch64 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/dd3eb90e672f6ee02c74b49c8a081f6eec736451/
      x86_64 |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/0b8ca1d56e9219a1efa7d25fa40b7ea775082a96/
        sh4a |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/f050e9eff77cc2c2d6e077c320d0a0faca5700ff/
     powerpc | tvheadend-388f57ecc32a3b631... | TIM | http://autobuild.buildroot.net/results/37173cc95b7fa1165712951ae4041bdc5356e7a6/
microblazeel |                   usbredir-0.6 | TIM | http://autobuild.buildroot.net/results/f33fb2fe7806637a8b95b9bfc426fda2cd592b02/
      xtensa |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/55a8ad8d0b848993a33a274a1b0c03aa47b42574/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/ec0ae60d5c7deb179835f302c2f94342f5e61b5e/
     powerpc |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/5b76c815e1200a5efe2d144161f105218ad0142d/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/eed1bc60cab6bc27da9c4d796fb25876a54a774d/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/0ae0e0ea1993ff55c0b1ee3e6436464f0aa69b01/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/79f9c51175d1a90a823bb65950bffd894a79d04b/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/a54bd5a71dbffd5e7e0c6c243b973df93755c1c2/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/ded9bf350747a2c4602fb8e8a9718deb9235be8e/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/c09e05bf245a70c49eb0f8f82701ddbb0d864c4d/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/449a4caf2852b3079620c49192f015a60beb9c6e/
     aarch64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/64cdde42fb877b4462d4366094d1dac85f38660e/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/d16fc949cb9e9ec8638642948d202a88215a2e64/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/5d3d62a416ca051c8df538acf46db992426dc1c1/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/96caf6a0f8e447923999d047c739705c64ac1d99/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/a72fd57aeaf1424cd5ba4d55d68ef15820b7062e/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/d53d21f165e69e4d6b03c6a3b8ab8c674dda4551/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/7eacf17de0672e538ff7b459fac649c504707faf/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/14a0d506beed657ffcc7a28a611cd895bffe049b/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/b9d688603e5abf0ad7602be0d2ec7a620c46e581/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/4f4949e06bce729514b67ab9b3a14606c37a1a56/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/68d355b4771c56226e59f4b7e8ee48e04de02ecd/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/f885f180e2a5a7843595a1dd4f3f8a584b35d92d/
     aarch64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/327d8b025d40861c6134dbc0fd86beb3d4379f89/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/d14b0789a0d3301388fd28563437db496358ddbb/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/5a902fb086ff0a176fac563512bf69600aff29c7/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/9090dd37af7367a8d07f51291017a6ce4fcb8029/


-- 
http://autobuild.buildroot.net
