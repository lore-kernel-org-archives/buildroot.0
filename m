From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 06:15:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-16
Message-ID: <20190817061601.0EEDD8613C@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  1  |  0  | 14  |
  2019.05.x  | 20  |  0  |  0  | 20  |
    master   | 138 | 29  |  0  | 167 |
     next    | 10  |  7  |  0  | 17  |

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  monkey-1.6.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/fdec4135ef9f74f7d6d14afb698869a46d0cb86e |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           python-numpy-1.16.4 | 5 
                      icu-64-2 | 4 
            host-mfgtools-0.02 | 3 
                  cmocka-1.1.5 | 2 
               libupnpp-0.17.1 | 2 
                 batctl-2019.3 | 1 
                    ffmpeg-4.2 | 1 
                  flashrom-1.1 | 1 
       gst1-plugins-bad-1.16.0 | 1 
           host-harfbuzz-2.5.3 | 1 
           host-nodejs-10.15.3 | 1 
               libsigsegv-2.12 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
          qt5multimedia-5.12.4 | 1 
            qt5serialbus-5.6.3 | 1 
                suricata-4.1.3 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         batctl-2019.3          | NOK | http://autobuild.buildroot.net/results/f64aab0ffedb6f2f4bb221781f720be9313112da |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/38052254f0fde88c362cdb4184730ff3e8651f27 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/811c6eae5cbb4f5854cb7caf03e479e6d567b0d9 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/8c028921909da7d0cee9a5992a757b6bf530c530 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/68a8ebc1a60ca0b2b9a1d71d44b9898c42717945 |     
    arm      |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/11211445a0957b6a320b75e72835442ab72654cd |     
   mipsel    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/368f08364503eea13d230f339b85dbc5ea439383 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/a5d53eaedd528cf4c36a7986dc588c32cd40facd |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/ad69c7ea96ae94039e196a90f93cfb93938f5cbb |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/9dbb821766c29b1236ad5f6ac88c3b53a2fdd7e8 |     
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/80bac0db7133fcc42da9c2bb5b78ae2a74a16adf |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/85a8eafe0f38c6cd1e0dd4b18967d871304fcaf3 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/d80389ed27a35e9aec9ce7ac8be146eee562389c | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/66b76bfe644c7d7d9357db4968a62a59a408cfde | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7807945794fa663243073e51619044af089c1f85 | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/c0d6f630af88702691ff8bbeabbb0ae8b9b5310d |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/45c9a45ecf02977696e577f387cb4d88b2d94d13 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/ac618c3d3fe7fcfcca65314c03e24703a4b87179 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/a360c1a8cefb29d2307ae6b3a5efaa01be30617e |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a161a32bc56bd21b4d012bb85d0816564ae3cfe0 |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/b2da9cb2b2954e9d81f98be5a5f9aed7523b7beb |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/6c2e253878173e1ee6e42b779261f3a1ecbcda9c |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/d8a98d4708f68792e36616b12252c3e4ad356d84 |     
    arm      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/4c3a2d6c88caf7ba3299a84a83d23148faafa8b6 |     
   mipsel    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/26a68c74e3836eb3ed9895640e6f4ffb31c8eab8 |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/e9619bf8be36603ccf7bd943f2562fb69aa6fbca |     
    arc      |       qt5serialbus-5.6.3       | NOK | http://autobuild.buildroot.net/results/e2e0ea895c822597f16a61df9a58618efee22164 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/ade40e658f7cfb419daaa27be4379ed4acf6ebc5 |     
    sh4      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/a4b6eb514633b96b7fa4fb12e7cacaa186497bac | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 haproxy-2.0.4 | 1 
           host-harfbuzz-2.5.3 | 1 
               libupnpp-0.17.1 | 1 
                  luv-1.30.1-0 | 1 
                   mpd-0.21.11 | 1 
           python-numpy-1.16.4 | 1 
                qt5base-5.12.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/ad6a646edb6407b4656e6d40c2a441afb657cf30 |     
   xtensa    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/496a219ce8c8934d9d58578ec5f79a07fcd9a291 | ORPH
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/b69c76521f110c1c663b32a6cedddaec355aebd7 |     
  aarch64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/32d42e7499467ccdab071d14d2e231bc6f056514 |     
   mipsel    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/5b540eedba3f38666654c963cc200a086ffff406 |     
    sh4      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/d36618f272c22366027c7c15112e46cabf1838f0 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/db27eeb36cce8edaae87a58e580db4b131f2b4b0 |     



-- 
http://autobuild.buildroot.net
