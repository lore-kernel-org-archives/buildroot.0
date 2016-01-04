From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-03
Message-ID: <20160104073021.9E9D3101466@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-03
===============================

        success : 201
       failures : 149
       timeouts : 1  
          TOTAL : 351

Classification of failures by reason
====================================

                  boost-1.60.0 | 22
               tpm-tools-1.3.8 | 20
                   assimp-v3.2 | 9 
                  libogg-1.3.2 | 6 
             host-boost-1.60.0 | 6 
                  libffi-3.2.1 | 5 
host-vboot-utils-bbdd62f9b0... | 5 
                  ffmpeg-2.8.4 | 3 
                   erlang-17.5 | 3 
                 opencv-2.4.10 | 3 
host-gdb-6be65fb56ea6694a92... | 3 
                      qt-4.8.7 | 3 
zbar-854a5d97059e395807091a... | 3 
            mongodb-legal-info | 3 
             lttng-tools-2.7.0 | 3 
          chocolate-doom-2.2.1 | 2 
                  prboom-2.5.0 | 2 
                moarvm-2015.10 | 2 
                bind-9.10.3-P2 | 2 
                  gamin-0.1.10 | 2 
flann-04b4a56533faf8c8228d0... | 2 
              rabbitmq-c-0.7.1 | 2 
                xcb-util-0.3.9 | 2 
canfestival-7740ac6fdedc23e... | 2 
                mono-4.2.1.102 | 2 
               libcap-ng-0.7.4 | 2 
           linux-zigbee-v0.3.1 | 1 
                 dropwatch-1.4 | 1 
 toolchain-external-legal-info | 1 
                nodejs-0.10.41 | 1 
                harfbuzz-1.1.2 | 1 
code/CMakeFiles/assimp.dir/... | 1 
                   libnss-3.21 | 1 
                  fbterm-1.7.0 | 1 
                grantlee-0.5.1 | 1 
             fxload-2008_10_13 | 1 
                   mp4v2-2.0.0 | 1 
                       unknown | 1 
libsigrok-fe473123ba836445d... | 1 
        ltp-testsuite-20150903 | 1 
                 x11vnc-0.9.13 | 1 
                mongodb-r3.2.0 | 1 
                   kexec-2.0.9 | 1 
                  connman-1.30 | 1 
                sysklogd-1.5.1 | 1 
              libraw1394-2.0.7 | 1 
                 setools-3.3.8 | 1 
            kodi-15.2-Isengard | 1 
             netbsd-queue-1.70 | 1 
                      time-1.7 | 1 
                libglew-1.13.0 | 1 
               libupnpp-0.13.1 | 1 
               linknx-0.0.1.32 | 1 
                      pv-1.5.7 | 1 
               dvbsnoop-1.4.50 | 1 
