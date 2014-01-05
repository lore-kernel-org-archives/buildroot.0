From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-04
Message-ID: <20140105073009.8FB89100CE8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-04
===============================

        success : 72 
       failures : 61 
       timeouts : 1  
          TOTAL : 134

Classification of failures by reason
====================================

             transmission-2.82 | 16
                    ola-0.8.32 | 7 
                aiccu-20070115 | 4 
                  libpng-1.6.8 | 4 
make: *** [zmqpp-legal-info... | 4 
              cryptsetup-1.6.3 | 3 
                  thrift-0.9.1 | 2 
         host-elf2flt-20130904 | 2 
            libvncserver-0.9.9 | 2 
                 libevas-1.7.7 | 1 
zmqpp-30d72d95f2cfdf9c5cedf... | 1 
                 pixman-0.30.0 | 1 
               alsa-lib-1.0.26 | 1 
              e2fsprogs-1.42.9 | 1 
                 dropwatch-1.4 | 1 
libwebsockets-v1.22-chrome2... | 1 
        ltp-testsuite-20130904 | 1 
                    strace-4.8 | 1 
                elfutils-0.155 | 1 
                     php-5.5.7 | 1 
                  nettle-2.7.1 | 1 
                       unknown | 1 
                libsecret-0.15 | 1 
               libsigsegv-2.10 | 1 
                     gd-2.0.35 | 1 
                 webkit-1.11.5 | 1 
                  ltrace-0.7.3 | 1 

Detail of failures
===================

      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/f8230481b51cbd81161d932b0907c97d9045b711/
  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/483186d1fc4f75381360afb413c0ec3954d7c92a/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/1fb96e0903d8e9f88345f6429ea62fb2f5cf9f04/
      sh4a |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/31e807626ac53bf45d993ef647ef15b4f883d7e9/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/02304fe1b5e9bafaddeb1397aba3b9f30d69b196/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/af1802f534df6d1e1810435f98a5de56328753c4/
    x86_64 |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/a54e0794a54b2ad58803f5a686b307335c429e67/
      sh4a |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/ac41f299988ce0bc730fc3fbc5c8dcbb823e7af9/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/05720eb99f2c160c22911079045251499e665735/
     nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/34724844bd5518eb0735c189f8c3908db4d4083c/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/3259d9cf40c7202684782993f5f6a9015a95968e/
      i686 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/1b69d2d12f3108ed7b609ab6a42c6f20b2bf0b0c/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/1958d75f23cb765038044c59a036a3221832a040/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/0ba013ab2004c1578f23847bfc3e181e7569b9cd/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/1c02a639e37284ee0656a9b2ebb9aecde966b3a3/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/17d2eb5416d72b4cea236590d36f13428612648d/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/fab9a26f14a727106ba00d5edb5bdf9e043c0d7a/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/003b2dafd3b11cf58ae2c1072da4098523a24dd7/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/6dd5eca62d63d4c55b97900c59e691d31be4b772/
     avr32 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/39000db7dc0bd22e74ef61e2c529dece4efa526c/
microblaze |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/ae6a10ae7cd8f2d2f3891ea9c6e867695ca1acfe/
    x86_64 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/ab4ac1341066d420777914bcdb2c731f90e42e1a/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/3448abdf419fc8063db058da9817419de1adb655/
    x86_64 | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/5f87936e66efbf5b8905bc269baf0d7cbef80170/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/06e44292ea530777b8517f81c5af37fa56287ea7/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/3e841143bca77767d16545a1c0d38d818ccefefb/
      mips | make: *** [zmqpp-legal-info... | NOK | http://autobuild.buildroot.net/results/a9486192f360372829ac4df8a0b2b091735972db/
       arm | make: *** [zmqpp-legal-info... | NOK | http://autobuild.buildroot.net/results/2e4a09a1725dc88d14f867d4d2a21726f12b5d90/
       arm | make: *** [zmqpp-legal-info... | NOK | http://autobuild.buildroot.net/results/a6029fcb670cd27687a68cb96f0f14f5c13caf47/
  mips64el | make: *** [zmqpp-legal-info... | NOK | http://autobuild.buildroot.net/results/9709c445822aa2c4b358c65217116c8ee044387b/
    mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/90a70380be353ccc462cb94541d6c6c13f887346/
  mips64el |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/2d42a0269049aff444b1d3e96b9a55beb3f10169/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/c3ff8b8ee4acb1a0044f3dfabf2c18fe6aab8be9/
      mips |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/13f7fdcdd81303a22b03d544d580f384f803c72c/
      i686 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/229b58084c652ed55a4ddcb139a5d60083d903d3/
  mips64el |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/8cf9de44aa44535c7d26f130d664ee27a17eb6ee/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/aeba0e6318248cbb3f3d81b3c74abee5383491e7/
    mipsel |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/379484f0011e5cb9b2651962b1bbd87c53363a35/
       sh4 |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/269d8b0ae7aba62d93562528d8434f0b75151083/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/e2f6e4750d8b93320681abf09157917d131c8de0/
       arm |                     strace-4.8 | NOK | http://autobuild.buildroot.net/results/8296dcc90644c8f3970ffba5921b704fcd3e3902/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/bdd1fd21969ec879e2779c60112c64fd370640c6/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/d0e785689c862a008047163209169cf87ce046e8/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/f82813525151c8559f6cc89eac1edd8a59d3681a/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/3df97b7a9373a8bab050f65e77755ae74d2a6185/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/e3184e01c4c0f5e744bca63945037ae8218cb158/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/0953bd5c2e29e7bc5d05173f92b5e16c14c22d22/
       arm |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/e3db4dfbc69509add3b7ff645c012056fe67019c/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/e3ff966df37c6808068da101246efd3d0924bba7/
  mips64el |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/c300aca1c0ecd278f283dc2b367eb58b3e03f474/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/22c90b5b115bff81a877e4078e70b2ab5bf34ace/
      i686 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/779c0c9ac2971c68ab1fcbaa47fef31a3755f260/
       arm |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/1b9f4fa47b7ce723f53e5a20b7ea47d88973d0af/
      mips |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/9207643ad4f65e883d5b4838dc373c18a6531a31/
       sh4 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/5bbad71ec75ec1a76a420df00f25d522b7e29a5c/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/01c65e3a0d5e2f597b0f4fe2093b2025ead5d33c/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/f245aab1dad05340a50a6f4c42c8b40ffde836ea/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/c731fb73d5e01c353b637ac60b9e56db4e31cc71/
    xtensa |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/228325804c451ffc30d07a978c660dcd5150686d/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/2136f3642b52d1a1aee47fde3f3d57c2f0e8e5a9/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/2ea04877466a6a256a798a6c64c9fa8dd349278f/
       sh4 | zmqpp-30d72d95f2cfdf9c5cedf... | NOK | http://autobuild.buildroot.net/results/34444ca5757eb56d40631430f23af39f895632da/


-- 
http://autobuild.buildroot.net
