From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Jan 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-06
Message-ID: <20140107073009.21265101E51@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-06
===============================

        success : 75 
       failures : 64 
       timeouts : 1  
          TOTAL : 140

Classification of failures by reason
====================================

             transmission-2.82 | 8 
              host-libxcb-1.10 | 5 
                aiccu-20070115 | 5 
             alsa-utils-1.0.26 | 4 
       xkeyboard-config-2.10.1 | 4 
              cryptsetup-1.6.3 | 4 
                      icu-51.2 | 3 
                 rt-tests-0.83 | 2 
                  zeromq-3.2.4 | 2 
libwebsockets-v1.22-chrome2... | 2 
                    ola-0.8.32 | 2 
             util-linux-2.23.2 | 1 
                 libpfm4-4.3.0 | 1 
                    tcl-8.4.19 | 1 
         qt5connectivity-5.2.0 | 1 
              e2fsprogs-1.42.9 | 1 
              checking whether | 1 
                     popt-1.16 | 1 
                elfutils-0.155 | 1 
                 cairo-1.12.10 | 1 
                  samba-3.6.22 | 1 
        ltp-testsuite-20130904 | 1 
                    libcgi-1.0 | 1 
                  libpng-1.6.8 | 1 
         host-elf2flt-20130904 | 1 
