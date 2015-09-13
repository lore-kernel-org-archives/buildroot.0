From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-12
Message-ID: <20150913063015.5A65A1015A6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-12
===============================

        success : 208
       failures : 62 
       timeouts : 1  
          TOTAL : 271

Classification of failures by reason
====================================

libyuv-1ebf86795cb213a37f06... | 4 
                 sudo-1.8.14p3 | 4 
                    ruby-2.2.3 | 3 
                busybox-1.23.2 | 3 
                  samba4-4.2.3 | 2 
                directfb-1.7.7 | 2 
                    ustr-1.0.4 | 2 
           qt5multimedia-5.5.0 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
            ibrdtn-tools-1.0.1 | 2 
                      qt-4.8.7 | 2 
                   perl-5.22.0 | 2 
               util-linux-2.27 | 2 
                  mono-4.0.2.5 | 2 
                  c-icap-0.3.5 | 1 
               libupnpp-0.12.1 | 1 
               ibrcommon-1.0.1 | 1 
             alsa-utils-1.0.29 | 1 
                    qemu-2.3.0 | 1 
                  gamin-0.1.10 | 1 
                  tstools-1_11 | 1 
                    ffmpeg-2.8 | 1 
                 dropwatch-1.4 | 1 
                mongrel2-1.9.2 | 1 
xdriver_xf86-video-siliconm... | 1 
ltrace-c22d359433b333937ee3... | 1 
             bluez_utils-4.101 | 1 
make[1]: *** wait: No child... | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
              strongswan-5.3.3 | 1 
net-tools-3eb367aedf1280f35... | 1 
                  libssh-0.7.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 mpg123-1.22.2 | 1 
canfestival-7740ac6fdedc23e... | 1 
            host-python-2.7.10 | 1 
               linknx-0.0.1.32 | 1 
                    iostat-2.2 | 1 
                 mesa3d-10.6.7 | 1 
             lttng-tools-2.6.0 | 1 
           libfreeimage-3.17.0 | 1 
                dbus-cpp-0.9.0 | 1 
          openpgm-5.1.118~dfsg | 1 

Detail of failures
===================

         arm |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/923501c49712c246c840d93ac594e00fc445a8c0/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ce87034515996fe064889e34d084b42820b61135/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/92bc1b1ef318881c79b60cc2d4615c110b2a24c2/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2b44b93e8e768e181064b872153a4ea5781d2fc6/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/16e6d9ebc577d756e67e35b993deb1375818160c/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/1c927750d2dd8a1eb7c51d624360ecc5f207c45c/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/95d6920ed0327d5f0f9ce33599732e0f22f87e5e/
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/cc599e989656fc4618033d6b6aa58f1defbc88a1/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/f78ad06c4a3ac9e61961b96c7ba5c376ac8814c5/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/2f15f075b86c129e86f8d1a89b0e201f2f2d9407/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/7ca5a6828f53cd26a23dbe47330a3ebf6e0c0b04/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/f5269aa4d9e83fa7484e8046e8fc94f0750d7317/
       nios2 |                     ffmpeg-2.8 | NOK | http://autobuild.buildroot.net/results/ec2be3b40617ecfe9995c8c399424bc4f0bc2896/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/02f7c6600d6e2d1365497be0a320d782d59bcff2/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/5a00750f9cf13820b406dea4d334eb5cb3e18fd9/
         arm |             host-python-2.7.10 | NOK | http://autobuild.buildroot.net/results/ab71d6c3661f987fbd4f9fbc7fb2965585c7690e/
      x86_64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/280fe3a872c05f19b0d78cc6a728ebc963cbe010/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/c1e966128385e831512a3ca974fce3d74362c9f1/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/3220c11b58c4ac8935f15906fd746fc9c04a2a2f/
         arm |                     iostat-2.2 | NOK | http://autobuild.buildroot.net/results/59e7c8a3d94d06ba52ea5034fcabd9737a5314db/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/dcc7257b3694d8bee217ee72d419476c6c8ec201/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/b6182db5b955c900a575ca431b15c7b82841de85/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/3ae06c90ba0576d81c12de228b0659d4c41429c1/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/26504b497c57b3390fedb579c0cc0d58fbb62bd9/
         arm |                libupnpp-0.12.1 | NOK | http://autobuild.buildroot.net/results/a4adac62f09575fd049aefca7ca69191280936a8/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/c328f0808a31a5ed530d95a800511ff48d191249/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/7052e4773c5f49b3a15b03bd3071c5efbfb835f0/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/d824c64f7fdc0f009be43e09e93f86092c90e9b3/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/872c59e53b1dbce640432d36fdaf6b9273eb16c1/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/0ad6a27fe80c1c7db02bef2309322f77169ae6b8/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/1f32d8388bc45d85cfb2c384f3ae3d4ec4a77481/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/28d414557605308aac57445fc5d943428835b360/
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/5715975640734f6fcc33cbc0ddb226a8ff7ce94c/
         arm |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/753b9849ca6ea63d94753c9048ab7d6e4a06871a/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/51a1aa8db291c4e4c9dd36d02c2f205b38a4e9ff/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/fdea7f93de02c743c1b947962fa7cfe659a08ad4/
       sparc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/2afe0d24a8452e4c325d9edd33e293c58409824a/
         arm |                  mpg123-1.22.2 | NOK | http://autobuild.buildroot.net/results/908b334aab585eafd21453939185f92b96b22f80/
         sh4 | net-tools-3eb367aedf1280f35... | NOK | http://autobuild.buildroot.net/results/af5b3019bd0b02723c9571ff0584fc4c16027a07/
         arm |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/5773e5bf92cd036387bb7759329a0c0fea3d7dc1/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/502e6a6280451acc48e5f500e774b2bd04c7229e/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/b32d3ee0df56fe60bf6ed063fb071e8ecbe9cf43/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/26c2fb54d991e4cc1b4855795f0a47d56d69d631/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0c5027b8a89167d7cf0eddf787a0bb9cf20a8dc4/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/258026ee0730192b01e1cb0b1f949f935fbba09d/
        i686 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/81bb602262485eb6ce8146957d88f5dc3b9b56e7/
      xtensa |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/90983ab3e0255565f26bfb768ac8f8599c33cc20/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/cc31c0bc94cc976b111752c05ec419466bc31b32/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/18f59da41e3dc4c7af8315fed5dc19488ac372e5/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/23df95845daebe2a625cda8092ec32907f697cfb/
         arm |                   samba4-4.2.3 | NOK | http://autobuild.buildroot.net/results/11f2f9cd69cbac8bf66bf48fe5a243810253ab77/
         arm |                   samba4-4.2.3 | NOK | http://autobuild.buildroot.net/results/05b88c0ccc63d01808f29215157f7f8f3d31da6a/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/b2a7365afe0458877cb91ea38a1d58f394f7ae15/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/a162913159028edd7656a965bcdee16a30d7490a/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/bac2742e432645cb040eccd8de87a8da6c1cb1dc/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/af66cf22909af7529e3736fe9babb3858904b780/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/eec292a745444ef5873e3ada77aef2d7e97a5a64/
         arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/adbab36e7f2a380ea176e079d3b5a00e3636d522/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/d88a75154bc85bee552c8407b339376f0abcc848/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/da019d14e7db958a5264b8293fa07250092c35e1/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/2cad047c301c707560e9333e416db78eb7ab91fd/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/184d3f78b574bb6e25d1998d6e986fff52a2c2e3/
         arc | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/0fa83cca54358f70e563c9bbcbbd366d82a3fb14/


-- 
http://autobuild.buildroot.net
