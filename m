From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Feb 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-03
Message-ID: <20140204073011.07F84101799@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-03
===============================

        success : 75 
       failures : 78 
       timeouts : 2  
          TOTAL : 155

Classification of failures by reason
====================================

                      axel-2.4 | 15
                    gpm-1.20.7 | 8 
                  ltrace-0.7.3 | 8 
                 libhid-0.2.16 | 5 
                   minicom-2.7 | 5 
                      icu-51.2 | 4 
              pcsc-lite-1.8.10 | 4 
                    sdl-1.2.15 | 2 
                   open2300-12 | 2 
                       unknown | 2 
                  zeromq-3.2.4 | 2 
                     vlc-2.1.2 | 2 
                       kmod-16 | 1 
                    mpd-0.18.7 | 1 
         host-elf2flt-20130904 | 1 
mmc-utils-11f2ceabc4ad3f0dd... | 1 
             iputils-s20121011 | 1 
              gstreamer1-1.2.2 | 1 
               libglib2-2.38.2 | 1 
                     tftpd-5.2 | 1 
            libvncserver-0.9.9 | 1 
           imagemagick-6.8.8-4 | 1 
          sane-backends-1.0.22 | 1 
                       joe-3.7 | 1 
                 pixman-0.30.0 | 1 
                  libogg-1.3.0 | 1 
               libsigsegv-2.10 | 1 
                aiccu-20070115 | 1 
                  iozone-3_414 | 1 
               alsa-lib-1.0.26 | 1 
           heirloom-mailx-12.5 | 1 
                    fltk-1.3.2 | 1 
                     php-5.5.8 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/a4edc3fd918c273067deecc0680fec02abfb4b93/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7736ae9c3f677cc4d4b59c100d01ab10e9d92d2d/
    xtensa |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/44bb8eed0d0b5124b7f5a60b83dfaab181941912/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/d19c1f3e4e7a41ebb8e06ab986c319a39d9f5634/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/851bc57d5ad36ba3426d722b07d92499901017e6/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/7d688be8e28e94a3ddfffba7fa0336773fd66e49/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/8c8c548419816a17ac90e9ccfbb7b39099607c01/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/27d9bd75af225ac5c680787ae84aa93e174f5b6e/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/65f85487ff7567e8e1f0a2f9fb9a0ad10ac7a4a5/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/7aa1b31e806289362c7f6b6ea98f5e484e999a66/
       sh4 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/85f176aa8b949b2336501738dd8b232a25e16b5d/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/3acf4f9baa529a975eb955b7c485c7f921d91efd/
      bfin |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/4dfb571581a5730e8da0b5d5e4c5688cd76abde4/
   aarch64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/f779859d78b67eb58de4edc4f8b056f403b9f6cb/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/051114aa886e1603632d4233d44642e29879cfd5/
     avr32 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/6f8b4c1f50f651d23b4b803174fd04b6f67a1c3b/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/fe8d5de90717263cb42f3a6b144e853574c93c1c/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/f23fb9f1b30e8f50b6976fc53c3813db0ec43fc2/
    x86_64 |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/01f5dec5a99665f2541628115d262b1dc09a0665/
  mips64el |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/89932eae957dd2ffc8e9773506ef655910ecf5b0/
   powerpc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/cfc0257b96def88a94e6ea9e0ed8f8a7bdbccea3/
  mips64el |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/a64307e7a0ed044d655b8660f6a33d074d658683/
       arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/4b05ff811895efbfa74cf3bc56d2c61cf174adda/
      i686 |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/d2033621bf7bde4427a8788ab4f5e224e056642d/
   powerpc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/15afd17e1c9b22d642a43966a5c7e5ad4eb54db5/
   powerpc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/f54a97b08a77425eb036bcc0f71c3d88da21e3b4/
