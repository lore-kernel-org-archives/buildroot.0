From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jun 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-26
Message-ID: <20160627063032.35B21101883@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-26
===============================

        success : 184
       failures : 91 
       timeouts : 1  
          TOTAL : 276

Classification of failures by reason
====================================

                flannel-v0.5.5 | 8 
                   efivar-0.23 | 6 
              host-libxcb-1.12 | 6 
                pulseaudio-9.0 | 5 
             bluez_utils-4.101 | 5 
                 gflags-v2.1.2 | 4 
              e2fsprogs-1.43.1 | 4 
               libdvdnav-5.0.3 | 3 
               target-finalize | 2 
              libarchive-3.2.1 | 2 
              libdvdread-5.0.3 | 2 
      kismet-Kismet-2014-02-R1 | 2 
            lttng-libust-2.7.1 | 2 
                    quota-4.01 | 2 
          libmicrohttpd-0.9.50 | 2 
                    cups-2.1.2 | 2 
                cifs-utils-6.5 | 2 
           linux-zigbee-v0.3.1 | 1 
   webrtc-audio-processing-0.3 | 1 
                 lvm2-2.02.156 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
iputils-55828d1fef3fed7f07a... | 1 
                  boost-1.61.0 | 1 
              qt5enginio-1.6.0 | 1 
                   libxcb-1.12 | 1 
                blktrace-1.1.0 | 1 
                oprofile-1.1.0 | 1 
               libcap-ng-0.7.7 | 1 
           libfastjson-v0.99.2 | 1 
                    dash-0.5.8 | 1 
                  openjpeg-2.1 | 1 
               linux-pam-1.2.1 | 1 
                 php-zmq-1.1.3 | 1 
               linknx-0.0.1.32 | 1 
                libaio-0.3.110 | 1 
                   systemd-230 | 1 
                 rpcbind-0.2.3 | 1 
               libsigsegv-2.10 | 1 
                mongrel2-1.9.2 | 1 
