From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-12
Message-ID: <20160213073022.3A8D9102643@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-12
===============================

        success : 198
       failures : 95 
       timeouts : 1  
          TOTAL : 294

Classification of failures by reason
====================================

                  boost-1.60.0 | 11
                pulseaudio-8.0 | 9 
                   fio-fio-2.6 | 7 
              libraw1394-2.1.1 | 5 
                 libraw-0.17.1 | 5 
                      qt-4.8.7 | 5 
                   mplayer-1.2 | 3 
                directfb-1.7.7 | 2 
                 setools-3.3.8 | 2 
             host-nodejs-5.5.0 | 2 
     host-google-breakpad-1373 | 2 
               valgrind-3.11.0 | 2 
                  cairo-1.14.4 | 2 
                oprofile-1.1.0 | 2 
                    cups-2.1.2 | 2 
iputils-c8ff6feaf0442f8efd9... | 2 
                numactl-2.0.11 | 2 
                 mesa3d-11.1.1 | 1 
make[4]: *** [all-recursive... | 1 
libwebsockets-v1.4-chrome43... | 1 
                    ustr-1.0.4 | 1 
                collectd-5.5.1 | 1 
               linknx-0.0.1.32 | 1 
                busybox-1.24.1 | 1 
                  lshw-B.02.17 | 1 
                  stunnel-5.29 | 1 
        lttng-babeltrace-1.2.4 | 1 
                   nginx-1.8.1 | 1 
 netcat-openbsd-debian_1.105-7 | 1 
                 libdrm-2.4.66 | 1 
                 igmpproxy-0.1 | 1 
               libcap-ng-0.7.4 | 1 
tvheadend-1aa0073be39119f5d... | 1 
             webkitgtk24-2.4.9 | 1 
                   erlang-17.5 | 1 
                  samba4-4.3.4 | 1 
               syslog-ng-3.7.2 | 1 
             bluez5_utils-5.37 | 1 
                     mtr-v0.86 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   hostapd-2.5 | 1 
                   luvi-v2.5.1 | 1 
               netplug-1.2.9.2 | 1 
                  connman-1.31 | 1 
                  gamin-0.1.10 | 1 
             util-linux-2.27.1 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                    ofono-1.17 | 1 

Detail of failures
===================

     sparc64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/b21ee624487955e00d8b11f986888eb947cac808/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2d6664b69aa316684dc138f1a61aaad7f3dc3138/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/626dde847a57904a44b29f1e72ce04e39362c7c3/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bb2994c8112afcd28bac23e1f59a674c2a2ae258/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2ea88b5d9fd1e345395a9c2150f62a990ef0b080/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e08bfc70a3ef78151f11654ae9a4aadcac01e72c/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/919ed25a2434401499d58f66b2475076ac88ea52/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/43bcfac691249efe8ed2478fdab4d3ab331da20e/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/696e8eae1a83718803b6deba73d9aada52ab0f6c/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9978aac453e5aa270a0b6f416d9ba39608925b54/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0f548e79261db535e5338e744a73d6ce075a058b/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/31d0ca663e22834aac5de864d40e0c9003d9403d/
     powerpc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/1e0e848cc43d6cd5e876a44e02ccf6120b7b29fb/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/1741fc3e5866c8bc8d658b3c0c05fd0ef06ac117/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/d6167c21bbc3f14063294530de111908a107c726/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/dc6a271c83261e5b46522b925bb9bab9853f07bf/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/57a99fb1d3a9a9df3ba715d8063a33cb0450fc63/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/bdf0fe5ada5369f4485a78933e3e65cbc33ba165/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/ca04d1662d53abb36129a3b3feea2b075a001f13/
        sh4a |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/cf19126d800524dc92bd9274f03d777fbdf689e5/
    mips64el |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/16fd6da90637e2a044d88c418976e171537862a3/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/a53400da483b5e81ee6980cdbecad0472b949fed/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/d244c175674e38efd20df21b02d2682540837e22/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/0e5bd8d1dbb53463722f35dff65acd6253628377/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/d598a3b6a40f9509592e5168aa535af15bf7ea4d/
     powerpc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/2bc08bd641138397a6ba586e802f265b6e663d2b/
      xtensa |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/4c434ed76ca2a95c063a5ac4b97fa9b9a4a1e151/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/1b25222541799d43f059567d6c6e19a8a7169d8a/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/0a8abde824d904d98692c0b692462e14a3370e1c/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/c54f1ed8e35098f76ef0483165289c79e7d12750/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/3b85a3bece914dd2d6141aa36d29f54109e43b1f/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/2bc694154ecb770f198d55bf6dc19e49e69d3b1f/
      x86_64 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/91943ac343241fc4c1fc3ec674043d9761cb0e83/
      x86_64 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/89877358cf6ba3cc7264ebc8f74865b994b372be/
         arm |              host-nodejs-5.5.0 | NOK | http://autobuild.buildroot.net/results/86a4661185b09f81f91267b43dfafd96a2a83944/
        i686 |              host-nodejs-5.5.0 | NOK | http://autobuild.buildroot.net/results/7e378a2301bf5f27a4bdcf12a96c13572d64a256/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/a592b25c400983888b1eea158e74c1cc9c58606d/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/109d943e3a9d47933bf449e9f7e6abb5d49f3f2a/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/a4a5ee5223199b932bd71ce7207dad7784648c4c/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/93410a4d551c81f34140ba102b81b7375d147833/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/4e2b3207fb56941aa84b5d2cd53ba91bb2c20e17/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/5f88793adcbd2ae6cbbe64a9fe932cda48c93d6f/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/a76a0609d49e478cc76848ec11aafd613880653c/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/c4577e137a524e5c730642b17ce200982c5b6723/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/39df9591506e118c8adf9ff0d9710d347aae7ab5/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/bc1d5eff753b9b6b14bbb170130e22ede148dd29/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/9349340a7ad8d695c31c6fd420e0c465cb06b32d/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/80cea6f0fea43144524a9671c8cc52e306281bbe/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/4dd643da44c057dddb8268081cde5dd4d7bf3d45/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/28294f47006755e6c07b219f845917c197502d7e/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/c31fdb0fafd668ac372fab7501be3600cb34793f/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/0c29734dab3f8f178a4a5206e5d4b57502488c45/
         arm | libwebsockets-v1.4-chrome43... | NOK | http://autobuild.buildroot.net/results/be762fef54c74bc0bff7705c3187b57839fb2792/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/41a8963072b526fe5c2334386ee5563045ba3725/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/54df3c931d615a7acaf377294b66aff47ec33449/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/2003e3bb68fa3bb5c5b08bcd9f93d8f2f68207d7/
      mipsel |                    luvi-v2.5.1 | NOK | http://autobuild.buildroot.net/results/0090d319c1743f5f2e88c036bacb609831b80432/
microblazeel | make[4]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/add594a327e150817948345571981d9e6128ba53/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/34542f45ca4d891f8cc03ded7182014c9b4e8bc4/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7e69588b418e64674fda4ec97bb5a81b61344bda/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7b412dca6c809210dac3380a72cdb24925ba95fb/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/517ea8eab12efd83a0bed5b12fad3a890668bd6e/
         arm |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/746cd6b926c402b5d01581515a0e5e2f48d559cf/
        i686 |  netcat-openbsd-debian_1.105-7 | NOK | http://autobuild.buildroot.net/results/d22c19eb0c19c91ce75ad106dc2af44d7dfb6091/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/b32d21a7fb2d0a21a252c050f303d349fbb7a650/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/87c1167187dec68a234d0b40500ab51e34661ce2/
      mipsel |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/9616f09e7cbd020134ba72853acaa28a308432a3/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/3160fb32fbb6990b0bb268524dcea02a1f6880a7/
       sparc |                     ofono-1.17 | NOK | http://autobuild.buildroot.net/results/468c45db274cce903f9da2de71e6bc140c121191/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/9262424befde9b2e150bec1a1bb4a58f5d68ca5b/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/550cce24a2dbb0bf4fd8ccc0a0d381f29cfe0626/
      mipsel |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/ff1819b5d3ad39efcb41178a6737dd78419d4322/
     sparc64 |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/e5b185d15012aec93bac4054217d5c4028a2e97b/
        sh4a |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/2d2cb8356672147d04c3ce2058ba173912da4ae5/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/1a3c1dab81f58055abf1f938d15135d9b3786ea7/
        sh4a |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/2854753da744529d3b643d4431e9915ce94e4e97/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/11a0515ac0fbc521b1450b7fba4f7d4ff1fc12e3/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/c7d31d7eeed5500c91fcbc95840c42f10e0d449f/
      mipsel |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/a748eb75e1c9bcc9633c1b7fe9f6ab7ed81766b2/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/ce07e3c0f16f2855ec7bae8e12f72d8f9e0831ae/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ff2ec8678dc9b9e2cf76eaccdb5dd6a33f20209b/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/40af06bc424c365c839a8207b1ed51b29c8a7568/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/89b46f97e2736d9337f888c761259e7bc7cdd128/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fde216e19c2a7add3b3c447dee87f50320d2c69d/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5e6940d8a34b429ded74417859f608e87d42ff49/
        i686 |                   samba4-4.3.4 | NOK | http://autobuild.buildroot.net/results/72aa26ade5093f936116da9d3a7d72c366c1f366/
      x86_64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c54ce868edbcac7a5954de9d8d111206dc677dd9/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/8807304ed274cc7ba39cb43bb19e4a80306ae042/
      mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/6d2c459465826d7cddc3770a03298dd99721c37b/
       nios2 |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/c92010ac132607a3aeaa85e2e7fb4c111bcc6ef3/
       sparc | tvheadend-1aa0073be39119f5d... | NOK | http://autobuild.buildroot.net/results/7b5a247a1f672a789f8bf1f4a3f1a06c830abd1a/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/70ee7d8c7016c18dae8222017af56eaa1febf9a3/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/985cedce498e6be99e4a19bd10606ece72c2272d/
      x86_64 |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/810548f9d873f51b6f07b839fc10b8d9274c4410/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/42d62085617b87ddb5f0b8d076c15d4bee28d04d/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/10ac406f32e292bb4bdbb4eb9c49f3aa1af9cc50/


-- 
http://autobuild.buildroot.net
