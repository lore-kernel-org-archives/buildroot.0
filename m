From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 Nov 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-06
Message-ID: <20141107073016.0C55F1018AC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-06
===============================

        success : 216
       failures : 77 
       timeouts : 2  
          TOTAL : 295

Classification of failures by reason
====================================

                 schifra-0.0.1 | 19
      dovecot-pigeonhole-0.4.6 | 5 
           libmemcached-1.0.18 | 5 
        host-gdk-pixbuf-2.30.8 | 5 
                    urg-0.8.18 | 4 
                 rt-tests-0.83 | 3 
                  zeromq-4.0.4 | 2 
          shairport-sync-2.1.8 | 2 
               alsa-lib-1.0.28 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
                 webkit-1.11.5 | 1 
ltrace-0896ce554f80afdcba81... | 1 
                   atftp-0.7.1 | 1 
                 fio-fio-2.1.4 | 1 
            host-heimdal-1.5.3 | 1 
                elfutils-0.155 | 1 
                  prboom-2.5.0 | 1 
               mpdecimal-2.4.0 | 1 
            mesa3d-demos-8.2.0 | 1 
                   lame-3.99.5 | 1 
                     rpm-5.2.0 | 1 
              sqlcipher-v3.2.0 | 1 
libwebsockets-v1.3-chrome37... | 1 
                  nftables-0.3 | 1 
                   libcap-2.24 | 1 
                  libv4l-1.6.0 | 1 
          libmicrohttpd-0.9.38 | 1 
             host-mysql-5.1.73 | 1 
                   systemd-216 | 1 
                libcurl-7.39.0 | 1 
                    ola-0.8.33 | 1 
                  tstools-1_11 | 1 
                     radvd-2.8 | 1 
                 clamav-0.98.4 | 1 
                directfb-1.6.3 | 1 
                      bmon-3.5 | 1 
                  python-2.7.8 | 1 
                  thrift-0.9.1 | 1 
                      qt-4.8.6 | 1 
             alsa-utils-1.0.28 | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/06e8313b5e7ba0446131409c6ce66e6f5713e563/
        i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/dc14734d22e52887b1bcee7b010c6e64e0d5075a/
      x86_64 |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/894711b6db621d505175ca8b943602af0ecce2e0/
      x86_64 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/7d1fd5603975c03a40a1a35fe18da4258ea995aa/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/f697747dcddfa7fd00832ce1c0574c5b5d0d042d/
         arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/d37fadcb204c3ad9bce9be2a1f46c49d1b265355/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/63930d6f8b24ecb8e625d658217a54f72fc5e1a8/
microblazeel |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/172365acadef472bcb1f373ad981da7a3c1976ee/
         arm |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/fd18c3678eded431476b4e61a10c48e160ffd51a/
         arm |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/88214d7d34b267f49205e6e05b3e6312dae5d474/
         arm |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/bd37ee92eeb00adb1558dbb61315465a0cdfe635/
         arm |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/e1497d101e4fb844816ea734bdd94fad5d9e1d27/
     powerpc |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/fbbc01e5ee575a40bc43239bc307ccf52b70e84a/
         arc |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/c05b411b58ba60371354ef1896818eb382e52edc/
     powerpc |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/b282b7e7a9e3e5a8334d593be9092746509d4702/
         arm |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/657c2a549da8b5799dfc0c36445d901dd9e8978d/
      xtensa |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/ab726bd82bba2a0ff979a69748200d3bd8d4c06d/
         arm |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/dee288268d81cc19fe685b32d68036b596af260e/
         arm |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/3ddcb4f8019d7e2203fc2487035111efe1be5a41/
     aarch64 |             host-heimdal-1.5.3 | NOK | http://autobuild.buildroot.net/results/8477ac6dadd54c88c5e46f05e6b3c3fab2a7cfba/
         arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/f42f2ab06c92fae53e1dda577ad5541f2d0b5000/
