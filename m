From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-29
Message-ID: <20150730063016.4CA9B101F42@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-29
===============================

        success : 223
       failures : 63 
       timeouts : 4  
          TOTAL : 290

Classification of failures by reason
====================================

               libpthsem-2.0.8 | 7 
       host-erlang-rebar-2.5.1 | 4 
                    quota-4.01 | 4 
                  midori-0.4.6 | 4 
libsigrok-fe473123ba836445d... | 4 
             expect-2014-05-02 | 4 
      make: *** [_all] Error 2 | 3 
                  mono-4.0.2.5 | 3 
                 libebml-1.3.1 | 3 
                busybox-1.23.2 | 2 
                   audit-2.4.3 | 2 
                     rpm-5.2.0 | 2 
             libselinux-2.1.13 | 2 
                directfb-1.6.3 | 1 
                      atf-0.21 | 1 
                  bonnie-1.03e | 1 
                  ffmpeg-2.7.2 | 1 
                 mesa3d-10.6.2 | 1 
                    libev-4.19 | 1 
                  cppcms-1.0.4 | 1 
                 webkit-1.11.5 | 1 
           aircrack-ng-1.2-rc1 | 1 
                   sudo-1.8.13 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
               libcap-ng-0.7.4 | 1 
               linux-pam-1.1.8 | 1 
                   bdwgc-7.4.2 | 1 
                 lrzsz-0.12.20 | 1 
                 clapack-3.2.1 | 1 
                  boost-1.58.0 | 1 
libatomic_ops-libatomic_ops... | 1 
                     ola-0.9.6 | 1 
           qt5multimedia-5.5.0 | 1 
                 empty-0.6.19b | 1 
                minidlna-1.1.4 | 1 
                yaml-cpp-0.5.2 | 1 

Detail of failures
===================

      x86_64 |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/4fa865fcafc63482ada0f745464b64b454ed9978/
         arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/1a5861da3fb6628c872f3635118bd1f5c7707893/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/ad1b15e58a83c41b92c5b66ae5b90ce189161182/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/190306767b0e86c839f48d429b51414921abb9b7/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/fcdeceb59ba838ac005e5dcc285b5b21ced70deb/
         arc |                   bonnie-1.03e | NOK | http://autobuild.buildroot.net/results/c2af14c4096424e41449c094666ffa0262f4e9f2/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/ea427b22dc541aafcefae09710d9b30c0fa5fae2/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4f2ade79fe1e7399b1ac575e4459aa8037b12616/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/411f93baf104a3b799dbf19aca45091fd822674f/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/4288d0184e86e3acaeae3e1fcef0013c09c038f8/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/d87c69bdd0a9c8fea3654efced8d1d17dc65e371/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/1cba5b5f5796f0ad62721f3e45d812989356373d/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/ecc140527f9a5b5882d35776f0533bae60a371d4/
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/677fb7134ec4fb5d184e428b139fd39cf03b5144/
       nios2 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/794441731ba4d95d2e3ffdcf339d3e94747e65b8/
    mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/267aaa0fc3cf3616aedc0876325d73cc93e9f261/
    mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/c281d51e826d09016a10f45a7746a5a59409da6b/
       nios2 |                   ffmpeg-2.7.2 | NOK | http://autobuild.buildroot.net/results/30bdaacd62325b56896f959586514d58ae76a6cc/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/5c591c2fe4e3e1d5c23b54a8486de741fe0e329d/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/f1d6b4e6143b508350f2791fdff8c85446aceaaa/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/fbcf7bb071c75b19c76f8fee30688315cdb081ad/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/74e24559820d8e1ae2bd786c9f698a920ba36fc0/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/1fc9f5764dc5cb5efc36fb1e20ed8fab15b08409/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/7e0f5f5f863bd55b2e99102ad8279c6baf8cd32d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1f7ac4cfd6bb7f6a5194a78125882f3b6d42e660/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/83af643e377f53feea044eb6fe1447f7ea502612/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/4cc30b029b4e9a03edc66c099ac62a0604337bb3/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/c4716b5458633961613e56c80ba689e14088afbc/
       sparc |                     libev-4.19 | NOK | http://autobuild.buildroot.net/results/d8a3096ab6a6aec9ca67cf1124f041a154ed43cf/
      x86_64 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/14bac62e804792835a72245f77ddd6ad1c990db5/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/675df26d7b47e02bad0b22f3e1cb404076a84a91/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/003c4313676cc79c72a9296159ff63dce177f079/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/86bd9fd83278a5468856f4abf700df57749d8e09/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/97205d8fce8d0851208d167fc3fc7ccce40d391a/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/1764c8f7f84fc5bad950fdb41ecadff571ceb36b/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/e733cb648398df7efd7ccae6493af3c92713a9bd/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/9c2f09fb7b2a594c7d22fe413e8bae843e8d227c/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/3835eeaec5b81885d5b99dcc8c0df2b30acd9ac8/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/f1fe725b2baec96fae5c613e37a938721197708e/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/b40736f2f844f7b873632f4775915f064bff4346/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/27488abdfc5d926696dd48f783747915ef7db2df/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/96befa5b2dfa7db72f63ac39e3979cf5ec2ef13e/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/01a32eb6f9c01a256ec61b6fab27a80d358f1c43/
     powerpc |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/1e1b55819be30450ab55adb7cf15ad1899fe71f6/
