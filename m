From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Jun 2019 06:00:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-11
Message-ID: <20190612060110.7DA27221B7@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  19 |   1 |   0 |  20 |
   2019.05.x |  24 |   2 |   0 |  26 |
      master | 168 |  69 |   0 | 237 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-nodejs-10.15.3 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

     aarch64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/9e3d8860b065e72d8caa83309f870e1e10cc1d4a |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/0a21e2961663fc177e5c7e0998a6f37c98c2031b | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.3 | 20
                    git-2.22.0 | 18
          modem-manager-1.10.0 | 11
                   cups-2.2.10 | 4 
           host-mfgtools-v0.02 | 3 
                qt5base-5.12.2 | 3 
             iputils-s20190515 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
              domoticz-4.10717 | 1 
              host-clang-8.0.0 | 1 
               host-efl-1.22.2 | 1 
                   mimic-1.1.0 | 1 
                mongodb-r4.0.6 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

   powerpc64 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/56a2c514f95261694f51bc49993400e77e71d077 |     
      xtensa |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/7501bb7f2f490012af7a346462845501d17e9a00 |     
     powerpc |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/f66dc265edec38eb65eb5e371cc73bb30608cbf7 |     
      x86_64 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/57fb0aef4c3cc1ed5a50abfce11a02b5d37d76e4 |     
     riscv64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/117395e7cecea4340612a5eb45413d943773780c |     
        i686 |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/3aab7b36ae540e2c3d9f8eff53013d87d70c3afd |     
         arm |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/6eee4e11ddf745d3d53726145c60c9a52d2f25ed |     
        m68k |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/66fcc12b074829d34d9d639e57ef33e3c2be9ffa |     
     sparc64 |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/28313486044fdcea3de1d9a063a4eb0228df796a |     
       nios2 |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/e23e689332953db50b487881bd02634c2441feb7 |     
     riscv64 |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/3b263be33ab25134f8ceb67f7ca9c97a0b67c168 |     
     riscv32 |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/dcea4dcfda4a031c06a9c67f7a4097336e818cc3 |     
     sparc64 |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/c55aa9f83d1f4cf63b22e1594d065637ead94c32 |     
     powerpc |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/9197e50588d1c65a4dffb9b7613f7e0a7e7a7ed1 |     
      mipsel |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/742b32a99349c2880f5f1c8757dbd4b2af1c6a06 |     
      xtensa |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/6412da0a5bb21650c7139211f8b2717fd50a105a |     
     powerpc |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/8b7c3d9c9166280ea7d4999d18fe15a6336cf4c8 |     
    mips64el |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/4b22f761795d8760dac6ddfd40934259f0135a4d |     
     riscv64 |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/446291737ee3f1fa24920258177d66b9c37e1427 |     
      x86_64 |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/ea6470c6c47b2675f7d24b9468b0864c27b6347b |     
    mips64el |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/850b103cb8d407cee52db4a319e5b78a1a9382f1 |     
     powerpc |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/df0594245f26665e6d9ba9917ec77952acfc6d9c |     
microblazeel |                     git-2.22.0 | NOK | http://autobuild.buildroot.net/results/4e87c8b4b5922ceac9bc8b779e8f1086e014ce7c |     
     aarch64 |               host-clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/5613169d6adb99fba4f4cdcf38a49a7c2c1d556b |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/6f964f3e4197f7caa6b5c5643702e76ea4b6f907 |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/6cd9d99b922a9ab2968d23b1746fc6d987c7e9d1 |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/23d4fb86fe4104652fa3deb201aee4b82f0fb974 |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/637ac2735865665c1589560225fa01e17ecdf0d0 |     
    mips64el |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/ecd7e1ad4261c5a23c71ecc5673150afffcf24de |     
        or1k |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/a391cc425f8df57c4b5cc95eaf2546d9a38fc59e |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/349d4403446d0a75eae0dc34eadc8faff391e2ba |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/62fb662492022c47847a48017ca7d8d1f69fe8d8 |     
microblazeel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/422d7dea0a5b6bb4863babf21a405121391872c2 |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9f2231c7b54c5aabefc46034d63f9ea2309df849 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/cf00b6d6d0e2fe230ebafac684a479c551a467c0 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/61194b92e4aa53d7053089ddc9c6c59d24f1bc79 |     
microblazeel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/ff004ecf442d5cf0be649aad855ce87f1eca87ae |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/f0d85d76786343d767fba9c7c5c01f042ecfc018 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/cdc917bd109c522bf9c42e97c79826eaf4867d1d |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/640f9e7acbc356acc1d30a33a3189e78e912a785 |     
        i586 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9706f2bcece6404f4d7433a92b8d828d82ae588d |     
        m68k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9b9bd8a3b86fae9837fb1b59d1528099c331d96b |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/91859cab7a011819725fd1e6459c8fef2f1d3213 |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/a421d7797cf521480b5fd0a07c58230cc81baa24 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/55651ff6a4dbb13e260bb19cae87b2d2376d9aae |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/6742ae1ab17bdcc70b8f698f5be3a4148c422dc0 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/6a4078eeb10e030ed222c09fdf1c8200c4a0661a |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/31c57ae8f4af97f8b888cc907b4189eac521b9c8 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/228da0d4f286f648951c81600723dd323bfa688a |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/1665374b552a035180705b64e491dea191b6cf6f |     
         arc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/7f583e8799c32478c3bab9edfec5c025c707e3bd |     
  aarch64_be |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/7b717d0cc6bdff0a405a9462ba57b2bf33f31255 |     
     sparc64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/5c0e4f3d33e01198688d58388aabe159bd005234 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/d936810ca9ccaeda81968e06c77effc63be191f9 |     
      mipsel |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/02b61c843f857fd2fb1d9ec6886bf9d6253a8603 |     
        m68k |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/000a1c967d740ffa25a86af827954cf71922e195 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/369ab09bd1ebb6ab1d21749dc900e248017bd314 |     
        i686 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/1484bbecddba0653c3d30788c25014191f137a9c |     
   powerpc64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/b33685a810ea480358809adb60d9a8571c137f24 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/1579bf973efb9bb1970f08c03063399e5430cd2a |     
    mips64el |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/f2cdd569d111aead2d2d36b24c8da4830525bc39 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/8f12f7241f16d980140a6e7aff390752da6ac2ee |     
         arm |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/58763238d1385480944c5faadfa092a639ac810b |     
    mips64el |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/aeb9ddd91825b231ccd4f864d0ca5cf4b5ac8555 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/c1e9f3bcef3addb4433b81d8e11bfb37796d81fc |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/fad010444cd94927a74c63d181e016e6153a4b4a |     
   powerpc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/c8a91326bfdeb8d807b1a701f4fc34471d381f29 |     
   powerpc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/f8ea3237e5b180ad1d88781f0cfa4334b306642d |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/53843b5d233062fe14950759caf02d45c0d1ad53 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/293b19e909d2ad76242e44538eab61b756d344d5 |     


-- 
http://autobuild.buildroot.net
