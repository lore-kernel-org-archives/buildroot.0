From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-29
Message-ID: <20150330063019.E7192100F9D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-29
===============================

        success : 217
       failures : 87 
       timeouts : 4  
          TOTAL : 308

Classification of failures by reason
====================================

                  powertop-2.7 | 9 
                  boost-1.57.0 | 5 
                libtirpc-0.2.4 | 5 
                 jsoncpp-1.6.0 | 4 
                aiccu-20070115 | 4 
             bluez_utils-4.101 | 4 
freerdp-b21ff842ef3de583751... | 3 
      libva-intel-driver-1.5.1 | 3 
                host-gdb-7.7.1 | 3 
                     gdb-7.8.2 | 2 
                 libxml2-2.9.2 | 2 
                collectd-5.4.2 | 2 
                host-ola-0.9.4 | 2 
              cryptsetup-1.6.6 | 2 
                 cdrkit-1.1.11 | 2 
               batctl-2014.4.0 | 2 
pulseview-19be0af16af83ca10... | 2 
                host-gdb-7.8.2 | 2 
                    fftw-3.3.4 | 1 
            libnfnetlink-1.0.1 | 1 
         lua-periphery-1.0.4-1 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                   strace-4.10 | 1 
               alsa-lib-1.0.29 | 1 
               gptfdisk-0.8.10 | 1 
                libevas-1.7.10 | 1 
             host-thrift-0.9.2 | 1 
              postgresql-9.4.1 | 1 
                     vlc-2.1.6 | 1 
                gnuradio-3.7.5 | 1 
               libecore-1.7.10 | 1 
                   evtest-1.32 | 1 
                 clapack-3.2.1 | 1 
              pptp-linux-1.8.0 | 1 
      kismet-Kismet-2014-02-R1 | 1 
              libgeotiff-1.4.0 | 1 
                 lvm2-2.02.117 | 1 
               arptables-0.0.4 | 1 
                elfutils-0.161 | 1 
                poppler-0.24.5 | 1 
                 mesa3d-10.5.1 | 1 
                    gpm-1.20.7 | 1 
                   ncurses-5.9 | 1 
                  fbterm-1.7.0 | 1 
             host-boost-1.57.0 | 1 
                   atftp-0.7.1 | 1 
                 gnuplot-4.6.6 | 1 
      xlib_libXScrnSaver-1.2.2 | 1 
           libmemcached-1.0.18 | 1 
                    php-5.5.23 | 1 
                    wine-1.6.2 | 1 

