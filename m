From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 08:30:03 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-10
Message-ID: <20161211073003.CE14420C1B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-10
================================

      successes : 192
       failures : 58 
       timeouts : 0  
          TOTAL : 250

Classification of failures by reason
====================================

                dovecot-2.2.27 | 25
              mimic-legal-info | 8 
                    cups-2.1.4 | 2 
             lttng-tools-2.9.0 | 2 
python-libconfig-b271c3d9da... | 2 
                  stunnel-5.36 | 2 
               bootutils-1.0.0 | 1 
                cifs-utils-6.6 | 1 
                 enchant-1.6.0 | 1 
             freeswitch-1.6.13 | 1 
                 ibrdtnd-1.0.1 | 1 
                 libraw-0.17.1 | 1 
                  libsvg-0.1.4 | 1 
                 openssh-7.3p1 | 1 
                   perl-5.22.2 | 1 
                    qemu-2.7.0 | 1 
                    quota-4.01 | 1 
             rabbitmq-c-v0.8.0 | 1 
               tcpreplay-4.1.1 | 1 
               trousers-0.3.13 | 1 
uclibc-ng-test-189b47080068... | 1 
                  xl2tp-v1.3.6 | 1 
    xserver_xorg-server-1.19.0 | 1 


Detail of failures
===================

      xtensa |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/fe7ead15386fe75f11beaa58707a148a838a1505
      x86_64 |                 cifs-utils-6.6 | NOK | http://autobuild.buildroot.net/results/9ef22b8da864f7600bf0e026871c479a02064a07
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/3ceb9ebb79f3c2ba0bbbd1447a6dde78504410aa
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/01843548184b6318a85ca15dbd1970e1f597b4a3
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/b2a09ee3c8d08e354788fecb77970a3db75227e4
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/0104be4f880e2a06833bf6d0d5f9543415344430
        mips |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/57482148b5e7dbe8955129914ba0be2b1660c5a8
    mips64el |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/24be792cd559e33f998d19fdffaa7901a8f1c0e1
        mips |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/a6d11ac4df7bcc36137674a11e8e8e212dbd2232
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/f457835ef8f01e53ac7c18de91f38706f3767373
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/345b6e8117334537cec7a2c20be2ac5826888567
         sh4 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/711f3077848dfbe91b666f9996a5dcefb715eaff
     powerpc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/834746fe84e6637b771248603d0d9d851f758f32
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/86b8aad478b21f1c2568e6327b325d619689ea71
       nios2 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/614682836c9673f531edc28fb66ac6fa16b90054
        i686 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/1bf0f7d752c63e06038f779d8d44db96359aeb77
    mips64el |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/0daa0723321487333acf0ec458c5b6935d5ef4b7
         arc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/1fb3a6aa70a10330e532fa85336fd56049c3499e
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/6ca29b44463fbe94c5fa6c27cd11bb780464a3a4
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/f4a18213a5c09e2e4727911a1d99eae981d9c285
   powerpc64 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/c857d2220e33eb42a07948708495a04f4ace700a
     aarch64 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/849a27ca55003873460bd802a929f6c445e4e0d6
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/fea2107845252a4e994782ebb03dc630bd389210
       nios2 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/e46ec84e800644473c14bf9b175527ca5d7c2878
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/8ccbb71a020cfd14d7318b3d6a25dd1fba3cf5a2
        i686 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/2e76b1f53cd1d6c417651611016e6aeb83a59970
    mips64el |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/42b33b5b437ad8d08106db1aeb35980aa1e07604
         sh4 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/64b15b30ce7aecef2443781c713738fb272c4379
microblazeel |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/08c2e4530c4542378368d7d33c0acaf9aef61f5f
         arm |                  enchant-1.6.0 | NOK | http://autobuild.buildroot.net/results/d2e9ceff3f1de4816e06185a2c82e65ac9428399
     powerpc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/ccbf8fd7db099dffbc2eae6c09633a9abff66506
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/a507556eda3da2e41c98f166b807c735836fccb1
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/2d5f079a474384b3ef39e064cc75938327eec985
   powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/be3340209972e1c9e555a18d2d4b6afb797f90c0
         arm |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/877b6ea3a2b579257ee514650bde2226d1678c53
         arm |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/3ecde796c8f9a65f325ead0e055df25cd2b5039a
         arm |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/30fca8f04a7c95c5af45e550f9f269ab5565fbe5
    mips64el |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/0614f0b235c0684569f8e465e43e210d7fda592a
      xtensa |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/a55526cd83ed22f5de5cca5df5f3f9aff0bcae24
         arc |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/68ae4adfd2b2ce96338f6afbf6f106cf050b27ff
         arm |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/07bdc07dc21c06d5b966f652a49aaf1d61105a64
     powerpc |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/673aa6d3005ce3eb0cafa3f78245e167ce8e7449
      x86_64 |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/a68aa2b2c084e420c1e0ba391505f7301353f09a
       nios2 |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/8395d3771639b67c5b0f873b0d2e4b58c392027f
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/a65df1ea17cec8f22106d18e62940b0ae992dcb8
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/db2a0e46397ca495869376bf428f7e12fad3e466
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/bc7e9c37ed6e377ac47a8d2b17ab7dd81efc8870
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/f0cc5c15c41793d3b22d462c82b08592ed7d4d76
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/7cec13be1ff5a25fe2b627b4856b4f1ca0a4ec43
        m68k |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/fb2b215864887d2688e0d6513204e88e4a455f0e
     powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/b260993a4e08a3301c8581bb5d2eee190bd5d8ab
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/36fe9f287f28dd865766863bdeb59b8f98bef91b
      x86_64 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/159bb138b5565d4180b3c2fc33e3c6d9dfc3e69d
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/1abb544e4f19a8621a7a2ef7b7cc88a5ee30b2ec
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f543436cd71dbad8d7952440b45bba4327750090
        sh4a | uclibc-ng-test-189b47080068... | NOK | http://autobuild.buildroot.net/results/43baa5d72d4b019b961cab2fc726bed1a84ca40a
      x86_64 |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/657bc5687cf01aee38d32d45ba57fb62b2bd56d0
         arm |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/c1d99604b37ee5e0ac7f611a772c1a00ed475632

-- 
http://autobuild.buildroot.net
