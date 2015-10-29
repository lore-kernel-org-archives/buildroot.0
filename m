From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Oct 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-28
Message-ID: <20151029073019.7BF3F101D3B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-28
===============================

        success : 136
       failures : 77 
       timeouts : 0  
          TOTAL : 213

Classification of failures by reason
====================================

              host-perl-5.22.0 | 11
                  ffmpeg-2.8.1 | 7 
                   mplayer-1.2 | 5 
             python-spidev-3.0 | 4 
                   dvblast-3.0 | 3 
                directfb-1.7.7 | 3 
         conntrack-tools-1.4.3 | 3 
              swupdate-2015.07 | 3 
liquid-dsp-df5a459fa05dba41... | 2 
                 sudo-1.8.14p3 | 2 
                 dropwatch-1.4 | 2 
                coreutils-8.24 | 2 
                 libpcap-1.7.4 | 2 
                    ruby-2.2.3 | 2 
                  connman-1.30 | 2 
              strongswan-5.3.3 | 1 
                  vsftpd-3.0.3 | 1 
                  guile-2.0.11 | 1 
                  qemu-2.4.0.1 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
                oprofile-1.0.0 | 1 
              cryptsetup-1.6.8 | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                    libiio-0.5 | 1 
                      x265-1.8 | 1 
                 mesa3d-11.0.4 | 1 
                 jsoncpp-1.6.5 | 1 
               util-linux-2.27 | 1 
                libnspr-4.10.9 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                pulseaudio-7.0 | 1 
               dvbsnoop-1.4.50 | 1 
xdriver_xf86-video-siliconm... | 1 
                  boost-1.58.0 | 1 
                      qt-4.8.7 | 1 
                flashrom-0.9.8 | 1 
                    ustr-1.0.4 | 1 

