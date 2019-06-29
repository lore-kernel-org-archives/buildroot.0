From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Jun 2019 06:00:53 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-28
Message-ID: <20190629060103.E2D0F862FC@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  16 |   1 |   0 |  17 |
   2019.05.x |  15 |   1 |   0 |  16 |
      master | 129 |  60 |   0 | 189 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                suricata-4.1.3 | 1 


Detail of failures
------------------

        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/7649ee2e7a8718b3931ab7b904020bda7266362c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.4 | 15
                 hiawatha-10.9 | 6 
   vdr-plugin-vnsiserver-1.8.0 | 6 
                       unknown | 5 
              iputils-20190515 | 4 
rtmpdump-c5f04a58fc2aeea629... | 4 
               libcap-ng-0.7.9 | 3 
              libsodium-1.0.17 | 3 
           host-nodejs-10.15.3 | 2 
                 python3-3.7.3 | 2 
             xlib_libX11-1.6.8 | 2 
                harfbuzz-2.5.2 | 1 
             host-cargo-0.26.0 | 1 
       python-matplotlib-3.0.3 | 1 
           python-numpy-1.16.4 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
            qt5location-5.12.2 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/ec59e0a00384b0fae29d7aa271f975bb69f4c1fe | ORPH
     sparc64 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/2467f09aaa286ec97db9f9d3dd2b74fc4061d857 |     
        mips |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/1406ab77f99cb624a4c2bb73531b3e2962def4d1 |     
    mips64el |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/67b85814fb6798113c401c6f83a4f1e643f3b3a9 |     
       nios2 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/21a556b721757d33f476ea15b8a9c10c8bb64975 |     
         arm |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/d7b3578676a4e4c788af19d6abe0b2f3ef70a53e |     
        or1k |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/0b79ec3e75e943cb8e0c5a26f88178f1f055ed3a |     
     riscv64 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/cb84b484dc4a6016186816bc4d6927585303f920 |     
        i686 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/c809a5285c3b1703e0b968015046ea46ad18b333 |     
     aarch64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/4f30b063e82ac0a047301d3a6208ca3453038848 |     
microblazeel |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/1bf242d4bcbb8a8cdfec51d4559e37c244596354 |     
        i586 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/2ba6e1af2ddbcab841914a8a03b4c8d700c8f038 |     
      x86_64 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/caac5e03019a98656f303178231e57f032544515 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/e8259462692e2517aced0d251969f4ea73d641f2 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/397ffcf8228f4cb25f833cbd66b3277719bc6a2c |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/ab24625ceb214f5fff84c7397ea7439f7c7bf24c |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/8c018b968b7116080a00c286c3b2f0d6ac446a3a |     
    mips64el |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/64d96f8a5878f27bcbc6926748c801a43cafaa34 |     
     powerpc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/89dc3661fb057a1761f3b459baba5a9f461db303 |     
       sparc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/afc170d29937f48aae2ba208a784f1f5114ec11a |     
       sparc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/320a58c68488cae8099eec4ff4729b01e8d14602 |     
      mipsel |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/b4363719c080ce08c4f1ff8ac71e62e616fb4d81 |     
       sparc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/913e425b17263e8361734677cf54fad1758b5b75 |     
      mipsel |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/83d0783ee50f5d7b20eb05fb9e61f8e646caca44 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/9e9efacb3f2de63a748c526a5eaad3bb0a7b2c62 |     
        or1k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/38fd41062381bfb6f21bc1ed414d79dbe8dcf5a6 |     
        or1k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/02f7e4598af39ac4db28de3545966533030e04ed |     
      x86_64 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/7a73a337280d6e81d44faa576f3cd98bc44b1b74 |     
      mipsel |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/2340a27d95bac67eadf5195eb967b407da2bcbfa |     
      x86_64 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/765c37b8a3fc4fbab10da0b1e9bc2ab5dc3ee069 |     
        or1k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/515fcc115ea897ed21869f382acd04a0c14eb337 |     
microblazeel |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/8c9705784ec566f1fdadc49b1f72ea96ad096b05 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/57e59fd0cbc0bc0087480c4867bbd6973e1132b0 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/5c703eccbc9d37ea2b27501c319c59fb772d28da |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/575b7042e2117f8c1af9a8b069e40a658c11e882 |     
         arm |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/9114ff98ef1c104a23beb758b9748bd9374ab6f7 |     
     aarch64 |            python-numpy-1.16.4 | NOK | http://autobuild.buildroot.net/results/44c096b3d79c6f72bf53644005a60dcc63d9b409 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/05a53ac2422881bde857ea7146de50384e19c06b |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/fa7462d060ad6bb20cd8098b606857dbec2dfd57 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/3b535987da8029a320fd4d69e20860b667ea0fb1 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/ac644d781e0b875bf9ca2a1ce9a102bfa1f2818a |     
microblazeel |             qt5location-5.12.2 | NOK | http://autobuild.buildroot.net/results/a8fd21dd0172fc34f7bb095c125cf76a3b30aed9 |     
     riscv32 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/1ebe8bc3e5c8abc28acbf04c8173fd0fe8d0f0a3 |     
    mips64el | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/9f9a8d18ac775749ff8952d7393ff19898188cfa |     
     riscv32 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/2102f8c16bfb5da6bbdb530f6e08265dfc697f8c |     
    mips64el | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/dc9f357284371f2f55b2dd7f2e36e7106537af89 |     
     nds32le |                        unknown | NOK | http://autobuild.buildroot.net/results/2be79a19f3193f8fc70ae9dfe1e4786cfb09b2c5 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/fae1c62e53d64ab3ccf4b5095604d7b7cf77e5f9 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/07ceeae23ee7eb53c527e27d6e631abc55b61d19 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/751921c0ec8a2118dbf7160ded87e7e90dc3cd25 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/2eb98822125b3de443a5a998619e08afaf009080 |     
         arm |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/7915d9820ecd5a97f1bd67e53ec7e534032f2660 |     
         arm |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/6593f5f2a658d598a75cd74fb76a6780ffe676f9 |     
       nios2 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/bf861f082889f3e6c5092d2f2107a1cf4633eeed |     
  aarch64_be |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/b923154fc87785c123cf5280841211f18b1c569d |     
     riscv32 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/403527be8776435c4288dcc97456aacba44a8b9c |     
     riscv32 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/aec5b1e993afdac6b4686414ca09f9db2f67e6d2 |     
         arm |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/a5e8f4cd8da1f4bb7b55c3013aaace686c79ad19 | ORPH
      x86_64 |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/288a3282bf6ed72bfd5efad1875ce5351df7e443 |     
      xtensa |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/e38e7b8d73415bf43ff72d09eb1bf3fa47eb285e |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               wireshark-2.6.7 | 1 


Detail of failures
------------------

         arm |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/9a9034ee3c1cdd9aa616676b475cccbc2e65da02 | ORPH


-- 
http://autobuild.buildroot.net
