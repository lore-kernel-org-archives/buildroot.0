From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Sep 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-01
Message-ID: <20140902063012.275961012A9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-01
===============================

        success : 155
       failures : 48 
       timeouts : 1  
          TOTAL : 204

Classification of failures by reason
====================================

                     gpsd-3.11 | 7 
                   chrony-1.30 | 6 
              smstools3-3.1.15 | 3 
            host-python3-3.4.1 | 3 
           host-nodejs-0.10.30 | 2 
make: *** [core-dependencie... | 2 
             util-linux-2.24.2 | 2 
                    fltk-1.3.2 | 1 
                gptfdisk-0.8.6 | 1 
  toolchain-external-undefined | 1 
               php-gnupg-1.3.3 | 1 
                  boost-1.56.0 | 1 
            host-texinfo-4.13a | 1 
             lttng-tools-2.4.1 | 1 
                 python3-3.4.1 | 1 
                 webkit-1.11.5 | 1 
                 lcdproc-0.5.7 | 1 
                lmbench-3.0-a9 | 1 
          perl-net-ssleay-1.65 | 1 
        gst1-plugins-bad-1.2.4 | 1 
                libinput-0.3.0 | 1 
               madplay-0.15.2b | 1 
                  zeromq-4.0.4 | 1 
             libmatroska-1.3.0 | 1 
              libarchive-3.1.2 | 1 
       opentyrian-2.1.20130907 | 1 
make: *** wait: No child pr... | 1 
                 gnupg2-2.0.26 | 1 
                 numactl-2.0.9 | 1 
                  prboom-2.5.0 | 1 
                      gd-2.1.0 | 1 

Detail of failures
===================

    mipsel |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/d44202ea3849b188eb026ef61b812f0d7e664b27/
   powerpc |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/5726b596ea3f5b39bee8dc48cb721bfec35e817b/
       arm |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/6fb88ed2d0520e8e51b0cbfd38ebc6530c977d30/
  mips64el |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/fda3ca93dcb7b30a21ccb4b9bffb0b15f7fa17ce/
  mips64el |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/71a09beadcc340db9b1e447fecdb377a3d798320/
   aarch64 |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/fd03a86ed670c765d9f0a1ed6cc913079e030fc9/
    x86_64 |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/2d8ce1ca881813d220a25577891b8b76813504c5/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/c35df0b20e9f65154e7cf3dfec01a635a071eb41/
      bfin |                       gd-2.1.0 | NOK | http://autobuild.buildroot.net/results/735a39780de1bc3e53c6696f4536021afd4040ea/
      i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/1b0a8d7ae429a299d0076f6365416c993b39718d/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/8825a5ea98155faf8d62b3702bd1b8a0aa2f2448/
    x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/8047ae39653abcd140ace2c038783de8ca70250b/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/ef136b1d623d988e5f807b07498a71d1db9ed3f4/
    mipsel |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/fa2b71c087339ff7a0837e34f35abf80dbb349b6/
   aarch64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/b90c71d07d1c170599d787c59d4e6cebc1c04da7/
       sh4 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/e48f440ac85d519ced37944a1df12c899ead1c32/
    x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/036fbc931212a1f53d655c8692792b26283e6258/
      bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/bad99784b47d9ec4dd8321ee7f282b9801ca3225/
       arm |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/e2ec19caff32fcb37e6b79b481d1d0843c3b2fa8/
       arm |            host-nodejs-0.10.30 | NOK | http://autobuild.buildroot.net/results/765393872bc34fd0535203277fac7a589eb12290/
    x86_64 |            host-nodejs-0.10.30 | NOK | http://autobuild.buildroot.net/results/b1ae85c174dc6cb5e9ee20d17ef27e9df38ba004/
    x86_64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/8c61c2cba87c5f9050a4154f6dedcfbbfeabcb1f/
   aarch64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/0dd4f40e8c511b4f2d248dbb6b0132406d44b1cd/
    x86_64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/68709d62bf357660af5ef66b47280b37c662eaab/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/c64f29d02ca807adc81245150cf3fadbebcb325e/
       arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/fce29a0c28263184aa8d9c382a4aa5f6d3b86b8c/
  mips64el |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/4829c3758203edeb6f59ed10a06d5ecdb7db69d5/
   powerpc |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/31074eae0ac84bbba4ab74bc7a87846b45a9f297/
      bfin |              libmatroska-1.3.0 | NOK | http://autobuild.buildroot.net/results/a45d1a69f7dad7746432a55a56066ca08485ed4b/
    x86_64 |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/1bbdee987db83ee09823bdb9860d148e1c5815aa/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/5d9d1701f823af41c5bcd01452caf5fcb324f47e/
      bfin |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/5dbeb27ad674791ca00a026aa313cea1a3f46c4e/
    xtensa | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/06238d051746832fcb00a6e342992ef043fa433d/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/0099fd99a02194fd9269077055473a74a6a03232/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/72b27377fd8119429cfbd38d7d744b028e915c9d/
      i486 |                  numactl-2.0.9 | NOK | http://autobuild.buildroot.net/results/7e3b2a72d5a6a39a2617ab778bcc91fc3b46fd68/
      bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/e2482845c10b71e574ee69d5ec7a2608057d81e0/
   powerpc |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/53aebcf5a59bdc062b499b192c7545e5334ad6c7/
    x86_64 |                php-gnupg-1.3.3 | NOK | http://autobuild.buildroot.net/results/ed92ea517ece221be176cc85ece375a1f92d4b1d/
      bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/79798340f2a5d6c2b8f0c81d9cbb036f24349356/
  mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/3e48e731beb8f60d310bcbca1a8fcc614623c657/
      i686 |               smstools3-3.1.15 | NOK | http://autobuild.buildroot.net/results/499aeaa065397e7a74b4ec7d1d47a2445db8ee06/
    mipsel |               smstools3-3.1.15 | NOK | http://autobuild.buildroot.net/results/027bddbfb40f4babad1292426bda17cf3735c9ae/
   powerpc |               smstools3-3.1.15 | NOK | http://autobuild.buildroot.net/results/7fa839c7268256cb4f3b8728b3f50818cf3d3670/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b4d8a783c3ddac8c0f6ecf2354544304fdd396e8/
     nios2 |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/a0b4b294d2749025bc6cd0d9c735f9e4a3571bc1/
     nios2 |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/3ed96c18ff702a397147a3d3c246f8e02a6ae27a/
    x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a9162168f439c8e8335dc7bb0b4c79dd810449ea/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/8f8beba0ace5ed3b76cdecc8f0e9a49ad96b3a52/


-- 
http://autobuild.buildroot.net
