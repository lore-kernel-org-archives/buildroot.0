From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 08:00:42 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-16
Message-ID: <20180117070042.34FD420902@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-16
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 225 |  33 |   7 | 265 |
   2017.11.x |  18 |   3 |   0 |  21 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 5 
               domoticz-3.8153 | 5 
             bluez5_utils-5.48 | 3 
              host-erlang-20.0 | 3 
             libostree-2017.15 | 3 
           cups-filters-1.17.9 | 2 
         libcpprestsdk-v2.10.1 | 2 
                  physfs-3.0.1 | 2 
                     daq-2.0.6 | 1 
                  ffmpeg-3.4.1 | 1 
                   gconf-3.2.6 | 1 
                     gpsd-3.16 | 1 
    host-xfont_encodings-1.0.4 | 1 
                 libpqxx-6.0.0 | 1 
make[1]: *** Deleting file ... | 1 
make[2]: *** [CMakeFiles/su... | 1 
make[2]: *** [libs] Terminated | 1 
make[6]: *** [profile-do--b... | 1 
                 mesa3d-17.3.2 | 1 
                 midori-0.5.11 | 1 
           python-iniparse-0.4 | 1 
              swupdate-2017.11 | 1 
                       unknown | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/76929e879df05e382893235d9572de3581d74d8f |     
        m68k |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/62f0a01abe21179a0d368335ad067bc09eb512c5 |     
      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/e1463366e49f5a9d25e2b8a0f3450c7c84c3a88b |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4e95d91a7b3fcfe286ea6ee461faa2de90ee76fd |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/eaf956748d9dd001e9a4808f59c8b12e4696bd0f |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/cec4ab83270c61f9d2b3f52cc257b892f213b82e |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9824ebf00f4cac8cf8e1b24686788ba9343de1d8 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/c72bb055dc41abdb76d8a1257e1b9e42808c3e93 |     
    mips64el |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/ee7c8cfdcd583677c2a94fa73e8ea7d6fdd19d0a |     
        or1k |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/cb282e9f33a44f7494a2f94b06ff28d1c6444536 |     
      x86_64 |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/0fc2bcf9da758f427adf2fddca8ad1dace6a080e |     
       nios2 |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/332f677493bf1d802f3700777219843eeba53c81 |     
    mips64el |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/206e722cb7be3f02880db4dc70faafecdb55baa0 |     
        or1k |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/9df041b42543a441f616099cb27fc02ca80b4e85 |     
    mips64el |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/38d1225b1d37648963b5e94389c1f26d876f2abe |     
        mips |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/68e2d2b87df14e757716a6927157dac5c23c53ac |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/78c2def76f1bb923a124e928ebbbea8faadd668e |     
      x86_64 |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/9179b77398f905a452048e32fa396d3574dcac6b |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/7da1c37612af9038e183dff3741b5a1f760f691e | ORPH
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/eab1df062ff1fc7c3815c7c91a4fba65ed6156e7 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/c5b3c3ff5a12615949de344b332ac5f93803b299 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/252f757d911555f8092cf290617a416d63320a8f |     
     aarch64 |     host-xfont_encodings-1.0.4 | TIM | http://autobuild.buildroot.net/results/efad4d31386622286a638dc9a467f75459f7ca73 |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/65fbd26d3ce16b248fda17cab8c41dddc3d86205 |     
        m68k |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/81ba687ba77bbe803e4412d2070e666965c6cce8 |     
 powerpc64le |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/850c5d6e94c292671d75bde740e97df7550b874f |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/b932fa5ab19065b8a2d698ad60d1fed1a5bbd2f2 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/43abf597f13237447a55a5f8326a4abdaa8184c3 |     
         arm |                  libpqxx-6.0.0 | NOK | http://autobuild.buildroot.net/results/e1d6f62edfc5eae90953f0a93fdb30d713409c37 |     
    mips64el | make[1]: *** Deleting file ... | TIM | http://autobuild.buildroot.net/results/49022c55ebbb25f2dac7597bb2ce91f45707c331 |     
      mipsel | make[2]: *** [CMakeFiles/su... | TIM | http://autobuild.buildroot.net/results/efb28c2f00bd3786a768ab7aad54a4fb9c23a746 |     
    mips64el | make[2]: *** [libs] Terminated | TIM | http://autobuild.buildroot.net/results/666ab9c3dcfe8131fb8fcdd87c6dfdfbb8b81b72 |     
     powerpc | make[6]: *** [profile-do--b... | TIM | http://autobuild.buildroot.net/results/1464abc1d3155ec0eaf6a620ed21ab57980528e9 |     
     powerpc |                  mesa3d-17.3.2 | NOK | http://autobuild.buildroot.net/results/a1e9764920cb367602044c6a38cb8e37e8bcc25b |     
      mipsel |                  midori-0.5.11 | NOK | http://autobuild.buildroot.net/results/9d8b40778a808c578135aab3e95e4b90effdef30 | ORPH
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/695808ff1b78be4865d6e91a43ae4ecafcde13d5 |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/d2f195a3272af34b3e144a56adcaca4293d4f1f0 |     
 powerpc64le |            python-iniparse-0.4 | TIM | http://autobuild.buildroot.net/results/b8aa23ae0251c1040a7d64f3188b2ea5c8f53833 |     
        i586 |               swupdate-2017.11 | NOK | http://autobuild.buildroot.net/results/f674219225d0b67d0bc78fd10b47a865250746f4 |     
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/70b181fa5115dd3de744fff975a24bd55e888c6d |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.88 | 1 
           python-numpy-1.13.3 | 1 
            python-pyqt-4.11.3 | 1 


Detail of failures
------------------

       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/0a6b832fc2550b9e0e17731aafa8c1fcacc3655c |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/ffb52bccc71a668bbbca8c39ee26c90b3ad25e33 |     
       nios2 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/4757f76e56240302cbccf2d460493d13eefb0e56 |     


-- 
http://autobuild.buildroot.net
