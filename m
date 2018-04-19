From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 08:00:46 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-18
Message-ID: <20180419060046.52DD520711@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   1 |   0 |  26 |
      master | 152 | 120 |   0 | 272 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 1 


Detail of failures
------------------

         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/33f32dba53aa382908f12992ec1a219769ed4a6a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

dtv-scan-tables-07b18ecef17... | 32
host-squashfs-e38956b92f738... | 18
                  zeromq-4.2.5 | 12
                   flann-1.9.1 | 9 
x264-7d0ff22e8c96de126be9d3... | 9 
squashfs-e38956b92f738518c2... | 8 
                     lxc-3.0.0 | 6 
               libglib2-2.56.1 | 4 
                  udftools-2.0 | 3 
             bluez5_utils-5.49 | 2 
                  host-go-1.10 | 2 
qt-webkit-kiosk-34efddb0bf0... | 2 
               asterisk-14.7.6 | 1 
                  ffmpeg-3.4.2 | 1 
gst1-interpipe-10dba89eecc2... | 1 
                 host-icu-60.2 | 1 
                  libcec-4.0.2 | 1 
                    liblo-0.29 | 1 
               libupnpp-0.16.1 | 1 
                 mesa3d-18.0.0 | 1 
              openblas-v0.2.20 | 1 
pixiewps-9e5bdc6c86c8487b2a... | 1 
reaver-9bae55bd30b6d46b42da... | 1 
                snort-2.9.11.1 | 1 
                   wmctrl-1.07 | 1 


