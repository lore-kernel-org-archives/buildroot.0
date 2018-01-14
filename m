From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jan 2018 08:00:04 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-13
Message-ID: <20180114070004.AA6D320888@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-13
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 179 |  67 |   1 | 247 |
   2017.11.x |  21 |   2 |   0 |  23 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              e2fsprogs-1.43.8 | 17
linux-firmware-65b1c68c63f9... | 12
               domoticz-3.8153 | 7 
                  boost-1.66.0 | 4 
             libostree-2017.15 | 4 
             bluez5_utils-5.48 | 3 
                  cc-tool-0.26 | 2 
              host-erlang-20.0 | 2 
           host-mono-5.4.0.201 | 2 
            nilfs-utils-v2.2.7 | 2 
              swupdate-2017.11 | 2 
                     daq-2.0.6 | 1 
                  ffmpeg-3.4.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 libpqxx-6.0.0 | 1 
                 mesa3d-17.3.2 | 1 
                 mplayer-1.3.0 | 1 
                  physfs-3.0.1 | 1 
                 s6-rc-0.4.0.0 | 1 
                  samba4-4.7.4 | 1 
                       unknown | 1 
                     xen-4.9.0 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/c495ce259cd4f0cd315b204fbce58a7c02035a1e |     
       nios2 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/282e8c6f6d9174bb679a7b2f1b8c052be0e6c789 |     
       nios2 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/0197ee0036e129b736c1dc0e83722236fb656618 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/a4c8d1964e80dd558d7d6c8b493c7f9e764fe571 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/1a1090b116cf368682021c6e4cd9911e794d713c |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/760dab96c64275b696f78753bd30519f794f9656 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/1237f1a256da23437e411448116469af872adad6 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/eec9c89001ee3235f546eed670e73af348b0ba90 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2b41761b05dbebc2e76ecc2c232c1d21dc04760c |     
         sh4 |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/a63c18c05abf6379408617de47dea8d911bf106a |     
     aarch64 |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/5f02c8fc84889748f283ee1cb76248bb0880215a |     
     powerpc |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/794cd2947f413ccc2993ac63d0d814c10a2b2356 |     
      mipsel |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/af96ce4eab787c46a590ee5bbf2bb39ce7ef2198 |     
    mips64el |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/d00577baf2edf7838d23a3f8808d6ae254ba5bf0 |     
         sh4 |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/6fa33c04c8dcb0449b5c966cdc21a82f961df9d7 |     
      xtensa |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/60c12f933cb6690e3fd38162b0b07c974bbad600 |     
       nios2 |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/0ba9c7145c0d7a30625c6089e325fc2fe560b0f2 |     
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/49ba19d6ab3e0c1644485212e6d1f014f41ff49f | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/6fa0590e31a36db696c1db695547aeae421823b0 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/f41df6b541f91ef34ac3abe63d165a857fe9cec8 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/8aeb5db335461f86e80e1c138e6036b9849ce45c | ORPH
     sparc64 |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/de55040c1483d65af4255e39378af078ef10a97f | ORPH
       sparc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/4d2c5457a9c9a31d86409ca78fbc6d776fba6248 | ORPH
        or1k |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/0f01192b03049f2042d318b3a2589ecc19d1cdd7 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/33f54b271843f926c94b8261b0d7e708987da407 | ORPH
   powerpc64 |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/bdbfa5ee8e92050a2914ba17a2ed1c5625ceafe5 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/2165d7b5d2c852237e71b52ea3e96091b6a7f0f7 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/ae4d6768948b238cde395d7e3adf1964bf313159 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/3b91b2fe2de66a51f9f3871a01dfffa2ac214a38 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/c3e179dc1095182126710e07162d09703524a41b | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/9b2a6c3ea1c4a99afb8fe967287a0b5bc0eeae1b | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/b8d5545e8a287dea27b1c36b1066bf183d61e01d | ORPH
        mips |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/f5de34af03bca16c1a1d19a945aa7cc17b58de10 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/e37d1fb836c732dd04025d799f2ed4866267df0a | ORPH
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/f9ab65d87131303d8835209fa8c60fd091f2063c |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/90183318b3bbf9f1396267e20d4f277195ee8237 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/14676a9dd78bed2cfee62283577e233e9a33ba33 |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/b9face2d6b8f11bbc793686fe97dc5a783b63ad9 |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/d11ff6d4c72b1ef6ec92d7e343ffa941003d437e |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/763c954a3b4292cbfa8e773646fc118dc3e97d64 |     
       nios2 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/47e69aa0929fdc64143fe17488cce795f0ca2ba2 |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/2657c790d1d9f8115bea937ba717accec9e3043e |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/c485d92b89e9201894d6a929008eba60d4eec811 |     
      x86_64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/a4b2210bd701b60315d31b8448bede02caf9d157 |     
      x86_64 |                  libpqxx-6.0.0 | NOK | http://autobuild.buildroot.net/results/48b015650ede4e55e199538072c7228cccf64422 |     
      x86_64 | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/a66dbcd33a5972a7cf37ee2664c3314c135a8cc8 |     
      xtensa | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/5110c3b64a868cc029a6e2f1453f003c31ecbfc3 |     
