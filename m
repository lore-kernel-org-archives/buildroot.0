From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-15
Message-ID: <20130716063008.CE43E52C103@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-15
===============================

        success : 102
       failures : 53 
       timeouts : 0  
          TOTAL : 155

Classification of failures by reason
====================================

               libglib2-2.36.3 | 6 
                 libffi-3.0.13 | 6 
          host-erlang-R15B03-1 | 4 
make: *** [/home/test/test/... | 3 
                  zeromq-3.2.3 | 3 
                openssl-1.0.1e | 2 
                   dbus-1.4.26 | 2 
               binutils-2.21.1 | 2 
          host-protobuf-c-0.15 | 2 
                      bash-4.2 | 1 
                  libxcb-1.8.1 | 1 
                  libv4l-0.8.9 | 1 
                  prboom-2.5.0 | 1 
             util-linux-2.22.2 | 1 
make: *** [/home/test/test/... | 1 
                     m4-1.4.16 | 1 
                libtirpc-0.2.2 | 1 
                    acl-2.2.52 | 1 
               libgtk2-2.24.18 | 1 
                      icu-51.2 | 1 
               audiofile-0.3.6 | 1 
                busybox-1.21.1 | 1 
                     pcre-8.33 | 1 
                      qt-4.8.5 | 1 
               madplay-0.15.2b | 1 
                 cairo-1.12.10 | 1 
                  boost-1.53.0 | 1 
               w_scan-20130331 | 1 
             uclibc-0.9.33-arc | 1 
                 fdk-aac-0.1.1 | 1 
           imagemagick-6.8.6-2 | 1 
                  libqmi-1.4.0 | 1 

Detail of failures
===================

    x86_64 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/df01fc9364438c279f34edbcee2dc36efd13d8b9/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/e0737f37bae00b4cbb4e4bb449e2384c465ad59f/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/c7bd2ba285c3d8f8c3bac20c5f1a9752caf1b872/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/a16f956cbe595350afeadbee111a316d9abed88e/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/68555d611677f624deb84a1a9d0bbd2f945a9ec4/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/f240fd4c945b5128320b0bde6f17bfdefbe65fe0/
       arc |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/d6aa8b93b5fbd0df1adf2d373d352b0ffb0fbe47/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/0820fb969e0e4cc4ec0d01fb77136efad3f016aa/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/14b286c134c869ad49bc1e93a3af8e51880a47d6/
      i686 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/295ef18ef2d1a203e776e59815a64ea1ed69135e/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/052c761992bb5f3a063e744b0d0f79105f794354/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/d3308583ca437eb525649d8ce2975255c35af61e/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/26cb03b2e9225f3429d905c5455f1fb8db203fc8/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/a2a12d1aa0a35dc93ec4131e8deb2f70feabb1b2/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/8801fd29a3213cb335e88f3a5093dbfcd5bd74d1/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/bf94b8099112fd801d8ad21c7d892df36262e592/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/2c000bba5f36553d90d58075e513d1bde48541ad/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/036bf496ddda7c655f471d5246cf0343a35eb359/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/e2f1feb34e79e90b396dd975d8fd736b581c245f/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/a1b15c40e12e924ea390684fa10de10c73f846af/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/830b8b6ee27ecd682b48d2f0f7ed7f642eabcfe1/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/67205bd593e6f1f9ed70963a23598975e41c3ad3/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/2df91f37e8fb520304cd3feb4c3df66e1854cc75/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/9715275f3e16d60718295ba1bd420a59ddbca6fc/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/76442b309283be5c9c75f922c26385cdd627006b/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8e18ea9ae18e959f9b89072a7bf4246d56413a48/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/807aa1e7add75484f50afaf0c5d2937607b2b101/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6b6168ba7509ece6cc4ea11ffdce3fbfcb700867/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ec215dc54eea1f52a6a1f47e1144e33c27e91436/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/43773c0cc842f1f70dd99300448cb4a1262199ab/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/397cdca52ad88885fd8f41685e2da95bd0a2642c/
   powerpc |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/cc3d786d84188c37ae5687e36cf56753ca117b57/
     avr32 |                   libqmi-1.4.0 | NOK | http://autobuild.buildroot.net/results/9447b0e635903f3b7ce6c023d251ee99ce6012e2/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/f50e539b1880f926a85a9c35764c25e6e48eb9ab/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/5adda9ef83d6321c6f75ee1db69486dcca182d53/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/1a13c341b593ed5e271fdbf65b3e1643006d7ee8/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/91c2fd91eaba568da5abdf5643277d3dd19ec1c4/
       arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/278b88c94e05362a3bfab97d9fc5f4d0f75b0224/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/f5218c9b16c5f25d4f394eeb727da53ce08f5108/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/55cbb4b80f963adfa5bb2b55aef08e90fa3715b9/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/d70412fb0f8452251b2044d48b6980d6cec56519/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/5b84d220f7178c07cda675a6295e178ce33807a4/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/982e263a6f968026f47ca2d81aa7c05e32d95071/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/a8384c00cbdc6b16c50ed7f5278fd51843ab701d/
    x86_64 |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/c47054af6b7e6feb366fc904b95346536c12e307/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/7ee90002756c2be7a3e3a46986301f6457e6528c/
    xtensa |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/43021e0c4fa4c1db5b3df6f57c5a0824e6338452/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/b4657f5802d1739c56ec888cb56d95bd8d71b602/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/57dc3f3cdeef038d084268323cecf43210758d9d/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/e05ac2b74dd0b201df89940555432cc385e837a4/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/7c927fe17de9170c55ff18247e39592cb7b88911/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/78915985b3077522ca8dd8ea0daaf1de2ceb7ef2/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/80b53646d19c40e683f1fbdf989cb91e8583c594/


-- 
http://autobuild.buildroot.net
