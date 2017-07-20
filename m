From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 08:31:37 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-19
Message-ID: <20170720063137.E704121EA5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-19
================================

      successes : 211
       failures : 32 
       timeouts : 0  
          TOTAL : 243

Classification of failures by reason
====================================

                   attr-2.4.47 | 3 
               acpica-20170531 | 2 
                  cc-tool-0.26 | 2 
                 efibootmgr-14 | 2 
     python-cryptography-1.7.2 | 2 
                    4th-3.62.4 | 1 
                acpitool-0.5.1 | 1 
                  aespipe-2.4d | 1 
              alsa-lib-1.1.4.1 | 1 
                busybox-1.26.2 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.2.3 | 1 
                  dnsmasq-2.76 | 1 
                     gpsd-3.16 | 1 
                   libnl-3.3.0 | 1 
         libspatialindex-1.8.5 | 1 
                 libtasn1-4.12 | 1 
                 libv4l-1.12.5 | 1 
          mediastreamer-2.14.0 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.25.0 | 1 
                  nginx-1.12.1 | 1 
                    norm-1.5r6 | 1 
           python-pynacl-1.0.1 | 1 
                      qt-4.8.7 | 1 
                      x265-2.4 | 1 


Detail of failures
===================

    mips64el |                     4th-3.62.4 | NOK | http://autobuild.buildroot.net/results/e51fd77811fb192cc627f580c303535ab9cca5c5 |     
    mips64el |                acpica-20170531 | NOK | http://autobuild.buildroot.net/results/71924083956589bd0d877aacfdad1ff4384df054 |     
    mips64el |                acpica-20170531 | NOK | http://autobuild.buildroot.net/results/6f12bf96a479ef4f65317585ff7518f5adedf62c |     
    mips64el |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/d2f273515d046aee1908d1973297f58bfdc2b898 |     
    mips64el |                   aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/d2e23885e783e329e974d2daa232abf1d81e08a8 | ORPH
    mips64el |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/f72a2242131d2120830f35d062d8e216d719fa80 |     
    mips64el |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/c21bf1ef2ea5a5526b0d0c4a17479a891f2dc108 |     
    mips64el |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/25c744d76ed466d2d6c965b6adb151561a5bd1bd |     
    mips64el |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/dffa08099c50eba77764686f13094e330eec3163 |     
     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/c728bf3b76a8bf15230f78931600954806fc230c | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e8a10df358d054d4805da96542b572261fb4ca51 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c2bc120b96d5e362886de21f8aceed00f6a5a151 |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/d9f1b5cb5d47476a374df3f1db94c8e582353d58 | ORPH
         arc |                     cups-2.2.3 | NOK | http://autobuild.buildroot.net/results/19eb9b67bfd94d3430b8ad332e40ecc7ca2c4036 | ORPH
      mipsel |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/762f5415ffea1be06dd80ea41cecb57ad9d8e9be | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/dcfc0da02828e5792cbf024c79ec4955e0139ac1 |     
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/6347fc357d8871164ffc363c295fd93177184667 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/c286b6e1567ef685cc0db043325230ad648d71b3 |     
    mips64el |                    libnl-3.3.0 | NOK | http://autobuild.buildroot.net/results/090e8ca37ac1f6d66024ded1f6ec3b54894cfc80 |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/1238eb1112cce05903239fd95df346fa88c79abb |     
    mips64el |                  libtasn1-4.12 | NOK | http://autobuild.buildroot.net/results/4f105d988a76ade0ca40888d3ad9bbfc00fbc67d |     
        bfin |                  libv4l-1.12.5 | NOK | http://autobuild.buildroot.net/results/2854105e2e5b1c65cbda0571d1dec237917f4b49 | ORPH
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/cc818a55f674147434de3aa0e66ff011d34c000e | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/36d295cc7caea6e7f3ed1e21ae9f31d3f2ebe70e |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/ad94a0a3d466b5d8d9975e15a6c9154dfbce1dcc |     
         arm |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/5ed64cae3e1b9503e25cee926a7da31e498e0ad2 |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/d97163b2fa2fd81d68ea44a54a48a351fbd71a93 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/20040c099f39c72a66daee85cdf774b6d5b57633 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0cce1881b4fe5acf4d246afb522a02fba3f88529 |     
      x86_64 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/9a65a523badeaa6ebccae4ad99e686acfdd89bd4 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/babce4b764465ca60da883c7f6d7f1bd6c0dd9c3 | ORPH
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/609350092b945f6d93822edcf30a293595ddf28d |     

-- 
http://autobuild.buildroot.net
