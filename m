From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-30
Message-ID: <20130831063005.DE32552C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-30
===============================

        success : 96 
       failures : 36 
       timeouts : 0  
          TOTAL : 132

Classification of failures by reason
====================================

               libglib2-2.36.3 | 4 
                     m4-1.4.16 | 2 
                  connman-1.12 | 2 
                      qt-4.8.5 | 2 
               binutils-2.21.1 | 2 
                libiscsi-1.6.0 | 2 
                 qt5base-5.0.2 | 2 
               alsa-lib-1.0.26 | 1 
                  udisks-1.0.4 | 1 
                  prboom-2.5.0 | 1 
            lttng-libust-2.2.0 | 1 
                    systemd-44 | 1 
                 zmqpp-31220ca | 1 
               ruby-1.9.3-p429 | 1 
            kismet-2013-03-R1b | 1 
          sane-backends-1.0.22 | 1 
           binutils-2.23.2-arc | 1 
                   ncftp-3.2.5 | 1 
                   attr-2.4.47 | 1 
                 distcc-2.18.3 | 1 
                 libevas-1.7.7 | 1 
                 fdk-aac-0.1.1 | 1 
               w_scan-20130331 | 1 
                 rt-tests-0.83 | 1 
                      icu-51.2 | 1 
                 cairo-1.12.10 | 1 
        host-util-linux-2.22.2 | 1 

Detail of failures
===================

       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/49444920e7f6462692f8db8125ad60033b67a9eb/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/ea2a464db9ab0d2b863d1adaeae92373ba3eee90/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/63e5e8e02b96cdaa0114e3ed2ad79d8be9413c3c/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/12ea3dda957d5931cd151de21eb2133f50c9fba4/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/a746e5487b2927585d69ebc5aac60e6f85caedad/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/30c50ae74c406ee0060a3c1f54c4ac6bd581e345/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/a811b16afa07bc7111b44f697dd0fb2a87337537/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/7373d37b1f59a256b69074984ac0abfe103b05ad/
       arm |                  distcc-2.18.3 | NOK | http://autobuild.buildroot.net/results/8234ce6939214e6ceb4d42ccafd3e6d8926fb2e4/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/23086d50fc5c05435c74eb62e363eb584e465933/
       arm |         host-util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/c43268336b4be7f853f43c56ca3bbe2de17bb4e6/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/7ff19f88ef27941f2a19111616d554272e13718e/
  mips64el |             kismet-2013-03-R1b | NOK | http://autobuild.buildroot.net/results/68a15e188f7d6345eabb7725a97e6ec594675d39/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/cee89c19c00c635fb8a6b2a3e96b5972afb00d98/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/fcaa6a67d6c5338b7a95db75dad84a6f5f0a4efa/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/da330f9245c4b106976d83f31f597ac870fadab2/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ba5c4740d61f609c176c48f05090c70f29180da5/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8a0839d912ad266a55e66abe6a1827ce1c78f568/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/0596051855aa153c1fcc2705ad4094704978eb25/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/378fcf5f957e1d66f7bcd1c4df1d1367f23cb3bf/
   powerpc |             lttng-libust-2.2.0 | NOK | http://autobuild.buildroot.net/results/0fe043a8883ef0c31fd16611640ac9d64043218b/
       arc |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/f89b9192bbced5863e5eb638ca10341a1a0317d8/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/9a7f6fb2452254a538aa590c777ef99774d337cd/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/028c3bb406887a7562fa9b0df6948a60daaac011/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/845c5d59e807894174887bbfe084f6f7051bf147/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/b73af0e2072f22671f846896420ab22bc9855ac9/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/8c51485ee802e44f565fb650d6d7816d6ba08e75/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/0fac6937a6fc9fc8ce4318b3f9bad5b60eecf4ee/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/f2b9fe94c3ee94af7095942484f8214469897e9a/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/feb74f4faabe50f174f2ac876a3c6692af5c7bce/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/5a761f63bb690d190a428935ff0c62fb3f5527ea/
   aarch64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/a48c8bd4e69928b87cb58bc8f5594148a0bfe48e/
    x86_64 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/ddd57fe7c229c909d9158ac93ab1ce38e8baa8c6/
   powerpc |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/7aa7f3ad0e763e621a87da60ece4f25e33dcbe11/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/e71caa7a5d355c2e77518bc9c4a4034c5cb34d35/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/3c3aaeba532fa05cd0c7d58fe1c7ac393aa37fae/


-- 
http://autobuild.buildroot.net