microblazeel |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/2ec23fcfe13d7b4c9dcc639212c5a9b09a3d38db/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8648115d97cff53c5c827be01546e3009b0e8158/
        bfin |                 libcurl-7.39.0 | NOK | http://autobuild.buildroot.net/results/69710a04a8574e00aad1c66b98cd6fe5ad6cd12f/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/21252d39c9d6ee3ad53e37334d28f582f8f0ebe2/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/caf92fa095f0cc66c951fa3d5a8f33d2d973eb43/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/44aa48310cb9639ba79d92b143ab0d7383e58b5b/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/4b7e242c5072bb39d75fdac1e322ce510ee14bca/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a519105e2f41e3b97f69a0372509ed60f718b87a/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/4e530463482bd58ce09c4558a986bda115588c2c/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/8e6b2926f379f8405a8adc892c2ad6041fb69ebe/
         arm | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/9221b4967d069c9b634cb1f98ead193593d22dbc/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/0ca564101b870e5953acb66ac832ce9e23198392/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/8f292f1151089d20f33c599320941cb5435c0199/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/40740c4531a756ee2b863f41bbe9a564ec511636/
        bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/5a2485a76836590db85b4f5fa4d0c7923fd8829a/
      mipsel |                     ola-0.8.33 | TIM | http://autobuild.buildroot.net/results/edb374fba996973c21b7b4ed13d5d07c457793a0/
     powerpc |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/d99f4609a3d6d3c0eec78b9cb42fa172b511ecf8/
     powerpc |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/27b8ac2a4c198d0aa8913080a531489cadc18b93/
        i686 |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/c7a292fa46b00075199e2b2f013920fc5c1db29f/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/d5f674a9227e2fac1718a37eba424f98e5c891b6/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/90feea5ddc4aacd323acaf70c4c531e8cbe72055/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/445bbbb0e6370cc2d1caf4ca66f59b8441f9dcda/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/88b67de17d7059b2aeb41c483e4c275e5d2f2ee1/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e6cb3215fcefd76805abee98b277b810366e456c/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6611c43f1cdd0e0f63fbbc77c6cbf1b4fd054f3f/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/71fb8ea1861d25d8d81cf242b0ed080ee684b8c3/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/1de3d7857cafeb3a08caaf5dd0ad45cab3c47031/
         arc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/03221a4a6b400f59d1f887543d2144c6a46674b4/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/49ef372dbfb7dd7e781cff80f4529ec2b4e66abd/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/25413a27467dd65edc514b0c188f5e71ead96028/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/203fb377831f0757e8eb0b55b52db67153cf9b28/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b706d6c86904c4df6c75f726b57e6d407d4d5abe/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/3d82d186c9e35a951f3be47341ce3ca6e4a2538b/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/0239f36fd48100e26dda0c156aadbc6f37392344/
        mips |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/2a2a8f35f77652e192f7c7085490b46239000145/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/e10c4f54d9aa2b08d102f36ea2313876890a152f/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/61a1d53e01c9575cc4e2d52c66a79a7abbbb9b19/
      xtensa |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/cfa161bab2a259653656eeb5eb81be3710430cee/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/1a13a2a79302ac6b2195f712db2449893d491488/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/cf1b8c3726042c7d87e9ed4b71bd5cf002cc1327/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/eef9bc362f2a3f1f3ca7e350c6af3ec284ee2afd/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/83681135e5101a55f3d51101cb00503f46fb691a/
      mipsel |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/f11e90c640c4d3f140ea18c851e450a49219a1e7/
      x86_64 |           shairport-sync-2.1.8 | NOK | http://autobuild.buildroot.net/results/28e268a9de9b9c71a51097e6ad9f4da533dcae54/
         arm |           shairport-sync-2.1.8 | NOK | http://autobuild.buildroot.net/results/513fc9d66b823e154264c9db97dd6e6fa9dfbf7e/
        bfin |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/ad8dcafec0fbd6bd39f8ce26ddd831cf1f9cd7e7/
        mips |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/5764a0f71b5678701c2d4e4bd37516d8aae06f6b/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/95a1c00430235f4ef6c20c12a28b97a840889e58/
    mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e4ee0ae40ac9d58b3182db52d5a39e6ac3692f60/
      x86_64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/687cbd35c3c0ff42fac7b7278b90ea27579b5fbf/
      mipsel |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/c3daf1301e5d79442851752fda5275d3c1fb9da6/
      x86_64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/7f764c6ffd9dd5d3483ce963051208eae88e3739/
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/1a46ff4e36a3616fd68c146b766d594aaa4850b6/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/37fee290171ede86bf19b52d5c863a392dc5a00b/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/12993fc7586e1186a3fd2773982eb5d87172b80e/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/155ac6b85a6df9493fc845f30b339e3d3c31ae1e/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/d5cc0574e08f092d5c9c909c82d0341c0842b2a3/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/ed49acc0a105f4d4effa8e7fcee2d9a9ad8ad4bd/


-- 
http://autobuild.buildroot.net
