From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Mar 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-25
Message-ID: <20140326073010.66B80100F10@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-25
===============================

        success : 57 
       failures : 63 
       timeouts : 0  
          TOTAL : 120

Classification of failures by reason
====================================

libubox-bbd846ec2d72b262975... | 29
            lttng-libust-2.4.0 | 8 
              host-scons-2.3.0 | 3 
                 cairo-1.12.10 | 3 
                   slang-2.2.4 | 2 
                     wget-1.15 | 2 
               alsa-lib-1.0.26 | 1 
                  zeromq-3.2.4 | 1 
                  ffmpeg-1.2.5 | 1 
                    crda-1.1.3 | 1 
                     make-3.82 | 1 
                    gpm-1.20.7 | 1 
czmq-b5730c5f8290a611fd3b92... | 1 
              pcsc-lite-1.8.10 | 1 
             dosfstools-3.0.26 | 1 
                   picocom-1.7 | 1 
             host-mysql-5.1.73 | 1 
                    mpd-0.18.9 | 1 
      libnetfilter_queue-1.0.2 | 1 
libwebsockets-v1.22-chrome2... | 1 
jack2-37976441044d69b91d61d... | 1 
             ipsec-tools-0.8.2 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/011f7ae85c9dbd9d5a9472aec700bf799e753883/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f599d3769efafa6c9057e7584d358d5cc9ed0a20/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/025938d3cb5bb7296b195d706c237b997302a089/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/1f741021409f23815f65fcac25d18fada5ae5f2e/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/c68fd45f22505361f591e64f17ebe4448c8d5283/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/aa9b8802830d99b96f5c09cbc6f15399d66c6f11/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/3cfc0b7b7a28463f11c5fb6be32557dbfe8addfc/
       arc |                   ffmpeg-1.2.5 | NOK | http://autobuild.buildroot.net/results/064af1a8b71f0ca6a5a9fae8aa27d3071aae6628/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/635e301ff6fa253e298227d095b21e47f82da2bc/
    mipsel |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/c5b544f605d59613d2b48d9cff8a83b22c349e09/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/090f8da816379912b30b2a80bb10a51e44a00bb2/
    x86_64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/f4896a6b313a75fc58e6a0c7795eb55c7994c984/
    x86_64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/531361b391935e56d0631d77b0a592642ff01e96/
      bfin |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/f3b487f271b8c3ac52d93d3dcb27d27423eb6494/
microblazeel | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/84074e7152358973137249dd5960b48ab046097a/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/a740187dd32d29e4c9663cd1b932742ddc957f4e/
   aarch64 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/8836283d311a11bc13db7aed9bf0fdcab27d5eb6/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/dc99beefefa95b986275b19d5673770030ac266b/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/c74afeb348f323ea57dc86b6a71a22db77ce1606/
   aarch64 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/875da35f54855ba2b0a8295ccc692ec82b88057d/
    x86_64 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/ba3bad3883a29c9969fe418d830056f42ca90834/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/111b27265889695cdab73008639c617763112ee4/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/d0bed16158725beabd0b12d4088675056fcd2b42/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/24a3dbd4bfb5c9fcd79103e9f44006149da09785/
   powerpc | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/1fe14fef647004e8b745d9d523a021c5fc7fc847/
    xtensa | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/cc124a902a261b2de2e7b3ed6d59e3009351be7a/
   powerpc | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/221ba29bf4488e0aab974fe172d601af1ab8578c/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/096dc6b7a50b8fe167d5a065ca7f43efb0e95474/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/9097524518b46d28a16bc000be17b54cb844efed/
       sh4 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/6b66781690fb29b5d8ae6a0583eae3a17c5777f5/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/15faf3cd16b7de674830aab651e7373d3a9767b2/
   powerpc | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/934ffceddfdbde447cb87d8b319817ac77fdc749/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/aa6ff86b7d9efd88b826c7e0f5e7e80c95b181d7/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/65a1aa9eb4ff63824e30cecb768ab560faeb18af/
   aarch64 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/fbd0a9a475acdd26c1ab11a40591980fa4cce894/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/8ec6abd3eba09fd9c40b8e735b30f6f7ec46530d/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/07dbae10beaa2bd57758702f164c5b67582dfe76/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/b6d1e1261b1dd985854a353991f5ecc8df66ba08/
    x86_64 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/0c20e85c630c91cf2a1c9afa0848265187d20a79/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/609378f217379d76bba37c298d3fcd3fc35a858e/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/69fe1474c3d128d6ce6c8e868783dc715cad7e48/
      mips | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/a3d01a82c2644969afc22467c7258bfbe719fe95/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/c52d633df569ff1d82a8f6b9cca45058630d3495/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/d678dc547d5bc6318731c6a7fe5ca8f1ad67c9dc/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/cced445afe166d3a53c903952bb986b7d552e2f5/
      bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/9163626c696ee0c0c70557bfca86e2573486e336/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/f4b30dcc0c6a266a3ec839f075dc550a3b07144f/
      i686 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/a6bd9a3ee3a4ecb95d02640daba40ccba7114e0c/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/7786dd0d6a353e13e005c84ee40593b1e5f01125/
      i686 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/906eaec49c973875bd1daaaa90ee5025d1030fbe/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/6d9c7de47090d383ea71b2aedd3b893ce654770b/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/39dd503ac8cca501b13ed6b470a7c0d76c1235e2/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/6f1ab715cf1dad56cc73aea29f5eadfd746225fc/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/bf66ecc082f5f57667d3df71f635e5d237910a0a/
      bfin |                      make-3.82 | NOK | http://autobuild.buildroot.net/results/f0a7765a47d3a90ef60f17fce19a3f1501806219/
   powerpc |                     mpd-0.18.9 | NOK | http://autobuild.buildroot.net/results/cdc9c8fa8b25c2bfdd5e5797df4ed6bb632e5bab/
   powerpc |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/29ae8647cf8f08830b7bda23b6eb55c1fef9e83a/
      bfin |                    picocom-1.7 | NOK | http://autobuild.buildroot.net/results/9d3953e228e6a1fcf0add6db516f28afaa9d6c0e/
      i686 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/ac1414336a9c212eafa87428e875969214a931e6/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/7747073d1e36921c03e1908168c6938d9540f459/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/cfe5cf0278c079a14fcdda1dc355566b6196c9a3/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/e54ecfb5640906ccc1efa94ace00b232e5022fb8/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/3fbc69142f08003344c47788137065f3c3d641c8/


-- 
http://autobuild.buildroot.net
