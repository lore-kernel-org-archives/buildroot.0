From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 08:00:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-15
Message-ID: <20180716060023.49DBC207AB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   2 |   0 |  21 |
   2018.05.x |  17 |   0 |   0 |  17 |
      master | 166 |  63 |   0 | 229 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
                  samba4-4.7.6 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2cc83cfe780cc9554ba72ed4a66464638285978a |     
      xtensa |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/cb2eb47fd5f549bd27d6393142160a372d0ffe19 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  squid-3.5.27 | 17
             gnuradio-3.7.13.3 | 11
                   wampcc-v1.6 | 9 
           cups-filters-1.20.3 | 6 
                  boost-1.67.0 | 4 
                    host-rustc | 2 
               mono-5.12.0.226 | 2 
               aircrack-ng-1.2 | 1 
     docker-engine-v17.05.0-ce | 1 
               domoticz-4.9700 | 1 
            host-json-c-0.13.1 | 1 
                   libnss-3.38 | 1 
                    links-2.14 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                  mender-1.4.0 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.11.1 | 1 
                  samba4-4.8.3 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/75507419ef253b73cafb0a7cd507d58f97a56423 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/19823c70221750f8a58723e5f97f4ec37e8d1a99 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/87c1ea03ee5cd73035ed49e437f8ca550cece644 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/23e3f934f15a61235d7aee6a7b11721650320ea2 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/46f0edd6e139da4b6a518b56b420bd5dc2fb73a6 |     
  aarch64_be |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/35fbd328f9250872a30c704bdcbc5e833863da08 |     
         arm |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/647c2e1790005483226c5c4743e68b97aa64e039 |     
     aarch64 |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/d7ad16411dd6d9dcc95feab410869e6df072e875 |     
         arc |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/18134a4b7c7acc3f05a50fc29d3409e027606faf |     
    mips64el |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/d90314aa8c374da5957f7154e5da6b9d5969fbce |     
         arm |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/9a737f14664a0bf94652cd75c5345cd949b8438a |     
        i686 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/fa5799d25e2e8513d133eb8c14a625995b27b078 |     
     sparc64 |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/8042377c4524f1a3b99dda2ca5699156da889d94 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b68a1ee6ff7e34040bcd453c3b37a7bf5d34ccf4 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4edf565ad17b4b20ceed72433102f75df6d605a2 |     
     sparc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3588b92860186addcf6af69b4cfe1ada4ed8b970 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/79a9dd141b1377fc52f277600467c17df3529b6c |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d16c0feb665957f98d14ccc3a08534dd01a65ad2 |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4a719a8a4b0215e29457553bcfefd432fa0b61f0 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/8856cae2ca99fb8ed0bb62aba0697cbe3b8ae677 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/7870d1effc79540e15f16839c452c9ecca9f7aba |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/36cdd444d29f1b9d3cdb229bca9db7f569f90992 |     
      mipsel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3bdb0d563192a995f0321ebccdf14ca889438e92 |     
        i686 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a85a4b95afb5108615c577aedeb8899fe91f4b67 |     
         arm |             host-json-c-0.13.1 | NOK | http://autobuild.buildroot.net/results/9020aeae77655da6d461fa1decb8f15060543353 |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/bd7efc7ea925e3500d40e83feb08c73932083d73 |     
 powerpc64le |                     host-rustc | NOK | http://autobuild.buildroot.net/results/26102d0ec258d5ef3af36ac32371fba1c996965b |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/b95ff57eedee26159eca034070e979ca1223a7b9 |     
        m68k |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/810fb29e73495000960462c7b61d6cb2289683fa | ORPH
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/b71c71262d54466243b0f3d5ced23519dd5a2228 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/0ddead3ff41a13c21ba7679bcf10a8996c8f7b3c |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/ef7f039a27b4af6541b395705d93deb93654a13d |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/00153e5a7a6bd5d6868079caaea04559f497d118 |     
   powerpc64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/f3f362438e04bb857d38280bf8d234097e2a5a8f |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/ecc3e6678e9d30770bae8ff2988861a470d8802a |     
      mipsel |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/fa82ee9228686b82a89b54d94082c30093b23c71 |     
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/640fa173f84093cdd8cecfd6b2d49283026d44d3 | ORPH
microblazeel |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/15268a279121bb2e8facb232715700933be81914 | ORPH
microblazeel |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/47e5d776b867f1edd134c5445b7ad060b9cfac3b | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/704068044f4fdb4c880cec243b3585fb45bfae03 | ORPH
   powerpc64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/280f098e02b8c4c54a8b6dcd707dca9b8ab08b10 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/5a9d29cced2bf06fe323672d35d6fecc87e7cb98 | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/b83036f9babe33fc63dc6f8a7b75ac8ba4741666 | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/805565adbc7ad6a9c2889a7c37424ace4dddb9fc | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/53cb3ce81af9ce4f83ba9944765b74de02f18d2e | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/707659466c5d10fc386c59be911fb7ec5e216b3f | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/583d201b65b2ab693c3f505a8a3a07227217832d | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/19ff3653f8e475b750edcd180956a0cd3404a677 | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/e21e3fdbb45fb30d39d580e43825bd8971585b34 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/1b289a72593d2e89d25f481fb83bfd6ee1b2df1b | ORPH
       nios2 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/8b23a58d2d37da7cb14386d6902748da63b5382a | ORPH
      xtensa |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/307d4942362f9556d251b8fd179d4a7373996475 | ORPH
        i686 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/efcdd517609bf28ed8b311c94e788ac3ae59d470 | ORPH
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/b5fa2713747cb209a290cf0b9ba356ba601c65af |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/dbd886f3deebce7fa02af858fd08aaea21352300 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/269021310338ea65b49763b10ae0ffff9740aa76 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/e4cc4c81368a5317c75682216cf5420fb58dd2c4 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/3b135f8e0aed30a400416f7d44c90771fe8f1259 |     
      mipsel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/ed38ecc4e15a642305e90db80a5867ffd554e78f |     
         arm |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/250b100c6d0968c68998e152ce1d2c361c720ff8 |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/c922f8f0e6314b75e6fc4b762d35369c1d616098 |     
        or1k |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/2ac86798b429bf4805dc16bfe261b58552faef7c |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/fc0a470a2d30a3e3f286aa9b00c42ca715724d10 |     


-- 
http://autobuild.buildroot.net
