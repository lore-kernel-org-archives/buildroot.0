From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 08:28:50 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-27
Message-ID: <20170228072850.98DD52077A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-27
================================

      successes : 193
       failures : 18 
       timeouts : 1  
          TOTAL : 212

Classification of failures by reason
====================================

              host-cmake-3.6.3 | 3 
                 opencv-2.4.13 | 2 
                 qt5base-5.8.0 | 2 
               domoticz-3.5877 | 1 
                gst-omx-1.10.4 | 1 
             libsidplay2-2.1.1 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.3 | 1 
make[7]: *** Waiting for un... | 1 
                 mplayer-1.3.0 | 1 
                   ncftp-3.2.6 | 1 
               nfs-utils-1.3.3 | 1 
               qt5webkit-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  samba4-4.5.5 | 1 


Detail of failures
===================

 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/a8964f1472883e8925220ad35517d9f01f4d87a9
        or1k |                 gst-omx-1.10.4 | NOK | http://autobuild.buildroot.net/results/b30a2d70da791d795ecaee930b357337f896153e
        m68k |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/c718533f0c27bcdeca0ae5c40bcee56e36a3651e
         arm |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/e98676004002e359ec9ee292ef90b4910605a961
        i686 |               host-cmake-3.6.3 | NOK | http://autobuild.buildroot.net/results/1943f15bb41dcffce62b5e8ca08b307095e4a984
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/1f6a42bfece24e09c9c7f4078d549ec5c099c89d
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/bf172b535cc0a2408afc4bfc265df7ec0ee18d31
     powerpc |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/5b5f04aea886cf839e1cf4cc5160cdf3bf135afb
microblazeel | make[7]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/f4a52b725e19652a081d95e9802737b7d97cc50d
        or1k |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ce81a0cbc4624dc039de90e9d6cffcd55dae5678
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/4bc4d850d995694535883e34fd3d067810fe2f8c
microblazeel |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/12f09673443fa400d53c939f5e5d28a8d5cb71f6
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/d59427e1b9f82841397c3365fe767146ddb22476
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/f9002042f704aa2bf884e304e964a9e21a8512b6
   powerpc64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/14f8c436b184192681fb79c7f0c0d0daa35f867b
   powerpc64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/7180ad7d7e78f1c3ce6a1f83a5a8fcc5e0ac03a2
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/66109f311059a4061fc2873a4d6495df02f3310a
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/80db8897e4991274fd4793cbb9fc76a0023e37a0
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/e7a973651eb45fdea9e005fcf9a260305edc8e73

-- 
http://autobuild.buildroot.net
