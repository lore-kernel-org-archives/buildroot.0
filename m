From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Dec 2016 08:29:59 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-06
Message-ID: <20161207072959.C13FB206DE@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-06
================================

      successes : 211
       failures : 83 
       timeouts : 0  
          TOTAL : 294

Classification of failures by reason
====================================

uhttpd-59e0c739634f46a164d9... | 12
                 pixman-0.34.0 | 8 
pru-software-support-legal-... | 8 
                     efivar-30 | 7 
                    rpm-4.13.0 | 4 
ustream-ssl-ec80adaa1b47f28... | 4 
             freeswitch-1.6.12 | 3 
host-pru-software-support-l... | 3 
uclibc-ng-test-4ad1c23ae2eb... | 3 
                   ezxml-0.8.6 | 2 
                 jack2-v1.9.10 | 2 
                libmad-0.15.1b | 2 
                 libnss-3.27.1 | 2 
               madplay-0.15.2b | 2 
                 mplayer-1.3.0 | 2 
python-libconfig-b271c3d9da... | 2 
                collectd-5.5.2 | 1 
                    cups-2.1.4 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
         docker-engine-v1.12.2 | 1 
freerdp-17834af7bb378f85a3b... | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                  lcdapi-v0.10 | 1 
                libcurl-7.51.0 | 1 
                 libpcap-1.8.1 | 1 
                 mbedtls-2.4.0 | 1 
                    mosh-1.2.6 | 1 
               polarssl-1.2.19 | 1 
                  stunnel-5.36 | 1 
                 synergy-1.3.1 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 
    xserver_xorg-server-1.19.0 | 1 


