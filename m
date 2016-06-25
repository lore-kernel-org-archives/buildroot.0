From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-24
Message-ID: <20160625063029.C600A102526@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-24
===============================

        success : 196
       failures : 101
       timeouts : 1  
          TOTAL : 298

Classification of failures by reason
====================================

                   gtest-1.7.0 | 14
                  boost-1.61.0 | 8 
              e2fsprogs-1.43.1 | 7 
                   efivar-0.23 | 5 
             bluez_utils-4.101 | 5 
                pulseaudio-9.0 | 5 
                 gflags-v2.1.2 | 4 
              host-libxcb-1.12 | 3 
              libdvdread-5.0.3 | 3 
              libarchive-3.2.1 | 2 
          libmicrohttpd-0.9.50 | 2 
                 dmalloc-5.5.2 | 2 
               linux-pam-1.2.1 | 2 
                      qt-4.8.7 | 2 
      kismet-Kismet-2014-02-R1 | 2 
                  autofs-5.1.2 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
               wireshark-2.0.4 | 2 
                flannel-v0.5.5 | 2 
                     vlc-2.2.4 | 1 
               libcap-ng-0.7.7 | 1 
                socat-2.0.0-b9 | 1 
                libaio-0.3.110 | 1 
                    mpv-0.17.0 | 1 
                  stunnel-5.31 | 1 
                mongrel2-1.9.2 | 1 
         qt5imageformats-5.6.0 | 1 
                sysklogd-1.5.1 | 1 
                directfb-1.7.7 | 1 
                  squid-3.5.19 | 1 
   webrtc-audio-processing-0.3 | 1 
                cifs-utils-6.5 | 1 
                 lvm2-2.02.156 | 1 
                  libffi-3.2.1 | 1 
     xfont_font-sun-misc-1.0.3 | 1 
iputils-55828d1fef3fed7f07a... | 1 
                  samba4-4.4.4 | 1 
                   libxcb-1.12 | 1 
                 hplip-3.15.11 | 1 
                     gmp-6.1.1 | 1 
                    gdb-7.10.1 | 1 
                blktrace-1.1.0 | 1 
                    lftp-4.7.2 | 1 
                  gamin-0.1.10 | 1 
                beecrypt-4.2.1 | 1 
                   fwup-v0.8.0 | 1 
                   lite-0.8.10 | 1 

Detail of failures
===================

        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/75c63cdb2fe393be5d41d4fa8488f3c65706fcac/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/7f1daeade213f1d0c008c8e7f9deda46f76e4ad4/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3bdba5cf7e901f8600e567b1b0eb0866d6dfc523/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/534cdaf46a2ffb1de39d6208a25b0cc59b02905b/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/bd10befd1cc4055ebe7fc414d8903db11e7ef83c/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/49f4a57ce3fd011cc50bd2d3bdf5e2841f9b55b1/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0a0ff48facd3445a7ec39de7ff72fb0dbfee8530/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/f39ec2d34a333b6a5d77638435f0676a86b909e3/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/64f6707bdd3e4793980f1bce5e682ee29e378885/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/2ef13aed009f7bc21c0b6098a2425c3a4abda10d/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/cd265ef7d41cfdf53f2f614f330a7f34a6abd718/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/1e58afc25af6a7a2e7dfa737441a955885afd3e2/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/cec56a67807ac0b4e0606bee0bbe00c91c535d5b/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/a3ed6f7fe1bde6d0024c50e492a553c1b51a67e6/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/dbaa95aa69e679660a47504b0ad5050ee976ecc0/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/cb95f835e4499e9f08edc099693d195050957d2e/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/b9a8a5f5e4c50bf539901247608e19fad4c002f5/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/566bdfbecc2e25a8892212a252dbc0f56e110c7e/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/3c840abca365d91a698bd693b615c79972546ce4/
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/e9f853173f4403c3026c1d3d76657443126cddd4/
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/5b3a072ea1eab8b643fd7f510a12210389c1420d/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/294b3b51891a3ac5e3eec4002a1db2d635c11e0a/
     powerpc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/8561e525df150c2e3ea4587a028b5565679cbc83/
         sh4 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/7b2dac9ddde33fe25201ef011d11acd82845f91f/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/cecea445e8d51663be4eac892177dfee6761b9d1/
    mips64el |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/cb9dad8cb7aba29501b458d5851ba4308819a903/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/c3ecb1aed42b65a43e22f84e39b937c00509ef6a/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/06c872f330f034eabd5f0cf55de38ae2eccba5e9/
      mipsel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/cbccaa6b907ad504c5791d9c9fd4edabc0a18210/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/2dce7bcc73e5fda34b0123eb29f2ef3d1dd7d772/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/fe40c1d139ba8ddeef3dafd5c1818a946f014d7c/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/69db605e575815b936472404bd8b0123241ff3d4/
     powerpc |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/d1e4a3ea87835562bea749c01f2d58ca0e614fde/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/93393d76f08a9135bf774eed255c41c18221c98c/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/aacdfcbad7721c7b76be2184001f2662d77ccf95/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2321504cc82e166ff2cebb8e52249b3c831bf58e/
        m68k |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/ff959886969a4a87cb46d1639247053d22c57ab2/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f1cb027b7542245367755e8d808d560803dc8c9f/
         arm |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/744f5884de74175e24b8f07dc501ef5f1bc69d84/
        m68k |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/1b6fce03ce60a4b83146773f9690383cf4aceb40/
        mips |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/de0485711d788b2f172d9b771a3c079ae28650d9/
     powerpc |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/b10fe9971ad3cd7b863211e8442fc70520486e4d/
         arm |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/e9ff68d880cb437f16ef4356584a8a34fa7c2606/
    mips64el |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/c42982c1e555afea0d41909e287b71f16bb2fd63/
        i686 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/a5f9efbf5d5fc4c13f11c43cd9825f0238193bd2/
         arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/a35467b0e02cbf5508a0dc836ecf063f63d17e2d/
