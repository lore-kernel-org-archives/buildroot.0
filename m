From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 01 Jul 2019 06:00:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-30
Message-ID: <20190701060054.AA0EC204BF@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  18 |   2 |   0 |  20 |
   2019.05.x |  17 |   2 |   0 |  19 |
      master | 143 |  63 |   1 | 207 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             openjdk-jdk-12+33 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/43a074197420544c81fa7ccfc23d440e56200f41 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/582d02d7f6217241130c6f97b97b20212514c640 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.4 | 18
              iputils-20190515 | 5 
             xlib_libX11-1.6.8 | 5 
                 hiawatha-10.9 | 4 
               host-efl-1.22.2 | 4 
              libsodium-1.0.17 | 4 
                       unknown | 4 
                harfbuzz-2.5.2 | 3 
               libcap-ng-0.7.9 | 3 
                qt5base-5.12.2 | 3 
rtmpdump-c5f04a58fc2aeea629... | 3 
         xfont_encodings-1.0.5 | 2 
                      gnuradio | 1 
            host-mfgtools-0.02 | 1 
               libsigsegv-2.12 | 1 
           libvncserver-0.9.12 | 1 
                 python3-3.7.3 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

      xtensa |                       gnuradio | TIM | http://autobuild.buildroot.net/results/2db307b50e38d91206cd3eb67c53447df61205e1 |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/26b7904e0c4632a8d08b40073cdbabe9071c0363 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/41259b022b267d0db310ba990f259cfae3533385 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/07b81d92839c1243b9f8cb81f8ac9fc4a3dc9f0d | ORPH
       sparc |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/cf7a654c98b4ff627cff1149b105ff4458010350 |     
     riscv64 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/c38e66381a95fc47e967c97b4a54ec7c49da27d8 |     
 powerpc64le |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/13c402b553051015501ebe911de5699b7551d70c |     
     sparc64 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/354929bb94777a5f952a9e201a39f00e0c77056f |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/e8c3745440d656545d8b76d886ff77818048afc7 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/782c9970966edde27174da6486987c391046183b |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/22580c08be66e609b36e101d5fbd29bcb3c430a6 |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/62df8f13a60ad6c996427c0621ca06e43af96f38 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/3cc07f7dc41595f38013ad31c569a2d347076313 |     
microblazeel |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/07896198595f04a79a1196043509f6f091134ec1 |     
      xtensa |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/889c40427872ceb91d696e147b7328d7e9ac36ac |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/8916ca1fd19b7b0515098e23756c52ebb382c705 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/fb1cd9dea669f6f6eeab47e39e487c439bd250e7 |     
microblazeel |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/a904aec2ac4b4453230c5dd6afcbb045a16d4fa5 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/1fd40572de8f2a2349eafbb79b57f09b7668bd4b |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/fb773be77f441d6a40e9b83acb6b05b3e962e0c3 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/9563a3b7a955cedb1dcec45dfb0ed82088c6864a |     
         arc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/7b5efc7baef4c4aa18a210e5fcd863c1057e8bc3 |     
         arc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/6c8054669de05891f4fba8f24278f039262f4c1e |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/c8c578f0e00a638b04ea347516919aa987b497fe |     
         arc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/3efba14b5a77605710c4a07c81d9cc26e6c7b21c |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/e59120c275a6bfe8673413b1f58c9e72b70dccdf |     
     powerpc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/ae8e525175b72225323856ceac8b2d91d4785eaa |     
    mips64el |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/65364de7031284bfadf885995bf42c5099f8f171 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/a923a5130061b655308ff58adb52cc42f0d4aa0a |     
     powerpc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/e3ef84f631470f46dd711d881ba2fd506f93837d |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/12e0abd175045f4e0a0ebba26ad4bedb02d4ec67 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/9170033351e64d39f294decb793d67e524ed77c2 |     
      x86_64 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/d45bc86465de6def3e1e1fee68547d0a75f612ec |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/bdcc392e764a68c360f7c44c64c0e52022517c28 |     
        i686 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/b955e1128abeccd604787b264d25f214398e0b5c |     
      x86_64 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/4016cd4d490d4dd068e2bdfc25fc1c8e1229c6ce |     
      mipsel |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/32cddae24e0b2e9eea56598c54e9226ad464b8c9 |     
        m68k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/91406b42f72e9159581cb07db1c3dc1e51de9a20 |     
        i686 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/ac3365e40236a3e427e331f679ab6f5baa7da79f |     
     nds32le |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/7e420eb75c6c9c0cc53f47040decd5b7a457b4ef |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/a5553cf41b0c71a3609aafe151788939c3b3a52d |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/8a86f3a268abef2e18863f6f96b87c336528214e |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/971417ccfd1fee40be7a9b6425aeebfdf1f43bf7 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/ea45fefb475b82372fb3e340a3396f361cc80b70 |     
         arm |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/a78c145fc8e41653bd8ce893297b6d70f8976f6d | ORPH
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/2254362a48c7047f83bd68a0a3de3011b29e8438 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/9311a716e807fa5c056de473fd7e00aaf669ccd1 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/e8d1a18316e7437f785bd87d4695ca1bb8eeb3ea |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/024ec534897667d1baa32b3de32990297ea7aaee |     
    mips64el | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/00d5ac386b3a60c05764e387f6ab671db495a5a6 |     
         arm | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/8ee6e8602eb0dd254d0fab918b504813566b18ab |     
    mips64el | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/bbda2295cc02e8bdbd13ea4595fed5314965dacb |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/4d1110d5ad601ddea190bb502bda850e709c5326 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/fd5fd05d324c3c1342f39c87a4de713bafd94a5d |     
     nds32le |                        unknown | NOK | http://autobuild.buildroot.net/results/b1338771c789569c31ad5c6b3f5d029f7a40133a |     
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/6651e115aeec60dd0941e1a12bf2a6432338d1ec |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/18c08037adcbbb74a7ba22b9269180a57f45db30 |     
 powerpc64le |          xfont_encodings-1.0.5 | NOK | http://autobuild.buildroot.net/results/be51303e8002b181d0c7b3d7cf7126ee79abb585 |     
         arm |          xfont_encodings-1.0.5 | NOK | http://autobuild.buildroot.net/results/6aec9204b290e141218f97c3d3b8bd24c6966bfe |     
  aarch64_be |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/4c186434d0a2ede8c1cb3032c5df97f0ce6f2ded |     
     aarch64 |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/362a0818fcf24a00f77b39739c7fceb6293e66f7 |     
         arm |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/6b2f940b710f7d1833e34bdd0362e75f539df874 |     
microblazeel |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/b2b11ede6042a4c03438f1a9b83aacfd4046bbbe |     
         arm |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/d17beef3a3fdec0284e167ac603c262ecbb065d6 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 2 


Detail of failures
------------------

      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/b452726b4e884c58fa302bf7b3ffb5b82202ec07 |     
         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/7efcd56cd2b91c15b7427f9159d91f099af6a114 |     


-- 
http://autobuild.buildroot.net
