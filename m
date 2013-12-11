From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-10
Message-ID: <20131211073007.48D5C101511@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-10
===============================

        success : 84 
       failures : 35 
       timeouts : 2  
          TOTAL : 121

Classification of failures by reason
====================================

gpsd-327a3ef7c83c1b3b2cf7cd... | 11
                     m4-1.4.17 | 3 
                  thrift-0.9.1 | 2 
                       unknown | 2 
                   ulogd-2.0.3 | 1 
                libsigc-2.2.11 | 1 
  toolchain-external-undefined | 1 
                  nettle-2.7.1 | 1 
                aiccu-20070115 | 1 
                  dhcpcd-6.1.0 | 1 
                  avahi-0.6.31 | 1 
dtc-e4b497f367a3b2ae99cc520... | 1 
                  bonnie-1.03e | 1 
               uclibc-0.9.33.2 | 1 
               libglib2-2.38.2 | 1 
make: *** No rule to make t... | 1 
             alsa-utils-1.0.26 | 1 
              e2fsprogs-1.42.8 | 1 
                 webkit-1.11.5 | 1 
              matchbox-lib-1.9 | 1 
               qt5webkit-5.1.1 | 1 
                 ffmpeg-0.8.15 | 1 
          qt5declarative-5.1.1 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/84d734c3fae46d039f3cba77d2cff8bcae8ce66c/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/72d421b3ab6ae2f7e3a56df939323592e142174b/
     avr32 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/04543c5f991a69338ff2ee003bf04509005697ac/
    x86_64 |                   bonnie-1.03e | NOK | http://autobuild.buildroot.net/results/355ea673093580e851d027940c4577cb8612a074/
     nios2 |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/cd0c770402c2ab672521b89af25a70d704218b42/
      bfin | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/8b2521c7f9a05c2753e468b4d62573fb82e92a6a/
       arm |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/948889701b520d4db907a81812db129c3bea3795/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/4a714256846ab04ae62edf6af9892170ea5a82b7/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/6593389550990ea9c02e3cd0a59db1e74a528ec8/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/69ec1bc99bbb2603846b13ab2fac799c6863b212/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/3daa726f6124220e4ac9b194e1fd3d271f38826f/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/248fa58e7aa519a4559cd73809c0ae71524e7241/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/92df8ff907b78d8e3ecf534ed4efa579840b4f1a/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/2d51f7ae93ab82767951391cda95b0b6939c8a2a/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/99e7f30f629d4ba859662bd1ad0a22402353feca/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/76ad3b4792c376f6787fcfec3564b3545ad25670/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/1102052c0595ca117eec140953e7b2e4ec064669/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/3e9fd06ec0f7ff9b2d63e5f1dd1a311d03fbeca6/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/89bba40f581999421a147af0affaa919b05bc94b/
microblaze |                libglib2-2.38.2 | NOK | http://autobuild.buildroot.net/results/c5a1ac8c5ee7dc11b55010caf699085ee220f21d/
       arm |                 libsigc-2.2.11 | NOK | http://autobuild.buildroot.net/results/8d76ee5f89e891a0db88666be1684f92af62662d/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/15b5e8055671d9bd617e4c1e35963e6daeb8c65a/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/9c48e727a6cc00cf61a8abc20b10cd823b3fae5d/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/7276e408b2a2961d49ff659ae0458added683eb4/
       arm | make: *** No rule to make t... | NOK | http://autobuild.buildroot.net/results/9c64dd473a8096bb6343d746544997e333053e8b/
   powerpc |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/e4d071d3a0fe2d8068be38b0f13346a17fb72bc1/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9e9ea09982a6393f4b33980ebc6cb5f774fa80c6/
       arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/16a5d263212045c5a55ab190d4074ae1d7b6c381/
   powerpc |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/ae186b52ecaf0b3aae39e1486ff9aeac020f838c/
  mips64el |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/ef8afd0fea786f076a4bbece2fcbefdf5cb32ddd/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/73299d120f063ba3d51a7713024fb06fb5b6a28b/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8a04e66a594e1fe5aa042bc2ab39abd961c4dcdb/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/d34238c209cf2ef63371a598ab9218165c90f864/
       arm |                    ulogd-2.0.3 | NOK | http://autobuild.buildroot.net/results/527d9d4f42af0ffc110e4f52701df279f466a89a/
      mips |                        unknown | TIM | http://autobuild.buildroot.net/results/9d1e5d7bf0d0dca6cd5365c14926074f5c7afdf9/
  mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/f2f9da7b357faa638cd0ed034375f78446d72af6/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/871d89e8d7a2c35277c42de0407f106687ea2030/


-- 
http://autobuild.buildroot.net
