From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 May 2019 06:00:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-21
Message-ID: <20190522060049.2EAE186B90@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  25 |   2 |   0 |  27 |
      master | 191 |   8 |   3 | 202 |
        next |  48 |  14 |   1 |  63 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

libubootenv-8a7d4030bcb106d... | 4 
             iputils-s20190515 | 3 
                    dhcp-4.4.1 | 2 
                mono-5.20.1.27 | 2 
                chocolate-doom | 1 
                cracklib-2.9.7 | 1 
         mono-gtksharp3-2.99.3 | 1 
                qt5base-5.12.2 | 1 


Detail of failures
------------------

microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/ddfcc2fa875e1761e2f745cc249afee2a9f18371 |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/7ef699682ed5d7d3423e2c06ba88328f3ed4d71e |     
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/38a499349611836f3acead5760ce51cddc63bb95 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a3d3d6b7c049fbe10d5ae0afb96a2cd4b092b94e | ORPH
     riscv64 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/f78ac0d3c9a679a584bd54ac7f908390f5a4087b |     
    mips64el |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/e86555090e27b631ba35214ef100aa9331844684 |     
      xtensa |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/a15323897950f8166f2b14f235a36cd88387d5de |     
         arm | libubootenv-8a7d4030bcb106d... | NOK | http://autobuild.buildroot.net/results/8a6b3087a4c2cb53f4e9b80183c7f4b0ea6ffd3b |     
         arm | libubootenv-8a7d4030bcb106d... | NOK | http://autobuild.buildroot.net/results/206f1eba0dec39de1c02d760fa8f961d5a3879d0 |     
      x86_64 | libubootenv-8a7d4030bcb106d... | NOK | http://autobuild.buildroot.net/results/90873370a73749a5afd506e4dda0df316cd4139b |     
         arm | libubootenv-8a7d4030bcb106d... | NOK | http://autobuild.buildroot.net/results/e1837ccbe774071876642655b1fcffbd69dd7947 |     
         arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/f13a6103ec68697271c3cb3986828b9deac7c3ea |     
         arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/e6beaba992e0057535e1a8f97967bbbc465f5979 |     
      x86_64 |          mono-gtksharp3-2.99.3 | NOK | http://autobuild.buildroot.net/results/7cae5b32285fe0edf69eab3297be9c6a4e76b7b8 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/0ff8ba667fa4dcaf6e0230d648cee6d5aede3a09 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                qt5base-5.12.2 | 2 
                suricata-4.1.3 | 2 
                host-libsodium | 1 
                  linuxptp-2.0 | 1 
                   mpd-0.20.23 | 1 
                   netsurf-3.8 | 1 
                          opus | 1 
                    postgresql | 1 
               tpm2-totp-0.1.1 | 1 


Detail of failures
------------------

     riscv64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/dace17550493e1a261d00a810b6d67257b5f1cb3 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/53a5f4289c4cb522f97acd39d9d1c25bcff1a15d |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/2001c9dfd0b4291b93eb4f6211cdcfb3376b5920 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/3819a3d77d6d0579443983bffb3b22babb38af26 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/d8a16a22d037a2cc2fc2f0e2b709a76ff02a7777 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/aeaa6371e06d4df7788cfab497f98ba0f9ac18a4 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/aa3c6c83829cae36017c1bc24e1e1d0ca35ea0cb |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/8779fc1595c9d645d1c0847097f3e2db0d231af5 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/294aea8d286a3e1374d3cc523799c30c313179ee |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/4f57c417157a4c3b6f8cccb2acabad291b274ff6 |     
      x86_64 |                tpm2-totp-0.1.1 | NOK | http://autobuild.buildroot.net/results/5693a35e4d6bc76a1f46fe0e217abc49f7188aad |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                   netsurf-3.8 | 1 


Detail of failures
------------------

        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/a46e09bc599408ba9f0b178883c91ce26aaf02a9 | ORPH
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4b6987e8d470a4d5da3977b40c0081e289de864b |     


-- 
http://autobuild.buildroot.net
