From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-25
Message-ID: <20181026060018.48EB9208EB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   0 |   0 |  21 |
   2018.08.x |  18 |   0 |   0 |  18 |
      master | 191 |  20 |   0 | 211 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 5 
               postgresql-11.0 | 4 
                   luvi-v2.7.6 | 2 
               boa-0.94.14rc21 | 1 
                  cc-tool-0.26 | 1 
                 dc3dd-7.2.641 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 minizip-2.5.3 | 1 
               nfs-utils-1.3.3 | 1 
                    pppd-2.4.7 | 1 
               qt5webkit-5.9.1 | 1 
                  xerces-3.2.2 | 1 


Detail of failures
------------------

         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/630c9ec80b49b7f7f4ecd7caa6b26fc641e69666 | ORPH
      x86_64 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2e04bfc3f8e7f57e68fe375296922c48a107bd16 |     
     aarch64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/17a9246bfb034c531ec5e27e29d38857e58db271 | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/6048b19a8b77ba3a00c339ea3b64e31c6856f675 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c194c39738a5146e43c2e2ce975ebe1ccddbd0c9 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4e069c61a5ab0b0f03e4833661b63673b32790c2 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3a6d69000ead2bc78993f91e22851bb493fd3260 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cc9d4dc33f6096accbfd6fd233e2e8186165cd1d |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a55494bec8efee72042e791e2505bc55ff4a41bb |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/71f9ec4f98adba678df1a60e9183339780a86dc7 |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/d830a07203f2e288045facd89d16fba7631392ca |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/0abb750ee0c011b0ad9260e8af9a3182c8ccac5b |     
         arm |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/e55f57011a25fa3fc0dd79f6fe0e4c206f479841 | ORPH
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/14546b4823a14a3410925e19cdb38421657e5d9b |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/782a32962d7ea7c84c8b02247e5c7c6c714ed70b |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/f866d875585692d88bfb957a237c20d2d34698b2 |     
     powerpc |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/2a6fc62d285d303becbd6b3566c8c119c4052521 |     
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/8dcdf8a83f34807950251c762215e5889e9315d9 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/fe493823b8deebbf34ec34ce4dbfd6791c686d7a |     
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/dc7810d5d5c62658837cdd2faae6fe3390f968a2 | ORPH


-- 
http://autobuild.buildroot.net