Detail of failures
===================

       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2060e6e31c4d739947097faf6587e0a06681fee2/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/5fab91fed4b3afc1cbc02c041409b7db31949892/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/ddf2439b85b964c678c54d2aafac0d0e99d838fd/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/39352f705f94bacaff4a1ce0f8f1bdc2a0af183d/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/00b72f2a94880a24014d1330528eb6758340cd0a/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/c26acf0365cf92ca3091f8c65c83949b43eafc81/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/ed8c98b27bbb6e76b76b7ba937a3c3082dbd41c6/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/117b9d00f4b256b6651447895c27ce241799ce55/
      x86_64 |               cryptsetup-1.6.8 | NOK | http://autobuild.buildroot.net/results/ce5219f9350aeb4418dbb8257ad58ae0b09e5266/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/489722c232558aaff579572159eacc2d0cf2a57a/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/daaf27d2466295328974936a1e9ae959a516b54a/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/9c54f48dec6afcc5e9f72daccbf006d138169742/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/a36f64c62613728907a7f04811dfd6f3cb28f114/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/c65633e28f90b3d72169ff04ca3930fa999eed1f/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/c25143fd1363d162de6733bc55a84289543f4da3/
      x86_64 |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/167efb284be47ae3e90fe7a8e6316e757b59cd3e/
     powerpc |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/792fb85720f13cb8f71260a089d6fa580fbdf010/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/7a92ca34a4523ecc60472f2c7cd30bf8dd0e6c13/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/53deb4bd88f35d3b3cbbe0d683e855f18b176314/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/4425949537595b5dcacb8af355b429f200ac3544/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/bd54addf080e57a91d592e2a203a794ce0e6b181/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/ef8de72c083d92d13bc593f1908b2a9113245b13/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/6208e757ff09a771fe25749ba64941f87c9bc033/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/23f9184722a4db85d88e8dfafa777a8ffc6c2702/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/23ec58677a1d73b24d179fda55bc380f426db949/
      x86_64 |                 flashrom-0.9.8 | NOK | http://autobuild.buildroot.net/results/2a3744007c630c267575a638ebcd83a4b97644f5/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/4e6eef5c061ca0dfc7934dd39a279d5affb2d4c7/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b453c419292dba39aaa309ea057e56662e9af2f6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/269a0a9c66385a8f61156df97f9e6f336ec26bf8/
      xtensa |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/c779c2338d82181ecfb7d8783584db21557c0d23/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/31bc13954e841a921d6b4c3c6666c352de39ca89/
         arm |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/e9f5849bce996734c604359ba689403f1c6a3500/
      xtensa |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/fbe72fa94b5a391fd95e22b04076729fd79400b9/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/c7eb221463a47fd097b9ea9a37353c28e6f10bcf/
     aarch64 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/e46d607ae4b8b3a5d5049738037078bd430e5b65/
         sh4 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/d839320677502f295d7e29d13c42d34d36f81078/
        i686 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/745bb2eb39d9792dceed30290d1c527f931695f7/
        i686 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/9743da98d6ed88002205aa2d76d765c6f9902fa7/
        sh4a |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/f89b9353e1aa54e503adfcf464fb50ae3cc95cee/
     powerpc |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/bb087d73e860d6317116bed2c8445b8aed89d9a9/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/3493fbffeb79bd04f4e48e243d55b7f2feb0a5b3/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/4080de37ab37db7b9aef57686fc8d7e8361ba273/
        i686 |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/344add24340ede8094ac25181f7e455c64c89a5a/
      x86_64 |                 libnspr-4.10.9 | NOK | http://autobuild.buildroot.net/results/8c36f6bdae4db8b2b8e44a28476bb3805ee0bde1/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/4a935e2b9e41b7279489bfd1507dccee5c11362e/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/8068967b67e134e48e4b77970ab4567e189a46bc/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/25a74e56b1c64e9aed73c427b6c5bed860ce4bef/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/a30888ad79a5c370ae080dbc122b2edf74b5a37f/
        mips |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/e1aaba7927272b7d1b0e44a72155a9858af4917f/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/61b4a04b435192ddf2fa9b84c7d27b685e296a8b/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b3d56c5a86ba1cb933531bee477299b4bfa710b5/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2d027c3c472f950d453592f90852a9bb96569234/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/297cdeaed28ee277877602d94c987c6d6b00234c/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4506744e947311b46751111c75755951e61e59d8/
         sh4 |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/4f911d262ead4bb078ec014de245a0db87f26062/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/f12e9b7b95d33ffd3da32607bd37bebdb2893fd3/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/79d8ea1555c79be10f124af7fcaba9e5d1364030/
         arc |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/953c2d639cda1fd5d049fa5cbefc037f650348d4/
         arc |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/b0e9c7cdffacc27e7a685c32560b0632b51d0b71/
      x86_64 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/f764dfc0649c4efd69062b6a8b700cd2d77d5ca2/
        sh4a |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/028b4e685970bbead976ca46de3ef4b57005b670/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/424bcc45ad678fd720ba0519185abffafdec206a/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f5bcaebbdd105eca66d64d376b6847adf5ab20de/
      x86_64 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/4aa16f6d33c72e362d96921f30964a7ead382ca4/
         sh4 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/18ff6bca08fa1c22f2fddd096344ddc5d172d078/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/6c12bfb866272eaef20d0b55333b3a2accd803ca/
        i686 |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/23668c158ea200236f2805b4ded7a7cf43e0b9eb/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/e6dcf8b939d9f02c1c6b1add8d163a62567d26f9/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/e04bf62ad2e1180935647fff340896c266b01faa/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/f0ff7a748b94264907ff42189101de626a17b4b2/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/b9a3422e8eb4cdd8720a7884f5eb6d5e8ebb14df/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/85d4be15d871b9361edeb2fdfa606d43144a1a82/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/e2cecfc28fe3473896439013c0a0b9355c3e3b60/
      xtensa |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/16fff97454cf7b8a80e0b9422e5241d2501cdba5/
        bfin |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/81549d4ce50c29ba23a70d0fd16ed85abe53e581/
         arc |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/a8fab920599e7dc77038f3d2a9a699d6823cf3ef/
     aarch64 | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/5429dd3f07430cf1487a8cfa82ba55e66a640473/


-- 
http://autobuild.buildroot.net
