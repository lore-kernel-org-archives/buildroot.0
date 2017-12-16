From: Kees van Unen <keesvanunen@hotmail.com>
Date: Sat, 16 Dec 2017 07:00:21 +0000
Subject: [Buildroot] FW: [autobuild.buildroot.net] Build results for
 2017-12-15
In-Reply-To: <20171216070011.32047209D3@mail.free-electrons.com>
References: <20171216070011.32047209D3@mail.free-electrons.com>
Message-ID: <e28dccae0e2a4fc1a4fea0672c3cd738@AM5PR0801MB1394.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




________________________________________
Van: buildrootNamensThomas Petazzoni
Verzonden: zaterdag 16 december 2017 08:00:11 (UTC+01:00) Amsterdam, Berlijn, Bern, Rome, Stockholm, Wenen
Aan: buildroot at buildroot.org
Onderwerp: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-15

Hello,

Build statistics for 2017-12-15
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 173 |  17 |   3 | 193 |
   2017.08.x |  16 |   1 |   0 |  17 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     vlc-2.2.8 | 8
                busybox-1.27.2 | 1
                  cc-tool-0.26 | 1
              host-erlang-20.0 | 1
           host-mono-5.4.0.201 | 1
                 libdrm-2.4.88 | 1
               libgpgme-1.10.0 | 1
              lynx-2.8.9dev.16 | 1
make[5]: *** [video_splitte... | 1
make[5]: make[9]: *** [prof... | 1
                    mpv-0.27.0 | 1
                  samba4-4.7.3 | 1
                       unknown | 1


Detail of failures
------------------

         arc |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/fee3e302f99fde42af7b1aefa3cd9b0606d4c4f7 |
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/87428f338ff3b5400c918bab8f87692e171e1d15 |
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/3cf80e25a0ad97092cc5170f322027b84470d08d |
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/5117319efe159141f5cf6f468ba484570538718c |
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/92e074c49417261843eef95872ff935a56077c98 |
    mips64el |                libgpgme-1.10.0 | NOK | http://autobuild.buildroot.net/results/9619062ce6642ae4121d7debb3b4c632c88723d5 |
      x86_64 |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/215ae4d72628882d3cf690314f92d165fe011869 |
   powerpc64 | make[5]: *** [video_splitte... | TIM | http://autobuild.buildroot.net/results/cd8dabf2fff4286b934fbe3f79a406402c5164bc |
         arm | make[5]: make[9]: *** [prof... | TIM | http://autobuild.buildroot.net/results/9f2334d8e8cf0e5c6dc0754bf758eb9efbe56f2b |
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/864c409017c5a8b573fccce0803818a6efd5c5e3 | ORPH
    mips64el |                   samba4-4.7.3 | NOK | http://autobuild.buildroot.net/results/27ba25dd5a8227ba3e5d89dad2893ccd80f9f69b | ORPH
         arc |                        unknown | TIM | http://autobuild.buildroot.net/results/d144640be3124ed2c3200fd7feef0fe5603ee763 |
       nios2 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/b54f346c3589155514f2c044123bf80ba3a22d13 |
         arm |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/8b6842cc88c95b4ef69b8a57c31e1047f099f3ac |
    mips64el |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/f805b0fcbf48fc9d7c5bc6c80d0db6a75fe85100 |
    mips64el |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/27db13ae330eae28808c20712beaa3a2969ca560 |
        i686 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/8eed537ffb173d5d7665159418d264407bb2385f |
      x86_64 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/8f181a029497b4dfcac670b7a87698a155355338 |
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/c8fdb1d522a50cbe4be562af6d51b4a47eccd914 |
    mips64el |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/ff05443224bcbabf0e184e87597ff5d59a2dc069 |

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

                     php-7.1.7 | 1


Detail of failures
------------------

         arm |                      php-7.1.7 | NOK | http://autobuild.buildroot.net/results/ba7866bd4b4795871548c37b96fdd135f450cbe9 | ORPH


--
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
