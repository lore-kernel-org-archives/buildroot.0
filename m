From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  1 Jan 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-31
Message-ID: <20150101073015.E374710097E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-31
===============================

        success : 230
       failures : 27 
       timeouts : 3  
          TOTAL : 260

Classification of failures by reason
====================================

libsvgtiny-ea9d99fc8b231c22... | 4 
                  dhcpcd-6.6.7 | 3 
             bluez5_utils-5.27 | 3 
                poppler-0.24.4 | 2 
                  zeromq-4.0.5 | 2 
           libmemcached-1.0.18 | 2 
              gutenprint-5.2.9 | 1 
freerdp-440916eae2e07463912... | 1 
           libvncserver-0.9.10 | 1 
                directfb-1.6.3 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
           imagemagick-6.9.0-2 | 1 
                     rpm-5.2.0 | 1 
              wireshark-1.12.2 | 1 
checking for msg_control fi... | 1 
                  thrift-0.9.2 | 1 
                   lame-3.99.5 | 1 
          libmicrohttpd-0.9.38 | 1 
                      qt-4.8.6 | 1 
make: *** wait: No child pr... | 1 

Detail of failures
===================

         arm |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/cc937cc78b11bc503cc0c1cc8d3c2070f31a7c96/
         arm |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/1c6e33c86ba657b4b584767f3931a3d34ed60826/
         arm |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/1a8cc200496c8f91d2a6074318e78b47e3163a51/
         arm | checking for msg_control fi... | TIM | http://autobuild.buildroot.net/results/dd6a26979f93eee8a32bc1715dcd28b9416dd09e/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/d7c39cfd58b7a460d117ea71d2b26fcd212e4d01/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/844ce5987351da6162cd132b9e1653c22bd83b4f/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/3d482a770c79dd0cf5a7818572fa597094a97e77/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/4a4fc0258ef8f01c1c2e774e81f60a5a5b085201/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/04043eee1194c26fab04a66879e9e67df2b47f60/
        i686 |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/4d6ca0a3fcb27036cc57ffb8e74b24152a2232d8/
         arm |            imagemagick-6.9.0-2 | NOK | http://autobuild.buildroot.net/results/94d46b7750152f614671ab67a4eddd78077c721d/
         arc |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/12353364ecac19ae73b7cbc6d54465d9e8a6dca1/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7d1614b9b9061355dd3d5f951078ae0af5738f67/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a13cba9c753310497b93edd170408c354fb4674a/
       nios2 |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/725ad3192cee5192a6db7c1a35b8cbfd797fb68b/
         arm | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/a7836ca11a5ebaa0cb35137facbbe1aec976c01b/
        i686 | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/d38c96c62a19d95334e12f589c5c90c288e9a79e/
         arm | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/24257e9739df8f589150336cb6213812516bf465/
         arm | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/baefb397bab13b5007d1d301ba3ddbc6574864a9/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/84fe5e23a9b22f6fbd7bbb2e529238cda8037084/
      x86_64 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/e721771065e9fa9501af35d2bbd7469d7b11757e/
    mips64el |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/9b7053e54c05baa78f42d0b05ec51ccbe20c3ede/
         arm |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/88bb9fe34de15abd4a9f8cd9a2687c66899c9837/
        mips |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/f51f8821847979f942d676107ed2aa67b7594832/
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/24ed22b430dd30b3d1614015075dde2d521bdbd4/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/c590de662b89614e93b0fbb543f8d8d9127aec06/
        i686 |               wireshark-1.12.2 | TIM | http://autobuild.buildroot.net/results/3a5f27463cad700ec4c8e51b4b6d6372da933c83/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/55a30724da5ca9d15ec1a9fed0f15999b7a74a9b/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/789e98b84d540a79a96b43750a5eb7b9e79be331/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/3bb9f422f6b6e56e5f4a78a6c996349e975c7c2c/


-- 
http://autobuild.buildroot.net
