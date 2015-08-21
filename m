From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Aug 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-20
Message-ID: <20150821063014.F0716100F4D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-20
===============================

        success : 189
       failures : 34 
       timeouts : 0  
          TOTAL : 223

Classification of failures by reason
====================================

       host-erlang-rebar-2.5.1 | 2 
               iptables-1.4.21 | 2 
 make[1]: *** [all] Terminated | 2 
                busybox-1.23.2 | 2 
                mongrel2-1.9.2 | 2 
    xserver_xorg-server-1.17.2 | 2 
                  connman-1.29 | 2 
             irda-utils-0.9.18 | 1 
                 lvm2-2.02.125 | 1 
                 setools-3.3.8 | 1 
                moarvm-2015.05 | 1 
               linknx-0.0.1.32 | 1 
                 qt5base-5.5.0 | 1 
                   zyre-v1.0.0 | 1 
              lbreakout2-2.6.4 | 1 
                 mesa3d-10.6.3 | 1 
                  opencv-3.0.0 | 1 
                 gnupg2-2.0.28 | 1 
                collectd-5.5.0 | 1 
                 sudo-1.8.14p3 | 1 
                  mono-4.0.2.5 | 1 
            gst-ffmpeg-0.10.13 | 1 
             lttng-tools-2.6.0 | 1 
             webkitgtk24-2.4.9 | 1 
                directfb-1.6.3 | 1 
             bluez_utils-4.101 | 1 
                    vpnc-0.5.3 | 1 

Detail of failures
===================

      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ac40edb71118eafeced18644137db4f079fb09d2/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4583eb1eae69a28b01f5f3f8d934301de2be2a6a/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/271fd39e166756b6d46474ed5dbe5188fc7a95d2/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/abd14ee858be6a97aa135314500a50900614e5bc/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/2586e8b5f659b2d2f4e9b02818d396bf9ae5685d/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/d5174b224ced00ae6ae8ead66b74638efa681bed/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/cbdd67fe0fe6fd33e1c67cd9916de240edafde8c/
      x86_64 |                  gnupg2-2.0.28 | NOK | http://autobuild.buildroot.net/results/826b165662d8fad9c14b32041176bac5f047f2bc/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/30609b58461141214abdb13772f461610b7849fe/
         arm |        host-erlang-rebar-2.5.1 | NOK | http://autobuild.buildroot.net/results/9b76975550653c3c2067345a2facce72956b049d/
     aarch64 |        host-erlang-rebar-2.5.1 | NOK | http://autobuild.buildroot.net/results/30e79fbfd3046c2ac5132f642566520fc39d7983/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/6dc2d8b5889cbd74e7df3f1999a9b9eeb7aa5eb9/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/a77774635f692317a5f13f5e65103bf01bc872bf/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/0c861137b4cfd6a9c1990bb58d43c9a1dfb96ecd/
         arm |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/906d148a474cda96b52b15edb069dc9c4b197afe/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/51a200ef505433ba1d438ae45fa411deba1215d5/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/80f0e705609c27424e8086c74093f89c3be92d59/
         arm |                  lvm2-2.02.125 | NOK | http://autobuild.buildroot.net/results/6125903af6c6f3132c97040383ca188e4a90e557/
        i686 |  make[1]: *** [all] Terminated | NOK | http://autobuild.buildroot.net/results/6212571d5ef5a366f72ad10901266722744100e3/
        i686 |  make[1]: *** [all] Terminated | NOK | http://autobuild.buildroot.net/results/022e03251b407439752d373a3fd5f4b1a2fc48b4/
         arm |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/7282dd809793ebc48b5f19903109b0eff8732958/
       sparc |                 moarvm-2015.05 | NOK | http://autobuild.buildroot.net/results/b2c5d77bfc691f406a1cfc7181ee29a015e48cc8/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/954898e6e791ae98402c06b9ef60a74ec19a13bc/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/7002a3b16805e2eaa290a8c59d79d8ee30abd4af/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/43dad533397413315d567d02fc80485bc61558f1/
         sh4 |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/400dfb1e6c7134a1b1b7ce62c5c74626711257e4/
      xtensa |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/cde3fef7f8cb1fac297eee6a1a8d8bead5f96e1d/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/29dba8327d88629c4d6b2ac824b7f4f4762f4598/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/3adfa063f2fdd78f0aa569b8811963a9ccc1d87a/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/319de9a6f21ceebf67a470af955d73adf765d5ab/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/b95a47fa3afefab88c7682083631adf6cae613a8/
         arm |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/48dced45556385e692229ab7cec11067b1d180ea/
        mips |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/b02d41caf1d2823bcf9a5634f318add693a6da54/
      mipsel |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/0ab4c6a4bb4942d51e7712073d4731d81ecb5251/


-- 
http://autobuild.buildroot.net