Detail of failures
===================

         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/c19a9e63bacd44aa72b79acc30cb2428de7da79c
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/6cb4682197a5eda86f3a7ca733531c8289e9ea31
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/eee8acb22d213228f9692e1dcdaa311ae786a13a
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/e2f6966f9541733748bb1dc03bd6668371bb02de
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/12bda55cee271c08b5240845322541cab755d18d
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/bae38525e04d25416ec4f323ff5f04fe3394fef7
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/71cfc6d6230de9024c9061d05ed9eeeea1088553
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/bb37432f62d05bd6ca6def5bb52dcee2287c8afe
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/fc20bc68f502130dd422057d0862e0f0bc7f137b
        bfin |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/cd8d4637239c6dcc60b81ead70a460c035c4d563
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/c683cde1f2c8bb5afdac06b24878aad97730eb7b
        m68k |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/e28ad72e443146a1950406d4635ef032cdfd12b7
        m68k |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/434a980a8a83a8ee202c26dab3d04c12f2b6bb7d
     aarch64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/a947bbff0b56f2f230926ba49d11b309d2aef7f6
         arm |              freeswitch-1.6.12 | NOK | http://autobuild.buildroot.net/results/4afd70b76d630e6f26475a3ffd22db90be008c45
      xtensa |              freeswitch-1.6.12 | NOK | http://autobuild.buildroot.net/results/12e20b5e99015e6f06572851953f30052d65d07b
         arc |              freeswitch-1.6.12 | NOK | http://autobuild.buildroot.net/results/3a59fba6c03771a81ed1f531740bcf83a8b95b8e
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/ea06c671fd207b41c97ae8fb3b5466fec1be7f82
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/03581568a8cd34c5db7fddf94c17a19a016014a5
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/7fedd784b805194e376597271a80e1772a94d2b3
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/4e48e5642f539733910da72eaacf2988b1264934
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/ed2c9d38ec53821b15483d06ea8b8f0129219c24
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/2c9dfb1f0203b9b1efd634c216b58a3c4f0cb862
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/b8a60a892f541a28494c1a40562e8f43aff5a4a0
         arm |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/f4ea3544c715733f69ef5c6fe6ccce9e652bc81c
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/28835a93dbdea52ae1eaffadc3b1ba28356ce528
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/191a95ff714d6cf0eb39e3f8d35014b612e6f7e4
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/3018bdc902857eab20716c234dab2be19b3e41aa
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/3c72a46dfe19c966fb9a2beb71c0a4815a66539f
microblazeel |                  libpcap-1.8.1 | NOK | http://autobuild.buildroot.net/results/7e1bd745ca914c34d3d4783faaec3c52a4efd5b0
        m68k |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/cf3d21a0a14ed0e2724a5aeae3fd95e2fc0edbb5
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/3291554ea013e5f4a8f3447e10e664dffa8b131b
        mips |                  mbedtls-2.4.0 | NOK | http://autobuild.buildroot.net/results/cd7d4f287631e8de393e16394a3774cc8ea45c59
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/8ecdbce63985c1f86f7f0f858698211279fb228d
     aarch64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6450a5cc778a70b47475d0b85a684c6f3cb9ba9d
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/486cff91c53d58565d75730b5b333f008df1a53c
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/956db978b58504a4bdc76212b712b53852199101
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/7c72f08d577056603b3fe011f70fffc9fd47a7d4
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/fc085c4e436d23daca7e07da7a4e946c95d56765
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/11927ac81694dafd5487b67c0638d12842e43269
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/a219e7cabc08516e37d83e92249506899535e785
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/e8ed7bba1b187f9bcebe149b86a6f3bfe547ca27
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/d54e46062651694759eb898fa95c1f7a7e620cd2
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/5e67cc067a06f7364cde1a8393ea72608fe7fef1
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/d616f6a3a58f5952b3a0753738980e74319d21a7
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/96bdac7a0ce68535f887efbd8f73c66aadb6a6e8
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/b60801a933121a0e395a4b174e8a5cf870344e22
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/e862a0210d6c3a87e6fb4515400e1b3166c193f0
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/e3db2a0c4c9a7ce1b7979e8c45f288daca1fbacf
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/dc00c82575655ecdd06913e0a9967ede849a1d58
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/b5ebebce91ae5a25a3aeeee29975385e4f4215f7
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/23e8f562d1a9d6024ab85c2d18f3196cd8c3c631
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/534ba129fd0d58dd79579bf81c2c31db224e45ff
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/25307f09288f1df8df624d8937cf66c79309cef4
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/870ff9944f1308c4331d0d23cc06c4e836226f47
       sparc |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/09f420ecb6c6a53aba6832977dcb0c5a59bca42d
         arm |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/47aab284da117497b21dd394773de8792d542bad
      mipsel |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/047ddb1cbdde2377b881fd6d37e9a056cdc84c2e
         arc |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/23abd8ec7f055125327203fccc1f177c6824cb08
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/424a11d9759895bcc971c1319ff351ab7666bad5
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/c1a009c896c9b9add63bec45d35e6a5d8ee23a41
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/57a81345827a28eb92dc838ae2e7998a20b44654
        m68k | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/a785ad6190b011aa3d03ab84fc90da8e69d4c77c
         arm | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/74e7add310797772bc51f9ea9847408a8b05d643
      x86_64 | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/d4f04f790540f5f0cf3f5767fbe57da0c28503bd
        mips | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/61436090db9cc6d690141066adc5dc1858368055
         arm | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/badd96bb702dce7908a82bf52f8c57a337418c68
       nios2 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/1d87e6e63e0461850eaa5291994bfc848d40c964
      mipsel | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/bcb0ac77969728ce5734ae10016d569bc18ae696
    mips64el | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/b1a37f3580a032eb538ca57c4e76872346707ed0
     aarch64 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/763379dc223a8358a2c0b78ce8a93741f480afd7
   powerpc64 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/632c40ced2fbdbcaa4b80ab51c90ac810a58b621
    mips64el | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/3af4f80f202ba88ca239ffcff110b13333591ab7
      mipsel | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/2ebee89f1b367d6513a72ef7f5e9cde85e4b4579
     sparc64 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/2b73b618a18ca5f9348fb5d8a4d054f5cc152c8f
         arm | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/35442b11967ecf4dfee1ff896b2af8b221b27d5c
       nios2 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/7ad8bc059a697f5b07e1a65082cf57548b4d8d7c
        m68k | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/0e44a6f71fbdd9f58939abca577e813d08122500
        i686 | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/5af0b6387ba748d4504aa163bf39d51033ae39ae
      x86_64 | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/32245b5a663c8731d2ba211ab3d4fdfb3672fc5d
       nios2 | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/259c7963d582a566a0aa9bf8cf64adf3448c6abd
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/4c21d24c01ff3b5c3ad3308c77737253f450ed08
        i686 |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/71bee242f02ed0b7ad40147e713ec29be8678b80

-- 
http://autobuild.buildroot.net
