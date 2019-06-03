From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 03 Jun 2019 06:00:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-02
Message-ID: <20190603060112.318F821541@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   1 |   0 |  21 |
      master | 202 |  12 |   3 | 217 |
        next |  48 |  14 |   2 |  64 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

    host-mender-artifact-3.0.0 | 3 
                   netsurf-3.8 | 2 
                    dhcp-4.4.1 | 1 
             iputils-s20190515 | 1 
                       netsurf | 1 
                openzwave-v1.6 | 1 
                          opus | 1 
                poppler-0.77.0 | 1 
          qt5multimedia-5.12.2 | 1 
                suricata-4.1.3 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
                     vlc-3.0.6 | 1 
          wpebackend-fdo-1.2.0 | 1 


Detail of failures
------------------

       sparc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/832c07e2494ebec486a1d268cb62f131eb5d9662 | ORPH
      mipsel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/493713f730b412c011106010b965c8ef1206ffec |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ba6d2679e6831a243cb74231ade2622d8d3e9916 |     
 powerpc64le |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/6b860c7e60a531b9a28524248eef0298b439ec81 |     
      xtensa |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/6c411652d5413c1153254bf8cf142c240e0fef9c |     
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/a1143aa5654e6f658f1b65e0f72bb46341ae85f9 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d69a949faa11367f0bf74734389b7fb92773e115 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b0fdd7607c5332fdeb3a48ae8b3999479c6f9996 |     
         arm |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/f6c8c4072b2cd5b6e9aa548f41ab000e152f1add |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/ac9bc11270c287c7ffab3e3f10fe033cb3437c6d |     
     riscv32 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/f9e24d38d3aa4519615c5a0ae7f62af610df976f |     
     aarch64 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/4002eaeccb6e955037d1d9aa21794d063a7f031d |     
     powerpc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/3c60ef6283a4c63bcec7c0d2c5a6af5288cb31eb |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/25ead25daba6762f5576965b1ce048d4a813ec3a |     
         arc |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/37d0a5ba57de4c52b6e0ec99aedaca71f3397fbb |     
     aarch64 |           wpebackend-fdo-1.2.0 | NOK | http://autobuild.buildroot.net/results/0ce0efea36af0bcf6d76dfa3907f48821ef7cb6c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

  vdr-plugin-vnsiserver-v1.8.0 | 3 
                qt5base-5.12.2 | 2 
                         slirp | 2 
               wireshark-3.0.2 | 2 
                host-libsodium | 1 
    host-mender-artifact-3.0.0 | 1 
                 mesa3d-19.0.3 | 1 
             qt5wayland-5.12.2 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

 powerpc64le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/6619737e6e7f592106adf34b896be3e6987d6d68 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/dd1a6dac03dd3b68ee63761c33dbb01c328d4f14 |     
         sh4 |                  mesa3d-19.0.3 | NOK | http://autobuild.buildroot.net/results/9079001d1d088181b4a4ca7988831e65a95dd922 |     
     aarch64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/710a9a5e1aef50fe589bb32a2b9d5699e8ba6009 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/b87442eb8e34b90e9514fb10aead6da83a397387 |     
     sparc64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/902322ca156c14044d4ce53ab2c77f30dd854c98 |     
         arc |                          slirp | TIM | http://autobuild.buildroot.net/results/f05cf62c8f024455ad9a0361a7c0f844c0b5d103 |     
        m68k |                          slirp | TIM | http://autobuild.buildroot.net/results/b48bc0bbe6fbf1f5c833eb66b90f05f5139bb10d |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/3f6e51d6681c72c8ac9bc6a6bc200debca4cd664 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/adf33810bf799f7d8cc0bf12bdf75b98997e7f29 |     
     riscv32 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/d13bc78af8b9e64d6e85065c7cea4c27e0f6b0ed |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/c8c7120b434bc0fcdf265a407b0db0ab4de4a6f3 |     
 powerpc64le |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/94d0001dde4c7665449c58224be7a69810b103e1 |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/3f66d4b9ee20ff6727e0cd219f769cb4858b552f | ORPH
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/0f065f43e7d06172ae902d2018598c1678237e6c | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/793c741e7fcfee09f5bfaf1b4e759b03cd0e4f9e | ORPH


-- 
http://autobuild.buildroot.net
