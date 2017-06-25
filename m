From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jun 2017 08:30:49 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-24
Message-ID: <20170625063049.CA71C20911@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-24
================================

      successes : 150
       failures : 80 
       timeouts : 0  
          TOTAL : 230

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 17
knock-258a27e5a47809f97c2b9... | 9 
                 sngrep-v1.4.3 | 5 
dropwatch-7c33d8a8ed105b07a... | 4 
linuxptp-97c351cafd7327fd28... | 4 
x264-df79067c0cf33da712d344... | 4 
           argp-standalone-1.3 | 3 
                beecrypt-4.2.1 | 3 
                busybox-1.26.2 | 3 
                  cppcms-1.0.5 | 3 
                kvazaar-v1.1.0 | 3 
                  cc-tool-0.26 | 2 
               gnuradio-3.7.11 | 2 
           host-doxygen-1.8.13 | 2 
                 mesa3d-17.1.3 | 2 
           python-pynacl-1.0.1 | 2 
               util-linux-2.30 | 2 
              alsa-lib-1.1.4.1 | 1 
                   attr-2.4.47 | 1 
                collectd-5.7.1 | 1 
                  ffmpeg-3.3.2 | 1 
                   flann-1.9.1 | 1 
                librsync-0.9.7 | 1 
                 libtasn1-4.12 | 1 
                 qt5base-5.6.2 | 1 
                   strace-4.17 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/469848e44e9af5cf6e3b1fa3e03b0886890c67cf |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/0624323a3d9ecd77e87d3fea579ae792b2c8cde9 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/755d4ca17251ba0294dc849710c3c7d737d794d5 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/8d52639ee7b53faca338af55f84b6b1481fd77eb |     
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/f711147c74047926a0cb7c70cf14aa6d2ebe6e06 |     
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/f4cdcaaeef0344b775ddd390d4692f1b68bc3827 | ORPH
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b733a12951469f1ca7859d1858b8e4e893be99ac | ORPH
        i686 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/72731458fd74c45c84bd7ca3d7d8b1972a8255c5 | ORPH
         arc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/ac657f5cda837e5d03d828e6b28367dcae3872e9 | ORPH
         arc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/9cca93a17f480523b4c6c6b18054ff81728daf6b | ORPH
         arc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/535024ed2cc6afce367d35754b342a04064a5bac | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e7c09cb7b7a47630138c5d6d97fbcfbb084fc7b4 |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c13b5539b00b85187b54712849129da7ff6bc587 |     
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/da2bc26ad24e9c8d63272f94c19fbd9a5bd201cf |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f5584031b3f08aed6a60df4371b9cac779f3d3f2 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/57c7e55e158722cf4664ead08dbec6e8c0fc044a | ORPH
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f576049877d64053078f8d926639b3e2b50ef2cf | ORPH
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/fcc28ed7e015d0a52f34b6d1cbc8067db3c912bb |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/dbf85b85a527a0433ef1485ac65cb8424239c177 |     
        m68k | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/018e79372c2891e84c29a4c3c9dadd5aaccc4185 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/8b2501161a5fee045f5c9cbcfa501f2768430e5a |     
         arm |                   ffmpeg-3.3.2 | NOK | http://autobuild.buildroot.net/results/cc3a405d5e2f0a2116dae69f73caa110712facd7 |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/ff2ebb4f026c22c8042a04968eb9b4d110236032 |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/c93dcf768a16113444f797270c3225e0d08e3e17 |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/52825918bf65b23241cd68d99513350703469294 |     
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/ca3a486322e001625306876c80692c5b92e913ad |     
    mips64el |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/582ad20f4a892d6890da762dbebe3d93e6fb6fa1 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/87a67cea8c4e897be5c8ac70af15f2f6159548c3 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/b61f0ce7e7969738668881a0bf31e00d33ff314e |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/f7bb6a13c4995d723e9622fe5d8b0b4355eae88e |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/dd047e288002ae07503598557ee97d1701c8f99a |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/6416b4400893c09627af3033722094bdf4d23d22 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/a2dfdcc394902e26b56b51344ddb3172ca3fc7d0 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/3230984cd962312a833fb31ab0150306a32caed1 |     
       sparc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/373bfcfcd214a77090106d61d98fc69ec8df491b |     
       sparc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/cce9709c29bae2026db6eaa7acbe70cf5e89ab95 |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/f418fbae088c93217c031d8aebb0ccc23a1d949d |     
        m68k |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/fdb01a52955ad71a6c6a0f1b5400a33734fc45bc |     
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/9a5b2f9699cf0b9da9ac2edcbb653d562099721f |     
         arm |                 librsync-0.9.7 | NOK | http://autobuild.buildroot.net/results/f6718166cd51d15111f2d91002e0a4a72c76516c | ORPH
         arc |                  libtasn1-4.12 | NOK | http://autobuild.buildroot.net/results/3ec9ac756b18f3819dcf798ce24aa3e1407917cb |     
       nios2 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/03417afab9925a9e3415e761a3fa1b2544bf1fa8 |     
        or1k | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/357bf9535971604aeb2fc5219aac3d0c6ad31d87 |     
        mips | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/400de60384fd9f952c5a6537072d9926d2018adc |     
    mips64el | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/2771465f2249555a834c1b36cb4e5efb8bd6c9ff |     
         arm |                  mesa3d-17.1.3 | NOK | http://autobuild.buildroot.net/results/864ee9b2e91c6d69d061ac6fed3e9e41fd7f4b1c |     
     sparc64 |                  mesa3d-17.1.3 | NOK | http://autobuild.buildroot.net/results/c4f861777e6a5c7b2d134afc2a35557896de800f |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/dbb3eb3c717326d9c3a75e9842f060ea3f8a1f27 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e5cf035ab71f115ba74b17f24e00f049e4f23559 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f3f6f797160a9d4842eb7a62002eb36e25f90a90 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/da3294f5e3cd11ed265af0ed783200bb34c81986 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/281a704428cad952ea75f86c91c75048420b7e64 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/053dbdae4e8668d77ddfccd844c1e346247e3e68 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/267f3e396b05cfc22853448e63173cd00b254af9 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f5cec007f65074f1122cd18badaa6bab507d74dc |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cb0e21d2a77ba24b2dc0eac88d60214384eaf01a |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/daa7213371fbe0a58be5cc7102d5d3964290b21c |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9547610ecd9af072e6e7de34f1836cd5d869eaab |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/50b441eb399e42881545358cfcdf8df65d37a6bc |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/709e9f134b183374fd21c7a9acc5750c2479c1f8 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/716dae5b630774cc7d7626b78b1dd10085b88c09 |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1a168141073d7ed533f38ad036e9dca4a060f2b8 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/83ae8eea927379d48514e5b91867c0cba3dd014a |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/50dec5350a0a99006333598f82e731910ab643b2 |     
         arm |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/949e63821271b59716cb74a970767f1ca449cf8d |     
         arc |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/d0e5a2e2d8aa2724fbc97500ef670273cd441ae7 |     
         arm |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/8539e18cf2bd97a1816e4f802d15b63ee9e4b7b3 |     
     powerpc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/7369693ab02a5c468aee9130719e3980748a839a |     
      x86_64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/0106e9fa298f56d08ec5a0bcece613c3c77e9ec0 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/87b1e1ba0577a35c8de4b3fa13f05bae1f1dfdb5 |     
      x86_64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/74ccddaab661fbbe3220c6c6451ff02b32cd329a |     
        bfin |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/ae89fb08856859a4db5a69fe7b3390a61dfbaad1 |     
       nios2 |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/6133944e1d104ce6cd54d9ba4ada6c12cf30d9fd | ORPH
         arm |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/dabe60d5bf6dbe83285dff35a84a71f07712234a |     
     powerpc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/8c0734dc09a69e0e1370fb0597f87790a9609cda |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/3a47aa5d4759606c29849bcce3802bf272d2adf8 |     
      x86_64 | x264-df79067c0cf33da712d344... | NOK | http://autobuild.buildroot.net/results/7ccba331627aafd7a240c53da4cca7f6feceaae8 |     
        i686 | x264-df79067c0cf33da712d344... | NOK | http://autobuild.buildroot.net/results/3f5759a1fd6aaa0394229cdfce278752d4a01ddc |     
      x86_64 | x264-df79067c0cf33da712d344... | NOK | http://autobuild.buildroot.net/results/a2ce647409b2361615b12bc85895559596b2c4c4 |     
      x86_64 | x264-df79067c0cf33da712d344... | NOK | http://autobuild.buildroot.net/results/ea9077560bb6f72e2d403efedd427ade3774cfac |     

-- 
http://autobuild.buildroot.net
