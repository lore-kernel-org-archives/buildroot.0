From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Feb 2018 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-16
Message-ID: <20180217070006.68731207E4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-16
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 174 |  21 |   0 | 195 |
   2017.11.x |  25 |   2 |   0 |  27 |
        next |  37 |  13 |   0 |  50 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 4 
           host-mono-5.4.0.201 | 4 
                     php-7.2.2 | 3 
                   systemd-237 | 2 
tvheadend-e06ffd87beff16103... | 2 
                    dhcp-4.3.6 | 1 
              host-erlang-20.0 | 1 
         libcpprestsdk-v2.10.1 | 1 
                   mpd-0.20.15 | 1 
                   pcre2-10.30 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/aab1e40028bd4b98b346d75dbe1bf5c6832db4cc |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/857b684e0fa8d19d21e8a1781df2061734d3f748 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/71ec55627b0c65e8f426b99bbad8c7e71fe56521 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4beaffaad60619bb61974de9de245d407811f59a |     
         arc |                     dhcp-4.3.6 | NOK | http://autobuild.buildroot.net/results/4e956b0b4c045e0c13c2a45c90008280702951a9 | ORPH
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/3ef0f61aefd64165455663017acfb855dc4caa76 |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/e9ff6c3a9dd904ce884608bbaf9b4e900a0091d3 |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/63d7f694a470f0d31429691653f915f7440494ef |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/89b913c36a38918f5074d26ff4a2d111b6cb22ba |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/2f4190656ba7af34275d61d11ce21a892b87cb8a |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/a9488a24af14b28ac8fc477713c47155e13e66e1 |     
         arc |                    mpd-0.20.15 | NOK | http://autobuild.buildroot.net/results/7db2b71f088248d280b0fecbcb6aeebb8659a9b4 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/9ad1dccd858e77e8e9d553b8e9693f8b5ee03438 | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/2dfe7ffc31ac5828fbca557b20586dc718e2a28d | ORPH
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/66c48eb72c055d4c39d45c1f0f049bb98437722a | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/7c1242d8ec47bdfb13e8eb08c1b63f0b75147be0 | ORPH
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/96ff00a04bf58ae8393f44facab7b6f3d5869e54 | ORPH
   powerpc64 |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/4cd6bc48bf1aab601785c0955a7268e4f8cf2cde |     
         arm |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/eb7acc5798b8d2e19181d41e713a5441f1459ca4 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/6637d24de01199ac81830a7d2de9946775e7f37d |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/89aa99ca63db57954eef8dbc83aa8c25b1758648 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

            lttng-libust-2.9.0 | 1 
                   pcre2-10.30 | 1 


Detail of failures
------------------

         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/08c218bfbe44cb8e5a0444cc15557fc2decd7895 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/69e929fd14517db3075f6fef9123db655babe6ee | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 4 
                    liblo-0.29 | 2 
               lightning-2.1.0 | 2 
                  udftools-2.0 | 2 
             bluez5_utils-5.48 | 1 
                   exim-4.89.1 | 1 
              keepalived-1.4.1 | 1 


Detail of failures
------------------

      x86_64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/47809403a55ec4d4ef2aee08bee785d95f17dfe4 |     
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/729d80a3a6c3f4b446dd76e0c354ecc2d11a648a |     
         arm |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/f83c5267d248188d4267c1b94ffe8b3264739e00 |     
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/45a652eecdbac2947a192a78dbacf03d9e822ada | ORPH
       sparc |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/8ae734b8f135e0b3cb0267ee1fae9841054486cb | ORPH
      mipsel |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/b63e449d83ee9b71d2e92447fb5e18f65a3c99c2 |     
     powerpc |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/777ed89abd41de053807997ac34a433e5d99daa0 |     
    mips64el |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/a8b06e322dd0dbda9b9d3465ee55d3f16f418b4a | ORPH
         sh4 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/05b4aeae2a7e8aab6d6a8be1ba1ca73dd7aeb2ae | ORPH
      x86_64 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/938b3def127267622c1af41144f2e76773c11434 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/1d09e44f98098666a8fc225d6ef260e0b24f396c | ORPH
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/cbf8748a8f9460ccf913b5bf0aaf4fa3851ab087 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/70cfe7443abc67679562b24dfb05f7f3e6a8123d |     


-- 
http://autobuild.buildroot.net
