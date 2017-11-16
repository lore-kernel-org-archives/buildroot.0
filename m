From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Nov 2017 08:00:35 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-15
Message-ID: <20171116070035.B88422055E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |   5 |   0 |   0 |   5 |
      master | 109 |  32 |   0 | 141 |
        next |  24 |   5 |   0 |  29 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 9 
host-google-breakpad-7515ab... | 2 
            lttng-libust-2.9.0 | 2 
                   mp4v2-2.0.0 | 2 
           oracle-mysql-5.1.73 | 2 
              alsa-lib-1.1.4.1 | 1 
               asterisk-14.5.0 | 1 
                   attr-2.4.47 | 1 
                  boost-1.65.1 | 1 
                      feh-2.21 | 1 
                  fwup-v0.15.4 | 1 
                     gpsd-3.16 | 1 
                 libdrm-2.4.88 | 1 
             lttng-tools-2.9.5 | 1 
                 mesa3d-17.2.4 | 1 
                 mplayer-1.3.0 | 1 
              pcsc-lite-1.8.22 | 1 
         qt5connectivity-5.9.2 | 1 
                       unknown | 1 
               upmpdcli-1.2.15 | 1 


Detail of failures
------------------

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/d2e7149e5182829d7916593bd6b04831f4e111ba |     
         arc |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/8dc0f6509ed0b5535e1657b0fe9f39e16bb2fef6 | ORPH
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/4b3a145a34b8ab2dc092b24e4af3f1360f2f4f97 |     
      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/e332a50310c20ac49648ab8e047e916734fee612 |     
      x86_64 |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/392b58cca2671e206c85a530221ce7b2d42f31fb |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/89833336cb9f6994673277f980adb1bf02ed65ad |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/49597899c7deabf992844c26e9ff1c9c38085e0b | ORPH
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/0b9f0f35aeac6767827139814791904ce88bfa8a |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/9d7f64b4177edf639d846b222ed5bb4d4d851ce2 |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/86c9c696251932acfbf89aa3598347a78306e79f |     
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/49409f8c3d57722c10f4dbfa6e7b0c100e2a8a08 |     
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/2a0b69a0c53143ec83e12c31a6d75d5482f1e152 |     
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/907bb6a9ae131e4811c9de387779707a9025da61 |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/b48baad50662b0dea7fd9147e6a91267e53b84bc |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/4ccab6d608ef4e8b628135db476efb20e4270dc5 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/4b176f1f98faadc4e9533c21f41822b662ba4439 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e10ad452fa4f0a8b753ee5ead96aad27d7ddea9e |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/3ad51ee00ceb4820a003ab5c4bbc0955e92f1974 | ORPH
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/76084b80c21e910162e87190444d8a4b56710e98 | ORPH
         arc |               pcsc-lite-1.8.22 | NOK | http://autobuild.buildroot.net/results/d316da5b294e1cb3c7ab4bb4c3a596fd2ecf46e5 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4d6d76c8aa95a5d6135106960564ef151398455a | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/02c22064d4fdb3827c7a721d32c023280d8e42fe | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5cac8edd8b46298e067917fe6061131a8d85047b | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7fa3f2e3d93110ba55f779abd5bdb16d81f56989 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2496f8838c46126020c816c4ee1df832cbad880f | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f92fb57954904d55839ecc7e0759f52869fb8987 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0d14e112d5ca94cf36cbd2605d270215236ffbde | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4634366b7dfea6d6f11ae4d4410e35beed80f9e7 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f1db6a482b6d0ea0bf1967f2227d60be330de79a | ORPH
         arm |          qt5connectivity-5.9.2 | NOK | http://autobuild.buildroot.net/results/7de0dac63d04a11ae5d685e140be41c37412c251 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/06b70031a83aec3799124b861fc57b4470b2734f |     
    mips64el |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/96145aa6b618b1d2a82fac510e4f31efb7185a88 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   mp4v2-2.0.0 | 2 
        host-xapp_bdftopcf-1.1 | 1 
             lttng-tools-2.9.5 | 1 
                    php-7.1.11 | 1 


Detail of failures
------------------

         sh4 |         host-xapp_bdftopcf-1.1 | NOK | http://autobuild.buildroot.net/results/4cdd50aa77495a91e0eacfc6aecf050f079a6254 |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/e37a5c69e2a9f9cd7c0705331e205c1ee20808e7 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/8961e555770e29ece2fc795af11f7076fecdc840 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/8350751d7e2170af8093e86ef17df22c0157701e |     
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/fdbb33e9c355ee89f4218b932c2afb05cac9d6aa | ORPH


-- 
http://autobuild.buildroot.net