microblazeel |       make: *** [_all] Error 2 | NOK | http://autobuild.buildroot.net/results/8d901cb07dc0a8eacaf6f70b23b4397b0b91b5ed/
     powerpc |       make: *** [_all] Error 2 | NOK | http://autobuild.buildroot.net/results/26000c951552719165f8dfd90b6aad74f3a5266b/
         arm |       make: *** [_all] Error 2 | NOK | http://autobuild.buildroot.net/results/e443bb5a26310be97b4e59c2a1368096a9ffedee/
      x86_64 |                  mesa3d-10.6.2 | NOK | http://autobuild.buildroot.net/results/b516676ca0e695b3dbc3c33622d527b89a227932/
        i686 |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/3581b5e9914fced0f446255ee55942281879ce6c/
         arm |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/91eff951d5602982adc101c6d8ab332423b8c740/
         arm |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/cb7f4dd86cbc97ad49a2812d6ea3ad7141030264/
        i686 |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/572ec7a7884ec55af457acbd5184a6a13b32d9a0/
      mipsel |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/85e53f2b30f107f486be08549ce6df08953ea499/
       sparc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/c582d2e023906777c47f48581dfe9df886602516/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/31d2660f80a00e63dbf276f504345630f496f0aa/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/6c69153246532137c01a5aed691926d4b2f77f24/
         arm |                      ola-0.9.6 | NOK | http://autobuild.buildroot.net/results/e3f91c833b25949b5d0ad14309bb7adb4573d6e9/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/f0819e247408438ef9a725618a3271d46365999b/
     aarch64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/f2bed58eb841eb3b08a77ab71777b521de66a685/
     powerpc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/763b3c6dba73f8a594c799673a9bf2da75d0c972/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/eb1910c12c827b36953340c20fecbe8231f4cb15/
     aarch64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/a01068fe96d1a2c57ff0b9f873bf6469781ec855/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/c59fb3093d41f53fe22693bca040f2b12d53837d/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/d8ff9c2e591c74c83b76ec3b477da4acac68707e/
         arc |                    sudo-1.8.13 | NOK | http://autobuild.buildroot.net/results/1b77539d08ffd950317a58cef8e2a4ce624c4710/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b5d84548fa2c14ec3aba15045f17bf04e60023f3/
        bfin |                 yaml-cpp-0.5.2 | NOK | http://autobuild.buildroot.net/results/2ce3c6d0140696cdf73f2ad1499b779c83ad8f6e/


-- 
http://autobuild.buildroot.net
