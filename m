From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Jan 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-02
Message-ID: <20150103073016.B7445100B70@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-02
===============================

        success : 199
       failures : 54 
       timeouts : 5  
          TOTAL : 258

Classification of failures by reason
====================================

             libselinux-2.1.13 | 31
                 openocd-0.8.0 | 3 
libwebsock-3c1615eeadb0b582... | 3 
                   erlang-17.4 | 2 
janus-gateway-c632c1e9da5ff... | 2 
                    ruby-2.1.5 | 2 
                 libssh2-1.4.3 | 1 
                   lame-3.99.5 | 1 
                    dash-0.5.8 | 1 
                       unknown | 1 
             host-guile-2.0.11 | 1 
                 webkit-1.11.5 | 1 
                 dmalloc-5.4.3 | 1 
              libarchive-3.1.2 | 1 
                directfb-1.6.3 | 1 
            gst-ffmpeg-0.10.13 | 1 
             sofia-sip-1.12.11 | 1 
                  poco-1.4.6p1 | 1 
               lightning-2.0.5 | 1 
                 python3-3.4.2 | 1 
                     rpm-5.2.0 | 1 
              xmlstarlet-1.5.0 | 1 

Detail of failures
===================

     aarch64 |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/e51670bd5ed0b01cd8c2bb0d55680793e44fb61a/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/9b9c77d45760fe49bb8b5629b90e857ed068b687/
         sh4 |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/2cc40ae3fc8b7a287c43528b3e4ffdbcd5033c09/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3ef897a855e62ef42f97c9408946b4a8b4fc4214/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3576728c409fdd51871bad171326a8f87932e155/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/6fc7239c84b13d8b35332c47a6229e408cb3cbdb/
      x86_64 |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/0b0651771cb5d38848251645d5a5c60568b4861e/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/db83fb0aab52a088b41ee59c220c02539f3cc764/
     powerpc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/fdede04c59a4d40a405ec4b5b50d9c7d674ef791/
microblazeel |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/6cd4d9fba973a041158a42b07bbb8121d0299058/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/76b81be4668a41f2c603babbabf3ace52e7fb94b/
     powerpc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/57fba05a9c51100eec7c9594737900103e1e5d00/
        mips |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2d4c878a737e36820d7f2c26a2344c07c2128c1a/
    mips64el |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/3497b46c5d9bd3c21024f4386ebb1a4cc415e5b7/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/54b66d26b469b54351535debb86cc952b3ef932a/
     powerpc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a9feac6a36ed5140636315f3cbd997cdde1f6b1e/
     powerpc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/c2db2af2c82a0a740f44f22e548a875e14900588/
    mips64el |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/75bd493917735121e963da1fc12e4eafb7651fdd/
    mips64el |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/d9b2c90e4c938e9e8bcd0dad077ed0ed63322e2a/
         sh4 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/d90e40f7fb6e1a7d429454d04b9f5f69826a842e/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/b1c54326e374f2f1a6a16349233e9bb628191cf6/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/90dc73980a45b9b0441be3d493b22e3afea3cd6e/
     powerpc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/68b6caea629263d970804a8d236ee0d22edbee2d/
     powerpc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/92f21e2d4efbde99ce7f33c8ed8a0db74d0ae807/
    mips64el |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/4a7b71f1471b889abf278882a7735475dd95451b/
         sh4 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/d86ed2f7bb18dfffa5ed2a10da07326dc1068a09/
      xtensa |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/74d89d720d3df5982b93c2e76b424ab6734e9736/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/85a91e3f50117a17e871aac684ff40f887155c57/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a2c143fb3dcdba626b780dd54694403d5d0c7d5f/
     powerpc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/59e8e72041e9acc8c72ea4b7937b2e0c131534c1/
     powerpc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2400d8d95f296613478c349900055ba0edecf90a/
      xtensa |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/da14e7a925717f70a856ba838c17a1120f41e868/
        i686 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/bbb38e6d3be9a23d2dee690274175f45429a19cb/
        i686 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/722488a0e678fead5d32654b66c1c6e3bb55a94a/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2c959957183dd86575bd35b91d884cbfcb49e3cf/
        i486 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/7a8426f60a7377e3b08e6502f4e0b2c738002a79/
    mips64el |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/9f2394b408363fdf6d2f86b17662fed20cd97f76/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a0d21c2d7eef87d1b708a93307f49d616366234f/
     powerpc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/7f8476953555956a7917ae6d928505285db870ee/
        i686 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/afc2299b5b6e344a32bbad5720d0eac038f4e4e0/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/b0452410f5adb5940ba55366e3a367284b7af960/
    mips64el |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/bdf621c5a893bce51db95f4a8f2814c14d2f6d49/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/108e5804adf4c7a1d10b969e481ae32cc574aa8e/
      mipsel | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/95109c7e37aa21228bc71c69e9c66a6821f3174a/
        i686 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/517bc814732f86dc6dd1a5c91148ce52ec9803f7/
    mips64el | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/337d03f7bdf0785181b68eebb88b135b9985778d/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/0c9d05241757f5cfc87a396097b154052758d31c/
        bfin |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/e90b4d5ad79d99487f21c9d18581e8eba7034501/
      x86_64 |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/e2c6b72231f9976a3e6ab50279a5850574976183/
        sh4a |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/91d2ae34f14f1978e0985e75f803055d51201a93/
         arm |                   poco-1.4.6p1 | TIM | http://autobuild.buildroot.net/results/4419ec6a17038c7afbe2647487e6147021ea8cc5/
     powerpc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/feeca6fa1e4f32c4d62008364341b7de7db7f7a7/
     powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/abe3e40ad0ef40a0b96f053edfda3ec0b6476bc1/
        sh4a |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/516cfcbf76ca87251148e8669bdde24502fedae6/
         arm |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/ccc1d8ca4d742dee0a4bd112ee120b17edad162d/
         arm |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/84132db699d430c5c8dc6f8408c097a6365546fd/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/31705fa991424ef57ba7d938d5dc8c61fbd2940d/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/901d6af05c6a94422e78a514845916404a28bc34/
        i686 |               xmlstarlet-1.5.0 | TIM | http://autobuild.buildroot.net/results/303bc4489ae25af28ea92d90505282dd5b8de995/


-- 
http://autobuild.buildroot.net