microblazeel | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/808d36fb7d299d7b2ef634df70b4f79047bf75a1 |     
         arc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/68bc1b77eba3ba0e9bf13e4cdada120138e6dda4 |     
microblazeel | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/ab8f8548e74ee17ddc12c0a8f6232c79c9dc49d4 |     
microblazeel | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/221ebc9f7bf1f8955fd1c7a2b7c82c28e4465dd3 |     
     powerpc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/8eb48ab90f5f18c0a7ab49a811f54157790da143 |     
microblazeel | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/8cb94cd62b2caf08aea0020df4722f6bc2713a80 |     
         arc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/1b3bce92c49eeb9f7a85643521296b1b0c348deb |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/2b376a6fc4c6cad719b7779f5563b47fca9161f2 |     
      mipsel | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/f4a8d4c43758b55cf78a2d6f914fdc7bac38a61a |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/d8bd944592671c4b8062bf41bdb4c3b41ceb1d97 |     
     powerpc |                  mesa3d-17.3.2 | NOK | http://autobuild.buildroot.net/results/d84f45301598ee809715e1cd5075d5ca498e66a5 |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d882193f039c79ac9da2f79bfd2cae5df1c78b60 |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/c04ccbab93b1e422c13b33b30560c0552e9dad2a |     
        i586 |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/a08c7a956885e325ced9077de834c7067215367a |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/1f119c6b84d5a946deefe78674be71b2b65784a6 |     
         arm |                  s6-rc-0.4.0.0 | NOK | http://autobuild.buildroot.net/results/f368e0b4df05a641b912044dde5bac1e61172e8d |     
    mips64el |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/d66bae38bea3736677050bb5764b71540a0db716 | ORPH
         arm |               swupdate-2017.11 | NOK | http://autobuild.buildroot.net/results/b87c7269459fdae241f1345c389e322456d5fbaa |     
        i586 |               swupdate-2017.11 | NOK | http://autobuild.buildroot.net/results/d5705f9e4289186a7d9b96c553339f633ec081ec |     
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/1a3081cc1afdfa7a9ec31e84803f0091fbb3d82e |     
         arm |                      xen-4.9.0 | NOK | http://autobuild.buildroot.net/results/8bcb80dc93d38bb38ca32ad93d52c22d1176d57e |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.65.1 | 1 
             freerdp-2.0.0-rc0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/995b6e398f9bba083df49141c1f5b8e3232dbb4b |     
        or1k |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/e16e18429f63d22b828a722fbee827b621de1d32 |     


-- 
http://autobuild.buildroot.net
