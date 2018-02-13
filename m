From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-12
Message-ID: <20180213070008.72957207F0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-12
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 166 |  50 |   0 | 216 |
   2017.11.x |  21 |   1 |   0 |  22 |
        next |  55 |  22 |   1 |  78 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         postgresql-legal-info | 21
                     php-7.2.2 | 8 
                  boost-1.66.0 | 5 
                 mplayer-1.3.0 | 3 
package/postgresql/postgres... | 3 
              host-erlang-20.0 | 2 
             bluez5_utils-5.48 | 1 
                busybox-1.27.2 | 1 
                  cc-tool-0.26 | 1 
           cups-filters-1.17.9 | 1 
                   jamvm-2.0.0 | 1 
                      qt-4.8.7 | 1 
                  stella-5.0.2 | 1 
tvheadend-e06ffd87beff16103... | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/33779e185acdf6230dcaebbf857f64c7f433ae73 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d20e22965fd4a0a5c95811c4ae7bdce9d8a84178 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4fd9d8154dacc043d1641359edc4ca0e62c47edb |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/dabb71c01cb645b1c18c1ccac5c89633091c7cef |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4af90aec6269e45791139e10d60f8144cf13ae02 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/7b2d20370b7277964d0672ef54b3caf6dc5f5f02 |     
        m68k |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/f349c8e7625bc2b3ad6ee0adf9bcac18266ee7b0 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/614bdc3b67e583b770c41d863408eae9b5e2da16 |     
   powerpc64 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/d9ad3bf443f0d7a7593895f8cc12f1f94d21bdb7 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/6307ef4284ee55bc943c950685d658ccf4052d4e |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/015d6956510fdc47ddb21f98ec17b2084ccfdedb |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/1e807737868a955e61a4902c6d53b0f1a77cf789 | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/db8b66157e7eeb5bb84af141eb3c77d4873b46e3 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d4776a56057eac28e6d2c6d9b1de67fe402ba02d |     
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9dd0bb7c006c9249aaa4a51b2165684720af1251 |     
        or1k | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/010e0f61d8aefcba3c7a33354769cbf74035f302 |     
         arc | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/de4c642bd5b5c662296dc71e506f132ed29e0c9e |     
        m68k | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/0499c517b49b1eb9731980e775bce4bce304a034 |     
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/50835ee539806f35166b7df33c79fc961bbff049 | ORPH
        i686 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/2f0b486d1cba4d235860a2409dbe973c6dad4c40 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/d59b5961890aeddcd6d59ed52243be6554d1fe21 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/91fc6089aab5d0630985209ff684589ce44f2b8a | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/692818129ccadd5a56283084e38517d9eb63bd82 | ORPH
      x86_64 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/a5a88ecf631d0d56417b14a6be7ee41b276864d1 | ORPH
        bfin |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4d65307827eec1906236c3de57197f62cf5dadc8 | ORPH
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/accf5061e4e97820ac403561ee1bbb50bd1a7714 | ORPH
      x86_64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/f808ebacb4ef75e4fcda584da749efbd96c6fd06 |     
         arc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/063972556755dcbb7bf1c4e454b8f166bbb8f026 |     
      x86_64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/563a09fdeb5135a877b931ba1cf982cc0a628a38 |     
        i686 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/6041aea9fcb6b531add5b890c7d33be3dcee4c28 |     
      mipsel |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/cbfb9aa2f7e0283784854bb847df3671dc8f14ee |     
       sparc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/3cb3f1ec11c08c2d8e47c84c32454cef42343101 |     
         arc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/92304d639db4286986fef9109f36afc4161a615b |     
        i686 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/4478a828d88cbf51de6e0db0ad2ec1dc75a1456a |     
      x86_64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/f1f87311e03ad3e24bb26cc8f20e1eb4d03f5b31 |     
    mips64el |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/ef273764c8fa569115095dd1796a483110555cdd |     
      xtensa |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/1077628846f1fc363ebd108f5e9734e72dcce82e |     
    mips64el |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/446bc145e189d406943077e7b0ec63c6b9796e8d |     
       nios2 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/e69fe8932280a375cb8ee56bb6c02071581996f1 |     
        mips |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/8e3e854c564d4716b23e16edd53191c0ab99cfbf |     
