From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Feb 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-07
Message-ID: <20150208073017.35112101697@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-07
===============================

        success : 325
       failures : 36 
       timeouts : 0  
          TOTAL : 361

Classification of failures by reason
====================================

              host-erlang-17.4 | 9 
                    strace-4.9 | 3 
             armadillo-4.000.4 | 2 
                   perl-5.20.1 | 2 
                 python3-3.4.2 | 2 
             libselinux-2.1.13 | 2 
       opentyrian-2.1.20130907 | 1 
               ding-libs-0_4_0 | 1 
                  zeromq-4.0.5 | 1 
                  imlib2-1.4.5 | 1 
           qt5multimedia-5.4.0 | 1 
                 webkit-1.11.5 | 1 
                  thrift-0.9.2 | 1 
                      qt-4.8.6 | 1 
           libmemcached-1.0.18 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                xapp_xfs-1.1.4 | 1 
                   mono-3.12.0 | 1 
     host-google-breakpad-1373 | 1 
               sdl_sound-1.0.3 | 1 
freerdp-440916eae2e07463912... | 1 
              lbreakout2-2.6.4 | 1 

Detail of failures
===================

      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/ce2e7b81eeecd93e1567d7884673c4c1cfce9898/
         arc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/f3e5d39ca201532a7fe5a5761c23e82870dfe1dd/
        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/3c866403c71786cd1d56d470980dbc619a4df09c/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/218cfdda76e2fbc5b51fdb59f85fb8ef14ad49c1/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/0950780ec1cc6e917c58ba2a7d02f3c59b4d6739/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2a7b706b06f2de8d5eb9cc0e6b48e5e202561ff2/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/ccfe316b6904dcf61ce0f2b74af038166934d296/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/b8adcfbf1f09dfb8bc58ac3537d0eb9a40208c40/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/772b5e8119824e9f46e99f2c60b70bf0c99bd81e/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/6d9968dd6c3b725e44e42a1b8765a7e4b69d3952/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/5bbfde570926032d77fe4ea03b2c333b3a86f698/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/16aeae035bea46c1ee7e7f27c2c4b746b49b4862/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2a986caadc161693e5556ff3b49f9ebba12878bb/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/f2bae538b90201baa6e9c1c37881a587e65b43cf/
    mips64el |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/4b0b86adb660a38c405abffc681a8edd6834825a/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/178cedea81e4314eb074d7c6012b927cb9d22676/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a5adebc2b9dd438a3d07d5411e7ff6354a157d8c/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2d010123f84f6333343d4ee8670dd11b1bf68aa9/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/dd81de38ef69adb0db6f6d0a62f0abcbf2a0ec89/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/4b1b24df2bc27afa90c6234049d90001c6151eed/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/23e2d53a167fe62ca93766f08d63e6d93482dcb3/
      x86_64 |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/323a82776cccf17afaa00ebe3483cfc06a06f264/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/7d4cf7b63fda1a062263b7a4e758c699049105af/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/4ccb2525754366e46c6f2bc60c66b47326a11b43/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/16a4fba267e89bf2da7444f6694554f18435f876/
     powerpc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/8b04be268b7d24418135013e63dc239c0dec5dd2/
        mips |            qt5multimedia-5.4.0 | NOK | http://autobuild.buildroot.net/results/b77cdf9b1cf6cafd5afef7337553bb32489207e5/
     aarch64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/6109c0b95389e62a67f8968ed0bcfc0eb8625997/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/8551f2e05e53355c05501376fae8a26c79dfe37d/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/5152f86e17b0d69138612e323f315aa2ba3628bb/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/75776f32ddc7fe42fda186aebb7a3db21ff45830/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/863d547ef572722607d5bf5f948ee627a2e75312/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/d5d652a143ecf7c15197364739094a480142125b/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/7fd9672d56a83d6f3a6ffed406b7e7262ecd361e/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/b5df5fda0d0ee67f548b080d7be3349a1d283111/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/6196e7d077240bfafe0d73dee270111074cb75da/


-- 
http://autobuild.buildroot.net
