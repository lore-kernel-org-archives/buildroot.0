From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-10
Message-ID: <20160911063018.EF17710233E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-10
================================

      successes : 210
       failures : 45 
       timeouts : 4  
          TOTAL : 259

Classification of failures by reason
====================================

                    mpv-0.20.0 | 6 
                blktrace-1.1.0 | 3 
                libxslt-1.1.29 | 3 
              e2fsprogs-1.43.3 | 2 
                libmpeg2-0.5.1 | 2 
                 lvm2-2.02.165 | 2 
            micropython-v1.8.3 | 2 
                 mono-4.4.2.11 | 2 
                     php-7.0.9 | 2 
                   pugixml-1.7 | 2 
           python-psutil-4.3.0 | 2 
               wireshark-2.2.0 | 2 
               wvstreams-4.6.1 | 2 
           dmraid-1.0.0.rc16-3 | 1 
                   glog-v0.3.4 | 1 
                  libcdio-0.93 | 1 
                  libffi-3.2.1 | 1 
                 liburcu-0.8.7 | 1 
make: *** Waiting for unfin... | 1 
make[1]: *** [libavfilter/a... | 1 
make[2]: *** Waiting for un... | 1 
make[2]: *** [out-static/db... | 1 
                    mpfr-3.1.4 | 1 
                  openjpeg-2.1 | 1 
                 php-zmq-1.1.3 | 1 
                    qemu-2.7.0 | 1 
           qt5location-5.6.1-1 | 1 
                  squid-3.5.21 | 1 
               tcpreplay-4.1.1 | 1 
                   ushare-1.1a | 1 


Detail of failures
===================

         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/5d2aa7af7227a1b38c2c821b5b994ec2e6aa1576
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/00700df8d4b978ac50e3a411205e45f7e9884a7c
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/4497d33f10b02dce2f4085c55f16f6d9c0a4078e
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/bdf062a1dcd2659f892a2d661aa23eba912c87c5
        i686 |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/27ec989f3d7d1232579a2e9ec7e13cb3d9998fe3
        sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/cf8b22b7688c10bc75b7a78fcaf3c84ce8c0f55c
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/6302207b5c40aeb9fec8bf5b02e877d261ec1d77
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/103d51531d6eeb4744388b57f9698f15ffe4f3d6
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6b14ab2692dea7e9a6f9966c4cbaeb8dba82f0ab
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/94e984a88d1451f1a16993b34f129525468f80c0
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/2eb15ad2f14ae79756c0f44ef3aaa6312bf1b50d
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/03c6521335b9c84101a02b49cf73636ab047817e
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/d99c9fc532c7d83091a6b88cec99e0f33419f44d
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/d2d66300922268993b71d76991f8d61fb945725b
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/0a0a158d6bffe46f716be66fe9b21173fcac3c2b
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/16bdca28602ba43d75b85c64487bc0162d161098
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/d9fadb851e9c210a04c36265b5f7af180eb9b1d2
microblazeel | make: *** Waiting for unfin... | TIM | http://autobuild.buildroot.net/results/c341a67979a5ab7ae8508d45d93a41c5c90b0b82
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/794c09fb3764e085ee37a17fcfa188f28c1da1cf
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/8ee3f748de782a051d81308aa9cf2db9233c2cf1
microblazeel | make[2]: *** [out-static/db... | TIM | http://autobuild.buildroot.net/results/b060268ed718809838e56fe1fb70a695ef3c90b7
     powerpc |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/212cee82cc9db81cf1524925d106e01fc1e62ce5
        i686 |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/4f72a602702f4eac1fe8c4a385ebfeb6e1c50df2
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/9f250fc0bca9391c28a2a03c5c14d505f6923af5
        i586 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/a5d10bec8c2322511ca41f7215cf21bae118f823
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/b2be84ab2fc41cb84d67849806210d3cacad9cc4
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/9212c89f994c10a76e65fa27c7908150c3abb1f9
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/583268d770318b715cc5f4903bcaa42a043efe01
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/e4e2640cead211198e3be23358ac63769c209407
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/17551e9956cb5a8b24b81408019eade5599e27cb
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/604995a8fea4757d1d1b56f5699ff92744a1ad41
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/7d807715458dbd9b00b33100713e0df97a7f3dba
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/3de1d1e29f652ccf57e9f4adfaf9450ae696dc31
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/e348c5218f1a5208fd10d4ac01d63a2ac4656848
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/bbfabbdecc3d08cb40cc882ebceafc8985238461
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/5aeb211d51cfad7b1c7692f0b2bb09d95a34f785
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/97b5e2e254b11841675b7cfb689f6c7e9cb6fbea
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/7e616d30c3f9d5b80e8138c7af03d70099e74b03
      x86_64 |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/285a0edbbfe7efdec01d3991ca805272c2c567ad
      x86_64 |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/b1e1eb9ab225576f6bf598e7322d8eb016091eca
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/1d6d3298633100c89b8333164088af6f04e2d139
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/28fcb8d0229ab180d121ecceb858bdcfeb94cb74
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/e24ac5e656e1846d477325c2c4ab783ed3d1b1d8
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/a37601dde6657d322b1a329e696573800a2a453c
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/768d8cdf074d3fe2745259788ed9a436f46405f8
         arm |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/7853fbb5216eb0b53c125a40a769ef9407bceb92
     powerpc |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/3ae21a8b613a1503cb49008de601dce3d779a1f3
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/1136e8a357fad9ef2407f2ef4a47097f9222137d
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/b55361214e0794e92d51a6d46a79293e6da310a3

-- 
http://autobuild.buildroot.net