microblazeel |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/6c6f80dad96ae5f80dd8072df85b0fb6f1b8248a/
         arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/e94e45ee575586e159ecbc8bd14b47c7d62634a7/
        i686 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/0ba86a5bfa43e51a2dfe475b1be69bbb17696345/
         arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/b92a56da9ca0f5dee93bc9de98c9cdbb50c308ee/
         arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/975e2f3780d52fd5a625659702c610fa4b05ee4a/
         arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/08e1eb10f63f07378237ba72953d7201ea0786ab/
         arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/f232e35353edb83921c208a5e504d4823d9a4c38/
    mips64el |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/8c6c8ddb92c493e998d4e0fa0837a9fd2ad5c53d/
     powerpc |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/9b442f788c4314da51edac477fca3ec5eda1d429/
       sparc |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/683794c64f190902016aead17c08749a4cd67af5/
        mips |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/478494fb952d59191107fc698405d894f5560ac1/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/b240201d52fc2ca5882a9657ce1013fb3384d559/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1940b40cebcc990ae4e06d20f8e53991fa63e1da/
        m68k |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/95e3bb72389f26cc30b4381ad69d7876987d2c06/
      xtensa |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/873bef1ea6c1b15fb4880962dccd64983668deab/
    mips64el |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/23e3b538cbbd332ecd648af3206e29482a0bd526/
         arm |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/12671e8e1fc4056cb7a212a36cf9a424b71e2e1f/
      x86_64 | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/920d2d1d967691779f79fa54a38fac5adc5a8ee4/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/72d5978ba4cf92f6d6d2778e3662e4e63ca415ae/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/9b5490f91ec105d19a24fbb38af37ea73e8b1acf/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/5e55897367021a758db2250e5139b68c87ac79eb/
        m68k |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/effa7b95fe5bc55f91d2e9f455cd534dc45cdf07/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/fa0de00bdf58eab8f01272fc6cc61c3a9cdd61c1/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/489cba98458e090a2bd04841d145bde85ab60a6a/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/253bbe3a1033a41b4697c93ea5ae31098b4f7c53/
         arm |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/41534b70a66c6297652f0944f9ecc7e780b26c45/
         arm |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/cbcbdbf636211c0105754ddc68b334d32d33b42c/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/2cdfb78231ea2ad6f3160132585fee9ab2e788ba/
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/765f832acc69a136da26b9e6740b7722858c3714/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/d50a664890f8352ace15012b9db7377c3803ac89/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/5eb2432c564c149f2dc9b7fa7eed8b309d2227e0/
      mipsel |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/629379ca35dd2cb4bd4968401603bdb63874a24f/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/b9bb340b8f9ed88190b88bbb4397c75ddba536d5/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/cb94a8278158ca97fca81db92b49f1d033aa902b/
         arc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/59afc77b422009ff6fd14b38818d3142b8f56710/
        m68k |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/b720b4a6af6a421efc0ff07fcaeaed63a50300a1/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/19010d578f8d4766faa62e6db3a79f43a0de4322/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/7983ab8254778207c8626425f8581149a73d7bd3/
      x86_64 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/72aa2ae7552b72b1c2e4e04789820d89c9b2164d/
        sh4a |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/b198eced96eb9b5a5eccad492c59df75572f71ee/
      x86_64 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/e704212cb984c970fadd4116c01359eb58f7674a/
        i686 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/67f88ffeb87ca6adec08fbc57f658c80b5c8a5c0/
      x86_64 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/859f85ef0e322d9cdd7b5c0d0eda20195a682124/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b600c0da8f113e3e417ce0d327b2783db6aa7407/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f1d7d574bd9f6dc7229ffd26ab7ab4df6722dd16/
     aarch64 |          qt5imageformats-5.6.0 | NOK | http://autobuild.buildroot.net/results/0c9e4c7549ff7ccb5f6fb0cea944be447b3c5348/
         arc |                   samba4-4.4.4 | NOK | http://autobuild.buildroot.net/results/424b58d4565bd58e1ec4b76173572921506e8c61/
      x86_64 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/4194e5220b2b00eba984022922e62b1462dd50c1/
         arm |                   squid-3.5.19 | NOK | http://autobuild.buildroot.net/results/1c24160af5b9210ac177ce9bc79513349e298308/
         arc |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/f5e69b942fae18b297092dfb387d82ce2f66c332/
         arm |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/10b9eb7b0f2a898831344c96a92328a8771dcb81/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3ae103d536495bb02139f59ff6ec0821c1c6b5c4/
      x86_64 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/eae2b08f57f1b68483c5b9784e28691cff8009f7/
         arm |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/bc4b0a7d0a0dd927d94c24e2944f87d2fdd8e58a/
         arm |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/2f805ed956f1a0fffaef4df8a9eeeebc28bd19f2/
    mips64el |      xfont_font-sun-misc-1.0.3 | TIM | http://autobuild.buildroot.net/results/ef16840abb2ec62517599d9414a6c78ec97df963/


-- 
http://autobuild.buildroot.net
