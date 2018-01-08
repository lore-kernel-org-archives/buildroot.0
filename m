From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 Jan 2018 08:00:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-07
Message-ID: <20180108070010.7A57220733@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-07
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 205 |  37 |   5 | 247 |
   2017.11.x |  25 |   1 |   0 |  26 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              cjson-legal-info | 6 
             libostree-2017.15 | 6 
        python-xlib-legal-info | 4 
                   gconf-3.2.6 | 3 
                       unknown | 3 
                 libdrm-2.4.89 | 2 
package/python-xlib/python-... | 2 
             bluez5_utils-5.48 | 1 
                busybox-1.27.2 | 1 
                  cc-tool-0.26 | 1 
                     daq-2.0.6 | 1 
                  ffmpeg-3.4.1 | 1 
              host-erlang-20.0 | 1 
           host-protobuf-3.4.1 | 1 
                 libpqxx-6.0.0 | 1 
make[1]: *** [obj/ethernet.... | 1 
            nilfs-utils-v2.2.7 | 1 
                  physfs-3.0.1 | 1 
                  rygel-0.36.0 | 1 
                  samba4-4.7.3 | 1 
               tcf-agent-1.6.0 | 1 
                 xenomai-3.0.6 | 1 
        xlib_libXxf86dga-1.1.4 | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/fb2fd212058f855ce42761f020d490624c5b24ba |     
         arc |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/fe53139ef1fc8768b918c794045d4e637d08e9fb |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/6f2c6c03fd2f656aa8319daf0ddb93b4f8d9a177 |     
         arm |               cjson-legal-info | NOK | http://autobuild.buildroot.net/results/00bac21eb2520d71ea1063fc362c7424d058a538 |     
microblazeel |               cjson-legal-info | NOK | http://autobuild.buildroot.net/results/ac1b8ba864de01365da306f153d155aca1de1691 |     
    mips64el |               cjson-legal-info | NOK | http://autobuild.buildroot.net/results/513307165be1af4090678d9afc3b287eefc42aed |     
         arm |               cjson-legal-info | NOK | http://autobuild.buildroot.net/results/01ad4f71cfcd4a01b51078cb558558466098ed0d |     
      x86_64 |               cjson-legal-info | NOK | http://autobuild.buildroot.net/results/7f5100f7d34b81df066907c39c37e4cabdb1f8d0 |     
         arc |               cjson-legal-info | NOK | http://autobuild.buildroot.net/results/626f01bb2e769914d471e70665f7f2909e1f5fe2 |     
        i586 |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/054f6581f67338b28af4dc2203b285ae1055581c |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/b31fb8364a5bef046db04739f12301a09cee33ac |     
      xtensa |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/7d439d748e32e967358d1fed3cab4a0e6e6b8cca |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/3d28fdc658dadac8357558b74545ad2b1ff7d4aa |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/0d1db644b49910965b2198d8ae00c078b8b09af2 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/60aa65815b664c50ad96318fcf62fee3b945d4c6 |     
        mips |            host-protobuf-3.4.1 | TIM | http://autobuild.buildroot.net/results/b5a0904d5d5fa1877fcf88924e0623842805d240 |     
        m68k |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/cea777dc997f86c1122c8b818d264215a0e77e5a |     
        m68k |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/da4a3c18f15fd05df5c5dcce637daf65c40583a5 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/c375b766e84a8762dc4594e848a07d79cbf5da04 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/96e327df02d7f8d72fa6f5ece0d41107e4fa0181 |     
      x86_64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/d1bcdd3e10c717fd131382a38d3246606178f9f7 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/c697d5bde89d6e5f8892aa8004ae4154b73a3653 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/8c784d7f2592ebecefb3ebef8002a604dc9586b9 |     
      x86_64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/c02e1ce919ace3a6552d0e2387e4f27419ea4629 |     
     powerpc |                  libpqxx-6.0.0 | NOK | http://autobuild.buildroot.net/results/77f0d9ffe322c33e146e9e6c8a947b48e241ef9d |     
     sparc64 | make[1]: *** [obj/ethernet.... | TIM | http://autobuild.buildroot.net/results/66192e28f73b8bd32e9d7d6b16597ffe9e40539b |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/3863affb2f3862275bfee8625f1ac3fdcaa11e51 |     
         arm | package/python-xlib/python-... | NOK | http://autobuild.buildroot.net/results/3341d0976bf799db5bdf693eff231d3731f29c7d |     
         arc | package/python-xlib/python-... | NOK | http://autobuild.buildroot.net/results/f90bd7a481b6014ea4f65894936b8dda790404b0 |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/6a9f09390818d3391f1ff4bde9e20557e54856b8 |     
         arc |         python-xlib-legal-info | NOK | http://autobuild.buildroot.net/results/332c5430f09524174a99bd0b2ea33ab8aa4adb7c |     
     aarch64 |         python-xlib-legal-info | NOK | http://autobuild.buildroot.net/results/ca6207c893229c1df56de1891f742c9fa77ef6c7 |     
   powerpc64 |         python-xlib-legal-info | NOK | http://autobuild.buildroot.net/results/6f547f64f4e16a7e5c3b82e650b61e1f1e576f8a |     
         arm |         python-xlib-legal-info | NOK | http://autobuild.buildroot.net/results/cc8c8417decb1a8c984d4cfa7eb6d03fb44d6b21 |     
      x86_64 |                   rygel-0.36.0 | NOK | http://autobuild.buildroot.net/results/6c659aadfc418c0a27a93284eb34d75e2b0dc169 |     
    mips64el |                   samba4-4.7.3 | NOK | http://autobuild.buildroot.net/results/05439c1b53963a6bc375f43b7ae52406d2b86f84 | ORPH
   powerpc64 |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/5088f6efd44ce9b081c2c7825a7005a9cb60799d |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/68f60ad38d9b6eae83b5d233966616a25d8c9391 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/38d7ef07b1e32fcba2ba8d45241aff5a93d2216a |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/c938559f16b3166bc91afe7291065ce177b6f19b |     
         arm |                  xenomai-3.0.6 | TIM | http://autobuild.buildroot.net/results/1b4be53654c1697eac22dd07e18efaf6b86f2857 |     
         arc |         xlib_libXxf86dga-1.1.4 | TIM | http://autobuild.buildroot.net/results/a353e84835548ab7942e16a4c30c92b95b8ad549 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/94767a53c13619eeca7707b83991c65ff4895308 |     


-- 
http://autobuild.buildroot.net
