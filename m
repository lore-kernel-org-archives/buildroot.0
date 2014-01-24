From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-23
Message-ID: <20140124073009.DF0461010C8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-23
===============================

        success : 73 
       failures : 56 
       timeouts : 1  
          TOTAL : 130

Classification of failures by reason
====================================

                   gtest-1.7.0 | 9 
               tcpreplay-4.0.0 | 9 
                     vlc-2.1.2 | 4 
                   open2300-12 | 4 
                    mpd-0.18.7 | 4 
         host-elf2flt-20130904 | 2 
                 mplayer-1.1.1 | 2 
                      icu-51.2 | 2 
tvheadend-c7d0335eb10d02b78... | 2 
        ltp-testsuite-20130904 | 1 
                 libxml2-2.9.1 | 1 
                  python-2.7.3 | 1 
                 libnspr-4.9.6 | 1 
                       unknown | 1 
                     gdb-7.5.1 | 1 
            vorbis-tools-1.4.0 | 1 
                      qt-4.8.5 | 1 
                  thrift-0.9.1 | 1 
                     php-5.5.7 | 1 
libshairplay-139d5ef5556451... | 1 
              sqlcipher-v1.1.9 | 1 
            libvncserver-0.9.9 | 1 
                  zeromq-3.2.4 | 1 
                  libogg-1.3.0 | 1 
           imagemagick-6.8.8-2 | 1 
             alsa-utils-1.0.26 | 1 
                     lxc-0.9.0 | 1 
               w_scan-20130331 | 1 

Detail of failures
===================

      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/0c616b8811399b1a57dc37b8cc2408e39c1d0941/
microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/940818b87adcb50a94c70e77366755d5c5bdbf63/
   powerpc |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/5c6e58c51b2a14a7f23d296f771a76096b80362a/
      i686 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/bde777d343e9c4884272893d0da3b113dcc75e3a/
       arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/20cbf90749672607cb277c676a45d2c0c3965fa0/
    x86_64 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/1e610142e72676bd8d13aa8e87829b492c714257/
      i686 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/e5b54b716fb2371014b4f7ac79287bea6d4b03de/
      i686 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/b1e9bae22b3e0b91dccfd034864c4a5c7848f41c/
  mips64el |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/89a29d1f597dbc12a6fc8eb079133a84952fc612/
    mipsel |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/9f891b201e4e9db4a67868ecadb46bd8e95e9d41/
    x86_64 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/ce02a951d5751a35b7669d46deec0534e7ddf427/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/4d64b4c539ebbb7afc682b02bae512bf60946ba1/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/bfa872f6d28116009dc2a8dc77445c082827a62d/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/1a3b888ebb4b2f175d96b9359865e82b3560c6c4/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/1c54a4b54989f49e12eca5862b155bf46a7c84c7/
      bfin |            imagemagick-6.8.8-2 | NOK | http://autobuild.buildroot.net/results/5cab595efed232e35ed1fb5d1fef4275a49e0c61/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/d651f923468bea7f55cc0aea437152bc9cff92d4/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/662812aa42721a6c4c86aaeb052038d55d6d6a2e/
      bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/565211541b42f16af7b14d3a410318eb86ef0667/
  mips64el |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/13f1669c2a5b132a28f0057b0da6d49562098e9d/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/b9815cda93ded22dadb73e3d0a26476b03555a94/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/d10ab2ac6b2b4b4387d069b947c286925534d696/
     nios2 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/10715282504fc403f74e59a8e79196941c825ba6/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/f0cbc422c818b951c3b533417f87c291c7e5086e/
    x86_64 |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/a8ff08b8887102af205083a2d2f43c6373e6aee5/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/ab47a909586016ac81e8d1fd9ab9a6e780c700f5/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/8e721bd40f46605f3930c4d81f981f6d62e5580b/
       arc |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/1eff4409b0baf8ea0e4baea2ef07722d1fe9da3d/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/28dcefbc5c5a506f44c7d6e47c9e010f791855e2/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/7f137a0407468d2c9df33ab31aaeae19f85e6959/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/5034e929344d148cb429c5fc38f2d0fe2326faf6/
    x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/92e3359aa36c00e4ae887d135ddcaa7059651f1e/
       arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/45eff3c89f7b669dc9ad2903050cb25ac261d8b3/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/cc6669747157716b9aaa33de053d34268b75dfdb/
    x86_64 |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/fd3e9b61f91b2c8940db1b8ff9cfab8e5af3e0f1/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/4969cf1c6e1b56054f7ae0b38676cd409786a350/
    xtensa |               sqlcipher-v1.1.9 | NOK | http://autobuild.buildroot.net/results/92116c2837e4c449919e7a0ab9aebd6abb1cbaf1/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/2058bad449b0c3225eff148a6ea5958f9410a6f3/
       sh4 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/0f8646680680c14077db1459f6fbdeaf8e5fc9ab/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/d0130e6c16efaf4f35672072389bdd839920d568/
  mips64el |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/dc52c17259eecc47db575962d027967b60e50de2/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/85834d13b02845079c5d6b034c9e7c8004917565/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/816da10413dd1766da65eb87224222071a98cbff/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/34a51758fcefbf8c411773040b4db921ba1fcc5f/
    xtensa |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/0aea1721e3e2e2cbd5b4fcf355304611c99110f5/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/46ee48ff23f265b81dcdb2a4874fb2fde1a45639/
     avr32 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/6f21504c06c21fac3bef857dff847ca5964b23b9/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/0526f878b57cb7b6798a2307e64f6c466482c1bd/
      bfin | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/6a207ee731acd88038b35983c03e4ed5f903611c/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/3dd2f6abc9e995fa1b34472c37a11e9501e75b0f/
  mips64el |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/c9bd5647838e4fc60743a579b639c1470617f969/
      mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/93e640627c78259a74bcd871abee3fcf525a212e/
  mips64el |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/71aecf3d338e91f41ef5f7038a9f2825a97dde51/
      i686 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/76e8bbe6d425f26cdebabb0f53ad41bd1356e61d/
   powerpc |             vorbis-tools-1.4.0 | NOK | http://autobuild.buildroot.net/results/a887296e2e94b819125db0d9dd9f62bd462e11fd/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/61599e898c058a47d738a810a93dfe6e5cc92a2c/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/45233d4695d62afa670cea98d42f2311555a4b37/


-- 
http://autobuild.buildroot.net
