From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-30
Message-ID: <20160131073021.8EE3A1019A6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-30
===============================

        success : 209
       failures : 80 
       timeouts : 1  
          TOTAL : 290

Classification of failures by reason
====================================

                fio-legal-info | 11
                      icu-56.1 | 8 
                  boost-1.60.0 | 7 
                   fio-fio-2.6 | 4 
               valgrind-3.11.0 | 4 
                    ruby-2.3.0 | 4 
iputils-c8ff6feaf0442f8efd9... | 3 
                      qt-4.8.7 | 3 
canfestival-7740ac6fdedc23e... | 2 
               host-efl-1.15.3 | 2 
             util-linux-2.27.1 | 2 
                 opencv3-3.0.0 | 2 
hidapi-d17db57b9d4354752e0a... | 1 
     host-google-breakpad-1373 | 1 
             netbsd-queue-1.70 | 1 
                  trinity-v1.6 | 1 
                 mesa3d-11.1.1 | 1 
              gst1-libav-1.6.3 | 1 
               libcap-ng-0.7.4 | 1 
          libpam-tacplus-1.3.9 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                  prboom-2.5.0 | 1 
                  monit-5.12.2 | 1 
                 x11vnc-0.9.13 | 1 
                collectd-5.5.1 | 1 
                   nginx-1.8.1 | 1 
                 rtptools-1.20 | 1 
                nodejs-0.10.41 | 1 
                     vlc-2.2.1 | 1 
               nfs-utils-1.3.3 | 1 
                mongrel2-1.9.2 | 1 
                 libdrm-2.4.66 | 1 
                sysklogd-1.5.1 | 1 
                 dropwatch-1.4 | 1 
                   luvi-v2.5.1 | 1 
                    sox-14.4.2 | 1 
                   glog-v0.3.4 | 1 
code/CMakeFiles/assimp.dir/... | 1 
                   redis-3.0.6 | 1 
                socat-2.0.0-b8 | 1 
libubox-e88d816d6e462180f03... | 1 