Detail of failures
------------------

    mips64el |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/9cb9613d9baab545c731557093dafb1a4e49e581 |     
       nios2 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/a82ed0b082aca2fb8ce555b00d382b617bc62e92 |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/30b8f2dffda85539c4ff10c0969d86a855269785 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/487f5f9786264ea04f470999b20c449707d75fcf |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2d9f3da6cb76d9399288a8cd49230dc5d55fd6e6 |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/887b2c6af4de91c150073ed2f5432c9fe3bffbc2 |     
        mips | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/9a0111b84048ee9b3c188fe6e948330caec7e46f |     
        i686 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/8c75f785372c035269162e1d674e369639a0a97f |     
     powerpc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/879773a1f0c32aa98e1ef1c635fb42eedb88c240 |     
        mips | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/8330e50d2bb686e1b78f7ac743960603b74d03f0 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/152e5bd437da13de3c993007074e011e3a73eb15 |     
     powerpc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/1cdbfeb265623b20ada675adf4ebb7a7399b6617 |     
        mips | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/cec01c3e3c58286f471ecd6001589bd29c629b0f |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/1c6af568919c135f8e4464f3984d55b976f6866f |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/a4dff3cfd8cbf6983fb6a576022e5bae8f49a803 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/b4510aa4fc957d3553ee244186f9edae20faaa5d |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/061c603ffe5c0611c759894a0d421aee823ad1b3 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c07dcbd84244b28aedb7a89614bd5e15d7fa06ce |     
   powerpc64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/f1165b41e60e2b037ee32d66aab627c9947c3fb8 |     
         sh4 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/eeddb3858e010dcc69ca7f0236e7f6b326fb7c89 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/03c4a3199bdae17ebaba52c7cbd308a566f380b2 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e847c6cf466182c497faa4e748de568144ab0977 |     
        i686 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/59d4e40ce1802ab3123087a8ade1636af8e1ce92 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e023928238dff6206d4b706406e18ffcb0f7d296 |     
     sparc64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e3ade0ecbb75f640cfba725ef8b2eefe0db8ac6b |     
   powerpc64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/03e57ac514d4680b986f39fb8ff73bfb3369d2f7 |     
     sparc64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/3bd26d95f55b0228354a2f60e6b38756918de5ee |     
     aarch64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/87eaa2ebeab16b0fb260d979d9d626c59195e5e4 |     
        i686 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e10f90c7408bb3e81849d0e3522807d89476d4e1 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c70a996ce22ce74b3efee8c6ff8f65bff660ee4e |     
     powerpc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/d0c132d086cdfd2d024a4699acc7b1d6dae1ab84 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/154cacb8c416f424b7b4b6723af2fdbf67924132 |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/69a444094a30a54571e29828f5137b53c3ad612e |     
     powerpc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2ba88d7c11051ed94ba6f2730a50e5b02cd1d2ad |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/48bdbb2675724d2eeba83d62f63b91a5c400ed95 |     
        i686 |                   ffmpeg-3.4.2 | NOK | http://autobuild.buildroot.net/results/fba30241917c8c140a938ae9d9f7509e1857a4c0 |     
        mips |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/e3cb168dad45ac27c3ed5efcb5c385398772e593 |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/1446e43de54fc80d8f7d6c2c797e6d0678a147c5 |     
      x86_64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/7d5f91e88f465b93b03c85555c40dce0f7b35de5 |     
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/b2febfaf8c44ce477b3e4a5b9b976fd25e8d7454 |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/ab4ed6a363bb16915a81a3ddd5193b5632fdbbf1 |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/8d1728e28ff9404ca53e5ef93f6c7e6a3b703706 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/47852e68d58b9b2a4dd6b50809f405a9380d3d15 |     
   powerpc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/85c8503c1eaa7cd3a75b13a674aa29c4d4c1b894 |     
         sh4 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/dc031d701453d20a47bec687235d102fef1f1486 |     
         arm | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/2f335d60b6c7961e60233cf370eba5decb5893ef |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/ed2698561c5c2e2f97a399394aaa7f06c4d68523 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/31a0b4ab3212e3a35ad6b1fa04c5b5b5fff3b606 | ORPH
      xtensa |                  host-icu-60.2 | NOK | http://autobuild.buildroot.net/results/97ff1ed1d098339517c2f707043122d604cd7c16 | ORPH
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/76fdb90bab3fdd6c4237ccef66d2e31792bf8b61 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/bbb6a191a4246a838a2fcb70a298f176de9a289c |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/a297d96fb4e9221c012fb52e2f496e5a5b788202 |     
   powerpc64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/803eecc1d03c5a827e738c9cd0cf131d7ada7674 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/7185ff8091a352886b2ddcc77b213afa6915dac8 |     
      x86_64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/85270c5eee63dbdd26dfd9f6dde0c6945d0b9281 |     
     sparc64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/d9d5b64225a39a7711143fe75e3a1800d4df403c |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/1641eb80b1962755f4f59c5b64662c517f176c1c |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/043ec311d6b9ef09b3dab22db1da6a0ff2793d9e |     
       nios2 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/2a0343859d824bd0da260860498333434fa7d152 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/3101ae1ac6a176971ca5ce67a3f48a06f24ba4f6 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/be4c57b6c2bc147e2c87b1da789567c921c7b75f |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ca202798c24913685c07e6526a7d8d9b97412ad8 |     
     sparc64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/7510c9b523473c7a1d84ec69dc817bf012d5019a |     
      mipsel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/58a594c1331ddffdba92beb4fb3afaf509e51843 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/afb201bcbbfbe8acd7ca158f9bc2514cef8d6103 |     
       nios2 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/c524bcb8ee040d80e7916bdadfdf1950b6db63d0 |     
        i686 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/5c3c2695564d93710d08277ad5c070b0b0b4c6bf |     
      mipsel |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/3b1182783fc958dfed96c6b1c097993662fc7308 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/17f565fac0b0e86b493c7c00c395ae138dc1d412 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/da89a7a45a4578387e2e14678e4c99e77ac3f12b |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/182bea84b7c812a1664389aa5741aa5bb11f5053 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/8868080eea85798dc4272e7d602321d45e627991 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/3cad200c955b177c24853e7299bd4055f9a8047c | ORPH
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/c185262bcd706ebd0cf04978b6cca7d7e82e6bda |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2fa70d7f063985e69df15221066257bab0f993ee |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/6e90a30b4b06e99228b445bec38c623f4335b653 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c838100a6eeaa5865d4c34f9f0f6017faa14cdd1 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/4e48595853561eaf4576cfaf9009d4122c9abc10 |     
   powerpc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ae7d544c607bd8c78d8b02e8cb051a7d6c9eba37 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1cc5429677902e5d6d703cb3342cec5633a2fe12 |     
     powerpc |                  mesa3d-18.0.0 | NOK | http://autobuild.buildroot.net/results/27ca02215658233789de3f6322db9525f369490a |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/0ad6cd1cf814df05ae2a61dea917d7052dae9b16 |     
         arm | pixiewps-9e5bdc6c86c8487b2a... | NOK | http://autobuild.buildroot.net/results/c3d0440181cb7c778f0e2969080c0a0156e675d9 |     
        i686 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/cf2db6e766693e276b0fce6ea8ec9223efe6c58d |     
         arm | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/d01d491463bdb6cf57cc146650ee30cc0c928392 |     
    mips64el | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/0fb387f0544e962e5080ea966864f325fbaf4117 |     
       sparc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/8f171b47bc0d3b0f32479e659d22267bfa5a3355 |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/835da078ae6447ff6f465a9cb68eb5e6885f6558 |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/5f1ddb0dc80d3d7431c5641822534fa2624714d6 |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/5ae7a8a1967bb1af471ba5aca141d68c21a0d703 |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/f026df2eb943d5a27ca81b7c250a0d184c3f7662 |     
        m68k | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/903a9b96581f5fa0c233a560cba2bceeca658be3 |     
    mips64el | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/bc241f7cedda685b5c15dbd94d2ed020347d0738 |     
         arc | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/06301c023ec9dff12585e6287f5ecdd6bf2f1d04 |     
      xtensa | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/cf9d9cf3ed609e888d6efc27a12eca5b6bf9bebc |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/6d7ae19a696123808323ffd755c2861308c032c1 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/260807a4de22223aeb9a99e14fe2e51c7bd256c0 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4aae91328670e5874b7d0674c3f92b57e32cefac |     
         arm |                    wmctrl-1.07 | NOK | http://autobuild.buildroot.net/results/9495fd39da4de6cc774f45e31098951cb7178855 |     
         arc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/bf04232c731adf34cd815563903d925ca3eebbff |     
      x86_64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/233ed6a40557b274c833c86826b878f85bbdcf0f |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/da7adc2876257accdf2f059b2c3dce117cceff3e |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/6a1ff65868a79aa5fd31d17fce8e2da0f5f69f1e |     
         arc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/0e752b50ddc8928def4a0c8c7d1099e65b35bed1 |     
        i686 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/66050c37b7f6824355dcd823a48ef39d518913f4 |     
      xtensa | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/f84858a79134332ea512001c5e2284f9e55acb20 |     
     aarch64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/8472b3ece65846ed2b76fc917ebd3d70f51dc413 |     
      mipsel | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/4a8ded362f58185268cd60cd6b01e6c0e7e911eb |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/260edba9d228a4ed9e0611c1ec138be14bf039d1 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/fb5c3b8ff90d7366f6013013ca9e8b33fd269549 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/023497813fb3fea5dae557b35dffadad2ffa3498 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ae291d463922298f4200b70fecafef7a8f34fbe2 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b0f93954340301c99e4e1eb58b425c1e1c5ced12 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0fa62c7f40cd7e679f91f65a69a9243edd6eb2c0 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3d79896b0f7b027c84486612513a5ff89ade4795 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/173a67baba52a6d4e89f75100307621ebca7fa53 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/f569c9fd54bfdbcddffb5fd393a8317408e9523a |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7f1a987abb66484322c5156573099dc364201341 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/31c13ae923ff77656c1b7ff70afb9262edbdddae |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/46e2964f825a436ecedd621fdbdad30eea445f21 |     


-- 
http://autobuild.buildroot.net
