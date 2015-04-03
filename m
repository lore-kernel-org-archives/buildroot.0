From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Apr 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-02
Message-ID: <20150403063018.DFAFB100BC6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-02
===============================

        success : 210
       failures : 58 
       timeouts : 3  
          TOTAL : 271

Classification of failures by reason
====================================

  toolchain-external-undefined | 9 
      libva-intel-driver-1.5.1 | 8 
                  boost-1.57.0 | 4 
         lua-periphery-1.0.4-1 | 3 
                      qt-4.8.6 | 3 
              host-vala-0.26.2 | 3 
                libtirpc-0.2.4 | 3 
                 cdrkit-1.1.11 | 2 
              xmlstarlet-1.5.0 | 2 
                     vlc-2.1.6 | 2 
                 apache-2.4.12 | 1 
pulseview-19be0af16af83ca10... | 1 
                  fbterm-1.7.0 | 1 
                     mc-4.8.14 | 1 
           aircrack-ng-1.2-rc1 | 1 
                host-gdb-7.8.2 | 1 
janus-gateway-c632c1e9da5ff... | 1 
                    fftw-3.3.4 | 1 
                   zmqpp-3.2.0 | 1 
                   evtest-1.32 | 1 
                     gdb-7.8.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
                libevas-1.7.10 | 1 
                elfutils-0.161 | 1 
                host-ola-0.9.4 | 1 
                   squid-3.5.3 | 1 
freerdp-b21ff842ef3de583751... | 1 
                 mesa3d-10.5.1 | 1 
             host-thrift-0.9.2 | 1 
            lttng-libust-2.6.0 | 1 
                    php-5.5.23 | 1 
                     lxc-1.0.6 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/e33994313a4f811bef1d4f64363ff8920b2e44a6/
       nios2 |                  apache-2.4.12 | NOK | http://autobuild.buildroot.net/results/27c5848a344c7e16feefcbd3773b50a78d6e63f0/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/45e7ab338d7cb4949b858f921204582036497c32/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/4bd928e2998c4a2431f0d205deddf8ffc844ed01/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/5fec90b3deabbee0d6858893297da135e5118b31/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/dcd960bfb176cdf31f2d58923895b04feeab9f0a/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/aa5906ac599d91bc93f2344fdbe36cc3d4954da2/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/47408a592f08cd24caa9b0609643dd0a2564ce59/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/5010ac13183f6daef4c24768e5da6aea7f9107f1/
         arc |                    evtest-1.32 | NOK | http://autobuild.buildroot.net/results/c9e672779968e084e0a91e1d7987c1501618aa5f/
      mipsel |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/c19a1644e7c897a020f58b067b6cdfc300baa3a2/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/26de7384a134a6375d7be29df306434c30dda894/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/bf79b84e6f145be181816ce51fe2125e80af8e70/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/91db8d6f855e7b3cb6c54f88f1616d073332b7ae/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/f2a3fb755898db45b8ea5062e552d3305c1cae67/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/25f3de64baa72d5d6587eb89adef7075975baf3a/
        i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/6182a8d7333b932ff5c393b9b3ed5908def2b8dc/
         arm |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/42c665a167b5ea13e3b7228c1430965c49f96f18/
         sh4 |               host-vala-0.26.2 | NOK | http://autobuild.buildroot.net/results/dddb5dcb16a6268255ce7a1b1a64c4fc271fa538/
         arm |               host-vala-0.26.2 | NOK | http://autobuild.buildroot.net/results/4fcf472c07a27fa2299192eca6d41da7afd5b182/
         arm |               host-vala-0.26.2 | NOK | http://autobuild.buildroot.net/results/0b127b54779ac48a325648515352cf10c7246cc5/
         arc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/aac36338a5c60004eb142e3ecc92a57120a015cc/
         arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/42ed9db9a10a10c4a51e59367f0f837776d247d3/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/a12d2452dd82eab0b0463e9ddedd28877d2cb8b4/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/c5069587470b5e25fa7f7db28f169597be949ed7/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/f82a4e31795099286918f876e01fd3f6c881d18f/
        i486 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/b64ed03fc8ad4c8e876dcabaab9b2c7b9157fe10/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/6b6fe2f8a659360038989c38ba70858293279bd6/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/5b41452efdc19c24437fb4e5e96d5c872544420a/
      x86_64 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/1d497ae901d0120c2323d51d9cde8b66df4e5ed9/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/68aa46383b02c336f89616f752be122f0c0f3886/
      x86_64 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/e8b70e18d4dac7d789d443a4b1f08fe4bf523b11/
        i486 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/7c55dc1221d1c724c479dfb4fa68afddea6a0293/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/3787aadd28dc175453c2f82f8509b2fa9dc5dced/
         arm |             lttng-libust-2.6.0 | NOK | http://autobuild.buildroot.net/results/4ce0a35316cd25536b58b50f096b6f75f6e3c1c9/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/67280b634e155fff1226b793ec49d1c381ac8237/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/8cb14b272e31a8a23865de116eab79f49d9f488d/
         arm |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/be22bd2a3fb76d1a0a594cba3c9f149b5136eadd/
      mipsel |                      lxc-1.0.6 | NOK | http://autobuild.buildroot.net/results/3fb31be7601444b638f3cabfecd7d4a295d981a3/
    mips64el |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/e25587c17c2e8ddae83f9ed02541931f510bfcd6/
         arm |                  mesa3d-10.5.1 | NOK | http://autobuild.buildroot.net/results/7a5e53861bce6854265867e6e8525aabffb1d473/
     aarch64 |                     php-5.5.23 | NOK | http://autobuild.buildroot.net/results/f540e5c5efdb21bd17923950581e36bb6280c9d1/
         arm | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/42d5d272d24c269e0d689e34170defa1f74fecfe/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/feb3fd0c367f2eadd7555b5a2f65c62f842e22f6/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2b4b8a282804486c0818c940b5f8c5f80f92c287/
         arm |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/21debc300f4cf71bcb0e1855438fdbfb58484e0c/
         sh4 |                    squid-3.5.3 | TIM | http://autobuild.buildroot.net/results/4f6528dc33003a71ea8aaa60d413120355e5893c/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e4fc2f7b5964376d4dc5bf6ec78ad79c2ab7fde3/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c8745636a886a76293c9ef1140bfdce85940d4da/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c1b542cfbf165aafc05436990b3d56b40e635a69/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/45b4c656783167c1ad2bea9feeb618cdd3b7156a/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c726ffb7f78b3103c6e8994e7599b09072c06aef/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/13045c1925489db440114e9c8b30fe0c4353dbd4/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8ef5cb7505c9c833d023682693801e206a331bdb/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/3a2e2735c2bcadae813f1b1f7cb523a97dfa9f4b/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/fa81fa105a31e8b5f3564807333f94c0160d608d/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/a0eb50f18e0383b33fd4b95ebdf91db10dca86fe/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/1e911733a029e8e80c47cb55355a22ae387a43d3/
        i486 |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/ce28d2e4ac873261dccc9643672777067acf224b/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/84a3122140ce986c27e58e16cc3a7b72f8b3b782/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/ee6ef16025984a17834afbd45dec795c5049137b/


-- 
http://autobuild.buildroot.net
