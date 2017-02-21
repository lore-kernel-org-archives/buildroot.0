From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 08:29:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-20
Message-ID: <20170221072902.80C59207F9@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-20
================================

      successes : 200
       failures : 34 
       timeouts : 0  
          TOTAL : 234

Classification of failures by reason
====================================

                 sngrep-v1.4.2 | 8 
                 qt5base-5.8.0 | 4 
             alljoyn-16.04.00a | 3 
czmq-5205ec201e97c3a652c17e... | 2 
                  apitrace-7.0 | 1 
         docker-engine-v1.12.6 | 1 
freerdp-17834af7bb378f85a3b... | 1 
               granite-0.4.0.1 | 1 
                      icu-58.2 | 1 
                 jsoncpp-1.7.7 | 1 
                    lftp-4.7.4 | 1 
                  libcec-4.0.2 | 1 
                  libnfc-1.7.1 | 1 
                 libv4l-1.12.2 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.3 | 1 
            mesa3d-demos-8.3.0 | 1 
                 opencv-2.4.13 | 1 
                    sslh-v1.18 | 1 
                 synergy-1.3.1 | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/eebf4ce5ecb896e54912cfa21268e81ff5fb6593
        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/a41087ebd9c26c1c3a44acc21055484582426c77
        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/cc7bb33366977839b7c2f5071d26495319832a47
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/7a1ff050e51267b12e550ef71c98086df1443e62
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/f6d7c0102954aaa02c53b0313cdde01d87cf98a3
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/7d8b87c0dfa2af008f88db927d0c630ca9c89cbc
        i686 |          docker-engine-v1.12.6 | NOK | http://autobuild.buildroot.net/results/9dc9370a79c5c44e6c92be6a44334842c211d923
        i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/5d429d0e288754a541ee5d8be515454c5fccd28b
      x86_64 |                granite-0.4.0.1 | NOK | http://autobuild.buildroot.net/results/e8e012ca64d32c2ff51ab6025e68c2681080d14b
        bfin |                       icu-58.2 | NOK | http://autobuild.buildroot.net/results/e919dfe0fad82ebce5b12adda01e2d5cecd68e1f
        or1k |                  jsoncpp-1.7.7 | NOK | http://autobuild.buildroot.net/results/8dbf406898a59e36ac6a1e16f543b6260da775c8
         arm |                     lftp-4.7.4 | NOK | http://autobuild.buildroot.net/results/7c6e39651c9f07507596ca610b36cacabafc41f2
      x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/38ba94fe0db1544e78fd69dcbd77a452e121deba
        or1k |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/0fbb98eac816ed98a256fd8450901a778e5807b2
       sparc |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/3f13042565df20087e007949f653942c0462e334
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/052940d74cb7b79287edbb419453f87ad18526ee
        i686 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/e189300490fc05dc78f3c46bca73cb1f535bfae8
         arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/1da5e9edab7a07fbbdd4edd4a840286becf381ff
        i686 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/f49486286ce02918d7e64b1bca30f805b6b8acfd
      xtensa |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/ce6f506f610434dff1d0eb64644be0200d7c52f6
         arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/197ab8a12bf1d780a986e5d447d1e0f5ee070405
         arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/05d74374b6338c8da3e98579db51bcd214132dd2
         arc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/fda8a5165cc599adfa4b3cb012916fa4dc38aeca
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/c0342a9f3a6471355a1859b289234386127f41ba
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/9183cfbbce5eb558f45ceb42d3937eedec6dd054
       nios2 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/dc8b73423dc9610b04088ae75877cfbb073433e5
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/23701810d86e1021441f41a552d4a2df6b6c36b0
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/0af942c6b55a887be033d123940e44df81c1e7b1
        i686 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/2a6239a3e3200252a30f71131d321bcebcc67acc
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/1992641cff4f301e973a39f33dd0b07b0ba5b1f3
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/b3621154ff79ad7fd0cfb9a1fb3fb64ebd6aa2dd
     powerpc |                     sslh-v1.18 | NOK | http://autobuild.buildroot.net/results/867c74ed74fd04ab06d1a10ff34ca177fe005fd2
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/1395eca13ca537bde928ddd68a5bc6e130e82ba3
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/ef4f3f280ebbfd9f52d4e1055d750706fd60e723

-- 
http://autobuild.buildroot.net
