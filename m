From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  8 Jul 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-07
Message-ID: <20180708060020.EA2A8207BE@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   1 |   0 |  17 |
   2018.05.x |  15 |   0 |   0 |  15 |
      master | 127 |  32 |   0 | 159 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mplayer-1.3.0 | 1 


Detail of failures
------------------

        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/cd86b012a513d72090225141f7bd684eb8bf44bc |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   wampcc-v1.6 | 11
             gnuradio-3.7.13.3 | 4 
              mjpegtools-2.1.0 | 3 
                      x265-2.8 | 3 
                    host-rustc | 2 
linuxptp-303b08cbf55096aba5... | 2 
            qt5location-5.11.1 | 2 
              wireshark-2.2.15 | 2 
                   libnss-3.38 | 1 
                  samba4-4.8.3 | 1 
                 wiringpi-2.46 | 1 


Detail of failures
------------------

      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ec01f20290da4e93f1c56cfad5ecca5f3c784623 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ddf395a134d93c9681ae1e8286316ac831713496 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/957a49d8d581864637e044f6ce7090bfde80dd30 |     
      mipsel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a02257f43b5fec07b48b159c1bdce6766fb055e4 |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/47a5a31ac25e2df5a8e644802436c19c32cc881b |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/4c1254b3dd69b207237b77eb5a2c35069075a225 |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/d1ddf16997850daedac96a3a56d224ca019f4f91 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/0e7ac0209cdaee5ddbc5336e1226343f458a57ee |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/94180b406db11926026a478a0234b8f8aa832af6 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/e30c4f0dca721ad01c83bde6f88af31f3166a33d |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/045956d5cf6279a8c93d68b389a4ddbaf357f5c0 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/44b910ed666adbe191f99e371f52b4d6c29ac198 |     
    mips64el |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/db7b4c61bb41d32e0f7960c194588cd1559ff3f7 |     
         arm |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/397acc3f5d4998a8d632749ef7d21533c35d501a |     
        i686 |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/4dfa00b8186a46f2ec407bce2d5da5956513ea3a |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/f12de3330a6590bbaffca2503172307c5fee0928 |     
        or1k |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/4f60cd9c7b6f16cce35127bcf441e18a1bcfc2b2 |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/f80b7dd2e02e39f1a77ff0715f643c634e04be83 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/751d57f96411f67292624a9444980e9dbf89206b |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/a2a3abb6a1ec9f2baa1741ea5b494c3852bbe4dd |     
        mips |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/2f994762d4e01a904c50cf2728a4103e6e79da2a |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/b47daa2f7df44109b839b07d282d4f5b5123533c |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/09740919379ee68dc700573cdb7723bfbfacf3ca |     
         sh4 |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/ad251117e24f9d9198c2f9507286778e76efbc58 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/4dbbff73883db60d09c16a787e3530ab0d064c3f |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/103d6134cb50ee20c2aa60c94fbb2cb190bedca4 |     
     aarch64 |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/55f34049a2d34afa7a5d1f7cc1b1023f2f0ba9cd | ORPH
 powerpc64le |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/eed1700ebeacae917a71a23fe4a30419fd0751f5 | ORPH
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/839a45907459b14dc34aee19d39bfe1c2c5c0ac9 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/6629b4bd850d51e6abdc92b63a700b0afcd47dfd |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/291f05e6cf479d37248caaf0b43ade6f0153e40a |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/0769c788b18a04aa6643e06a78aa08b498e841f0 |     


-- 
http://autobuild.buildroot.net
