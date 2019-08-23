From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Aug 2019 06:17:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-22
Message-ID: <20190823061748.2FEB687C22@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-22
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 22  |  1  |  0  | 23  |
  2019.05.x  | 17  |  0  |  0  | 17  |
    master   | 199 | 34  |  1  | 234 |
     next    | 13  |  7  |  0  | 20  |

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a64a1cf4d44421c6c5f1eb6a1c2e7eb45917aef0 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 5 
               wireshark-3.0.2 | 4 
                  flashrom-1.1 | 2 
                host-go-1.12.9 | 2 
                   mimic-1.1.0 | 2 
                    mpv-0.29.1 | 2 
                suricata-4.1.3 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                  cmocka-1.1.5 | 1 
                    ffmpeg-4.2 | 1 
           host-harfbuzz-2.5.3 | 1 
                 host-icu-64-2 | 1 
           host-nodejs-10.15.3 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
                 libdrm-2.4.99 | 1 
                  libssh-0.9.0 | 1 
                       lmbench | 1 
                openblas-0.3.6 | 1 
   openvmtools-10.3.5-10430147 | 1 
           python-numpy-1.16.4 | 1 
          qt5multimedia-5.12.4 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/af554a72482e7c4c4f86c0ef054424742d5bdc50 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/3ebda1c746c7f056948db18d1b7ba7ff4a94c78a |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/e9e952fdfdee6a1ed15f05d979ae32e9f2aba03c |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/db1d00efdee1017fa40ab200f85a740a611146ed |     
  aarch64    |         host-go-1.12.9         | NOK | http://autobuild.buildroot.net/results/a171525232030f734edc08e96aa2e3c86e5c92ba |     
   x86_64    |         host-go-1.12.9         | NOK | http://autobuild.buildroot.net/results/a9be71382925cb1945cccda58095f62a17ddb1ee |     
   xtensa    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/701731a98858a9d48cd48b04db246dc95e641c64 | ORPH
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/26b926db2412a672c6413a71ed9221edd3f3ba79 | ORPH
    arm      |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/8838b8b0c5d0ac2e9c073dc05f8f5481d14dfe88 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/edb0f89398425390be0b900932292041e6f5955a |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/e1a57cb63205d303e3b400da8e290692f86c8268 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ddf4b8f3aeae0e9430eb9ce5a9b10f4e7b12561c | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/8ea8ca281edf6231cc9e1bb3998cde39f9da99d8 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/96899f42d3d89d9dcb799778204b1efe24c5e2d1 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/c72271d44f8dddb6a113cee60440311950647034 | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/126a92f7d9445141265c5228f21d1e848660e4c1 |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/0afb9e3f2b85a6e2e4b87284b4a661defcd7558b |     
  riscv32    |            lmbench             | TIM | http://autobuild.buildroot.net/results/c2bcbdb2298a0ffeee9f974c4af2d6fe24ec6837 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c40bd5a094041f95ae9d23cea53c49e96f884857 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e5400303069628bb91df30d8b3628aaf6053066a |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/bb05a2e0570bcac6643af391508f880f980f13c8 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/716622d4c609e884e1333391ea3425798c0eb6b8 |     
    arm      |         openblas-0.3.6         | NOK | http://autobuild.buildroot.net/results/cece95187d08f916514951a2863da7ed9fd22e92 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/71fc520992094393490da85272caa1f17bee60fb |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/611db66fcd8c8e977f9d9b26ff10811856370b98 |     
  aarch64    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/69c539ea9644466d76217c82087a88a98468204c |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/c45ddb0487217b09cae9765c053a59c0eeda03b0 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/b18fcddb804b48b70b32fd49cd9e34a25d18d218 |     
  riscv32    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/c569dbbfcbbc02e88db895325c1f98a78a0a50d2 |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/d91c8e862364fc3bc70aba60bc2c770e8384dda2 |     
    arm      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/60339b1fafe11e1f4e99d6ea931cdc9a741dec57 | ORPH
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/51c527c9e92604439e60eeddf537046ebb00cce7 | ORPH
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/1b5aaa800206492097a8fd108822edcd216e1a13 | ORPH
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/4f77aa70dda820d1a5b7aee1273ac3b889f91e0b | ORPH
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/59b9b4c54789968be8b2b460f5f55f6a31b21f5b |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.6 | 2 
                collectd-5.9.0 | 1 
          host-capnproto-0.7.0 | 1 
               libupnpp-0.17.1 | 1 
                    mpv-0.29.1 | 1 
          util-linux-libs-2.34 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/bbb96a2ca629b1df3acbec651351541a0147026d | ORPH
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/f6abd48f7bfa3e4882fe7bc18ad089e8d4a46496 |     
    arm      |        libglib2-2.60.6         | NOK | http://autobuild.buildroot.net/results/d5756b08210b47f0d65981072cd235744b85478d |     
   nios2     |        libglib2-2.60.6         | NOK | http://autobuild.buildroot.net/results/ebe16435d2613c4ada807c6a438ecceadc84b67d |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/9e7834b6fed980f611c64b9234bf67eda673cac5 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c2fc19d97bf5c6f2808faeccaef9c096c381e642 |     
    arc      |      util-linux-libs-2.34      | NOK | http://autobuild.buildroot.net/results/66e2db01dfd34c280411cd672a96478bb8ef7f81 |     



-- 
http://autobuild.buildroot.net