Detail of failures
===================

         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f49dc42d81a3abf5515ef68940037e34caee6a1e/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/04c4efb24f37ee95b870c8f0335187b95b7e7d4a/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d223971c94d80d5b186fa6695d7aea8dbb79d157/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2b01a079026edc0fd4373518d685b7fafff2e09b/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/97be234adbd34e76df92df36057d5b824161e40a/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/49baafc0debeaa960f8cf024e9cab64a9677842b/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fdefe50f4a1ff0888105feedbabab186ab6294cb/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/61990141cf30f429b183a2e3e38bb21ca0de335a/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/b6334362c7c163ee96dfe6feb7db622a18753399/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/3ad6d6713df74ec9928c1d95b01c3c58b54720fd/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/e84f496547a14ceb4cf545232ccc0a0456544d68/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/dc92ff44d46dc3b2049416786e20adb866943b75/
      xtensa |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/087cb3b20e05a1a08b53da89956695b2d3072a29/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/ccbca698805e8855283f8c8541c9f357abb86a3c/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/3befcba046aa32fbab4e681dac2e909d92885dd4/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/f30275efb9a0c227a42e3002768c78044d30e8d4/
         arm |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/6f7a780970aa315b82e179694ea2942be98ea4e4/
      x86_64 |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/a3596283632433831ea24c1d586f2067b034eb32/
     aarch64 |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/7297551688ea48b41d694b9d8c140f5fe1cea7d5/
    mips64el |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/715df59b4ed971a7b718c0887c3446bbd2daaf7d/
    mips64el |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/d351fb5647b7c05f0df106bf1b39f87bf862d7ed/
     aarch64 |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/a0b8524d01348343415ca9f1524fb71b81518065/
         arm |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/7f3f2cc83cab82c68596866a3184750badb9ef35/
    mips64el |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/97083d6fbdebbba969721dd805a228378f1b0674/
     powerpc |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/d8061344d0ae4f6c825adc62fc5561b4480c3c8d/
         arm |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/a23eaa28c2c09187693ebd6ed019e05f58f029de/
      mipsel |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/29152b506bda47d8850103ba42e0e9a0b405eb89/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/fdba8a6c4163d4f09cf7b9c8293c5dc5edd30cfd/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/81f1345c4a8c2793785e0935963f441a0e23a5d1/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/85a58e0e678f204b82ef7eff49d80338292cf408/
    mips64el |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/3a9d8258ff6fa0f8c673b062ec01dc4b1c45bf0d/
         arc |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/8281d39c6aa5d91186698ff7906d048bc5dfa6ec/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/4c09a8edc6dbd01818470ddcbbb07ab95adb60bf/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/a3600933f9bcada0a3845f410d44706685306d56/
         arm |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/12c0b396de5ec39ee85f5dcb17d55c23bd1997e0/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/628549fcc9649cfa84cc3a61b1ee1c84bc814b97/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/1e55d666c180609c42d715c395c9ac34187fa4dd/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/804091f9527d74281b9019f7d7f84832a7e06691/
     powerpc |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/92bb09e439e1d307ea97320409d9d2f37b08ed5c/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/a7e3ffdda2a4ee2e5c9c99124c8474045498af55/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/bbe3777d0f96bb672d848799776236d51b069e14/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/7d3af0eff4e4b3bf9f1124a39f9f4d3fe8eb787a/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/2005af7c5c6f9fc2ff8f7dce2b91988de52b23ff/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/11e030430d2f013f067edaf14be143df0e5b5a24/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/0c8323c2673a9499838cf4444b70f228ffcca74f/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/81c76e8cf67d9ec85145a0e9a7a461af8f57852d/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/8a5466b1a4cc2cf6fecb2052b0b8dd3299714736/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/1c14909344131b03ee615dda5deab6b66d5dfc2b/
      mipsel |                    luvi-v2.5.1 | NOK | http://autobuild.buildroot.net/results/3a29c6e50bc41d06a87bd8af3c10c59c7065b2b2/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/9a6a857d6354030241415dc72466ee0670089e65/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/d6eb32683ce2c08f630f90d530ce46cd5de6fe3b/
         arm |                   monit-5.12.2 | NOK | http://autobuild.buildroot.net/results/60c165a6669680fd0c3825b18d4b89adf29eb21a/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/99a12450d3b607ea229cbdecca8f994799515b6e/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/448cd2a78907dcd38c4574c42344e911a77deff3/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/b6eb628ab1463dca88a82b6cd7c22605e9562ec1/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/97c8d317a21c0ebd33ea5109fadc0fa5838ad8be/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/afae116dc80fd754bd35a0bd07287a8d869bb66f/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/937da62e48e94f188eee1501da394f471b032ebe/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/324f1dc1f3fffb2fdef47ee4066e2099e0e8a72f/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/f39ffa88973fdbff2cb05607bfaec99549e0abc2/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/73aadc8fb2fcfd6945eb6155f1d933af62993fb0/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3d0e435d3e3ff41960f5f61feba0f8c4e63836e6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/692b711f2378bba5466f5bac388fdd30b70fae1d/
       sparc |                    redis-3.0.6 | NOK | http://autobuild.buildroot.net/results/1964f1920e9893796fe6c856790542610b986a6a/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/f9d0bf2af6aa91686c7444a85300c88e867b6f56/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/86d746f2197bdd18e3b54dc39424627925a97bc4/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/0753b1758f78a624b20d13754894078129a4ba6a/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/0a0efcdb20b7ea5f408f60422cb014c2308abf36/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/90e0b5b738bc90a1c60b44c8b44c899522190805/
      x86_64 |                 socat-2.0.0-b8 | NOK | http://autobuild.buildroot.net/results/7af51ec0aa9563fc1285e63f1c0b9e2c87b4d164/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/a34e2076a293da9a2a25312f65299ceac674540a/
     powerpc |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/eb474967cae0e6ece6d7b6663581957e2a7f6e9b/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/c2eae1ff0234ebe6146965c071ad2cf972523af4/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/110174035f3b6ae7150b819e9ebe952a8bf7f3ad/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/2d441fd5c8398d6809bd14e3a097a766115ac1c2/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/d760e1844061d303eb3223cdba40c74adc7ecfe3/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/ffa3842def2fed97d407f6bd3f43e0f4b0ece5f6/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/60e9d7c6eeaab6b54a66193726986d711568a8cd/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/ffcf649bc11e318a4b07ab11220b57a2489f2d6e/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/7270a771f91a7dd0a0236af5e26d81293185ebd2/
       nios2 |                  x11vnc-0.9.13 | NOK | http://autobuild.buildroot.net/results/f2316d76af4ebb88cb550fef9ac16049f6ceff49/


-- 
http://autobuild.buildroot.net
