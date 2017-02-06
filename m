From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  6 Feb 2017 08:29:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-05
Message-ID: <20170206072930.B423820B89@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-05
================================

      successes : 79 
       failures : 57 
       timeouts : 0  
          TOTAL : 136

Classification of failures by reason
====================================

                  libcec-4.0.2 | 22
         libevent-2.1.8-stable | 6 
                     vlc-2.2.4 | 3 
               cbootimage-v1.7 | 2 
           imagemagick-7.0.4-6 | 2 
                 libv4l-1.12.2 | 2 
                    ruby-2.4.0 | 2 
                      tmux-2.3 | 2 
               bctoolbox-0.4.0 | 1 
                 glibmm-2.50.0 | 1 
                ipmiutil-2.9.9 | 1 
                    libiio-0.7 | 1 
             libsidplay2-2.1.1 | 1 
                  libsvg-0.1.4 | 1 
                   ncftp-3.2.6 | 1 
                 openocd-0.9.0 | 1 
                 openssh-7.4p1 | 1 
               openswan-2.6.46 | 1 
           oracle-mysql-5.1.73 | 1 
                   ortp-0.27.0 | 1 
                rsyslog-8.22.0 | 1 
                 sngrep-v1.4.2 | 1 
                    sslh-v1.18 | 1 
                 wavpack-5.1.0 | 1 


Detail of failures
===================

        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/6dcfda595d2e41e8b814d01385de3193dadb2c2d
         arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/6784aa516809087e3c061adc3185eee228c25fd8
         arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/6c80fb8acf02f8131ca60926bf9bfedc8893f865
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/9fe4b79b7db53df3f17d5e2d2b1a0674658b52b8
         arm |            imagemagick-7.0.4-6 | NOK | http://autobuild.buildroot.net/results/9aaa044f78115d7f599ea09669c0d6bface5633e
         arm |            imagemagick-7.0.4-6 | NOK | http://autobuild.buildroot.net/results/aa80f2fd4c7dd884ea8a1b55ad15a40c7bf40501
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/86be47dc534df2d7ffd9f7a5d6047dfc0913bed1
        sh4a |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/3491c906f4c179d07a6a4f8de0a783f9aec110e5
         arc |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/8c1ec52563a5a2746a5a6f98e57981f64348be1a
      x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/da9d5ef0095205827abfdee531a72fce9afbb7f1
       nios2 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/d1a86c9709e1069fa8ea1fde63a9eac5b254ed2e
    mips64el |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/aec0c458b30b20854a258cbfb3f7c7aa2b4912b3
        i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/8b7bfe50f4fb5d32594c2e96bb0038ab7783843b
         arm |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/8b91dd787ea249c750f0957d19bcd38472c599ab
         arm |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/0119a72d962ad6258bc8023abddb73008e9a6256
         arm |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/203f98f82c477364d2371e4cea1cb517935bb9ab
        i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/2c75ad817a89b770c17357a1543e60e7fcba1c8e
 powerpc64le |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/39e6321158af6637a56181608a4ac510b5587c73
      xtensa |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/f124f453660ed72aab72e70dc8fed0dffcb8cefb
        i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/d3d8134f182abf0ec4649f2331626da1ae3f0092
      x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/5861fdd4c1df9811690ee9a72c0e585ddacc72dd
        i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/050465f771d7a8bf4a2771d3ef70fca02481308f
      mipsel |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/549536803a5ab01c65795d7c0d6311190dc59c01
        i586 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/a0361a6f45253b6ecd53a7817804d0839e27b443
    mips64el |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/16269990dc6db093b94bf2383eecb31265f6ef3e
         arc |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/c62e52b73e0b9e8ad7275ad372a86f789830219c
         arc |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/2836e9f1ab52d13de381c67114f66285b8d022ad
         arm |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/3e3423ba425f43c2cee2e43b9b1258d4af50fc64
         arm |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/2f6f59eae578af22cbbf30abdc68154fb17a6a86
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/8396a0bd0b89c0e7abe67cdcd7d69ed3f6479bdc
        i586 |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/8aa03fc71e28200f5b11ca7d4d7a93cc48903c0a
      x86_64 |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/ec434952341e5ed19e3ab41c3c9f5d500779f7c8
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/593174369f3aee5cf6ba5e15f2db0b842fe43a2f
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/098e8f1ba206a299cf656e8815abf1a727821b12
        m68k |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/d61cf7c1e3a80a54d2a9ed91b19caa255ffd52a0
         arc |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/08c5e72e2eaa47af06573e769c779893aef577ab
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/33e70cc639e091a41afabd1c39f35da3b67ae276
   powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/8a682635673323ff60271a24aa1a8aa62041f394
      x86_64 |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/4e8528a775b7ceae09de21ff180abcbce226dbf8
         arm |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/5569aa4eb8ecb668cc155380cc46b37715b1f1c5
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/dd500df2467e6d5bf32eaf4c7c02d596a09fca33
 powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/1931d35167e4b6299482bf4a2b573dc88b384810
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/4a9ca75b945751f3016caa0daa81baf41b4eb764
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/a6da425e9cdaf240ebb63b0fb0aa245616047ff2
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/5e38423ba735ab68bc84e67c625493ce662f61fc
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/86cb01743ff06839e0cd5960d8bafb23d7b7bd94
         arc |                 rsyslog-8.22.0 | NOK | http://autobuild.buildroot.net/results/9d65ff35e960dcc497b613e22449dd98befbe016
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/24b9cf070ba9ad596cf7b48d22cee70953a4fe82
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/b6137aacc4a893d76c8016a9424f1b5bc40f88cd
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/95390227126dbc559ba64e42194b1d8569c9a2a3
        sh4a |                     sslh-v1.18 | NOK | http://autobuild.buildroot.net/results/f971629bc99147f9014e52c6ef71c3417faa6b67
      mipsel |                       tmux-2.3 | NOK | http://autobuild.buildroot.net/results/ccc9d2e995ba1eaf19f6b325b0af5ebeb8066e7f
        m68k |                       tmux-2.3 | NOK | http://autobuild.buildroot.net/results/8a28d43bd0c079c1b49b61b0c6ef7de79eda0549
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/00c7a1cd8322466442ed1acb9d7c25d04458647c
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/70a5c11606105cc8824c6e03a8885e4e1f36ff8f
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/17b196d1d149849f2ff8ba2a7282376caa5a706a
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/5bc0d16efb6dd2ef1af341974d46f0ea325b89bf

-- 
http://autobuild.buildroot.net
