From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 May 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-12
Message-ID: <20150513063016.7B76D101561@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-12
===============================

        success : 331
       failures : 27 
       timeouts : 0  
          TOTAL : 358

Classification of failures by reason
====================================

          google-breakpad-1373 | 3 
filemq-482797b8aa30fcc9ea13... | 2 
                  snmppp-3.3.4 | 2 
      host-gdb-arc-2014.12-gdb | 2 
znc-b396cafdb249544164ed029... | 1 
               libedbus-1.7.10 | 1 
            python-pyqt-4.11.3 | 1 
                     lxc-1.0.6 | 1 
                   czmq-v3.0.0 | 1 
               harfbuzz-0.9.40 | 1 
               gptfdisk-0.8.10 | 1 
                  vsftpd-3.0.2 | 1 
           uboot-tools-2015.04 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
                 jack2-v1.9.10 | 1 
                 cdrkit-1.1.11 | 1 
               alsa-lib-1.0.29 | 1 
                     php-5.6.8 | 1 
             sofia-sip-1.12.11 | 1 
               openldap-2.4.40 | 1 
               libcap-ng-0.7.4 | 1 
                ipmiutil-2.9.5 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/de84eb982fe7fef93b032e7f93e614c8c929b2ff/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/a5e68646e988ab05726bdb4e98ebfddfdd697cb1/
      x86_64 |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/faf0bb00fccb1350afaef55f6cf14c11a5f5dc3c/
        i686 | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/7d4b3e07cb035f7bc6fa0aa15a4e670e3bd0ae8b/
      xtensa | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/63fdd5ed6bbf472cda7dda1c404d22d5139bc57f/
        bfin | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/6854ef734de9450b9afd8b1ecde7800a0eeb5257/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/09e8a8bb6a8dfcc7937934b802683178281ff90d/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/b2bfbcc922b3041ab3a1892d5c1469ec68476682/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/a07e37390eec0e7a951627301e7b2a5a1d274fbe/
        bfin |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/128700e4d27c711b6165480a48f36588efba54df/
      xtensa |                harfbuzz-0.9.40 | NOK | http://autobuild.buildroot.net/results/d010cfa294229294b77a371b64b37f1b92ce392e/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/741b228a3ab73702b718ea34b0262eede91ef814/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/25b510bd53973c47934a2feeb30e6be818dde23a/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/f606ec1fff4cea257a4c6274bc5603efdfc439ad/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b6467df952361d57c60088725f02cb6d6a0f476d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/e002e2a3bd52a3cc3b0d06625de61315d86de524/
         arc |                libedbus-1.7.10 | NOK | http://autobuild.buildroot.net/results/d0ac5d9ea2e5bfb7f11473a57762c529b6ca0cce/
      xtensa |                      lxc-1.0.6 | NOK | http://autobuild.buildroot.net/results/588dc28315a9114374f148bbc64c4ec3d7b4e295/
      xtensa |                openldap-2.4.40 | NOK | http://autobuild.buildroot.net/results/dd3821e713b7da7cde0f059409fba46371c8bc40/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/4b557a5a3b3bd2797c158cc219a315a2b1f35356/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/8128e08495afc31f52da9a8bef5de00d1f47cf5d/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/53d6c084e61809be29a5c4653540057f2991bc79/
         sh4 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/b19357b4ed0d0bb5051051d4934d2200eca94767/
        i686 |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/cad55738ad3da954b12d04cf36d3e9065f1b13d2/
        bfin |            uboot-tools-2015.04 | NOK | http://autobuild.buildroot.net/results/a9f316cd076a74b8730ce4cdcdb8176da4ed9eb3/
      mipsel |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/d710ecfa9ed0a8e3f97d2010d3dabb372485c7f2/
         arm | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/846ab83beb5fe8a4ac824d4cb2b34a4948b60a9a/


-- 
http://autobuild.buildroot.net
