From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Feb 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-16
Message-ID: <20150217073016.9F5601017A8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-16
===============================

        success : 339
       failures : 20 
       timeouts : 6  
          TOTAL : 365

Classification of failures by reason
====================================

                      qt-4.8.6 | 2 
        gst1-plugins-bad-1.4.5 | 2 
                 webkit-1.11.5 | 2 
                  thrift-0.9.2 | 2 
                libsrtp-v1.5.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                 gnutls-3.3.12 | 1 
               libcap-ng-0.7.4 | 1 
                    olsr-0.6.8 | 1 
               alsa-lib-1.0.28 | 1 
               host-qemu-2.1.2 | 1 
                    fltk-1.3.2 | 1 
                  zeromq-4.0.5 | 1 
mjpg-streamer-730b5bcdc378b... | 1 
            gst-ffmpeg-0.10.13 | 1 
       opentyrian-2.1.20130907 | 1 
               wvstreams-4.6.1 | 1 
    host-protobuf-c-v1.0.0-rc1 | 1 
            lttng-libust-2.5.1 | 1 
             fxload-2008_10_13 | 1 
                     rpm-5.2.0 | 1 
                libevas-1.7.10 | 1 

Detail of failures
===================

        i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/553c334220e86218b5bddcc1b0b53ce9285c5caf/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/c986d42074d0f60d3024b46fdbf30983786c078d/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/656e1fecdba2e652e609782d3289b41d0653d801/
      x86_64 |                  gnutls-3.3.12 | NOK | http://autobuild.buildroot.net/results/9c3a3781907d98225540d5bbcc6ab6d81f0a9d89/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/f7bbdd351e26740dbe034d90915b261db9f1420e/
        sh4a |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/a58899a8749016bae02ea13eb9b0cf781fa8e252/
        i686 |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/b718cbac6f61d8b304df9bf085c947ac102429c4/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | TIM | http://autobuild.buildroot.net/results/2d8c0e068a967f16a4a305240f8166fc9a4ee61d/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/bd3f76b317282b72f2c10af3fa749a069b34af50/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/8e9d761b5570610c4b107a2a0ffa9c661cf0ce54/
      xtensa |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/77acd0e431ce50884492115071ca47fdfb3b6f22/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/6d454d60adf5977d1b283e1bf6a3d30b822220fe/
         arm |             lttng-libust-2.5.1 | NOK | http://autobuild.buildroot.net/results/12417ea5faff9b83ab52d6336f738c762f34de41/
      mipsel | mjpg-streamer-730b5bcdc378b... | NOK | http://autobuild.buildroot.net/results/cd52b739370d57b5ecbc6472b8c7f1126700e85f/
         arm |                     olsr-0.6.8 | NOK | http://autobuild.buildroot.net/results/e7aabfc9e80bd36958c6deeb5b02d5ef97629ae4/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/188bc0bd222024c3ac5d2fb3697760d7f83c076c/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2aeddf703d169637636c10ec6040c493f7bf8fba/
     powerpc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/63a42063ad155adbddd34e4d9cb4401bfa773c36/
         arm |                      rpm-5.2.0 | TIM | http://autobuild.buildroot.net/results/1d090c6fcf34ec98716aec99ed16883e7fb05986/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/09d140cf468c8128a20198f6c7b513401eed72c0/
        i686 |                   thrift-0.9.2 | TIM | http://autobuild.buildroot.net/results/a09ecd76d5f1e13251d559587d33b6c4eb5067ce/
      x86_64 |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/ed85269ef26153f2f2dbe76c46898ad055818532/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/c00e8aecec4894993b77aa3cb7b40f975b74321e/
     powerpc |                wvstreams-4.6.1 | TIM | http://autobuild.buildroot.net/results/6923b6ca4850daa9e3ba175ae492a88d093a227d/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/25bc11f949bbc18ff91740b0572b547e8ab5479b/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/af15a5f3584f211c0e422e1be094432808341622/


-- 
http://autobuild.buildroot.net
