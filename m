From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Sep 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-04
Message-ID: <20130905063006.8F3AB52C60D@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-04
===============================

        success : 76 
       failures : 51 
       timeouts : 0  
          TOTAL : 127

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 10
               qt5webkit-5.0.2 | 3 
                    mpd-0.17.5 | 3 
                  aespipe-2.4c | 2 
                sqlite-3071700 | 2 
          host-protobuf-c-0.15 | 2 
             gdk-pixbuf-2.28.1 | 2 
                      icu-51.2 | 2 
                      qt-4.8.5 | 2 
                 zmqpp-31220ca | 2 
                openssl-1.0.1e | 2 
                   cups-1.3.11 | 1 
           mysql_client-5.1.70 | 1 
                      pv-1.4.6 | 1 
                sdl_ttf-2.0.11 | 1 
                  connman-1.12 | 1 
                   tcllib-1.13 | 1 
                 libiconv-1.14 | 1 
                 dropwatch-1.4 | 1 
                 binutils-2.21 | 1 
         host-gettext-0.18.3.1 | 1 
                 qt5base-5.0.2 | 1 
                 libevas-1.7.7 | 1 
               libglib2-2.36.3 | 1 
                  zeromq-3.2.3 | 1 
                libiscsi-1.6.0 | 1 
               binutils-2.21.1 | 1 
               libcap-ng-0.6.6 | 1 
               alsa-lib-1.0.26 | 1 
               uclibc-0.9.33.2 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/f9bd2e7409d41550dccf5ed72ab97be39e31d52c/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/c34dc2ae8df0c2916c9d4c3bba0a1e88b2dbfa14/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/63b53bff95485463f3cbc0280aa50f1dd152996d/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/ee28b02f678aa8073a81411f5133ea4f7e0d6d64/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/8333276434b5d2a5cfecbd97ef0879cd73b74145/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/cfcff4ca3e1db571b444f1ab02f24560b169f487/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/63202bce6f34825c4f1b1b2efc08f9affb8c9abc/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/ab72b026e44ed86e05d41f1c8c5757da689f1b9e/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/10a5036ec3280c3c5d0499971a7900a817b22e30/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/e335c8ab26c551c0f92e5a87b4844348e4d89b08/
   powerpc |          host-gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/36f37913c491000573df9814bcedebccfd4d905d/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/897e79811a0162a521830986eddbc53a0c0870f1/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/7b94c37b56076fbc8a3fcf30635083daeb2e6365/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/47c1461e8c87d2a4426c98574a57f1bb6557a512/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/03f24bae027fce4ba8a7fc8f5ffdbbb19458b5d4/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/d34c569b2e7db7ffe726cc8a0305f3dbcf6a8a52/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/92b3990e3a51c9e400cff31a1f0d23aeb5085a54/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/15aa2bd6b484f9d0156028ef062e7856be3f72f6/
   powerpc |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/4816bbd4f63c09af53c651a7df4a0c41f2118b35/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/ebb5c87c9a230ea1fcb80b27e911c3a194026e7f/
      i686 |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/63e38b0e2c24d7b713eaab2b63d328092c4d53dd/
   powerpc |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/8af46b4285c9b65237279376d4d77fd725207b9b/
    mipsel |                     mpd-0.17.5 | NOK | http://autobuild.buildroot.net/results/d6dcce83c21c6df95f26d97a2ecefc24df0c6d85/
       arm |            mysql_client-5.1.70 | NOK | http://autobuild.buildroot.net/results/10424f991c3865ae5b50a25df660e36e773f1cc6/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/e73ab3fe30a5e188c0ad9fc7a3d59617e5637b31/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/a8bd4dd93b3340dd08bd4bcf2ba5a319e67e40dd/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/85bc45182ee31688147eb97b88aacb1c02dbaa45/
       sh4 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/7707029cb6253cb39ee592185ee576f4d34649cc/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/8a1c247a39ba1a95e76cce45858ad597290e685d/
       sh4 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/fb249b49d128be0a4f49b1a42f3e0a219c57ad8a/
    x86_64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/d34899f7b756498ba6c790cef0f9440ad70d531c/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/114836fa8f9e4bd0a5280b9cd0116f5800388373/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/0dc7facd377d89ae3179f70d98ce01a505b5df1c/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/06c5c36ba80c1e8675b8f2d942e4e547fcc0e77e/
   powerpc |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/e919a939eb51dd0a2184bca38b8d7fadf92fa3de/
       arc |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/54bccbd90feb52e2d771dc864eb3178f62c8684b/
   powerpc |                    tcllib-1.13 | NOK | http://autobuild.buildroot.net/results/398959a424a9466ba61dd73d840c111bb2b9583d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d24b9d894eb2b45d99eb9798fd67e917bfcaa71a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3b2f166c8580916070443f57edf5ddd371959e0c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e82ec195491decd3f02b2c55ff171f8a49b0e33c/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/57496c4ce4ce300882a7ea39d768b821c355acfc/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/da8a98e46b5872cf48799531ab6595968a9d57c0/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5901ffe9f2f2eaa3c28169b44c4d6025455efabd/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3b9c23a470328b0bd18a41fbb4229056637eb274/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/1aaa0a6ee45520cd5858056099cbf6c74908d584/
     avr32 |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/723235fbebff81a456878f2a9495a46a9e4a0347/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/aba1c9aa070ea06f64e4bcaae213fba422fd54fa/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/695188ac1b056e7dc28d5ba86f3f741976d6c3e6/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/96dca65966c340cbe0fc912db5c4650832d934e4/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/884ca3c0de7d2f7a1cbd726d5e4d3816db2b375d/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/9fcd8e2d9f64ccbe4fbd442cbc5de376fb2584cc/


-- 
http://autobuild.buildroot.net