microblaze |               gstreamer1-1.2.2 | NOK | http://autobuild.buildroot.net/results/04250946f5b53dba6f98333076f25ff6ebc41419/
   powerpc |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/0a58e7b305d6dacbe5ce167138f768ee6e706893/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/a46503e6ef57b2e281d3e265ab7ec4bd14a28af3/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/c40a22814b405de2c5c75139cfc393c863ed4b81/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/787750d49f3a056629bc3a47a1dc4d4ac517fb63/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ab7bf8c85f006eff78107ffa65a3d28b76703915/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/be3f43e4b4b18caadff7bbc68cddaf13dd8852dc/
      bfin |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/7fbf866907beae01d1e89e02854a1225348312eb/
       arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/84c229c1e4311941ff6fcecdbc6b59704b95ba39/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/70aa84cc0ca6be4a784dd7900874557001604c91/
      bfin |                        joe-3.7 | NOK | http://autobuild.buildroot.net/results/cf27c31e0ea5209c3e2197ea8f7e2e0de9150a00/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/9eb036cb453999766610d9c12963d5d719853ae2/
      bfin |                libglib2-2.38.2 | NOK | http://autobuild.buildroot.net/results/2ce882cc09e39998968c03786828a7f728fc1302/
      mips |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/8c34649a7f98f60f14cff8b32fa2f8e82b1afeb6/
   powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/11078c81b7e603f15657139ba11fd4a724b35e72/
     avr32 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/af2a897ae91788a9ea5087c46eb48c4dc141c6a1/
    x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/97f98772749873e5e3a296a686b67d9910f0e06c/
    x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/bd8d4b2c46ae83a24d80e8b1580babd27c6a4c1b/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/27692619efee482cded56967017f260bd30eefe7/
    xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/06d091f2ea8d08a900dd7304bab5eeeeb85f7353/
      bfin |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/33506fff70dee3dd6ae43e114de9139225d21f14/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/658a278b1252d9c881d87f59a03e5caa122882d3/
      i686 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/91cbb14011d3be21b7217ed66d39e505436e8f7d/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/65b566647e6e8632e7107b48c7baf8095db6c892/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/95d82786127183b165a32fa8f8799321632aa7d7/
      i686 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/46cde50334a24424b00c273286639962cf28b759/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/09ebbf5fb8389d165574982243184a687181c270/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/651071459e418eae1a16173e3b14958f40fe7488/
    x86_64 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/3c86bbe8bcbe5594cfac1e96838eaf820b79152b/
       arm |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/ebe333a861277dc6b1bd447afc9b5fbfcf656cff/
       arm |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/e78d0486ade728a0ea3b378f4b94f3a4d24f3e9c/
       arm |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/1e517731e5a48b4622a9b876be4d7cc1d37a338c/
   powerpc |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/718c26b72f7e46faed17f883167acb86f6f26e31/
    x86_64 |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/7e34e73e40fdb0e04bd63fa889f9bc14f7e30536/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/afae6df10b03ea92c1027599fcac6124e86ad71c/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/8897803a54771d1f6a4ddba3515a3502d5c024ab/
       arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/beccf1d684c34d7b20727889c9b053371104979a/
    x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/0158f7d3654417289b4349d4ea8d82fd41412f3c/
      i686 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/b1a2dc224b3f1f5fbe7d6133cabd556629f2d895/
       arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/334a0d461beeb4d50a433d97c371ea50ed5322e0/
   powerpc |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/ab7e5f7f7d7437de35b8814c726b6bab4e153eb8/
       arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/7110f3552ff7eb27586f8b4f78cd7aad2bcfa1be/
microblaze |                      php-5.5.8 | NOK | http://autobuild.buildroot.net/results/4e14c745e1d4ac6b15c728091e1ac6c5ba2c507e/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/243f988b47f1dacd777cb64aa37d1ea5da5ad792/
    mipsel |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/9331f220c39d1fa58bb6bc9d557dabcd4bbf82c8/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/507bb7e05f02dd3195fd64b7d76824615398b8b8/
  mips64el |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/f1113b42ec13913fb420f764e14b9f112d4c4fdc/
     nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/87645c9a4d75c30cb19adbac4a19449b910272f5/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/1bc58088fd67876702eaed1d170a1f437f07b096/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/4b56f1c79b68de2c80708095a1848c69d6f4af1d/
      i686 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/78df2d86394d7637db88dac5d1e3c7b4a27af293/
      mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/da9ea650b1745d85750874b11f8c0327cb1b767a/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/86a18c7e2e7fd86112dc4e2d022f79e3cabe1dee/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/35e8a30df1e5ed72ecb231c15dd72a8a4db402d7/


-- 
http://autobuild.buildroot.net