net-tools-3eb367aedf1280f35... | 1 
                    ofono-1.17 | 1 

Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/adcb7e6fe8325045f3105645f26ad1df067de93b/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a170a656d0b80bf739587e4066b5cf54b620331f/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/040b680d1336e095b0eadbe30a39adebf49bece0/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f2caac9429dfe171b196d09dfb57d6a650a410c2/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5791c83cd4334b1518aad974a5e5a3d67712a9fb/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/973817fb4f6c5d4a123f48957c539f4b71fea815/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/43efa8af85d573fa3252a66aa729c7c3c30c26b2/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4e0e355235faa78db387543058070653b32fc33f/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d9a2bd884b6eaba6d7d86546b8a83a1b81fc14f8/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/7cd5ccb764594617899e4c0860dd30e78a222fde/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/fd42ac653ff7660e26a23eaf1dfae19bbf044be9/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/80ae71c38f0102192d1724ece3755ec451433267/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/89c7a071599a3df953f5c3f7948c0d85bdb0ed15/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b61803f61e352bf8acc09878a7fc8c8503fbc3ac/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d349cce1b521407083670168947869750d82238b/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/434899c95c61fd4b97336cec1b0d8d7d4777fb1a/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f22f43d8306c725b2b8e2bdbcf5d5a27163d6119/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3e1ce9e3dc73c6d876b94cad8d5430033f1c4f60/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a2f7eae9142751a7ab157f2fa014759a6b0f9781/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/07de7d0dedbedae1a782daf629ce99c778593fef/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fe190c21a6f1b4e781a5e0d04d10706a855f939e/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/98fb0fdd021a1beb395011f4fd85570ecb02fcd6/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/358d5877b558f056a6965779a84de3065af59a68/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2538958be8265a2188ffc1f1fd73946578a1f764/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ed41b99deec65e94d8a75f9258d912eec1ef5355/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/01bb9dc1c516b8ab0a7ce5e26c3cbd5baffdc984/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/70b4074c1e23ba0e39ad4f56c2eb047f12608ba6/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/532200b27fd10691ad9a85654edb960b63bfc7d2/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d46e0e79aac6d88df9ada0788e948f0e9e3b222a/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6eca66a67a8dfbc0c0f1f4da84971c88ecfd7d4a/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/da3c52ffb20c6947914f9782e88e2d0a624fa06e/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9d3cfa0f745410cf435e1e00e3d7a594ac51a6cc/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/94088b92ae3ed482c5f685ee59b2256adb35a622/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/5a0c9a63c63406330c9078cda65fb9e8cf0ad64b/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/390333c29e4c78110be19e561c11ed0ce0f6ecc7/
         arc |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/f42b167c3551184c5453de46ef0932d9fc2c0d22/
         arc |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/cdf01cb78bfdaed58199d5ed28374063a8c38af6/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/a9780445e98ada73b26d7707b030fde098c7aeaf/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/d55a7bc376a7404bde9c6f9ea642269f33aa69bb/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/de7d01661e0d8d805786cff30d5027490962a7c0/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/1ede71d294058cd0b26eeee14a590575b49873cd/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/b26cd9fcc99e628b4166791bb44f3f1abdacd770/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/e185ee5374fff776266812ce22e37d5d4eab7233/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/0aed5b14e16ba996b13efd20c918d56a3fb432bc/
      x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/4a7f1293b6d08e0c434c00193583345c230f93fe/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/e6fed744d6874de7dd5040bc236cc076febe65e4/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/d691a81d04dba3aac017c5709fff13ce5abff1f4/
       sparc |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/3640e87a4ef3d18a1402208f9a6dda82df6f323f/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/da0e13ac7a7816e6e96d0282756ee01f9b6e4ce2/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/b4354d647933a502fc5b15f7cabcef2090212f20/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/b06d9fae77ac8fcb5ac5369501492ad3e1aea122/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/a1afa8daeaa2e8f5ab40fccb36c2b354415e1248/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/fd0bf316840ba3f6fbba44035d8fc222b2fee0df/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/bffcaf1cb9a29f8653611a3af9ae262ab830ccbc/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/32fff8435b46b76606e881682337db296e7bcae7/
     aarch64 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2c9cbf1020563f6359a582b8576a65654c9970e5/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6b01ef0ecef567941df94b2ce03fb79737a42288/
    mips64el |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/60ad236226a1029acd6f8df8b5a4d93b682b385b/
      mipsel |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7a50f9d2fdead9e47ed283d1f3976aa9dc376d6e/
    mips64el |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/be2e25bb7f2030bb4a45c20ff907a9156c003ef1/
        bfin |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/09812e554fae7817c1a3b8863b294abe65e5aa03/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/e4593c47a9bf26d48993c6e0e1d2a2c35bcf3283/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/e63422678f30585e452d310b633e34a1a256f2a3/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/40e6d5988488e0d9e88b6cc4daeab58dffa26dde/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a8b5dd775788c9720e26a3607ffea817dd873360/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ca5195dd24cc9a7b7c6c526c4bdafe34f93a5634/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1a85eacae6900861ce173b2d8c245645af1487aa/
     aarch64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/69980cd5552d306423d22715f237555dfa24e819/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b6b8863d2f90efcb96256d21302728e3325b5482/
      x86_64 |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/c24504a4da3c6f4637b72cd79f621cb0481a3bff/
         arm |             kodi-15.2-Isengard | NOK | http://autobuild.buildroot.net/results/3c1a0e35325828c554f49ab9dbeb4b9b16f9b1e5/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ded64cf4098c484521ab3fb268eee8283170afb1/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/82f3abd919ee6f1e7843978330d29048c278c7d4/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/238c4c7eeed014dfb5ce896dafb3f54ad18a7566/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/905ecabccd3b36eed8a0e69e61b44768c746a937/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9ad5fd5d63a91870afefb7d5259099da0e97edbe/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/797bd400b16452b7188100198c8751a27cd71a52/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9e3912d5aeb68213e2e5d14b1e42f4fd0b97ef56/
    mips64el |                 libglew-1.13.0 | NOK | http://autobuild.buildroot.net/results/5d189c163b4a7c6a636fe8da8e205bd76b33e4e6/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/0f7b04909f8064bd05de83e4b76d411fffe8505b/
     powerpc |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/dc60488734b03f7a1a3eb642e155211084b9bf39/
       nios2 |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/68dbc5a7344e65add11723e305e50cfadbf3483e/
     powerpc |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/502adf5b1b4ce851e0f4d526748a9e1a78be978a/
     powerpc |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/097a1cd4074fa39a48a6aaf3eee0cfe45d940259/
     sparc64 |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/57e305b5c183eaf81f12490ebc2f7d7559d9ef3d/
     powerpc |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/a6fad2f87cdaa271150a46fff7389fb36cb744ee/
         arm |               libraw1394-2.0.7 | NOK | http://autobuild.buildroot.net/results/33cac2bda4890b6050c71734b2c36a77db3d3a09/
      x86_64 | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/a4dab61fb39dd642f85fad20972a0a4572af9a73/
     powerpc |                libupnpp-0.13.1 | NOK | http://autobuild.buildroot.net/results/aa93ff96305a3b201636bea65f1cfdb6db6d3dfb/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e4ccf0028cf668d95313c4290e6b4f438d0e69ec/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/745597fe2646ec14d6bc9c0c3f7af29995ed95cc/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/c3ccaf6944384a3867169f42632daa5711609a83/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/d9dca18bf5a23815432dec6c0d6f925d030392f9/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/57b60523434bf550b983fadafad73c72c9b7a27d/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/227a0a21ae662afb80c33b525f7974ce12afe5aa/
       sparc |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/4cf91dcebbccc795e9a4baed6a9881be71a86109/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/fd8b66056f9009f940e75142fc55b8f3b89b5374/
         arm |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/a1163fb7e31ce091f3fd41e53862242c749b58de/
         arm |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/373679d4b96a78b5ddaf92a99dfa558993a9fa86/
      x86_64 |             mongodb-legal-info | NOK | http://autobuild.buildroot.net/results/5a81db472d432880f44dfb30bae0d777b6ae6c79/
         arm |                 mongodb-r3.2.0 | NOK | http://autobuild.buildroot.net/results/89b9cd2dae8645b50407409c7f2a8567c551822c/
       sparc |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/85ab0eba52df07b10241c8bc0d14a0149da04e7f/
         arm |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/8c286ff07bd5f8748a02627c952bc0ee9960f7b6/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/36b0336e0e9f96c1dbd7009db96775b67bd30e9c/
        i686 | net-tools-3eb367aedf1280f35... | NOK | http://autobuild.buildroot.net/results/d0a9b863f5b2d87333ba49230a8c912909c6c296/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/844a9b9396c2486155931f5c537faa399f152912/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/775299601254cc5001f829241e2010af0cfc0e01/
       sparc |                     ofono-1.17 | NOK | http://autobuild.buildroot.net/results/0e169d3b6c416c4d0e7d236d2464b29971897e77/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/8b722879b3c0a50524b2cfd922a4af2ca87294ea/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/3c7cceb54f19b1424071b321480127dc672783c0/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/d9b1c259ddec07e075be8bb566ed38363d1d19f3/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/c080194e173d7317b82564bcbdf58adc2195281e/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/9690406afda490fddfc33dda008603666c8cefc4/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/82ccb8f0818d1909309eaef969548f963fc6cf04/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d248e806a3f4ac54d67bdb123aec657adedc09f4/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4e675629a16d91c89ddc4d7e51fb1a8e0c9dbfe4/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/127e2797f03b73749f98d4bcd4448a13f2849213/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/66bdbdf0c2263c737bbacd02d0aa13a6eb2930e4/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/669a110029253a7a69d38a486be4734e6685118d/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/593fd0fac11d1b3f3dad0666ae2b61b0f6ea1bd5/
     powerpc |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/7ed7986ff372792ba1dac216a26c9bb47f917b3b/
         arm |                       time-1.7 | NOK | http://autobuild.buildroot.net/results/5948e14adc294b851232d7cc6403779df826dfc1/
        i686 |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/6f53749c8dac7198248fdd18f871b48a6f97f16d/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/ebee1fc551034ae7bea7b87abdd86631a53bab64/
         sh4 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/3da41f2f40abc5463637b4efb0e06f75a8fdf4d7/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/e1d0ae99098e78e4055d27f70c1208dbe1b551da/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/1069761d4528c7a3513605fe2caf212c755d238e/
