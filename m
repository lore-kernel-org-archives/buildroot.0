From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  2 Dec 2016 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-01
Message-ID: <20161202073009.E1B9721D0C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-01
================================

      successes : 240
       failures : 38 
       timeouts : 2  
          TOTAL : 280

Classification of failures by reason
====================================

               libdvbcsa-1.1.0 | 3 
                 php-zmq-1.1.3 | 3 
                  boost-1.61.0 | 2 
                    mpv-0.20.0 | 2 
                 openssh-7.3p1 | 2 
                  stunnel-5.36 | 2 
               trousers-0.3.13 | 2 
             berkeleydb-5.3.28 | 1 
                bind-9.11.0-P1 | 1 
                     efivar-30 | 1 
                   erlang-18.3 | 1 
                  guile-2.0.13 | 1 
                 jack2-v1.9.10 | 1 
                  lcdapi-v0.10 | 1 
                libcurl-7.51.0 | 1 
               libepoxy-v1.3.1 | 1 
                 libraw-0.17.1 | 1 
make[1]: *** wait: No child... | 1 
                    mosh-1.2.6 | 1 
                 mplayer-1.3.0 | 1 
               openldap-2.4.44 | 1 
                    php-7.0.12 | 1 
python-libconfig-b271c3d9da... | 1 
                 qt5base-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  stella-4.7.2 | 1 
               tcpreplay-4.1.1 | 1 
                       unknown | 1 
               wireshark-2.2.2 | 1 
            xapp_sessreg-1.1.0 | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ab24fbae87bc60b429785c6a55952eb42251b73e
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/f2dc9bf2069ed605a5a4ecfffed623a9318d77af
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/3c48e72ec0ea0a84b53c68be17fb51ca999ce0da
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/74d07d069f4d40d6a82a570d9dd5958c6b823c3f
        bfin |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/ead8412d67dfe57ab3aa57d89a62a5edfb87795f
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/9b41f84be9a251a565a08815551fdc51e63a91d8
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/f921cddad3b870bde0579b3845dda9af1928525e
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b66c22b38da30e9427c4fd4b56aee8a41b1cc3c5
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/15820e5cdd6761949929ff36f2071f7ea383fca4
         arm |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/17a1c72a735d586291991cbabaed2e45b37d35f6
 powerpc64le |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/fece0c66aec57ad065e7a19131350b8bffc0ca07
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/9bb4d4082b238343dabe951672f98f11c5a42956
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/72e5e7cc5140b4894904f1a1d8ca339bde5f235b
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/362ab380233d121d9f1541880faf4e9e5cf17508
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/2cd6dfe1f1ca3ad8e5d2c3dda7c5082967c47112
      x86_64 | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/286f0bf75c21d905af25acc5bfe15669a9d1f908
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/5df7ffebd1d5b33701c10b19a6cc05e0bba84aa4
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/160f68976320dff4a11231e1d8135c263a68e2ee
       sparc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/9dc25aee8e6faaefbe38b35ca1fbd9a30cd85d54
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/8f833a291033916e675c0a050ef71ed04d1381c5
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/146e67423a850157e666a8397785705b30cdc252
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/bc889b0528e9a78bc3471f81e1e788df3aece336
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/5723ed39e226135f08c1306cbcc4de9ed4cde322
         arm |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/7bc09e85b7a8a182f997663cb414c49aeaecda59
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/f4dde34017939ded19d585627ae077d5ad772f50
         arm |                  php-zmq-1.1.3 | TIM | http://autobuild.buildroot.net/results/7166d876e235b9dd039758403c221f845992ee66
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/e0e3b45cf9f811506b751bda30d7f462c7ada9d6
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/087682dc97afd2b78d45ea72a12756eac409f914
       nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/dc1c29bb9f3832762b8da3f51f542a8717407feb
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/dbf303fe48c73a71f70b5d6fd9792f9ec4e274b2
   powerpc64 |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/976767b19a416d7b04ed9c9998020b454a919091
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/4f229fdb2216f1acdc05a5addfa3ec09decbea08
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/7cdaf2bc7d4dc7696472cb0de6bc63c8014efbd6
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/7861670092167f27b294b7432ce44bbed57ca0ed
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/09de24dbe3adb62980d8e41c0d793f9d50baa396
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f35845ba37a9ee0cec576b6318e73fb70cf92e65
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/f259679fd4221bc7f08d08a81610cac3f04549c4
         arm |                wireshark-2.2.2 | NOK | http://autobuild.buildroot.net/results/8d474e8d5cf136405d59ef6b80f8ca479832ead4
        i586 |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/25ae621cebf3e73b6d0f6e2e1627bb94a89cc01c
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/6b0ed2e8347b497a23c234f8f5b79126298a329a

-- 
http://autobuild.buildroot.net
