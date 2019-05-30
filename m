From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 May 2019 06:00:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-29
Message-ID: <20190530060042.D84E18758B@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   0 |   0 |  20 |
      master | 155 |  16 |   0 | 171 |
        next |  43 |  17 |   0 |  60 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                      ell-0.20 | 4 
                      iwd-0.13 | 3 
                cracklib-2.9.7 | 2 
                    dhcp-4.4.1 | 2 
              domoticz-4.10717 | 2 
             iputils-s20190515 | 1 
          qt5multimedia-5.12.2 | 1 
             qt5wayland-5.12.2 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

        m68k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/07243239de6001721fdf61ce8aabcea1baea9159 |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/3f507250825e64ff01d6bee198c5834ac523e321 |     
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a8c778b597341d6f6a46c845ae972b5bb4ff4e38 | ORPH
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/788ed47b1e81b8ce6cddb8cfc6cf7c7b4a3180e1 | ORPH
     aarch64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/02106ceaf03c794ba8e4e479bafdf0135d9a61ec |     
 powerpc64le |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/e5dcb9e4638f9058b24e087856a61d00505ba25b |     
         arm |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/d9fd5492ce9dda3a517d364a7ecd047ded8c14ce |     
         arm |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/fbc3f6022d588a021a69bc2a7d51f17811190ef6 |     
      xtensa |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/93f2262786b1f75d290312e961ed2524d1849b2e |     
        or1k |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/2e203628ef874ea91a503f7a8109cbdd1953aa53 |     
      xtensa |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/a55c2a1efbc4c3a6b98a9cc711373c1a06bbd672 |     
     aarch64 |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/36ce0a0cd20e890f0d9faa375cf131159153030e |     
         arm |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/0ffb869d69aa37c1a3b8b71c46bd84e722e89750 |     
     sparc64 |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/56de7281c7b52fbc2d536442284ffc29143dc490 |     
     aarch64 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/8b20ec816d545e343d2b4acf00c775c14d59529e |     
        mips |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/ab40513ca85e1a4299bfb4ebf5b41a44a8710b04 |     
      x86_64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/fc12b2265dd10565267dfa96a046ae67158fe764 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 5 
                qt5base-5.12.2 | 2 
                   mimic-1.1.0 | 1 
                 openmpi-4.0.0 | 1 
                 python3-3.7.3 | 1 
              qt5enginio-1.6.3 | 1 
             qt5wayland-5.12.2 | 1 
              spandsp-20180108 | 1 
                    tekui-1.12 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/721ea59c9cab617099bc546f2cd4f52d81b6ed22 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/fc1f3dd001a71469d27699f5acfa19f861ebbebf |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/39516aa2f21c991ebebb4b94d040e4604c25bd25 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/363d8f80fffcbdebbe3683e6690549c1a33b8374 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0fa746c62fc8846cc7799ba4118266054811683e |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/696314aa2262bd5b178a4fdbc59ffc981d992511 |     
microblazeel |                  openmpi-4.0.0 | NOK | http://autobuild.buildroot.net/results/8f334427e7475154d69469f8ee4efab6df80e403 | ORPH
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/ae4b08cd1d544329ab1718e81361cd7d75314f99 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/759eecc48d131ac9f04a57d69fb1cd54c60e697f |     
     aarch64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/51cdbdf8b0e77579472be95f65816d43a92845df |     
         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/12c96ec6eb31561bd7fb59ddf0c831252909d92f |     
   powerpc64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/e15440ad86433e8b140fa62c40845454a1b9d295 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/9acf6aa4c75425730905838753b0558175660da7 |     
     sparc64 |                     tekui-1.12 | NOK | http://autobuild.buildroot.net/results/7cba3df35ef53422830e1940bd110f8f2d4f04b1 |     
  aarch64_be |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/55147a51936628e474ed8377927d4ace29574b70 |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/ebdaae6574419beda6e5ef83f591d21b90ff4b2a | ORPH


-- 
http://autobuild.buildroot.net
