From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 06:17:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-02
Message-ID: <20190903061718.EA4A88836B@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-02
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  3  |  0  | 18  |
  2019.05.x  | 16  |  2  |  0  | 18  |
    master   | 143 | 51  |  0  | 194 |
     next    |  9  | 11  |  0  | 20  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             host-cargo-0.26.0 | 1 
             libgpg-error-1.35 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       host-cargo-0.26.0        | NOK | http://autobuild.buildroot.net/results/c4baef8005ddcd06cbcf00216ec94945762be88d |     
    arm      |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/51808e543b908d70137798b28508a3001b828f1a | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 
              qt5enginio-1.6.3 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/29e8723ff958f29109331feddcdb3cdd7e2af3a4 |     
   xtensa    |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/26a5f71ffeee5b38b532e34c9801a3df1f3b1d7f |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/c15d234e108bf2280757811531a54d59c05394d2 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 22
                      icu-64-2 | 6 
                       unknown | 5 
           host-nodejs-10.15.3 | 2 
               host-qemu-3.1.1 | 2 
                 libdrm-2.4.99 | 2 
               libupnpp-0.17.1 | 2 
               wireshark-3.0.2 | 2 
                  flashrom-1.1 | 1 
            host-mfgtools-0.02 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
      intel-mediadriver-18.4.0 | 1 
                   mimic-1.1.0 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.3 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/d614e3dc40451b124f6028dacff0d860e381d5d6 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/5408311d67cf2b55e6b96a6ce829c3440272f6f7 |     
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/9f3f8e1349432242a6833cdcd2614f039d44b3fb |     
    arm      |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/7f1bbc6f3f64bdeee8c7ccd33a79bf6fbe64e107 |     
    arm      |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/1ca700f9a2347a0089f6a5bee38454a758f0f730 | ORPH
  powerpc    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/f1374997a741d2b7776a59cbe3d00cd9810f03b0 | ORPH
 powerpc64   |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/57234956723ef095b514b4e3c08fb3638fff5099 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/48574781a2d7cd094bc1f1eb08d57012b4368b91 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0ca2128c761f819f10b255927c4e530f540d44d0 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1fbea078834c4a96273f17961e4a866a3661c768 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/8391e22446e5493e2ccbc27014423254e22b9326 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/78c02047f291b019278ed520199a03f599c837d3 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7ff093ff30e1965c8f1e5af4be18b77a907df6d8 | ORPH
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/1b532254938f90da606dc5280fa20c8eee415918 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/9d2c7723cdaab176788b7dd6fe2f0fd9c9bcafa6 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/3447f7ed764bdeb629611216f17a45b68eff6edc |     
    i586     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/08dbc8c180ea8c1280010e8dc39a5d6717b90412 | ORPH
 powerpc64   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/33791da83ee4c0bc8adca478f03c8ac5c44bccad | ORPH
    sh4      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/1fbb65973e9a77a16fdde7197cc1400d3ed822ff | ORPH
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/7101c8215f5de808e3407f33e0ce4bb2994e1100 | ORPH
  riscv64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/3efed4bca52736335a0ea2ae7af7b7c196d38a68 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/ac33bc3d9994d9b728db970a9e394802659d5d3a | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/9c810bb7267b084395beba4f362397937a310355 | ORPH
  aarch64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/0bb1f4f9cac32a956ebceaf9dd3f84d77b750ab4 | ORPH
  aarch64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/d642dd577867c2dbdd3c00a620feee0904cbc09b | ORPH
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/77db8e1d125c7c8085591f3c823ad69fd799292a | ORPH
  riscv64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/74ee774092cf5adc214d2aace6ad8e8e02fb9902 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/ae350b41d094079ed711b8cd870ce9586add679d | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/3551107a3cf9639819c1e3d730885fa718de38c1 | ORPH
 powerpc64   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/b2703dfc637375927eb3e6eeae660b305b859681 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/d3fcdf6c1a86fa4fc101a25a778bca004a0d7d80 | ORPH
    sh4      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/b538d17b6f1aed5835706243c13c6d4491867f0c | ORPH
  riscv64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/521979850ecb0af4e4142169df69c60edf89edf5 | ORPH
  riscv32    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/a0723269bc457c181a32356822f4c2bead1a65e1 | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/bd09a484646a83384968caeed8e6c6a61675f200 | ORPH
powerpc64le  |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/751bb5a2733cc89227b8a5a0846074d4eb7c26c9 | ORPH
  riscv32    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/67fd3877a579eb0d592e675af58cdd92b62e8c04 | ORPH
   nios2     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/76eef2d5e7b212bc0351927b18306323d489f7e4 | ORPH
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/487fde456e35a5fc67d7aebce88f16a50ada46da |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/8e056f043723265da6b272d3a590dab2f03bc4c8 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1c0ba078e02593631279c49571d7a23db803ac78 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/e85ac72f7d8167401559f2dbf455049029b336d1 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/23314f5930fc5d6725033302e25e330e8afbc922 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b767c359d4430410f7051905f20973cf52ed42f1 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/63b4487a2f64bacb7219f9919adfc6a71c2b035a |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/f9a9b166293655945f4c5bfdca1d307551266758 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/04e2511603fb343dcb5cf4dae124dafd41945aea |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a36e0e05ece58aab4d45a93c23c1a17102f07e63 |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/c21b426095717eb5db6d8ca2c34823f776609878 | ORPH
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/103a75ed94c167f1a3a9757cead982441986deb9 | ORPH
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/0982802212630083a144c60ced2ccde0eba16b75 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 apache-2.4.39 | 2 
                 host-icu-64-2 | 2 
             libgpg-error-1.36 | 2 
                 haproxy-2.0.4 | 1 
               host-qemu-3.1.0 | 1 
               libupnpp-0.17.1 | 1 
                log4cxx-0.10.0 | 1 
                   mpd-0.21.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         apache-2.4.39          | NOK | http://autobuild.buildroot.net/results/e7a4a24bebd0b07dc889940954c6b023240b434e |     
  powerpc    |         apache-2.4.39          | NOK | http://autobuild.buildroot.net/results/3b14d8c18c8a0de5e8379cbe0ee0b68f528a9d3f |     
    m68k     |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/47e363c4d92fabd679abc53829ba49dfb800f04b |     
    sh4      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/4ec1402a7ed50b83d1bfc948bc8b95753c618d00 | ORPH
   xtensa    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/c765e9c21ec86bbb2a06e97aa81ebfcd84402eb3 | ORPH
   nios2     |        host-qemu-3.1.0         | NOK | http://autobuild.buildroot.net/results/84d9bc94ed4cf985602182e96cdb998b0e55f9ba | ORPH
   x86_64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/c8a004051932895dd994335cc3ea12326a94b177 | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/002462f999ca38bed89386262907591cc0c33763 | ORPH
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/66a6753f52c49e632a8ccf7f0ee5ebd504a0a98d |     
   mipsel    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/27a880efe71e6a3c944298b1f1999e1c767c2c86 |     
   nios2     |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/4d983f842a3f2bee376485a7e96a0fe2e4de8ddf |     



-- 
http://autobuild.buildroot.net
