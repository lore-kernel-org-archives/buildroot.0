From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Nov 2017 08:00:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-17
Message-ID: <20171118070012.2A84C213DC@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |   2 |   0 |   0 |   2 |
      master | 106 |  23 |   0 | 129 |
        next |  31 |   9 |   0 |  40 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 6 
                  fwup-v0.15.4 | 2 
google-breakpad-7515ab13768... | 2 
              host-erlang-19.3 | 2 
pdbg-77158819158d1d7053a737... | 2 
kvm-unit-tests-5731572b2ac2... | 1 
                   libcap-2.25 | 1 
                   libnl-3.3.0 | 1 
            lttng-libust-2.9.0 | 1 
              pcsc-lite-1.8.22 | 1 
                pinentry-1.0.0 | 1 
         qt5connectivity-5.9.2 | 1 
                       unknown | 1 
                   zlib-1.2.11 | 1 


Detail of failures
------------------

         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/2d458fd8b785332fd2292391881322c2b0e4bf9a |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/91d497796e6ffa8cf7a87bfc1a8eec5af97383f8 |     
      mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/36de893434c90018973adbd812cde45333527648 |     
      mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/ee6e3dbbc9bf96962811271935ecf54bf7e19c6a |     
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/4be5e6a2c2d24d53a4b4d1780b80483ff455b2bd |     
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/890688cf4f1d0315279dd3cac08da434921be41e |     
   powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/8fcb147a0e5679ff0534e91f978047cce9ccd456 |     
         arc |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/81e6835750d78faf5f0b10bc2af735373663a787 |     
         arc |                    libnl-3.3.0 | NOK | http://autobuild.buildroot.net/results/0c829cb35b5d76e2e766bcf840d1e487d5e8b9ad | ORPH
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/403c388f66ba181f43a8ff32cb2dc2da5e71645c |     
         arc |               pcsc-lite-1.8.22 | NOK | http://autobuild.buildroot.net/results/3b16b0902faba123bc6e57accc759361681b6cff | ORPH
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/ff59f8ca1fdcf45edf41cf3aa088b7f6f9c0b9fb |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/a9c6c59e1a3a2cf6d4edbc6beea802890f5764e8 |     
        i686 |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/62b29c705317f6e272da49ee9fd85b318e18d357 |     
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2fde76a73e47cf7e3ddd6a18b411b7a8b8c882dc | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9ced0b73c265eb00ea31cc0839767e53d2790390 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/afd9e736d530463e8b186d143e4148f131f068f5 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/bf6e3c87d7c9c7cda75939b4c85302fa55a9afa3 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7db1265f6f34be3a498881564292517a8fc0e44e | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/527747a2fbb31195bb6fdb37cfdaa624e69b7d68 | ORPH
 powerpc64le |          qt5connectivity-5.9.2 | NOK | http://autobuild.buildroot.net/results/938859bd7058c41bb72fd9540494f07f89149976 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/3c45b9d48b09ee1531a7478543095eb755e3cff6 |     
         arc |                    zlib-1.2.11 | NOK | http://autobuild.buildroot.net/results/711954c78feee220f37ff984b8fa8ef650f716c6 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  libogg-1.3.3 | 2 
              alsa-lib-1.1.4.1 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
        host-xapp_bdftopcf-1.1 | 1 
              pcsc-lite-1.8.22 | 1 
         qt5connectivity-5.9.2 | 1 
                 snmppp-3.3.10 | 1 
                       unknown | 1 


Detail of failures
------------------

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/35c335669d5742381b8d864e1e83444c0c07cec1 |     
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/db1a308f0ca48161b13a689e3444c109a010c011 |     
     powerpc |         host-xapp_bdftopcf-1.1 | NOK | http://autobuild.buildroot.net/results/1173bbef5ee2f808c216c1a2c3a19c5e6534599c |     
        m68k |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/0e37f10da43d6b586a673107974add4fec1390a5 |     
         arm |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/1f6d1e001620798175d332fd0a7e71a508e1684f |     
         arc |               pcsc-lite-1.8.22 | NOK | http://autobuild.buildroot.net/results/34fa74f6e600d845d2af39c08e0a81faf79d047f | ORPH
    mips64el |          qt5connectivity-5.9.2 | NOK | http://autobuild.buildroot.net/results/387a21fe7fc672e5668b0afddc138cbb7197d234 |     
         arc |                  snmppp-3.3.10 | NOK | http://autobuild.buildroot.net/results/fbf2e2a1e4eeda0a12ddcd6b38f15ec06b718fd3 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/2fe43d3e4991a44a19e7b8b31a899700871eeba5 |     


-- 
http://autobuild.buildroot.net
