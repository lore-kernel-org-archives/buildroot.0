From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-16
Message-ID: <20150817063012.D75A91030EF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-16
===============================

        success : 120
       failures : 30 
       timeouts : 0  
          TOTAL : 150

Classification of failures by reason
====================================

               linux-pam-1.1.8 | 3 
                busybox-1.23.2 | 2 
                  boost-1.58.0 | 2 
                   ushare-1.1a | 1 
                  mono-4.0.2.5 | 1 
              macchanger-1.6.0 | 1 
                   systemd-221 | 1 
           libvncserver-0.9.10 | 1 
                libmbim-1.12.2 | 1 
                  cppcms-1.0.4 | 1 
                   httping-2.4 | 1 
    xserver_xorg-server-1.17.2 | 1 
                openntpd-5.7p4 | 1 
             bluez5_utils-5.27 | 1 
              strongswan-5.3.2 | 1 
canfestival-7740ac6fdedc23e... | 1 
      libnetfilter_queue-1.0.2 | 1 
libubox-e88d816d6e462180f03... | 1 
             dosfstools-3.0.28 | 1 
             libselinux-2.1.13 | 1 
               protobuf-v2.5.0 | 1 
                 clapack-3.2.1 | 1 
                   lite-0.8.10 | 1 
                 mesa3d-10.6.3 | 1 
             lttng-tools-2.6.0 | 1 
                oprofile-1.0.0 | 1 

Detail of failures
===================

       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/3c9f12ac1793e4adb03d261e0b2ef5fbfb67414e/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/8f4ed1a81657a26a9f5138a5eb5f088dee6c2bbf/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/aaecaf228e272f7c344af5b181010b5f9fbbca0a/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/45221fbbeb9e331294c43b5f2da41b91d2d46ecc/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5fababe73ee568ef85364a1c3c8f5924c5d26e1c/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/75aa6e7e4f3dcd74e4b65496060328ec7bd0e747/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/71b06758c19dd98a3b56ba7723aac58642c0bf2c/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/e5c352d91ad0e10e7a8c5d427064691159c4e0b4/
      x86_64 |              dosfstools-3.0.28 | NOK | http://autobuild.buildroot.net/results/a0923d7f6d4dbae02eba4c5024bbdae3a52aa85a/
        bfin |                    httping-2.4 | NOK | http://autobuild.buildroot.net/results/d8317756f2171fa8236f6019e7dd2ccdc4220da8/
         arm |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/638dbf05b785a276a33983b0237b7cad54777b85/
         arm |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/59bd31c10a0d445d2ea56550a36920ecb2ef89ed/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/10e9891edcbca231e9f625353c3b498101a938b3/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/1933df027b519931dc0e39903d15131b7aa1f8ec/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/c523e608da5916798cca2a257ad6990d739243c1/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/a20364747553ed31e87a5001c66a463a62da74e7/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/e287bdc82baf21d56c850212717c5ecafdce5c56/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/7db3b118d2aae805daa3ecc8c981d077187c835e/
        bfin |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/27feeb0f4095e0c48aa65607cd5d6feea1a3111a/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/44dc3164b0f99ce8275c35bde61f4b68f69819df/
      x86_64 |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/7d3f5bb036039b6966682eaf59b8600849f27034/
        i686 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/fb4c130f484a707bfab399170aacaa861b74ce09/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/e2b5d9d6c26c4c90a83927aeb032a22f8b2c1916/
         sh4 |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/a27c24cb333fca4d246a8ebc18d66362f1365d28/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/a485f2171a3fcbfa2e0e5aec8e653cf88512615d/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/1ab1c0a7c61e20f07247ae19b90681c23915735c/
microblazeel |               strongswan-5.3.2 | NOK | http://autobuild.buildroot.net/results/1c32b607ed2397ed6be12f80f932cd5a689d8cf9/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/cca5b259f07ec548e509c73384348f85fdc22f5c/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/61f4b3cda025e37358c9d754e58ace84a979d089/
     aarch64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/083596d99173aa898a86a81dc5d8244c7622a177/


-- 
http://autobuild.buildroot.net
