From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  4 Apr 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-03
Message-ID: <20140404063010.00CF61015BE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-03
===============================

        success : 68 
       failures : 46 
       timeouts : 0  
          TOTAL : 114

Classification of failures by reason
====================================

libuci-262fede3e8c8c08c1eb0... | 12
            lttng-libust-2.4.0 | 4 
                     wget-1.15 | 3 
                    crda-1.1.3 | 3 
             lttng-tools-2.4.0 | 2 
             dosfstools-3.0.26 | 2 
              host-scons-2.3.0 | 2 
    xserver_xorg-server-1.15.0 | 2 
                  zeromq-3.2.4 | 1 
                  mysql-5.1.73 | 1 
        gst1-plugins-bad-1.2.3 | 1 
               host-sdl-1.2.15 | 1 
jack2-37976441044d69b91d61d... | 1 
                    gpm-1.20.7 | 1 
                linphone-3.6.1 | 1 
                    fltk-1.3.2 | 1 
                aiccu-20070115 | 1 
libwebsockets-v1.22-chrome2... | 1 
                  python-2.7.6 | 1 
        lttng-babeltrace-1.2.1 | 1 
               vo-aacenc-0.1.3 | 1 
                   systemd-212 | 1 
                cifs-utils-6.3 | 1 
              smstools3-3.1.15 | 1 

Detail of failures
===================

     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/78e2cf7a85a8edc28e6625e1bdc024bbf00b6eb3/
       arc |                 cifs-utils-6.3 | NOK | http://autobuild.buildroot.net/results/87be851a3507fdb8b353c2ab03f1cebe63cc04e2/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/f7612c8866d0de45548488ce1b0cd93540208716/
   powerpc |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/e1544b5f0f40c7a9f10124db6737a69021543679/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/409b5158573dcdd48f0145faa667d18e56a193c4/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/6098341a311809e583991ecbad042b2220cd3bed/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/ab4616a1f55db5407401f366ee3eaa5483cb4435/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/efd53a58b5ebf59c1ca04570737eaa77115d761e/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/e92f0486f474bc416a1ac445443ba3fd80bc0b24/
       arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/56b96b045d756238a1b04c52746b0228fb4d1e0b/
microblazeel |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/7e3cb3e7588e32069dbc596bd1d351eb92474c39/
    mipsel |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/055462855acabfbbd0e60e7b1173aec252b68dda/
       arm |                host-sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/4e903aa35c05f0b80c1553330511264953d1bb04/
microblazeel | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/d3ba731d8fa6122a4be5cc2822c8f4cacfb418bf/
      i686 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/5b32841cad5f19d4ca9a75e61d7f114e43c73d07/
      i686 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/f238d77844c38b26791d68eff6b70db47b6f302d/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/6219fc47f981fde0f0fd6f8da01b235bce2d13c5/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/36e4114e705522877165dfd65782236b3d38e2c7/
  mips64el | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/98c543b3cce57b09716fcf80d30b7a6dadde4d5f/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/9e39a709941718a03f5bb5ccb45ed092150c96cb/
  mips64el | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/b38c2bc03ce1f15ee896eb357107703debcf4bf4/
    x86_64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/c18919ae26f0a2ec79f00ec7814f938f61bf5a11/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/2f9ab5a4e03d2b6fe479b22128981030d9ef3b77/
   powerpc | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/002bd5f038229e1949e7f9d93027a87cda272dd5/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/51b117ea42f66f0264d56d55be1c683ed631a881/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/ccae2efa7b0d75f9b06d80836a4f5475aea778d9/
      bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/71cf652f869d9e50c06da374fdf4456451305c60/
       arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/0d2e19d40d6d0df4048e6ebae5f77022f89ca7cb/
      i686 |         lttng-babeltrace-1.2.1 | NOK | http://autobuild.buildroot.net/results/e7ac25e658da8c0cca135e71eb864e0b1ae03172/
      i686 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/e3261e92f5ab0259f691f731fb91ced0c35b9b2b/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/2cb539fb6d05a25e1cdae4310d06880a8f3c8172/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/cc20c9159f68051e341902b90224ea29f8c9b5e8/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/1e74cd62ce917074665b9b8278c5f81a00405fbf/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/2d703d3d8b9cc486f25219c8b06788d8286c14aa/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/8861b04a058e71bcf2077a52c0c2cb9651fe47ab/
       arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/69d620057ffe6f17e719bd04f8c8afe92d1ef705/
    x86_64 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/b5cbf8509ec2a284b26828b5ac924f36fc63569b/
      bfin |               smstools3-3.1.15 | NOK | http://autobuild.buildroot.net/results/9fe7a34501a39d4a1eaaedb75ab58e7cbdbe15c5/
       arm |                    systemd-212 | NOK | http://autobuild.buildroot.net/results/3546c003a8fcbb36ef5ba29c00a96e473b927ecb/
       arm |                vo-aacenc-0.1.3 | NOK | http://autobuild.buildroot.net/results/9e1d1b9f8af016b830bfcca771c9148480dfb49d/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/7cf7133629c7215cae82768a10cd8d98923aac16/
   powerpc |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/84a6f25c4defd4d99aee68eca909dfcf2be8a187/
    mipsel |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/c0f7c801f61fdc310cde64342060b00a70155431/
    mipsel |     xserver_xorg-server-1.15.0 | NOK | http://autobuild.buildroot.net/results/de06de71b7f9e3d89d2774b3d47441972f21a12f/
      i686 |     xserver_xorg-server-1.15.0 | NOK | http://autobuild.buildroot.net/results/44e0ff16d98023e788df299727b37b6aca8ed655/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5b0fce0b7c13d1ff4e3f75faf3a7e45a42f8f5fc/


-- 
http://autobuild.buildroot.net