make[2]: *** [all-recursive... | 1 
               opencv-2.4.12.3 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   ncurses-5.9 | 1 
                 weston-1.11.0 | 1 
              micropython-v1.6 | 1 
                   zmqpp-4.1.2 | 1 
        ltp-testsuite-20160126 | 1 
                     php-7.0.7 | 1 
                   open2300-12 | 1 
                   dvblast-3.0 | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/1810dda1a4874e410e1578228e4f077e592704d7/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a781165e482af2c8330782ec6704c1cbaa45972d/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/41ba229c88b2b0c5f642f0f15a7105fa6ff71598/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ba75a36b3861e175cb4db95fd8d310642562dc62/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2777e5065c71fe683f246693641eb56d14b22570/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3d01df6a233d51814b72a9f1c2500c55d2e467a2/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/f9e7777379fedb5205c1947f5ae06808e254c183/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/e6258a7a2363ad6937d4e5128385d8b857db5791/
        m68k |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/620b35343a0733c41b88a92ccdda5e21def98737/
        m68k |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/26358f56cf2bec6e8e8f56f7fcb8d8b8869c4635/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/790ebcdddbbcbb86ebd78ed062e0b36c3a5d8310/
      xtensa |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/6f1372b81519fd2fc5eb5a6783558549d6ebc5a6/
      xtensa |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/9bf0050420f52550502bc6279d1a22ff9f7543e2/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/e6b9212a636c70da28c1a9bf42c8d19f8b7cc119/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/6b28aa4563037ba23d28e22d3ae17a71fd55d311/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/96c96668f48157413aca9f720b763a23bfba0e64/
      mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/6340dca2900cadc148295934870edb838d05d108/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/1843616098995ea2557cbdad2534d667425af5b8/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/1e85b2a1cb054e5e30dd3bf62bb58f14b9eba2b6/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/79f08425055b704bbd06956a3158211b284562ea/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6e0836044cdad87ab8164d7db51578c81043e1a1/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/ee7e2a633caac109890350442e522f90fd9c122c/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/9c67dfcdcac6728901d096143187107fbeb68d90/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/0c90e3e7ad41d21dd832f6f266af35fc19185170/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6b9f36d2d69e96dcf2e9a81e572f61513d02120f/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/aa9903280f14a9e918050663d31f8ef1ed88bdda/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/b2539c24ab6172410c9a8926217dc3a45ec9a003/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c04da50e21fe163994edfefb2874ef8fd299043c/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/13ca03e461e86e410eb17ef8ccacbac57229c719/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/178ebe1a73998735231ed7af16c58ea8e55f2fb5/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/a57c26402e47acaf67f4212f971de78000a008d7/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/ffc0d576694c33546c3b25637fe79b5649774cba/
        i686 |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/9a3d96166e1666bd06e30e7ff007d2698ba5ea14/
     powerpc |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/5d38e131c27c10f060efebc22cd9ebb7e7958b05/
     powerpc |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/0cd6b62065569f69165d205f3c3d1efffe899d1e/
        bfin |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/f90ad1b30423d5f7f0ffb84a4912400e768f8997/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/f4786fd368f75f370358ee113fa8c1d224cd012f/
      x86_64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/1cabded4ea15f62876aac73dba295da5b8cc0de3/
       sparc |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/e8c65c6b1b84d7155ec88b80da232f2e8b7eb49c/
    mips64el |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/31494e2e72237b333aad00c47e88efa552f1e4ab/
        sh4a |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/5ebd466bbaf3b2110e0193c5a50d14df27283f04/
        mips |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/84066789a6200e63091fa2276fff72df73195c62/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/05954b6275e40917a49e1d4480528d7eba488949/
       sparc | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/85a67787c9f73bf28d9458b511a29cdd98ed0708/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/5ded21a04907bfcd9b75f67036d16cf993454a0f/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/06797490847305eddf6f90fb65e658269e7a3948/
        m68k |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/980751f2cf0aa4ed513d6bf2747ad641af3c31f5/
       sparc |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/9bc6fc68de54ebdf76a9f7c0d05b4d66725956fe/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/007663f66df7039d3a5770e664b8566ae40b4eac/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/52bd81b76ffd00b3141c09f81d3777ab9900f517/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/ca66366eb25b5105eada6905e1e67a4003bc4419/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/7828669389092bbb78417c000c59a914cc43b9b6/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/0765805ac8cfb4dab336260a561b05b47eb6eccd/
         arm |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/7e8cee87d213efee2413f491b41b097ebd6eba37/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/c4e5df6e4ad254c24161b080d0a8946e3c3776b7/
         arm |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/754b1e6dc1aa19cd245e641269f1a87f2639f38d/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/4673c292187c87d2ad6c2f3a2b49da0f15cadf15/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/68a1767d4e7ec56e5c9d49888c83b68d8caa2a97/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/e2134a182eb27f8132a14587c820dd14c02bb344/
     sparc64 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/9b34ba9574e38fa95768ef52574582533d0c7857/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f128c4b2fcc74542962f2668f8fb93c285af7142/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/7966d2552aa88d64964a842a5bc793187be3878c/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/16e409138ab59dec03a75d52996e1399be32aa85/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/ab74df7ca309b961fedf401a0bc07bb3dd8f975e/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/238bd0feb238a661c4620451db346589c07a8996/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/eaaa7e4e47208f47fcba1dfb7a957ffcc51425c4/
        m68k |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/dc43c3e2d2287119687ea8bae1b29e3ccd8677c9/
microblazeel | make[2]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/bc3958f108f7f152e79ca1d7458123e6db7a949d/
         arm |               micropython-v1.6 | NOK | http://autobuild.buildroot.net/results/6d94cb2827753b3d4db9f1eceeb72cd02686dc6e/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/cdfb9f5c0d3fba86d46819f564b7b1262dbffbed/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/d4b02439a31928f4a44f7e05889938792c40c111/
        i686 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/ec4c9a45bde202dfa4dc402694b02c8b76481a1c/
microblazeel |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/2749c932348600ce22b3a9bcb0c5d6df3db1baed/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/fa66d02c46936e7d408619f1f99624e77cfbf26b/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/a5dfb729e46464be3ea8ae5c136e7e64911bd876/
        bfin |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/db677478a92493f367c56976adec0057203de4d3/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/6129b4656423ddade0797a2917cb2f4ed20bb60f/
     powerpc |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/eb78f20a2c8739bb40e236255147f44e93347f38/
        i686 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/8be346fead46718a1efbcbc4a890888589cdb733/
     powerpc |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/4ab71ab88ea000eee058aff32c1c4c44edb0abcf/
        i686 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/a23a598785b52e985b8c6972183e0257261a2706/
     powerpc |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/b9dc40128583b4c5aee4f1d0b3c3a39e614cdfb0/
        sh4a |               qt5enginio-1.6.0 | NOK | http://autobuild.buildroot.net/results/d62e55c7e0f2348a50827b538b22447845712d8e/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/2fab90b0b62e50fda26a97d507937b2732e82ee8/
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/ea5032e389b6e6a8babcf0e2269d5e7f46029387/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/eb4d29e87605cb60a91fc38d287762dca13743a3/
     powerpc |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/584d909870ee525095824901ed7d9b9e270974a6/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/f0d177dd773228325a08185ef02eb20d26b9289d/
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2686b5ecd9eb9507ef63e15c027aee115133818f/
        i686 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/d6c29f981ec2b52a916690fa3f6fc3822f74b4e0/
         arm |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/425235a00cde23caa4176c0834a23d7d010cc428/
         arm |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/746d35794725f10180b40e7fc9014212f236f328/


-- 
http://autobuild.buildroot.net
