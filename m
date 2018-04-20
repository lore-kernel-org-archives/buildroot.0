From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 08:00:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-19
Message-ID: <20180420060011.1E6FC207B7@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  40 |   0 |   0 |  40 |
      master | 111 | 117 |   2 | 230 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

dtv-scan-tables-07b18ecef17... | 30
host-squashfs-e38956b92f738... | 27
x264-7d0ff22e8c96de126be9d3... | 12
                     lxc-3.0.0 | 9 
                  zeromq-4.2.5 | 9 
squashfs-e38956b92f738518c2... | 7 
                   flann-1.9.1 | 4 
                  host-go-1.10 | 4 
               libglib2-2.56.1 | 4 
gst1-interpipe-10dba89eecc2... | 3 
             bluez5_utils-5.49 | 2 
                  cc-tool-0.26 | 2 
               libupnpp-0.16.1 | 2 
              openblas-v0.2.20 | 2 
                  flare-engine | 1 
                host-libsodium | 1 


Detail of failures
------------------

      xtensa |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/8a2161940c29b136d41f0ec0eff27f2ec61cbd1e |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/dfacb63e6ac1e9223db6800e6ea35721a4e692fd |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/cf4bc20a0a94778c6ff6321ca0b294e5ae9342c1 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/8a02385fbdef32070c78da181096427fa9967e16 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/be2bc3e28f8c7ab6fd8399cf2acf63f8a945d2e4 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e5ebf259e8debd4ed72b0378b39af058ab0e47ff |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/64aa8be211578cf66cfe0fbc5b9008a6d2bd543f |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/f3be0610736928b9d0f5c578b03c7bae4939d7d6 |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/5c4c14cbff2566e68df7a74ab586f7c5e88179f3 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2e1ec4a471be2524d0a27b21b9e4f71f367799ea |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/a332fba3dfa3608793b201d9fc0100a7a938419e |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/4473b15bcffdcdc8b32a69d0b0c4f1a3b6b20d0d |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/ff493d51b0fc90725ea71422fd7f9c9a483f75b8 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/1a7ff62bd6522b50294fd2696e1acba70fd01d4d |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2b87758b8ba56ac3832d77f3139c158e3229af1c |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/29a2635514f07b0bb62e73dfe9d230e22310f09b |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c92c61938ad5343f74623b4536dd13b89f2e94ec |     
     powerpc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/cfb665e6b03b069889d2967ee4125c551e6228fb |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/8f9b3919c6e4da44c127fce2af1966e911b3ea9c |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/854253d259baa4b7e6075510131f4bbe65ad86df |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/d7ed5b7d13f742126c1c0cf6eb400ff1afa6739e |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6d47dd032212af43e63321dd39513bde11c3b227 |     
     sparc64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/8d53a9e56d3098dbaa77f74a8bc649d09cdd17aa |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/22de4cf5ee65b19ead0c05c26b701f9a46625f74 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/5da1c3424628b538b35d5cfedfb482fb671b7f1d |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6259ee4b3c15a7b67a673b4b1ff6d79d82d98309 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/0c27db9518b540f0a97e8857e4d83787554737b6 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6b96fbd5af82e0ca952922714abf9f7525fc708a |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/34a0009b43c14889c1825cc305cc486450826f7f |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/d147704033e5e90e9ba2cec9be528a72e78e44d1 |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c914c34a06fbe4a9e649b3913e06338a1b1fa89e |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e7ea63524f42bb57fd08adff8b508480555b1203 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/dff7dc2e51edb42ff16a27a8df69a910887d4cc8 |     
 powerpc64le | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/699e60c3d0cae9c1a2adfdbe10b77174cdf6932b |     
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/71ebb97d6e067b373a7a46e3ba5c1c6db1e1e0e9 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/84230b4e8a77d67c20a04cc260f9dd87396b5a69 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/45353f987235220a19b543610f42f298fde2dc8d |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/8ad10ff6e5d833ae1996b870cba647e687fc2c93 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/78cc528589c75af9cfb490407375cc92461c33e1 |     
        i686 | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/ef61b0124ae82136deefa762c8ff175840137266 |     
     powerpc | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/a21b3e4ca00a70bbf575cd6f35b2ca0f247502a8 |     
         arc | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/e95e53a57d786e234dc401ceb47fba5df13f5633 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/87da3730c32d09d0827fac21a2d8137ce74704ef | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/f7d0b0cfaf0b47a352a1485a346d06c2670d2b25 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/b7b73714f93a0191e602e3f8846986f27888f08e | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/dbde3ce07c96d83095ebca154687aa8ff5d2e900 | ORPH
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/0cb659257f06ff63550f2b21ca864d797595fe71 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/c508e18745872c50f5f0fcff9348e138cca2f8f1 |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/34fd9d2bc4fd4e2e85ced0eff1706e664d1af889 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ec0488b632c196118681bffaa390cbd76b754641 |     
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/9187ff344c9749e6dbefc3bd0df227d61ea7bb2a |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/2b67d22bbd90a4fcbc93467e42b444ca6c82c2ae |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/551c17da8731087d7d8cf6b85bb1a6634cf084a4 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/517e723685398b87b612606e20be51df5cb579c9 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/956732c26dcbdfcd04eaf32223886432a04ddab7 |     
 powerpc64le | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/8794354af7c8755a54d66945e382137f3085415f |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/9f60b13aec4d94ad0c2f09d94547f7d0295eb4d2 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ff624b8e472e1a6ef498f0495fe190195f1721c6 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/cb158a06a136bcb5774c71858e85997230fbe64c |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/226e360fc4a7a6ef68d78973e33998370103162f |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/95a27b38bedfcff3332ad2201f2a7f6777e1e225 |     
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/1340e16acfa5739f4ed96df70f836678bff9fe52 |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/e94bed13d84db6792258d9f9445face28eea4bb1 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/d0507c724d539f8ed688c983825a982ddbe5ee31 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/a23bf3ae64ca281ae5fd2ff26193f661a2d18846 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/9950c31eb76145a467d53132600d7033912c2cb1 |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/b4342236340f50b2da44f4f36e16ab2b28ee7ee2 |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/a051a75e725a0741e1036bdaaff07a135091a58e |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/f137f61494e3a5c512539baecb33bd2de114e49a |     
       nios2 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/43687142819951839aa5d8fb8ee66b58df12326b |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/0a238a7f55ea56c33b639ad03ed5796143426889 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/8ad2fb66bcbcf7875c69cbe079b4bcfb878b5b8d |     
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/eaaea7f89b733ea6c5c14244321d2b2e237981f6 |     
      x86_64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/0a53f390ec60cb4afc217c5f43099c8a4fb72ef6 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/0991987aec240e053ef20b6ae62e2cffffeb3fd6 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/9b5ec1ba64011d25d4918a39328cc05aedc6c43c |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/3b0abc94db544229ace210ee021987f3b3c3df9a |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/9909a27371d4f330e92db2d28e50adea4642847f |     
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/c557bd7655b17453520ace2c79be8fbe6920d949 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/362bf19a3e4708f1cb162cbd6bbcbe2da3f9cb5c |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/92618678bd6285f9c00f30b12a2d1e4629a8ca40 |     
        m68k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/92a8a90e75a7297b9ea78b14caad895b68dd5726 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/51e9a8470a0316007d8d5def128b7812c7dae126 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/79a07d22a935a1525435a5343831fccecf098fbf |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ed5385e494c71d2feb4cff50aa5e210874d4fa79 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d191a4dafa7cb286713b31ecaea1034b22a0cce0 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7520c031c04010f4cff8d41a4a38865e75118a85 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a0a974e1bf7e67b46761775e45d971f907fe5f52 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/26178dfef2ee4bd19cd669d968a626853ead7af7 |     
      x86_64 |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/9be831ffe56d9a29ce8bc5c7412db63b0b19cab1 |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/007c0096de4e6968385449448ffab5c3411c2cad |     
