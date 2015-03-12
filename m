From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Mar 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-11
Message-ID: <20150312073020.61316101783@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-11
===============================

        success : 226
       failures : 47 
       timeouts : 4  
          TOTAL : 277

Classification of failures by reason
====================================

                  avahi-0.6.31 | 8 
                collectd-5.4.2 | 4 
         lua-periphery-1.0.4-1 | 3 
                  uclibc-1.0.0 | 3 
               qt5webkit-5.4.1 | 2 
                  snmppp-3.3.4 | 2 
                   sudo-1.8.12 | 2 
             host-thrift-0.9.2 | 2 
   libnetfilter_cthelper-1.0.0 | 2 
                host-gdb-7.7.1 | 2 
           heirloom-mailx-12.5 | 2 
    libcec-libcec-2.2.0-repack | 2 
                 apache-2.4.12 | 1 
              host-perl-5.20.2 | 1 
                      qt-4.8.6 | 1 
softether-16b713b98da8dba29... | 1 
                   systemd-219 | 1 
                    qemu-2.1.2 | 1 
                 qt5base-5.4.1 | 1 
          host-gcc-final-4.8.4 | 1 
                    mpd-0.19.9 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                xapp_xfs-1.1.4 | 1 
                 libepoxy-v1.2 | 1 
              xmlstarlet-1.5.0 | 1 
                     vlc-2.1.6 | 1 
             host-libftdi-0.19 | 1 
                  python-2.7.9 | 1 
               host-qemu-2.1.2 | 1 

Detail of failures
===================

       nios2 |                  apache-2.4.12 | NOK | http://autobuild.buildroot.net/results/5d21ac2d8f008d984d6f8b359ebb0e2482545683/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/7e1025ac7080a499318e425727fb337afcde70c5/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/668998a4cfaadefab8e656d9bfddccb6512bf957/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/f1bef0997457c9e552e41a01f10d55fa86b6b450/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/934857fd5897966b6d883526c29012592d7128d4/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d21b1d52fbb5d8518c40d88faf08626a98dd468b/
microblazeel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/103e5a62d16ed22414cc407eff8a78d5e8d7503c/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/f773883376570bb4547a1478c9d665b281bf592f/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/3f0de04fc8f41afa76b30e3bfea16d4d20fcaecd/
      x86_64 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/5ef8c977be885ff3bea54439f50d35c78fed3dec/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/b20fc13c9b8e765705512dc8cde0758881251c02/
microblazeel |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/d7751e16eefdf9af3039ffc9ca2e86bf060ab45b/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/a418808ba88baf10c496efe89f88338a1a1437d5/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/a4cea0a3b9ec5fa3b94e59ff8e4e5595e4ba0f20/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/b0a110e4f154e2afbd3b2500276c4da11a1e9e32/
      xtensa |           host-gcc-final-4.8.4 | NOK | http://autobuild.buildroot.net/results/fd2054cc4ca78fbe9951b5bafd1ec5ffa6771837/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/effa6d571d38898fe8ad92fede0ebff40cf790dd/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/c9b9fad1a5e328cf26167ec6eafbb67fe91d209e/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/d910b54c942ef684728119b01fe4e2dfc81e2942/
         arm |              host-libftdi-0.19 | TIM | http://autobuild.buildroot.net/results/a4b9b08e97c1be8cb8c6697506786e45ddd78fc2/
         arm |               host-perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/31aadb5d2b9ccb59d723216b04b4889462310de0/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/8c99b864de80539f6eef673cb6214a29b3afd27a/
         sh4 |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/f1f14f9094fca2359491c1e3f1a19f0a38910316/
      mipsel |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/56eb9706cbf84d3adda8bb7b6968cabe365a26cf/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/26b3cf0be0593a066dc9d657f04ba0c7db63385d/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/c011790dc66c531fcb96925319e810355cd25db8/
     powerpc |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/596f44a26aad45c027f0f4f97d63e97a1f4fd001/
      mipsel |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/f42c809daead97fba47d8812880ebe6503b56cfe/
      mipsel |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/e562c5a96eee0cb9fb193e4746be9306032f88b4/
         arm |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/ce265d2ded13e13dcbc10c9f0f32e8860625df73/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/b5ac4c8f2d29a75b236f4f2f0946edc924ec7b09/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/3f62521973d01c7762bb5fcdbe36e58898bd0f27/
     powerpc |                     mpd-0.19.9 | TIM | http://autobuild.buildroot.net/results/10bb970dcbf6a811a9dd618bbde949f570520a26/
        i686 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/99919f18caa3526bf43f066bd157da8da0932607/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/41c7069b75e89891ffde260428a1b3ff9393d987/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/29dafe437c7b1e3f6181170532a526a1f61d3c8e/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/a6d5362428b1c5d7227192c5ebb4ea0c69ae003f/
         arm |                qt5webkit-5.4.1 | TIM | http://autobuild.buildroot.net/results/fd164fcdaa3f0af009cea2000f715f1231524a4f/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/3c2d2bbb1fdccc6e9007a6eec699ed46519e0ee0/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/8664e4412089558e98a45f267dd26a51da73576c/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/daeb8f60a32761ee53e97b04bd51863b67bd5224/
     powerpc | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/f473882cd35445cbe5b3b15635d555340183951a/
     powerpc |                    sudo-1.8.12 | NOK | http://autobuild.buildroot.net/results/9e2b01b01ccb347cd18cb4b80e90d750ae3822ef/
         arm |                    sudo-1.8.12 | NOK | http://autobuild.buildroot.net/results/2805f69430c51af64f5a37ff7254bb0cd38f038d/
        i686 |                    systemd-219 | NOK | http://autobuild.buildroot.net/results/259aa23e25cce78a340ce328af7f7e501d2ce875/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/1d2aa1d815867cb55926c26cb3340dc15fcd37b3/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/392ec1b9f439205c4a6df30b1f63eff66cfc6778/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/caebf9fedbd04f481f68398f9e87c76a6539c526/
        mips |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/e1d276c8db2f08f3e6e6e2559ff0a58d28cb5797/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/15bf306ed984080bfbc0a80efa4617d884c63f86/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/26174edf6097ca95975b752b90854e82c631bdbe/


-- 
http://autobuild.buildroot.net
