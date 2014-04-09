From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  9 Apr 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-08
Message-ID: <20140409063009.2F8111012A3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-08
===============================

        success : 56 
       failures : 27 
       timeouts : 1  
          TOTAL : 84 

Classification of failures by reason
====================================

  toolchain-external-undefined | 3 
                  zeromq-3.2.4 | 2 
                 mesa3d-10.0.4 | 2 
             lttng-tools-2.4.0 | 2 
                  avahi-0.6.31 | 1 
make: *** [core-dependencie... | 1 
             util-linux-2.24.1 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                  taglib-1.9.1 | 1 
                  ltrace-0.7.3 | 1 
        gst1-plugins-bad-1.2.3 | 1 
                  snmppp-3.3.4 | 1 
       CC       libdissectors_ | 1 
                      qt-4.8.5 | 1 
                    php-5.5.11 | 1 
                      icu-51.2 | 1 
                 webkit-1.11.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                    gpm-1.20.7 | 1 
          openpgm-5.1.118~dfsg | 1 
                     vlc-2.1.2 | 1 
                     popt-1.16 | 1 
                 cairo-1.12.10 | 1 

Detail of failures
===================

       arm |        CC       libdissectors_ | TIM | http://autobuild.buildroot.net/results/c05b9cb9ccb1d02adaf5ae10b4f2c053f1979410/
      i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d1967ec1b19211d209b6f476654bb30039da94fa/
    x86_64 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e079219d70830a123977c3ee09d3c11b863d0691/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/fdb6ada3777ebd3532fbae6190f8c223c6087872/
    x86_64 |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/31ebbef18f1d96c9ca436e575584e843930dd9a0/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/1567be445b3ab9071717e9e72301818f95d0a143/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/4f32cf6e7115f62af0b48ca6ce2af4318437ff36/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/227caa0c41f900495a301df1c9f79328fbf26851/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/00fc8f433d7ad2343092aa7abf13abfbbc81ebad/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/6792f28c1a8f58084d74762e420e71099aa453f3/
   powerpc |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/2a6f0c86a72fe4b2f205c029fef1a1cd161a1dea/
  mips64el |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/4e0cbcb56b0dca7d1c19291855f63740ab264e8b/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/a2ca3fe245e410a738f4b10631a1414696a0edea/
       arm |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/01f886a073439c0639ed93e596b68bcadf1a5824/
    xtensa |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/e40d759ee74b0c292cbf91332a22e576b08c62c2/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/410c8f3a0c7ca2c7098a47c30088038411635ae4/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/db75b9b68e6d889f179c7b78b6b2b17a727fe9ad/
      i686 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/8075051b7578d42616f7492954a1d1ea371bcd69/
   powerpc |                   taglib-1.9.1 | NOK | http://autobuild.buildroot.net/results/02a6874aa21041ac9fef6fef51410c2ad92881c4/
     avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e71bc292470fdda2c507678a4eb457fa88119411/
     avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5adbfeea57a1b931c6eef72b8165ca355809b769/
     avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d1adad74fa8054ecf9a1e100391f4f7c31518ad6/
       sh4 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/d15c1e3ccfb97f515361075f8494f9b2295f0a6e/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/1c954593e560f200806548133cbe59b2865f8882/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/5e12523db7c698d861a8e4a6b7ef731f6acaf22e/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/2f8784ecec7c29f51b2019a6e817733961db92f2/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/9880735f8eac6fcfc0716efcb1ea38b4cf95a704/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/70f6c6514e9f52a4e98eacaf9dd59109aef38b16/


-- 
http://autobuild.buildroot.net