microblazeel | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/07908bcf476cd55f3e572d8f9eeff22937585d5a |     
         arc | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/2a3bb17d03b4d4089f6a807d3ded4871096654cf |     
       sparc | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/7512958333e9c603346426377935b380b5e6faf2 |     
         arc | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/49f46dbb0a475024318da77a728d180f07fe8047 |     
        mips | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/804ab88c2ea0ae8a6ead75f523c0f27f6a232bbc |     
       nios2 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/fab69315f4a06e88e379b89981ad640d31c67e10 |     
    mips64el | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/7d458d7459d0e84123a7decf734311e6d37466e0 |     
    mips64el | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/f68a548c23ff7ede281bfe342079184c42b961b1 |     
     powerpc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/c6dfb718bfd1f2c1eaa14b5a0b7e53ec13823065 |     
         arc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/0ec1c62f9a876aad1d465125b44627b449c32651 |     
         arc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/871bdeda4e5b151ccf95a53ea9911ac040ead4c0 |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/39e09cae434933bf8db6bdcfafacc3135e161950 |     
     sparc64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/07a8391952531a1815f7042b2db46f8949222717 |     
         sh4 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/f2399eeb645c6b7e780634c8c1fbeab4e2e779ae |     
      x86_64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/442bc92891e75d4d8cbf3dc400fe248bb3a1a52c |     
microblazeel | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/ae8cbe2863bde5583ca81114c7a8316043e2c2a2 |     
         arc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/998737ddb10116d6db71c4938aae39518e0280f2 |     
         sh4 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/5d121f4b1540c44d80213745fa2d6e880de1d645 |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/dcb265a8c2fc0550bfe9674217dc6d07d554f829 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/303ed94f42f05e002c2effb4548599680e47f8ba |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3f07499ee733d11e1c638b4fd9ab223fd8978f14 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/01e4cc94e62922aec81c0c92befe4aa7987a06b6 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e0b93eb7eaeb8cb6afcb2d2837e22d3983087940 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/055e7f2fcc42bcda39b82966efccca4a8ad04188 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/177b4ddef8a1b4a6258ea185593f1a8098f27fbd |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/deabbd760f64ba8972ac7402713d4b8af391f69c |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ce0cd98f0db93f722054bee00bdfcb6e8a6e36ab |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/fe83daea3db76489e1fe4463ae9015fcb27b8532 |     


-- 
http://autobuild.buildroot.net
