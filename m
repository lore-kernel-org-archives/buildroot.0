From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Apr 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-13
Message-ID: <20160414063022.C8B23101C16@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-13
===============================

        success : 138
       failures : 49 
       timeouts : 0  
          TOTAL : 187

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 7 
                blktrace-1.1.0 | 4 
                  connman-1.31 | 3 
               valgrind-3.11.0 | 2 
                 jack2-v1.9.10 | 2 
                     vlc-2.2.2 | 2 
        host-gutenprint-5.2.11 | 1 
                    vpnc-0.5.3 | 1 
                      gd-2.1.1 | 1 
               iptraf-ng-1.1.4 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  c-icap-0.3.5 | 1 
                libgpgme-1.5.5 | 1 
           lksctp-tools-1.0.16 | 1 
                 mpg123-1.23.3 | 1 
          chocolate-doom-2.2.1 | 1 
               netplug-1.2.9.2 | 1 
                   mplayer-1.2 | 1 
             ipsec-tools-0.8.2 | 1 
                   nginx-1.8.1 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
tstools-08f6be304040e7b8476... | 1 
            webkitgtk24-2.4.10 | 1 
                 mesa3d-11.2.0 | 1 
      ca-certificates-20160104 | 1 
                      qt-4.8.7 | 1 
                    yajl-2.1.0 | 1 
                rt-tests-v0.89 | 1 
          usb_modeswitch-2.3.0 | 1 
                    cups-2.1.2 | 1 
                  boost-1.60.0 | 1 
       gadgetfs-test-undefined | 1 
                    mosh-1.2.5 | 1 
                oprofile-1.1.0 | 1 
                  quazip-0.7.1 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ac93036a9d3cc384c2b2aeb1b0369d0051821005/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/705bcf2f30d669d7ade2a9bd1d85110334ad6362/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ae24660fd8ffeac4c0f6ccf0357a6f5e3e9ae627/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/e52c68ef1a3bcd201c97a4dfbc6eb8793f5ed9cc/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e97e884417f8a3c91b9d559e281fd2bb1166620e/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/057a88179150a4f02990d7b9b0d8f2de3c9da1a3/
     aarch64 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/cdf8446d8c2c2627155d2879db224b01d4eccb51/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/ce435a029c65ccd3f6b837c5a7d40b004a683116/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/e826f03b4335187e4e6ef4c850f4a5d801767b51/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/4effa2a875680e83f67829bc0bd420ace135cca7/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/38bb576027672c0dfcb555523b0f7f987f800104/
      mipsel |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/95da341df928656401b78aae78a84f2a7d1f5a47/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/56877a502cfafdc0b07300d4b268a951accd3d34/
     powerpc |                       gd-2.1.1 | NOK | http://autobuild.buildroot.net/results/a0bef9beb854e431230204d4337ff1b3539967a2/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/3cececa68fb39be804a196ec6ddc7effea76ec26/
      xtensa | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/8ba8eabb240d9c0e87a7e10ebac34398280f63d4/
        i686 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/c1d92d222cb2020ba9c889728a2fd5f281b55c50/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d4cb3aa166c9fd47f1996b28d3f95469c094f584/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/a0db2539e9690bda635fc1f828d54fe3d1c8f060/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0b14874149ed10ab8de061f56b2ee059c75438ce/
    mips64el |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/104976afa4f10328cea13ec087bc858b5bde2239/
      x86_64 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/e379fe2b131b8a511259c87b5af50c291dbca71f/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/b589af984499c532951217eb500ff31e6655c63f/
         arc |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/a3d7ef811dc194e23151ab13f157d669077c96d3/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/3d41bc085db3e2211eb13488e577c0442d245f1e/
      xtensa |                  mpg123-1.23.3 | NOK | http://autobuild.buildroot.net/results/7c48cd8c21976d3c1606e965ab9fc38f0bc20107/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/051453c5f02e255c41c5343839612132824a997c/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/0a5cb2181b9f0bbfbfa4dff17223ed15e80fb9ec/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/b342cb5b1ba3f6f9af4c889b6572261d1176eec9/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/9d9cdac2fae3db963c4d22d31e545cbeb46f28f4/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9d7b65cfa504c5f877478facd1c3894a7bb9bb20/
         arm |                   quazip-0.7.1 | NOK | http://autobuild.buildroot.net/results/a84191942aa2dfce558d096638278c506ac1f15a/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/d77c61e14b565b9af53184fd4cc4e39b567fa5e2/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/620c829a3d1ea152eff0f68794d2fd78e16cb95d/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2f0a5ecda0ee53fc3b631113a70d21e735e20bf5/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/302ea1271645db7dc196bd68fc46e8bb2c968581/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f46b241c53fbfb346c1bdd3fa7408d54e6f84a21/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/499d449541d5736c2c8889aa1985d7b2d8324939/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2433910d5aec2a9cfef06c7cb2047d3834dd0c50/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/306242d16aae2c400bcf7c3ff54d37b78ba77e3b/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/65ef2c380ed92d12b0f43811b8f241adda183a4b/
     powerpc |           usb_modeswitch-2.3.0 | NOK | http://autobuild.buildroot.net/results/f3fa30a11b68721b81b5696b089f4a7528d580ad/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/603f35a80e89cfeed9895849a5780262af0d2fd6/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/648d4f0be91ef0df0e36c25d38387e1a1f461df2/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/3f633ad249282ff72a4a30e565d8e045ebdb1e5f/
     powerpc |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/f0d8e7510cf9067d7ff9cd451ce5bd003297ce6b/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/b24f3627f9bd203a87b48db574e54a57058158f6/
      mipsel |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/2b72877d14fdd7c70649af9cb2c0cbb3df72fee5/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/270976518073f15344307a34f033ce05b1b67ce5/


-- 
http://autobuild.buildroot.net
