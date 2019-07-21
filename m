From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Jul 2019 06:00:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-20
Message-ID: <20190721060040.4E27586230@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  19 |   2 |   0 |  21 |
   2019.05.x |  14 |   0 |   0 |  14 |
      master | 125 |  48 |   0 | 173 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           can-utils-2018.02.0 | 7 
             gstreamer1-1.16.0 | 5 
          qt5multimedia-5.12.4 | 4 
socketcand-df7fb4ff8a4439d7... | 4 
                       unknown | 4 
                harfbuzz-2.5.2 | 2 
               libgtk2-2.24.32 | 2 
                   netsurf-3.9 | 2 
                qt5base-5.12.4 | 2 
                suricata-4.1.3 | 2 
              domoticz-4.10717 | 1 
                    efl-1.22.2 | 1 
                  flashrom-1.1 | 1 
              ghostscript-9.27 | 1 
        glib-networking-2.61.1 | 1 
               host-efl-1.22.2 | 1 
           host-nodejs-10.15.3 | 1 
               libupnpp-0.17.1 | 1 
                 libv4l-1.16.5 | 1 
                    proj-5.0.1 | 1 
                    qemu-3.1.0 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                   vlc-3.0.7.1 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/f20952c777fe5e8fb167edc91884e68a7f85eb55 |     
      xtensa |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/b99d05258ef87533b7666ba654c8d9301c2fff21 |     
      xtensa |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/b2c558faa51f6e16158bae62c6eb057be2fb8920 |     
microblazeel |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/013e4dcea3801fb50b754bb3849c422d25fbe2b7 |     
         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/ca10925feb0c7d819438e412aaf4a4be2ff21c28 |     
     powerpc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/3bfbdd7260c13c699a270e4fc3f7e8afe6204840 |     
      xtensa |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/2a97c2f3674e9e87801831d35e4374b05ace9cb9 |     
         arc |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/5af63c1a2fb7c8ef4f35f5f8b1461882a9be3a84 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/b1bb7fbcc2a3a712b7720fbbe742dbceb2d167c9 |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/578152de211ed21c6adeedf29ff31587416b0974 |     
microblazeel |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/f5abc10b066b8b7a8991f602092f0be2f7f059de |     
     powerpc |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/ef9847d091edd893b2bdaefe5ba01827fc07177f |     
         arc |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/1d120892925646e6bf42ae6f5fb5923a9c5638ae |     
         arc |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/f13c6c050c28736da2c0043b882ab2a08e2ca6c9 |     
microblazeel |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/7086cef09651153c20da701091e22036f48baba0 |     
         sh4 |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/eafa231ae38d8fde2e1bdebf723dc62108195a4b |     
         sh4 |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/85fb5fa0c93ddef2f116cc616a96c771cf576d72 |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/6938d6debc8f12953fcb06ebe9d01e99995b31b6 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/35533e48b1b607a21283311e8ef80fefc11e9e2d | ORPH
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/3f9edb667bab5de67907c7dfcb1a3730d7d4e641 |     
         arm |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/d4e0fa3c4f4541459415302f448218b5896117e5 |     
         sh4 |                libgtk2-2.24.32 | NOK | http://autobuild.buildroot.net/results/4519a41223f62e3f0286be88b542e74aeea7fbb9 |     
         arc |                libgtk2-2.24.32 | NOK | http://autobuild.buildroot.net/results/9ff3b53afdd3b0fea9d1696094bd065043ad8a18 |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/15c80f8ff7eddf787e0b0a0c31d7e742f5bc7f9c |     
     sparc64 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/79c1e1b7a1bc53c1e9b2ae0c9acb443e6d2e2994 |     
 powerpc64le |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/a54b8449e4bdb86f19bb6d68e64af219b22a7d25 |     
         arm |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/2c3be4dffd6156acbf5484ae2359005b97f71c32 |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/c643081a2018c012fc5dfcfd8cc0d128b3ffe8e0 |     
         arm |                     qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/6c6cf307d7db7d3887d6e57f23c8fbcde93eb4ac | ORPH
  aarch64_be |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/6d6b002427f27f23e0d3c4b0830c60321737b176 |     
      x86_64 |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/509cebef27d30f45d35af43b1b24e7e8632aa29c |     
        i686 |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/c7518a32496c6c166bf98a4b853488ee21fb98aa |     
      x86_64 |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/893bff634ffdbf1a2b573f94fda5ff7344a1a4be |     
microblazeel |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/438da8014e630048dcea1e57add7d098110461c5 |     
     aarch64 |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/ece81523f6e1ee6808f814c550a12678c4838b1a |     
         arc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/e8c67bc1f3028b9adc1b3c0aba6ef556fee62414 |     
     powerpc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/3ca9ff1f84810b111e3c486027f9433d9c80676d |     
         arc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/d9a68fed1627cc953cda0a751a69390f12aa2b3b |     
         arm | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/c31fb8d69f7eef904f5bffc0e8ed581a0f2acd9f |     
     powerpc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/b902afafd39a333e563310b1a8909062d1633f26 |     
      xtensa |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/2a1c5ed7babad1918652f6cbd611435580bc02f8 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/9d5482172cbcf245fcdbb14d99ced8f3c9237b00 |     
     nds32le |                        unknown | NOK | http://autobuild.buildroot.net/results/afe4c1d0b757a041eae5643d699a2712b252f1a6 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/cf795e9689a821f69ad86d6fb7ec0fa75309328f |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/0a29cfe7581d310716189785ac20a706f34cbbac |     
       nios2 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/79beb528ae64881eac5860176c66c0d88abe16f7 |     
     aarch64 |                    vlc-3.0.7.1 | NOK | http://autobuild.buildroot.net/results/2ba37196913d176a9e1c373fbf4f5da8b3146a1a |     
      x86_64 |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/777a12c35227d548b0615b97f253fd5d1000e59c | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/5fc9e37545d54560428d928e2a1d929e901541dc |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/0f38021369d0ef4774f5c60e83817b7b646bd79a |     


-- 
http://autobuild.buildroot.net
