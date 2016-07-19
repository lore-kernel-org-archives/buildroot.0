From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jul 2016 08:30:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-18
Message-ID: <20160719063028.CEC01102363@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-18
===============================

        success : 134
       failures : 82 
       timeouts : 2  
          TOTAL : 218

Classification of failures by reason
====================================

                  nginx-1.10.1 | 6 
           uboot-tools-2016.07 | 5 
                  libsepol-2.5 | 3 
             transmission-2.92 | 3 
docker-containerd-1b3a81545... | 2 
               libcap-ng-0.7.7 | 2 
openblas-f04af36ad0e85b64f1... | 2 
      host-uboot-tools-2016.07 | 2 
              lirc-tools-0.9.4 | 2 
                  babeld-1.7.1 | 2 
               linux-pam-1.2.1 | 2 
                  connman-1.32 | 2 
               libdvdnav-5.0.3 | 2 
             bluez_utils-4.101 | 2 
              gnuradio-3.7.9.1 | 2 
                 lvm2-2.02.159 | 2 
           libmemcached-1.0.18 | 2 
                   dante-1.4.1 | 2 
                openmpi-1.10.2 | 1 
              libarchive-3.2.1 | 1 
qjson-ba273682a9d33a7b3090e... | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                  cairo-1.14.6 | 1 
                flannel-v0.5.5 | 1 
                pinentry-0.9.4 | 1 
                  openjpeg-2.1 | 1 
                   erlang-18.3 | 1 
psplash-14c8f7b705de944beb4... | 1 
                jemalloc-4.2.1 | 1 
                     php-7.0.8 | 1 
                   unrar-5.3.9 | 1 
                    lftp-4.7.2 | 1 
               qt5base-5.6.1-1 | 1 
                       unknown | 1 
                  gamin-0.1.10 | 1 
                openssl-1.0.2h | 1 
                 php-zmq-1.1.3 | 1 
                    mpv-0.18.0 | 1 
                 imx-uuc-0.5.1 | 1 
                rsyslog-8.19.0 | 1 
                    libiio-0.7 | 1 
                    gdb-7.10.1 | 1 
               runc-v1.0.0-rc1 | 1 
                 openocd-0.9.0 | 1 
                oprofile-1.1.0 | 1 
                 ipkg-0.99.163 | 1 
                  rt-tests-1.0 | 1 
                  multicat-2.1 | 1 
                libaio-0.3.110 | 1 
                  snmppp-3.3.5 | 1 
                  boost-1.61.0 | 1 
               ibrcommon-1.0.1 | 1 
                    cups-2.1.4 | 1 
      kismet-Kismet-2014-02-R1 | 1 
          janus-gateway-v0.1.0 | 1 
                blktrace-1.1.0 | 1 
              squeezelite-v1.8 | 1 

