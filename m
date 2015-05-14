From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 May 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-13
Message-ID: <20150514063016.DE5B7100C9A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-13
===============================

        success : 317
       failures : 41 
       timeouts : 0  
          TOTAL : 358

Classification of failures by reason
====================================

                  vsftpd-3.0.2 | 7 
                  boost-1.57.0 | 5 
      host-gdb-arc-2014.12-gdb | 3 
                 rsyslog-8.9.0 | 3 
               host-mono-4.0.0 | 2 
           uboot-tools-2015.04 | 2 
                 lcdproc-0.5.7 | 2 
               libgtk3-3.14.11 | 1 
              libefreet-1.7.10 | 1 
            python-pyqt-4.11.3 | 1 
                 qt5base-5.4.1 | 1 
                   zmqpp-3.2.0 | 1 
neardal-33b54a55032b047fd88... | 1 
               mosquitto-1.4.1 | 1 
              libarchive-3.1.2 | 1 
                libupnpp-0.8.6 | 1 
               libcap-ng-0.7.4 | 1 
                   ncurses-5.9 | 1 
             sofia-sip-1.12.11 | 1 
              postgresql-9.4.1 | 1 
             alsa-utils-1.0.29 | 1 
             armadillo-4.000.4 | 1 
              xmlstarlet-1.5.0 | 1 
                  mongoose-5.6 | 1 

Detail of failures
===================

      xtensa |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/5347b57d23b44e1b011a499875ce638ed654418a/
         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/31be76d4cbc1193458d3a4cdd4a0ccc1087d313e/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/9faeba9f811bb3507861003d78eec245f8a93db9/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/46f9d84e6db10ce7cbe48653f6da4450aceceb4c/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/7852f40e6bae93f953a588bbd6902c2b1cee8a42/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/13b43105caf4d3952de70030b51f8d96cf6604ee/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/e119b1ef55c546e0d0598b85c46ceefa5c43d5a6/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ec8ad71c51939a4548b413d447c48a29d53cb988/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ca45297aa0ffbc9062ed92dc7ac070b0b33001de/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/4346e4417809f1b80b63b115137f27598b7e450d/
     powerpc |                host-mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/c72d96a9747ffd3456e86728dc08fdce39fc7273/
     powerpc |                host-mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/d855645e625e7909e38205855a9a4c66a98720e8/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/4ac625f4e888ba859a5867671664dc8d041ec9b9/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/61450e889c3912e38e52759812fbb6ce03270788/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/5f7b69a324b72dfb522a9299804c113414db348c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d136f763ca3389cdc6a404db7a4fc0cd18329955/
         arm |               libefreet-1.7.10 | NOK | http://autobuild.buildroot.net/results/4de0d4ebb92bda9904d9085b744705f109e99126/
     powerpc |                libgtk3-3.14.11 | NOK | http://autobuild.buildroot.net/results/045f75e42815e3bb1f06aa121e7917e4617e186b/
      x86_64 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/f383bf4d7572a7dd59d382cd06a9baeb37e9161c/
         arm |                   mongoose-5.6 | NOK | http://autobuild.buildroot.net/results/372515ba0a09a23237ae34024658f21c2625d6e7/
       nios2 |                mosquitto-1.4.1 | NOK | http://autobuild.buildroot.net/results/b853369452115b0c6f32c6c960af2dbdf71a74af/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/5173b841460cac17639958afe2abcef803f9eb81/
        i686 | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/586fa95149aa37df7ef430e3a47a3418e6f7ed97/
      mipsel |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/f9ed96d22e91cdba9ad92c4d4ea52e422bf1f1c9/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/d2bf71cdd0fe9b0049ba2889de89ccc36cfdc58a/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/f403a76ac0abbf8488373c0dffb4487f5d98c55d/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/d15a31eedb92bb22f0f22188913d15c93ac8d776/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/d14f8451f0488ca79ff4f131c68af83a974b3853/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/e70c54b55988a1bed0eb0bad7d0050ebf860a3a3/
      mipsel |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/d748025d17e131921d114d8baa20bab2722b26b8/
      xtensa |            uboot-tools-2015.04 | NOK | http://autobuild.buildroot.net/results/208e93e36d20df0137625c47edc44181a8ac24fa/
      x86_64 |            uboot-tools-2015.04 | NOK | http://autobuild.buildroot.net/results/9b7cedbf3eec5125385e73fbfd4988c382986be6/
      x86_64 |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/3bf7d288f77418b933d5f479c14fa3dab0e5b1ae/
      mipsel |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/90cea7c4fdb3e5af923eedf96d79594d6d02e563/
         arm |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/4be4623329f30d403b29ac77b9ce4379e530d341/
    mips64el |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/440e208a475577580be7042d52e10dda47d837ba/
         arm |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/a37fe465561a073a193ebcf8458f24738b64b296/
         arm |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/221c987a9657caefad54bcc2fe9d2d71189c94c5/
        i686 |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/3662e59003080ef1e5105d35fe8215768c2a899e/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/2d6ff7466a0626566082e98188a3e1224d1e1ad0/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/2c48cd13fc453ba399e57a3703375f4eecd65685/


-- 
http://autobuild.buildroot.net
