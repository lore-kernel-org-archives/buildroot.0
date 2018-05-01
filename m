From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  1 May 2018 08:01:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-30
Message-ID: <20180501060116.B875B20A39@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   1 |   0 |  25 |
      master | 183 |  62 |   3 | 248 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/bf09f3031f24cbdc37d00c8266a1a6f14dcc4cd2 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    cups-2.2.7 | 12
                 libebml-1.3.6 | 12
                     lxc-3.0.0 | 11
               sdl2-legal-info | 7 
      gst1-plugins-ugly-1.12.4 | 3 
                  host-go-1.10 | 3 
                 host-rauc-0.4 | 3 
           libfreeimage-3.17.0 | 3 
                 libcue-v2.2.0 | 2 
bluez-alsa-9045edb436ea755f... | 1 
                         boost | 1 
                  flare-engine | 1 
                host-libsodium | 1 
               libupnpp-0.16.1 | 1 
               log4cplus-1.1.2 | 1 
                       unknown | 1 
                     vlc-2.2.8 | 1 
                   woff2-1.0.2 | 1 


Detail of failures
------------------

        m68k | bluez-alsa-9045edb436ea755f... | NOK | http://autobuild.buildroot.net/results/7a632c2b6b9021aa6edcd5126400de26e2b8ca42 | ORPH
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/960aeb897fdeb2dedac3a1aecd589cc66eb727bc |     
         arm |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/bc8ade8b9b087d7a3ebf28dab48a8cbd4cf59212 |     
         arc |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/137a3d515c54471550dcd997bd107978b496ea5e |     
         arm |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/13cb03a8d0ae215c418fe2520a27b2940efd4a39 |     
         arc |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/48d53bdeceafdbb51756d5c0b9936ce7c98b4ddc |     
      x86_64 |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/85632ce23b351671b6cecee12881623241d08744 |     
    mips64el |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/d5db58c0c063cb2741c08487f82ddd4f04b3a04a |     
         arm |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/d04769b7a8bf1cd8ec8512ba9f4c917beef5869c |     
       sparc |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/52d67be85d662d0d8fdca5348e5a9d764e90d3fb |     
        mips |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/60fe80d26e4f6a92792dc2c6b9e0c049e367ac79 |     
      mipsel |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/5ca4dc78799b2dbfe6aef3f9071886e03e2c8e0d |     
         arc |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/4c3c2cee6a733b758a42bf7cacdbe3f355df3b72 |     
     powerpc |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/fd3c56b60bb0411b38dc7279880d1fab7228c20a |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/a511b7b34965301f0512e9c1e9adfaa6c512e745 |     
         arc |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/de4b88d78cf85eb897a9f85317ae061c99003a6a |     
         arc |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/cf7a6e60390e7cd59a9dc599975cc7f0982a8f71 |     
        or1k |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/0512aaa6bedd3c8b60de216e35fcc047991ac2db |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/14dcc10cd7f38af54040a354bb36839263155c55 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/b3e139dc2bf5993de513c706aa26926ebbc47604 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e1958f8d302385d473a6b4fa35828ac6a7a11f15 | ORPH
        m68k |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/7bbb4c83c324cb14fa25cde284583846da90cbce |     
         arc |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/5120a33b206ae0836250c234d9613613087666cb |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/787df7a61d12762b6dee932cb584e36f8d2c35db |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/be61595a0d9810157df623928c87e573ef59ff36 |     
         arm |                  libcue-v2.2.0 | NOK | http://autobuild.buildroot.net/results/27c4a9d71b7979a3070e40c16509b9547d95bd59 |     
         arm |                  libcue-v2.2.0 | NOK | http://autobuild.buildroot.net/results/5ed7779fbb45e8ff516db89559a9c79b7d41aeb1 |     
         arm |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/d8512ebee32667513b243f55735ba5ef79ba2a73 |     
     powerpc |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/bbf1c6687ad850fd40f82e1427b3aa31b3953e42 |     
      x86_64 |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/27e55f87b4ae15d6482d6d7fa6f6996f65d6355e |     
    mips64el |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/68134a53134a8cceb4d956a282473b8120e6bb3d |     
    mips64el |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/e86bf66027b4624cdfc0d24bbab6054f4ac555d6 |     
         arm |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/2976ea32a026f5e21661971410ec4df444a6ba2e |     
     powerpc |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/27cfeae5df945d257fae92ee1d77dec165e5a6ab |     
    mips64el |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/6008f1b84121eb854b61ce2f3577afed09f4d731 |     
        mips |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/f1eb2447b23b925836fc6335c1cc77eac0cadcac |     
        or1k |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/c5d58928b326327476d19a6068bc7e7ae1919001 |     
    mips64el |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/0875d572e619ebb2a40ba988bc0ae5d4e1cf2837 |     
     powerpc |                  libebml-1.3.6 | NOK | http://autobuild.buildroot.net/results/83ddb6e2ceea91e191c589b6d307baf0fefb91a2 |     
     sparc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/b4b7ff1d45a8064d4d5db35f4565e5e8b31d0f27 |     
      mipsel |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/30ef3e446466650bc3a0c9469dbe03357afdad21 |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/b8246acd58f4b9ef1f2186b256cd7c6c3d73c4ab |     
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/223485c62c13d5763d4f0439330e1f5eb0469387 |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/0d0f89bbf586871384ceb00c38fa07441376db8f |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/99d404cd00658b188dee8e10152db2adcaff9256 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3b491a27865993a5dbec7f1c0ef7d0b6753fc749 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d7d8b5c31ad1fc8fbbe7e618de5db8512c967b3a |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5411474ad0fcebe40e488bcac1f9f08057742569 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/eb5eb2c028fa60a9f706861c1eab2c5fef799b3d |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/87608173407c3484e498eb0009a272c1c87893c9 |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c47dc5c8022b0affbbe57b7b4e2c2355cdd3451e |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/bf17c87124a968eb376fc1849eed37ea61170af8 |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/578b88367ccc31864d1614fa7e2306514c8160a1 |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/999eaee4fe182a0778448b9412d7c724f8f02826 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/de19d7228ac5d56fd3d5fd27a6f0ad5136c1fbf6 |     
    mips64el |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/2c865463a4b7524114518c04dce9c94252433460 |     
    mips64el |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/f937b075afe3fb8f7c5c75bd2d1499b24c4e238f |     
     powerpc |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/84f45f693f87d22bb8c1ca4c3bc821a6cc3e21f1 |     
         arm |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/cb32bb1d82f2d8c571ddb08ba9a906aad14f8fc8 |     
     powerpc |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/f8bc4545a9228caf9cdcabab0d66b4875f076b2b |     
    mips64el |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/789408bd8bdaf14ac07e66d69715778fc57e1126 |     
     powerpc |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/cd8f6bc7ff5ea7729504d1cbebe0144ed9451305 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/4d27720dfc20ea7f0d9fcd5214455a29d9edfeb2 |     
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/6fe25fd9f9185d001db40676fcfb4e587fb80988 |     
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/bea1405a18ab9379491ae7ac1a8a420a17f8eb7a |     


-- 
http://autobuild.buildroot.net