sconeserver-d58f2de88c68193... | 1 
                  thrift-0.9.1 | 1 
                 ffmpeg-0.8.15 | 1 
                 mplayer-1.1.1 | 1 
                 libxml2-2.9.1 | 1 
          enlightenment-0.17.3 | 1 
               alsa-lib-1.0.26 | 1 
             dmraid-1.0.0.rc15 | 1 
                  ltrace-0.7.3 | 1 
                       kmod-16 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/590c765f1dbcb850a6f13045a3dcaed071561a1c/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/c14d98dd1fd4edf31c3602d22fd58a0c0854911e/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/4fd4c89c170c4848afcd50899bd695308fc978c2/
    x86_64 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/63fdeb0578dfad879f83539ff09987444ef9016d/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/c8c42614f2b7fc1ad828a34be387234360cda848/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/502336475b6a7f107bae76c058319b07bd2d4501/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/e1f4b92523e8b44225aa4d4ba7cb60cc2e987cde/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/b87ee931f5d45ea80c20d4e479daa0c7287b13eb/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/baf6e456826c300898762a7fff24e3f477c75fa1/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/38b569ddb0441dac82cebbff87eb78a6dc373cac/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e434aa12bab28337ec993d0070fc545e0a94eb1c/
       arm |               checking whether | TIM | http://autobuild.buildroot.net/results/084adf3df0ce09acc2c9a4b0b32da065466b6934/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/a23f73c032c26776534ed1a5b911eebfe8830d1d/
  mips64el |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/bed37fac9bc54d3dbe956e4af632a044a5829acd/
      sh4a |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/7b522ee0f2e246b9b587708af3e42d16dbd157ae/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/a9f386b3eaab59da8d14deda438782c891ddbcfe/
       arc |              dmraid-1.0.0.rc15 | NOK | http://autobuild.buildroot.net/results/d35e96b4ceb79a0d8ffe68b3aeacc2ab2e3232b7/
     nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/6edc4c1fa77f81fbae1caf58e039c0e4a5145321/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/fb06f010f7f539767b15cc05fa54517a84f8b40c/
    xtensa |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/84fb918efbcbf1312a228a9c11608edf096b3c40/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/23a1780deec5a92785ea50c785694a9d6424bb2e/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/36f867af0e4f5a221ce1055dc3054ea48f633490/
      i686 |               host-libxcb-1.10 | NOK | http://autobuild.buildroot.net/results/13ccf5191600af144b15a075193bb72050be3bbd/
      i686 |               host-libxcb-1.10 | NOK | http://autobuild.buildroot.net/results/b9bc26f6ae5b35133fb6e2ddbfbf9ebd01006040/
      i686 |               host-libxcb-1.10 | NOK | http://autobuild.buildroot.net/results/a9228bf5495cfb4eff18ef884f3e4838e47cfac4/
      i686 |               host-libxcb-1.10 | NOK | http://autobuild.buildroot.net/results/98f8dd2d1a9f8fac3024caf5aa0ca54fcf320389/
      i686 |               host-libxcb-1.10 | NOK | http://autobuild.buildroot.net/results/8b90de9923c37d958a87d035f06b7ec72c616169/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b5b2baa982fb8c1af55e5ef1c7d4adcd055721e9/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/6064125d89cc85b2a50d6f656ca5bf38185e16a6/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/6232043a482aed35050794f8b2d4b4e8eedd4d16/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/942b6497befb34c8b6b5671268822be6999ef0b3/
      bfin |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/700f19da9b7ba6ba0073087096368e5dc2b416fa/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/e3082c56be79abef7b72b0607f53fd23a876afff/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/13ac1f40873d2f5e512706fee76967962ce463c6/
  mips64el | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/6da8b60935e3abf06ed7337318b1e12ada2f8ac0/
      i686 | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/1642a42d224692da2a6aefa052bc6f94738c9833/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/33f48d6f17ac1a2e69f3171f616ca03b25defe05/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/2e9df4445db2a76b3cef128d701b17558dd9d2a2/
     nios2 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/ecab5f084146ea703f0747b321f8789c2939c09d/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/5d88a85369485ec8781943461c6200d89079089a/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/a356bd8d79c688a38cd5e75ee9547ae8154d2f9b/
    xtensa |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/3d09178bd769c7bef8ffeb48f2790775b29417f2/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/42aaf57ca0878e088026b165e82e2ba2f140d420/
      i686 |          qt5connectivity-5.2.0 | NOK | http://autobuild.buildroot.net/results/e8f77970aebdc3f34b3fdd91243109e3d0b3ce6c/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/fa03ecc087a4b30df8b0366bb238be3d167a56d9/
       arc |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/675a6112a1558210a5cdd3348ce516a376f0c8a2/
     avr32 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/51c6ddfd99a68807dbc6acae76b93c6be28e7d79/
     avr32 | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/ccebf51324c1629df06363147aa11903fbe3dbb4/
       arc |                     tcl-8.4.19 | NOK | http://autobuild.buildroot.net/results/0460ddab19062b7064aca37d849e368bd7127e9c/
     avr32 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/7a45ecbf3f1c3ecc55ea6c1a79b59e4df83c5615/
   aarch64 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/92d6ef216b719dfb66a1c2307413090d1023c940/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/38771218f28ebf3c9768d68965a360ac65e0f9b1/
       arm |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/c2c122c9d3bfc5649577d3da2f598c08b94d007e/
       arm |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/34217bb771eb7cb939eb6470cd844d316fb0b231/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/94a4579b04c8f8581d54f6ed8fd30c92fe0af2c2/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/507e1cc9ba3fdcda888a8dffa5b93e39f594dda8/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/9aedfe7182e45513d7aa44d3d90017c492ed3234/
    x86_64 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/2a31a294e6498967e1fe81c265f77431e64ee850/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/26192859e4b9ac55f4e6ae19183848e29f4361ef/
   powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/dbdf2c1ce6ad9b1763a979a9ee6da6aaaf62815d/
   aarch64 |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/f6dca5a99a634640503852e013c8542f2ef48a16/
   powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/f11687ae661f9d3570c55a9d62a7822e667ad9ad/
   aarch64 |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/845083a37e4e165bc64df2988a47f4664a9a4b0b/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/bfaa1337c7b85f127b409c82dc22df59b5bd907b/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/9120eed7d3e11d551912feedbc0d17d09bb6fe72/


-- 
http://autobuild.buildroot.net