microblazeel |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/65ab571289ea359758ae19811455c531a0068b82 |     
      mipsel |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/00b2ef8caf1865407259994f60157ac00529bf4f |     
         arm |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/2adbf63aec5db3bc7ca72ac59086208e8ddddd7e |     
       nios2 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/069d1088f03fdaaf19d2f3312858f939629dc137 |     
      xtensa |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/ce178f5f3f728ff0a20f715205f6ffbbffd67b2d |     
        or1k |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/b05fd6a7587f7dcbe4cf797ba1e2ab659958b725 |     
         arc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/93e494fa5f19e38b48f22c399a715b8c7b418757 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0b5ccb3fe6182cd86db5cb4734a5d01053cdaea2 | ORPH
        bfin |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/a8d7392ca17f22d1fb4aa68eeba49f92d8f1a284 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/56df0d850ea3b19e6e917e292e2cbb98e2005d1d |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

            lttng-libust-2.9.0 | 1 


Detail of failures
------------------

         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/bb619a4af516275da1ed309ba6a3c981df082ad9 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              keepalived-1.3.5 | 4 
               lightning-2.1.0 | 3 
                  autofs-5.1.4 | 2 
                  boost-1.66.0 | 2 
json-for-modern-cpp-legal-info | 2 
                    liblo-0.29 | 2 
                     php-7.2.2 | 2 
                  cc-tool-0.26 | 1 
                  dash-0.5.9.1 | 1 
              host-erlang-20.0 | 1 
                     host-mono | 1 
         libcpprestsdk-v2.10.1 | 1 
open-lldp-036e314bd93602f73... | 1 


Detail of failures
------------------

         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/6ec353904fb41e6a45e197af7aba731b4c50e7f9 |     
      x86_64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/2c1eb9fb3ddd47f5836dfbd0097cc742135a4a70 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/3e52353b3904d4ff299fca45d8907e37854b597f |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/3eb2aa5aa4d94ae689dd206d7470086b6e51119c |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/56915d01838200e643c1fa00aee85e02dbccbb56 |     
         arm |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/724f0dcbe11c7f6394a551fec5abf04c54eeded1 | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/dd01c0f8709551aa7edef44a379ba3d22f2a9379 |     
         arm |                      host-mono | TIM | http://autobuild.buildroot.net/results/44e0b98157e24407ef2202d9ef28125f4625cb02 |     
    mips64el | json-for-modern-cpp-legal-info | NOK | http://autobuild.buildroot.net/results/942485b94f21567c2f35a1a3cc62450f3461a4f9 |     
     powerpc | json-for-modern-cpp-legal-info | NOK | http://autobuild.buildroot.net/results/9b3a13df6f6250496e8156a1b30faf8d1531a5a3 |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/4399d6162a4dbae8294c56b2c17eca982f4ec9ca |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/fa241f27be8cad4f4621c60e54d057bc576690cd |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/6d1a02ead2bb8b2e0a6e88b4fcf405c95f7c3250 |     
         arm |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/42c8daf4af4f269c8b377c702c397abc70024c99 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/1c29f3f91308f7f421c22e7568ff6f7b8f061d42 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/cdb4fb6845e01c5d6b82807bad57e64121d85974 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/83604c02ec76cb99819a7a458f6dabe85d70722d | ORPH
     powerpc |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/398f451abb6e11fdb021eb20fd54699609b70cea |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/2b9e94693ef015309c9a97b427f76c32199cfe41 |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/e95e9debb993c6f0871d5da96c990559c13ca47e |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/bb076bd31ada77a42fdacc16173da21af6a0cc7b |     
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/f90d135b4a709e3ce27161f3a86acf7e97bcc1c6 | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/938e13fa76e7569d5973f8f50bde72998cfabb21 | ORPH


-- 
http://autobuild.buildroot.net