microblazeel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/0410e12ca2bd471610ea237c0772a8b958ff24de/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/55966763dc6fdc563c824aecb11948b0b227d192/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/09a8d32b4a4b63064ec76512d1bf7251cd974b05/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/ef16228871c41071a00a39e18e707d190fe616e3/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/e431d8eeaf5689de49aa9d7984daff958afc4a0e/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/3c617b5f01077c9ac96b82c416456210076ed334/
microblazeel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/b3924cc9747df176c22a4869149ab2403aff7108/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/adfaa17421006daa37cb5e603c2d28dfa15489d2/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d10f425755b0774d1bd87d811d5299ae439fc0b7/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/e23a4e62c33bfa753d566269961f719a7916f9c3/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/3c20b7a5dec1fb90a773006ec182db6d991a67db/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/5afb762ac74d1192d995f773e9f4e8b77535cc9a/
         sh4 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/be1de65d86fa48a0f6ec5af68683b60a7c6f3487/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/99db24f2fdadf352775603c28ab8139a93bf1178/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/8af6b238bb9c53049d010c038c9e40749e983075/
     aarch64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/51460db2f60b580fd3b31eac9f6e1eeb69c535c0/
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/6a471d2873ff7e645b0f0962d1719632e290993c/
       nios2 |                  x11vnc-0.9.13 | NOK | http://autobuild.buildroot.net/results/feb1c3884f900039c2990812b395e6ab29d5dca9/
        i686 |                 xcb-util-0.3.9 | NOK | http://autobuild.buildroot.net/results/d6562740ef35e284ca5d7367b4d1b5cac53cb885/
         arm |                 xcb-util-0.3.9 | NOK | http://autobuild.buildroot.net/results/b7817fe2dd39334578a45bd6029a360fdf528aca/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/74245d244be395008aaeef4e4ffcfeac76670e0c/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/cf2aea38a8fbecdc345bb869f3df2bc8957d772a/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/d229565bda01f00b7879c52445e9733a98c0ab49/


-- 
http://autobuild.buildroot.net
