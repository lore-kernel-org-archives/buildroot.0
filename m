From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 06:27:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-27
Message-ID: <20200528062744.16D12889CA@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-27
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  7  |  5  |  0  | 12  |
    master   | 98  | 39  |  0  | 137 |
     next    |  6  |  5  |  0  | 11  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 5 
                 gnutls-3.6.13 | 3 
              host-erlang-22.2 | 3 
             host-gnupg-1.4.23 | 3 
                qt5base-5.14.2 | 3 
                   cvs-1.12.13 | 2 
               host-efl-1.22.3 | 2 
                    mpv-0.29.1 | 2 
                 rocksdb-6.6.4 | 2 
               apparmor-2.13.4 | 1 
                  assimp-5.0.1 | 1 
                     avahi-0.8 | 1 
                    brltty-6.1 | 1 
                  cairo-1.16.0 | 1 
                 gerbera-1.4.0 | 1 
 glslsandbox-player-2019.08.23 | 1 
              ibm-sw-tpm2-1563 | 1 
                   libnss-3.52 | 1 
               log4cplus-2.0.5 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/90593ebaacdd25f00d9cf0a611bdcaa96338a658 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/07cff85999a31e9632d8c3ce336066097bed501d |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2cf4749df62c42f6a096225c4a73f7afc133cd66 | ORPH
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/b2b3d1db7122a88933762dc12cfcd9c4de904d26 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/0c8008c26e02e155f39a164b18713320b23e9f08 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/5bcd8f4235002da682cc900f866116d2fe87f1c8 | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/cbec63beed15da2bbad74ba7d940cfd969cf7454 | ORPH
    arm      |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/08d05043f3fb3be9e7799b086b1a13d358b4e1aa |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/dfe4c5e139221dfa760d6e2091387ea24d1c15e0 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/46c4face431f7d4f99a40ac53c5aab34dad30e2b |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/d86238e868227d390f4b8d2737a32acdc81afcd5 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/97d1c66484385d639e873e132b88f35289272c82 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/74856bed600c322be84834ce43b3103882c02f4f |     
   x86_64    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/83f806eaeb2ffc4d6053272a85f0817ffe91de9b |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/eacb54146bb16ad61aa4e99c3ac18b664544971a |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f93e97961ad289fefe36268a9642cdf1a8d804fb |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b985666e2687f7b5b6395c04233f90ac049fc20e |     
  mips64el   |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/83a1cdb85dbe2d68175a43f07b78051209ce70a5 | ORPH
  riscv32    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/64f0e82d235d8ddfac85f9bc92c66bb9134135db | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/ce9a08445063de56b399d79be47f7a961f0f2107 | ORPH
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/01e1cc89cc122cea0e5d5ed80eee050a7373ef2f |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1c6ab733aa6817bfdbcf6adefc2d8898a1b97935 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b45de03f9c86e4928068a93c430fca81e9746025 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fc807c11d0b4d13894855f83c0432a19dc7e8285 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c3ac42d4499cc53edddd2793189a49fa729c27cb |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0c8d020ea2157e7299b95001430f2710b18af6ac |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/17e65363e4b6a30a9736f5a8c7ed797480c8c8d2 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/c3affd84cd008a343041565050f536da785a16a1 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b3616f27c5d85e2dafeb9e0f5570763b78d2c5ee |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2b7e30693fe598a06f9058f2d0026c284451fbdf |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3b539407a22eb40a544ebc224a4214a31edfee7a | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/0b2bca40fe78bb2948c1fca5de292bc316eb2330 | ORPH
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/cc1c774fe39f8b207958d91c50ed0a1ce87b2816 |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b9d11e43f3b64c7fd7e8d104a1e48426a6c02be2 |     
    i586     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/8da73c8857c3cc9174616d3f9282e9e3d8975396 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/a4854fab62e574b58552f03697516370a6cc374c |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/c60db3216305d73f44e9d616a7fd9a6527f77364 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/e1ac998fa8a7cd5633a9db546153c033d452484d |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/6a4862181472c21e70909852f902c959e9afa2e1 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-checkpolicy-2.9 | 2 
                 gnutls-3.6.13 | 1 
           host-openocd-0.10.0 | 1 
                ramspeed-2.6.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/a6d09d1e5624fb0c3a55be1bab3220d66428afb5 |     
   xtensa    |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/b85f9c37c1f615888afb10d386968d12aa7b748e |     
   xtensa    |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/e22a19e76146f074bcefd0fd922816235fbd5734 |     
    arm      |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/224e61fa6e5000091bfbc4ccdcd0b68d7fb1585a | ORPH
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/60bce928bd351e06214eb00c74e24bf4761b7e52 | ORPH


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                       unknown | 2 
              bitcoin-0.19.0.1 | 1 
                    brltty-6.1 | 1 
     python-argon2-cffi-19.2.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/4f5a3367930bee8a6d2f66fb784267b9ca80f84a |     
  mips64el   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/b881cea2f4923edefbe92c76619891f1f31566e5 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/a447494c36e703b0fd7e5d1751ac39385f920deb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/282c3179ac3f910fed5d3bd8cf5b4a7ef99da804 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/4ab995ace31a46ac0320f50451b4488520952671 |     



-- 
http://autobuild.buildroot.net
