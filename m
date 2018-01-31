From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jan 2018 08:00:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-30
Message-ID: <20180131070010.7E7B721A1B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-30
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 199 |  60 |   1 | 260 |
   2017.11.x |  36 |   1 |   0 |  37 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     gpsd-3.17 | 19
                  connman-1.35 | 10
              keepalived-1.3.5 | 9 
                  boost-1.66.0 | 4 
             bluez5_utils-5.48 | 3 
               lightning-2.1.0 | 3 
tvheadend-e06ffd87beff16103... | 2 
           cups-filters-1.17.9 | 1 
                  dash-0.5.9.1 | 1 
           host-mono-5.4.0.201 | 1 
                   jamvm-2.0.0 | 1 
         libcpprestsdk-v2.10.1 | 1 
make: *** Waiting for unfin... | 1 
                    mpv-0.27.0 | 1 
             qt5location-5.9.3 | 1 
                  spice-0.12.8 | 1 
                   systemd-236 | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/a44f6af83d824b1c36c4865539d03e3a1530149d |     
     sparc64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/4231632dd2f8a76b3033306f287724185c6460ff |     
      x86_64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/aab62d2c2527e68c6e491edd8ef5b8be37dfe9cb |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f770133745e0097f8f9acaa94b7bf274b1cda9f5 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/3b9ba91b5b69c5ae78fe2d22135364d17aa41dfa |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9e4400bf9deb9fa376be7f75977f14b79f9bd782 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/36f743f124fca84005df6c97dc2ca576c298edee |     
         arc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/f35c6952897ef2874182cd859d67785deac6f56f |     
     powerpc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/2d07f0673470cc85f1f811d8a2a094736daaa397 |     
     powerpc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/640220462734cd864b6a97e3ac3c7fa539faf273 |     
         arc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/30e036b11ce64dede36fffe346250c41eecafcc4 |     
         arc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/2d88f115e61a118cef102e864e3e70da269fa603 |     
         arm |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/c3de866879c7aadd0e8b68d4839b871914f1c68a |     
         arc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/3262a17cfe360539fe75c8ac3f38ea8cc5a16802 |     
     powerpc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/74ed235b36bd3e3640badb3f40d487656880c03f |     
         arc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/de4626a1123946d5776f12f7290cd8fd5dbaee62 |     
      xtensa |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/da97cae9d8b6846b3571bc87c6cfc74c13ea76de |     
       nios2 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/cd04d78f14e759cdc2a49921c6200dc188923d0b |     
         arm |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/6bfdd44ea5d55a6ca3ef92254eab18c7c0416b7b | ORPH
       nios2 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/555b4bdd1707aa21e6d3014e30b635c96c5efffc | ORPH
      xtensa |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/cfc14a2c471c63ecc4c95c12b8e00ed7656acfd2 | ORPH
      mipsel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/2104e15526bd6f467f0d56dee10b5fa46e2c71dd | ORPH
       nios2 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/610b3f898b396c1def682b809482408c2c4555bc | ORPH
      x86_64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/a014f400378ea20873c4cd1a8ebdfdd4b73fe061 | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/63422c2f6b62c384955fee2d0e21a0dfd3dcd702 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/f52609f15327e3211fa3208fca67deb13f0adc0a | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/62706b3472e1a8c2fcef189795c4956a544ea295 | ORPH
     powerpc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/563c6d4a656242bbfc419f676d2f2dd6fa815337 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/b9b4eb6d247dfd9115523a06c3731cffc4c153a2 | ORPH
      xtensa |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/b78bd1c8482a1060e12f936505a33e40cf57a93d | ORPH
      x86_64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/4cd09025e41b8902690ca4f1ebc8f87060dabc98 | ORPH
     aarch64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/b435d501dd3f46172c995871af42623c56cebb61 | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/fcf0c285102609b8235f79f0a3d2925632a0f397 | ORPH
       sparc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/d6ace7c4360590f17b07cc0baf3d0c0effe33dd2 | ORPH
     powerpc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/8c7d33aac63b01f95aab180c4ea4d036396c0bb7 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/354cece8d4bc5eebbf5f5f6ff83f06f04e94e5aa | ORPH
      x86_64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/c9c91490ebdbe48dfa1151ffaae876993fe9c2a9 | ORPH
     powerpc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/87f358e7b796b150e43def58cc915d8b6f3c81c8 | ORPH
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/4b058de3394e3b566ceab7e8eaef1809573f55b9 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/dc93d068fe64de2e878a2209253ec91ff560ffa0 | ORPH
     powerpc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/fe2ed09807e154fabeb49b5853e254b80cf264b9 |     
microblazeel |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/08558b5e575b8ea6b7ee76dfa57cc0497e973e1a |     
microblazeel |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/b0cadfa020e7d2be6dcae90318c7e4bfbb5aed68 |     
microblazeel |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/e6eb1bd5a7bc7b0cfc9673ac24bf94edae02e76f |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/e409cb3138a6ccf35a8590cae562c838396f2e02 |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/2043b03d937ce5d00e3772813324e6ba38acf464 |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/d4428f967280a1e71dd97018bdce139db8174edb |     
         arm |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/e2d8191002a3cd3e4993a74fe9202847d2450d65 |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/5813d28cced5192922430ad8f35b4f3b34da30da |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/213a555a65efa835e4c30762fb438f93d6a373a3 |     
        mips |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/5df9500f339fe15a391cb06b7115c3fef14bc63f |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/27683970e74e32be8527de457706aa0f4c29af55 |     
      mipsel |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/7cea06079e3d55732af85d4bbcec17e0eb7e93bc |     
      x86_64 | make: *** Waiting for unfin... | TIM | http://autobuild.buildroot.net/results/798e6d32bd302decfc804325dc6198048e0a19ed |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/509e664781f163f88b255a1d2df32148f7521c0c |     
        i586 |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/73fa2e32eba47aa761d08f824648ff9381b65e8b |     
      x86_64 |                   spice-0.12.8 | NOK | http://autobuild.buildroot.net/results/bf8e8b5f90d311c645d9733dde634cf36109d7eb |     
 powerpc64le |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/afbbe01a669852b59b47c4de2d9e6272db052eb5 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/2b0347b4aa06f3c404305098463e899c3f5db456 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/b6e160872516f40f6155435541869be6346f2a51 |     
     powerpc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/571863954d02017089f9908c352500046847ec0b |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                poppler-0.59.0 | 1 


Detail of failures
------------------

         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/434030feb1352be8c7ee78a97bae670d0aaaadd2 |     


-- 
http://autobuild.buildroot.net