Detail of failures
===================

      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/0c92fe2f5977bb4e381b222d99a9b89789b53c90/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/49ba94b804d7a36c7955bc1fd098b94938559e18/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/6d288fc0544fb30918c4bd446b8df769d7277ed6/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/337c866942f6558a89317af87a076a8aa3d42937/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0be198068b94bad0d6b7701b48008f06c0eb5565/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/37ca2864a72fbf8a99d75e7727f8411a920a0678/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/517b3908c2d864ee0231608dc4894a007fcfc7d9/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/24ad64d1eaac6ca896fa2f863b14d3d5359588a6/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/f87d61d220f1f16379eb41622d6c03897c69df76/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/c6ad2386286977087853606f00409759abcca100/
        i686 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/48b9143d4a1fff651d4b7d9c8b41d02d068e48ea/
       nios2 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/4f3727df472a6c0e9bcd05b74e438a2e1781d1a1/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/084325d9f3ef796d4455fce8229c653415e6d83c/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/d9cc23ce2afc676ec506b7c9a6ce2bac08d2b0a4/
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/a63632826913b4e12254db8703a3fad30b3568c7/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/0e1a0ddd00fa4bd7cce0e527636e0fa087ae9d43/
        m68k |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/eb4389474e1b30b5c395a07a857da13a66763bdb/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/03a90c58094d1a3850bb7dbf829a62ad4b0a38a7/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/bace512dc28abd7f940008341fff48dcd63197fc/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/972643b4cc640931f10362bc26f49d2219167cdd/
      xtensa |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/072564b48f202f09fb0e2329ec144236315c57b5/
        bfin |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/82a880f2cdb4b370b421c1fdf16f4ee45de3820e/
        bfin |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/37d54e83215cf1129b47faf37a02ed22d174ddff/
         arm |                  imx-uuc-0.5.1 | NOK | http://autobuild.buildroot.net/results/a020b4a8413571bce636c3bd9dcfb5abeba8ef61/
         arm |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/964d8f694bc7d05b35411eabfbadf40bbf6337ae/
       sparc |           janus-gateway-v0.1.0 | NOK | http://autobuild.buildroot.net/results/440e9aa62446521c9151351a9e462f62706dd1ff/
         arm |                 jemalloc-4.2.1 | NOK | http://autobuild.buildroot.net/results/d40de399382f7dbe07d50c1c184feb2fbd20109b/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/ae5a662cba18340111ab17910c8faab3aac9ad84/
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/e70e2d34a25912189f30a272811d1dcb5374a0f1/
     powerpc |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/776668b199021ca3e09332df6aee57887e2c31bc/
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/8a3f2111cebbe625bce738841021427b539a33fa/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/d12954fbd460d396f255158fa127f39ff9d2be8d/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/45a596e4877b1401dbec382c1438025a9f416ec8/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/d6d450e3d5ecff1f508a12b91d7b165b7b6618a5/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/aa7d8fc007550367a7284f3cc9c289f1129b8f47/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/eb79c8d1f6f62818597e1d8db0b01ae62c213621/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/94c7c42ba99aea528a4a34834b082abc6bd640dd/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/01d67bec83d1e1ca69fc99d609d77dd40405d8a6/
microblazeel |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b15c9f265058054c297e06bb793a057efba9235c/
        i586 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/6637228c010324de8fdb05b3d0da1fb7a3e1f08a/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/eea24b5eca42f56f7604564924414ecdee3296ef/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/53258bf85ab971a5505fe600288f23cec5ab6b97/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/b53281b0edeb40d1b6fd7448988128a107b45be3/
        bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/9e3e14072d4ce41eb7c0f98ff0ac7c08d72faf2f/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/9c96101142fc8e696041170d868a8e0688e729c3/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/b4c33f11b4f853217ff9cc9c81ed1d6ea65433f1/
        i586 |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/4549e527cf61ed4f3585d3382e9974e57eff4cbb/
        i586 |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/4c95de694d4160d6ac49ccec27ccc7da368ce4dc/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/37aab4b55dfb755911609651e06c8c32eaa06e56/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/4712a41a3e1efa4e3ece96080280f2f5841b0c00/
        sh4a |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/5e0a3d5f11fbf6baa397966e40cb41fb730deb75/
    mips64el |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/d8e89f23579df80caf70b0e8fe619701ad4f09a9/
        i686 |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/2939a89a9e3cac780eff8feb51d9533f130e8074/
      xtensa |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/a152ff1ef61318281dbfb205135668c47b558c67/
        sh4a |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/21239536e7c089311781cf6eb3c6d1bd8c5705c9/
microblazeel |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/9d6a3bc2b0952358982b12d9c545210a48ceddf5/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/903bfba6b90072b07ab214956e5cc864e1270653/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/ec29d1e4b7924ed02da834859a5120534b70cbf2/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/490d1333abb67e136f72dda8330e241d706a655d/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/3cc73a803d6d618d8399bf085fb5c6373d6cb487/
        m68k |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/2f97d44f57cca514a62ceb1b30a844f7b8c73baa/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/1ddcea4e9aa0991aff76f607c737ed713d9b3a1a/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/7a82866948f316839daddbedc2d78ec87648ba1c/
         arm |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/1683d0cfd492043b195c32ad0989f507b78a3c92/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/e663cac5879e9ee9d919742e32e79accfad921f0/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/a393390b059835f032a69c4b8577a76e1d650bc1/
         arm | psplash-14c8f7b705de944beb4... | TIM | http://autobuild.buildroot.net/results/327fd904d263bb2368bf13b30a2aeb9a9ec8c1b4/
         arm | qjson-ba273682a9d33a7b3090e... | NOK | http://autobuild.buildroot.net/results/2a0544b32123fba91ac7fb7db5ceb49219d7f30a/
      x86_64 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/5c408e870a2e83ee901cdcd80a8e9698ea9b25bb/
       sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/3fd66d20f230520d8cfac29d0fc1d59502cf1ecd/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/d39964d435371803a5522fca49fe428ae0545167/
     aarch64 |                runc-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/550ac8eda34cacc9d7236b8f9f3d6923e962d80a/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/1d951269cf16a1318f7bf92e2e638fd33e8da5ae/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/cb92cb67c54951e72fdb63568adab1f91c1f86af/
      mipsel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/84482e9d1893d4c73c42249ccc1a87dda65aeeba/
        i686 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/a8b27c9b7d2eaad9058d23e99ac9b733b591a2ff/
     powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/0620fe702c42510d35afbfa58bd6e39bebc59a24/
         arm |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/707277a0c103d056809557ec51d1ac62a0f04047/
        sh4a |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/22026de084ddc39f3382eed158a6d8178a1de006/
microblazeel |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/f61c835a10c29e6786f0a5c73613474f6dc81e6b/
        sh4a |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/5ca34b92b7fcd8239fdb65ce7992883f2569f594/
microblazeel |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/f0131e6fddccf48e4fdaeccc44d57fce43ef4739/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/4b9657a8e63e7c28a3e4d5d11fcd107b8143873d/
        bfin |                    unrar-5.3.9 | NOK | http://autobuild.buildroot.net/results/8d23e6363569ecbd4af0660fa5523b0869e6cf50/


-- 
http://autobuild.buildroot.net
