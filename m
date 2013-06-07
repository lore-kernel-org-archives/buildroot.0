From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 Jun 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-06
Message-ID: <20130607063004.D283252C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-06
===============================

        success : 133
       failures : 64 
       timeouts : 0  
          TOTAL : 197

Classification of failures by reason
====================================

                p11-kit-0.18.1 | 13
            host-erlang-R15B01 | 7 
                    acl-2.2.52 | 3 
                  libbsd-0.4.2 | 3 
               qt5webkit-5.0.2 | 3 
                 qt5base-5.0.2 | 2 
            libvncserver-0.9.9 | 2 
                     m4-1.4.16 | 2 
               alsa-lib-1.0.26 | 2 
                 libiconv-1.14 | 2 
                      qt-4.8.4 | 2 
                      udev-182 | 2 
               sconeserver-211 | 2 
                  iozone-3_414 | 2 
               ruby-1.9.3-p392 | 1 
                   dbus-1.4.24 | 1 
                busybox-1.21.0 | 1 
                  connman-1.12 | 1 
                pulseaudio-3.0 | 1 
               libevent-2.0.14 | 1 
                   mplayer-1.1 | 1 
                 libnspr-4.9.6 | 1 
media-ctl-ac40b79f002a2315f... | 1 
          openpgm-5.1.118~dfsg | 1 
             bluez_utils-4.101 | 1 
am33x-cm3-AM335xPSP_04.06.0... | 1 
can-utils-836d3cc0122ce31a1... | 1 
                libtirpc-0.2.2 | 1 
                     pcre-8.33 | 1 
                      bash-4.2 | 1 
                  samba-3.6.15 | 1 

Detail of failures
===================

      sh4a |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/2838883ff5e2efae2b060b68b4d36cdb1c0ccfeb/
microblaze |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/f5bf2bc8cd4feeb69672b824a9933849185d4e4b/
   powerpc |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/e58dc4c391e24e9ff691db38b464f4a778017f08/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/6bf8448ec783a18e1ff0d88ada698f4fcf5c14e9/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/63263e2658d54f6a5071e14415094f8d4f9aa8ef/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/a72a37c31b3ad1ae00508a2a0947ee22d59e9f6e/
      i586 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/e436896a054315d88e3fa831794de3842fbab99c/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3d4cf7c581a0448b93fc151271502f974df7786c/
       arc |                 busybox-1.21.0 | NOK | http://autobuild.buildroot.net/results/048f27ec115b9896b7e69f2d4d6a325b208c811d/
microblaze | can-utils-836d3cc0122ce31a1... | NOK | http://autobuild.buildroot.net/results/84f15481cefbe666f88d3730118dd9736984b7c2/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/aa76f6f0169f54f79e0faf621b8206135831010c/
      sh4a |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/1cb6e374660e06b1087d618da8e9cc05271fecaf/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/c4796d11005c111104adbc82b9da5c404b9d512a/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/9e983bbdf7c59db6994da3d1adc4d3b364645254/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/8183e5f93f3f6eaf8cf016d54b2c71f52914b203/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/ab29c2198be9e5b0e69507b6fee044bf669c8a81/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/923018ef9ec8a8ed8cdb269df7c832c13e51520e/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/0d285526a229626214656708601d4a9424c3fc88/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/31231e0e637b6837206c420b94b8de83a0b09567/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/bfe870ea78992135a70229e2cfd81f29c4edd1c4/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/53ec21ab320d76a4c4356dd821c778869bb0b8d0/
       sh4 |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/4a04da2feb869ac24e7d23ddd38c05cb1ba6a012/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/3fd5e984e5a4d31a1736ca2e88578f48188243de/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/cb097b7124289dbac14a7c760b0687b1f58a8604/
       arc |                libevent-2.0.14 | NOK | http://autobuild.buildroot.net/results/5282b4d85bace9a6298e92b842b525d84ab21211/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/2e52095524b191360844643133b332e2d236631a/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/1242f4f5229b4cd0f637bafefbad40fbcaf12200/
      bfin |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/595e5fd63726074d73b39549804a5cba66661190/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/3ccdd907eb8e8fe2fdbeb063fb01bb1965753dcf/
      i586 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/780e825e56dc78f1ea347ca462e2e31044428775/
      i586 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/cc6a6b4534e6d63d73d444093e30cae3fe7f4d6b/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/731e2030271c6ca312566ecaac20cdc8fe8758a5/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/286b46abdb8ab109d5b6cfa5d05bb1402bd8be04/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/98af92934662b1145862ef6910e3aed2cd8d3170/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/d4157c5f268e40c7a862308e48241b9f161b7663/
      bfin |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/817999e8cc2de902315d18cb90d9f68111544d1a/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/98902004ef451bc082d6f556159921909304cad2/
    mipsel |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/e41352bbce907174ff978bcc5069fba343b4ad3e/
      i686 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/66b9e9e517c07ca4fbc0853f1aab815b48090224/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/40ee019a27966cabd45fab9dfd579bfffad7bc96/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/7364fd6f4c88ba135414522ee558cb6a93f37927/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/6b16a14d303bcdd34923fee85e75b6133eb5dbff/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/62562b4ff90dba9adf74ff1dc142c08820a5f99e/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/7c06b0bafefa44cb09b76d89faf9a5a06f09ad61/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/6028bf926b4f16b96025dd7ad9e0edc23c8f6b26/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/7a8e7012e9897542b256c1740d9dcb7696b04279/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/fcdd0fda0355fbbe163dae8e967846f57d97eb79/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/f8bdc9c64603283b4a473e7e8ef008b457fb11b9/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/66b4a1f56f1ddd41281722d815ee81cfcfe9ad61/
      bfin |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/a3d6b4c7c9158cde3db4dd9f5ad5edc1b3b6d768/
       arm |                 pulseaudio-3.0 | NOK | http://autobuild.buildroot.net/results/2caeeb0780eb74c54bee86b273bee843a0a2284b/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/7eced83fef6c0fe22f0bfeb5e4ba4e3d4a01a328/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/695395073d48e5dc599ca35f2a56c03baedc58ee/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/81ae66a235e63d93ea0be44927a5124f3da546bc/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/761d014757d739f48e55461400bdca18aa949a36/
      mips |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/b6ba08aa94af7c20763f0083ea259ae2e63a37a0/
       sh4 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/02e6113d3004d6fab2e69d38090eea5d7bea5c7e/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/17cbe4d36fdb356ad37936fe64a48cf02b251215/
       arc |                ruby-1.9.3-p392 | NOK | http://autobuild.buildroot.net/results/827d17ed203ffe9e43978d6bd23689f22eadb250/
       arm |                   samba-3.6.15 | NOK | http://autobuild.buildroot.net/results/40f5c358e7748be960632f6e441380c41652f839/
   powerpc |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/9479d9245e2cf17b7656cb9e4b9950bbcfdd4fa1/
      mips |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/c4b7fccfc613380cba3ea3d17a449b2a86cbf6dc/
      mips |                       udev-182 | NOK | http://autobuild.buildroot.net/results/3aaa31850db9a7271f60be34c69b633f2b2a0e72/
      mips |                       udev-182 | NOK | http://autobuild.buildroot.net/results/40352a3f1e241be14a46beb0ebbdc722be75eaa8/


-- 
http://autobuild.buildroot.net
