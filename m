From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 06:00:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-13
Message-ID: <20190514060040.8F90986849@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   2 |   0 |  23 |
      master | 219 |  22 |   2 | 243 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

  vdr-plugin-vnsiserver-v1.8.0 | 3 
                      gzip-1.9 | 2 
             openjdk-jdk-12+33 | 2 
                qt5base-5.12.2 | 2 
                     gdb-8.1.1 | 1 
      intel-mediadriver-18.4.0 | 1 
    libtorrent-rasterbar-1.2.1 | 1 
                  linuxptp-2.0 | 1 
                   mimic-1.1.0 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
               opencv-2.4.13.7 | 1 
                    postgresql | 1 
              qt5enginio-1.6.3 | 1 
          qt5multimedia-5.12.2 | 1 
              spandsp-20180108 | 1 
                   whois-5.4.0 | 1 
               wireshark-3.0.1 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/bb1ec0bac624504b022d8dd038c35610fe655662 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/79f9d92a40f44afa653bdf04026f5d40a1b1caac | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/c4c0612ae2912892b0b19887c4b84d2cd15d605e | ORPH
      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/659c1dfe3d40e6a5e25ba2e05fe32974c2060e39 |     
        m68k |     libtorrent-rasterbar-1.2.1 | NOK | http://autobuild.buildroot.net/results/746f60fadb40288341c1e5642cfcf6373b70583a |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/3cbc8c090fed00448ab2604cc4209329ea1f79ab |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/8a51dfc5028da62a48b4b3644c7207914f888347 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/2cf8ef4935166fa874042d5214110fb8c18b2fd7 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0129ed9c20ce5a44e612075bb4a01ef517aa5343 |     
microblazeel |                opencv-2.4.13.7 | NOK | http://autobuild.buildroot.net/results/17fff0f312ebd520ba3341976ba56fd8c85ee376 |     
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/53f1c27abe5daccab448dccab69f370865c4014d |     
     aarch64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/3c2455dbc285a418f332adb583e923bb90a0d8b6 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/e3516e654610bbdd579bb31211c3f56e7d0c3953 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/a836e2949f40726a85b1f611cc8883d4ecce312b |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/16dc54f5575fa4c8f3c69c57de8e4bf8f4f31925 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/894fcf9b9ca20fa4e5b54f99da6a56ff221cb11c |     
     aarch64 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/0db7c162683c328fcb6562c3a6aaf2cd172620ec |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/38cc08b3e040a515f28200321d222a98fbcae190 |     
      mipsel |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/d259ab1a79b809c5970c3cd5501c5d21a120b903 |     
     riscv64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/abae02f4b8811b9cc4cc747216078d5fa8cdd219 |     
     sparc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/14ed5edee636ccdbda2b4b3a61cd3de76a62d998 |     
         arm |                    whois-5.4.0 | NOK | http://autobuild.buildroot.net/results/b2972a346471b38eb1d8ddfdaf29f8f4f0bf3190 |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/6a2b90cd74dabacf11f69e7e994de4ee22bfe4b9 | ORPH
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/04bfad470b353aea08fa4d4068894ef8faf0d009 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               openldap-2.4.46 | 1 
           qt5serialbus-5.11.3 | 1 


Detail of failures
------------------

      x86_64 |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/81b6345f4524fe9f709b497e897226834224e053 |     
microblazeel |            qt5serialbus-5.11.3 | NOK | http://autobuild.buildroot.net/results/3482bd950c7ab5608666807a7ab7ea857c767333 |     


-- 
http://autobuild.buildroot.net