Detail of failures
===================

     powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/17248fa7f4deaacdab9bb22a777f51209af11e60/
         arc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/bf155246563e2f6c44e18f7ee423305600a68b7e/
      xtensa |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/32a8c566604e79bf2de7d7236b49b6ab40b8cefd/
     powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/4093e4679412b50048860299dcfc301927e2cabc/
         sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/42c4edd7fff3f0dc8d14bac0dc525e84caa4ebe2/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/0acd9f20970c0477f92bf3148a616ca253166cdd/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/33ad5b2b0efce663c740ca9f546143b4ecc93e85/
         arm |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/894e1029becc8aa8d59871e6fd4bd2b3b29ef575/
         arm |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/3d8f125078c37d2edba06cc92457465f0450c54c/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/e04e6627338f8f2f2ed8400010ad6c80a5517eaf/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3fcbd3d48ed09e6c91aa789b945d8189a0c37223/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/174da0289d08c2b49d3c01ac5ff8e558cfcbe313/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/64221cbe726fe47547849fd883a2227904bd3050/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/9dbb7b32de87be67af4853e3342deccf78221a6e/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/b2d228bd8a45bd09e268e1b702f020462f77185c/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/fdc236ce7f9aa7ba4387a3ea43dbf8fd3f70fc13/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/6a0ee653bb11ede15166f4831d178f669db8058d/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/cc0fd5caa1cb1093ffd2315bd867c77763bcc55d/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/b1a3675ed7d22b472e12879022460c49b55981f8/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/e59ad67ba39d79920bf4bfdca521c1bf98436a34/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/a157b2e785a0932d620372be870ccb2f4c422e6c/
      xtensa |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/4e107c51a3805163acfda95205d95fbe46317730/
      xtensa |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/01c0ffa4bc98851fe0e5df800352933d1e4e5442/
       nios2 |               cryptsetup-1.6.6 | NOK | http://autobuild.buildroot.net/results/025f53813871b9cca1e3fbb91512daaf1a11ee44/
       nios2 |               cryptsetup-1.6.6 | NOK | http://autobuild.buildroot.net/results/2898f28b33b5a53bc68ed20b1f044c7b1e763dd8/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/e49fb5375de08c27b913e47f77f671b3326a8981/
         arc |                    evtest-1.32 | NOK | http://autobuild.buildroot.net/results/fd0c351b453f51e7c9642f8527782ffb93d67576/
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/cff5ca237c65c018178f7a0abba5733834a12f1e/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/7404484b42817a6332afb3c9f4814db7708ac696/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/51a4f1d5493cdd7f5b982425dd7b42f659539661/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/8e1479ef644f4d606ed287c1360624e6a1b8e22c/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/ba9cee1ed3fb1560c9f37a0e9d8bc3caae5a0eeb/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/8b9fbd1148e5d6d62a99352267e56b7f4a7b728b/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/8351719b268d066e9153ecf3a499847e119b52a6/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/130cf541fff1766dd46511c028ef624f9f60fcd2/
     powerpc |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/af93e4d206d77b5782e575ea6cdb72b02aa8d852/
         arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/cc34f41dc209e4a08cf00ce1288a95376288ba0b/
        bfin |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/d77f1c463285342181e96b702fd4e610789bcbac/
        i686 |              host-boost-1.57.0 | TIM | http://autobuild.buildroot.net/results/8bb943f6e3781386878722f9d9efb50ec86d2d1d/
      xtensa |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/03b66b6ed0e89e37a99d6e293a03826b8df95f46/
      xtensa |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/0ebf263b24930b5edd54d1b8d8da7197c36be232/
      xtensa |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/8e914f2e7a62850a80498fddc25b362aca2eba7c/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/03cc785a12129689e35671804f2c008650e383f2/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/9361b5889cf4222beb4a45850a613d82c8884bb5/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/e5783c3c8c2cf97e239ef58218b53eb0f5df0c21/
      x86_64 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/051c615e3609aad66e32eedcc2a59587426fb673/
        i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/0b056cee4b73227d2acfd79553e8ec748a0016a6/
     powerpc |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/a43e56726af4e3d076e26fc1cb3bb6b58bdd98be/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/2e4450012175e5fe57af17c58d6e70fe3dfa69c5/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/154c5077aff189ae9881768ce7bde58ac5cb4df6/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/d3007298080aef5f90a69327a3f0c9231bb9749c/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/540e905eb1248f659a852999da94c645525f66a8/
         arc |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/eefc83314f47f78af30181ce96b513c358c7f0d4/
      x86_64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/78a82115b8a51cf538463cc392e245cf5bbd7478/
     powerpc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/c4044816c7dd5ebd69f42ffc7dfb1c86c1228f53/
         arm |               libgeotiff-1.4.0 | TIM | http://autobuild.buildroot.net/results/71d3654d4bc5634fca4033f4582e6e97b8a4abb2/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a202dcaa3b4c3c58b8ecca3a3ed38c67f3efcd9b/
         arm |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/bf5c31897ca8458af8b23f6a514d494f2fc2a576/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/88a0e1d0f4c6ba22d1e65ee20711596029507edd/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/27626c65f3619aa075dcde4a15f79b9b78d8d752/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/fa06bd55b08d156af9aefdf11cf882ff8be56ad0/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/48eac3de9c9c45b2a0bdfaffbcb9bac877ed4cf9/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/ed811a0cab7751d63f936708333d69d1786f2baa/
      x86_64 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/76dc4b670e2131b94bd0c5cff45ccafd5e45033c/
        i486 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/d6f624baa3dde4fc4051d361ddaf98ecc5c84134/
      x86_64 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/6061216fa6e2f4323117bb6cfb2b77753a89a679/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/9932f9734876fa8610904663f299b2d1c9f537de/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/4cbe7a3851fafafc994205fbe47a331548c52b34/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/863d4a9368bcb26fa457b93a97e686c55a2ccaf7/
     powerpc |                  lvm2-2.02.117 | TIM | http://autobuild.buildroot.net/results/32f401592b26b46e686d0abad4265d4060128769/
        i686 |                  mesa3d-10.5.1 | NOK | http://autobuild.buildroot.net/results/ce45f986c3943b8ced3b15a0ebd1dc03fc7b7dcc/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/ae25c043a903f9282e98dfcb1e157ac2c396c8d9/
      x86_64 |                     php-5.5.23 | NOK | http://autobuild.buildroot.net/results/ac65b43f55e7c9cf12336ef2aa2a5a14162068c1/
        bfin |                 poppler-0.24.5 | NOK | http://autobuild.buildroot.net/results/ef0859f0aa5a12cc2bd59bff1bceef7ec05f2280/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/282f3b046bbb17ab1ab87f91297b5ab2182ba821/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e84916d6e0f1254487b17e36c81341a718f3b77c/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/25d4a8c6acc19ba26b2fa3683a0f33a85b361246/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/46a8a83ffc579770382ea89a2ad4fca445972b37/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/17c8f08def1c34bfaf724f30e6422c30dda97287/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/cf42f5a8648e60942542cf7ed17d0862e4b027f2/
        sh4a |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/f9bd4e705388d27fc9a531fe736ebec1c923cc94/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/133ed536e2264b7f6c804295e2d7f7a8da50b785/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/939ae1e1a2fec85e338ab6660b25b9ef445eff85/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5abb2cf8583ad9f2b4eb83fbd78c4d905a032992/
         arc |               pptp-linux-1.8.0 | NOK | http://autobuild.buildroot.net/results/9e58ff21c855bd8f09c999b122eca27a6ebaaca6/
         arm | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/20c7b9fec3bfd2e2681495ae37d4ee8c977ae5d6/
         arm | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/45382109d5a4e06e65ccc78b9d1d17b052642f32/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/f0ee44d3b365bff45b55df6f9298487b47d4b477/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/47bedc2a5c040e9c5a876b27fd9782176d3eec87/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/ab9c62cb5fe71595d09b07f5c2e8b2e547b55751/
    mips64el |       xlib_libXScrnSaver-1.2.2 | TIM | http://autobuild.buildroot.net/results/ae6b9798e328319b791155a8eec80d112e47216b/


-- 
http://autobuild.buildroot.net
