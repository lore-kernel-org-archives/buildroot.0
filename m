From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Mar 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-20
Message-ID: <20150321073018.280E2100E72@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-20
===============================

        success : 261
       failures : 65 
       timeouts : 3  
          TOTAL : 329

Classification of failures by reason
====================================

                  powertop-2.7 | 7 
                  boost-1.57.0 | 6 
               libecore-1.7.10 | 4 
                     vlc-2.1.6 | 4 
                libtirpc-0.2.4 | 4 
                 jsoncpp-1.6.0 | 4 
    libcec-libcec-2.2.0-repack | 3 
                   attr-2.4.47 | 2 
           libmemcached-1.0.18 | 2 
freerdp-b21ff842ef3de583751... | 2 
                aiccu-20070115 | 2 
                host-gdb-7.7.1 | 2 
                  python-2.7.9 | 2 
                collectd-5.4.2 | 1 
              libseccomp-2.1.1 | 1 
                     nmap-6.47 | 1 
      host-gdb-arc-2014.12-gdb | 1 
              libarchive-3.1.2 | 1 
          kobs-ng-3.0.35-4.0.0 | 1 
             sofia-sip-1.12.11 | 1 
                elfutils-0.161 | 1 
              postgresql-9.4.1 | 1 
                  libmms-0.6.2 | 1 
                    pppd-2.4.7 | 1 
                host-ola-0.9.4 | 1 
checking whether build envi... | 1 
                   perl-5.20.2 | 1 
            host-openssl-1.0.2 | 1 
make[1]: *** [librpc/gen_nd... | 1 
                  libnl-3.2.25 | 1 
                numactl-2.0.10 | 1 
                  zeromq-4.0.5 | 1 
                    qemu-2.1.2 | 1 
                   strace-4.10 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                 mesa3d-10.5.1 | 1 
               linux-pam-1.1.8 | 1 

Detail of failures
===================

         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/99a4d01c453ae09d804a894b6fc4b2ac962a6ffc/
         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/2cb4a3932341b6adc609cf283c944ce284604bc2/
         arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/7785d07614ff1d76db79c86b790f13e8ab800cba/
         arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/b3398747a31ccf4fba3559fd42c9ffe1ce398ec7/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/58405cbfcc9e7936ac70dbc5cb9a722f165c1e7c/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/7abb09ebeb4ac4813c8953e73437efe5a8f86d38/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/459e816e3d8b2e7dcade3ab23fdd010300f9b0fa/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/6227f6afe3fbeef4b4d61a0357aa9ca2552d253d/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/178df5e93602f46361ddd63eafb74619af968736/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/cc2b157d2daacb240c78c259645f412b82ee4bbe/
     powerpc | checking whether build envi... | TIM | http://autobuild.buildroot.net/results/acf636959d8b20996b8b2ddc4231c8d54ef342aa/
      xtensa |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/19e1e279c534232ca21bf4b04ca53d69294bb776/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/c71bdc53446d61c64d5c089fc493e9329704f9cb/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/73b71864a7c686e7c60d3df20434cfaa20f13349/
        sh4a | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/de20fc23e7f8af44cc1306b203cc0ea32576a31d/
      mipsel |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/9a81bd28d2fc4e18036f833e07ac095680c7e912/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/3fea1525177d7c6989894c00b23ac76906f3285f/
      xtensa |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/ecb37710f5c4539c4a4ce4a157cd346ee39162ba/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/a3b8a5ad862554ef9a6cd7f4b1f4f1e65d03c940/
        i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/bb93068d48f3e999036d8267f3ae09d98b423de5/
         arm |             host-openssl-1.0.2 | TIM | http://autobuild.buildroot.net/results/49d8a1a1fe600744861e6e1ae71843d1eaea123b/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/7fac9e4b3aa0746c860fd032a4b7b8663fb46fc8/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/20b3f33e61286891a7804352c25326ea9faccfbb/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/e482ba1d06c7fe2736ab3e79796297db8fbea187/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/1bf20d204042810bedad58dd2466bde9ae7b3fd6/
         arm |           kobs-ng-3.0.35-4.0.0 | NOK | http://autobuild.buildroot.net/results/507185fded132103081a3ddd1374f044f1be4df5/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/7aff7b1149b9cab5445bc97617f2675dd4c363c1/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/3ab146583fa57ef7d6e67530b3274df1a844c7e1/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/6e9f03a3f1f1f4f01f7d392f2930ee20ccdf7034/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/9bd7bf4c1c4e400652dbedbd4807d41397634683/
      x86_64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/631edb0ba9dbefa47f6731896fb8a847132aaeeb/
      x86_64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/fd0f6cd7d3db569154369d92fa445402b0ffb2a0/
      mipsel |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/cfc80d9de933dd94e8f3bf01eeb8e6abc78b611b/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/d0b0f9f25180ab6444bca9959dec49056a005803/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/99ea167312edff66dd48d57f4d59d69b386a927a/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a82e219deb467b7084a1b780e932ccb5df8de99f/
        sh4a |                   libmms-0.6.2 | NOK | http://autobuild.buildroot.net/results/462f859d79aeddd6103716957b1f65d0b7616f16/
      xtensa |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/873fe465af04ae8923015f23226393f0d42a98cb/
      x86_64 |               libseccomp-2.1.1 | NOK | http://autobuild.buildroot.net/results/f9896413078944d9b7c852a1919e1bb4261b40ca/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/64c446d159c2108995edcd9c40a45e52ac4d1549/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/13c66bd808c35f7f3c8be4e2f829cc7de26f86ed/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/b23b32dc67093bf328942992d6808a3d1b4ad11e/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/e820fe4a49aecac19f32a357774cbde6c09f4255/
         arc |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/8a60fbc6af9010e44a9803d6ab140a43bae0614d/
    mips64el | make[1]: *** [librpc/gen_nd... | TIM | http://autobuild.buildroot.net/results/fb452100070e8aefa4ec1966893582f48e5f3e63/
         arm |                  mesa3d-10.5.1 | NOK | http://autobuild.buildroot.net/results/1ce2509c8abb7483397c7d0f21c299095e94a254/
     powerpc |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/0f7f3a56815dc6422a466fe9b4357ace98f78e11/
        i686 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/98221cedc6719a85cc756dd748acd86aac0373b3/
     powerpc |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/5bab2c412cb85080dcd0703760de201765e25773/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/6a798e9fe7964bd57de4605ca323aaed12851aed/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/63a8df84a3a3086711f199f577036ab87ff8783d/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/2b86879117a928b6575a08888857261451a2bbb4/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/a6d77d00f329d16967338c04a6476b56c96f22c6/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/270018e2c9e3845a4015faa155325eea2cabe3d9/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/f3b744e7c50b4b4ae7b79da512d93f6e5f6d61ca/
         arc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/dde1274c83c6d130a00335d4495b9fe08363f1b1/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/02ec403b0768e89a003391668036fbc6ee8a9381/
         arc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/e676304f6010a5e44470bb3f3b908c4f166d5489/
        i686 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/6f3dc4651afe4e0b21f75677a522bab2d22ff248/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/31070898b3c09bd391b9efb58d8ab27d8331d1ac/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/4ca06468ed73b6e36015c96439d9d739de4c2bd5/
         arm |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/1d5b35b46ad65b12dbe06de25229665756516981/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/04dcff9a32410c46a3d37557c3de093d937564ea/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/4252a3842f4672a27bcf1cd6d2f0ba2b7a36a572/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/7e7d88e87ef101be2ebd87a709071b42c4e1478f/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/5ca108ddff38bdf4828682fc96bcfceda50f6401/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/28b5211c78f0781765c3be2b3e8a455bb7142e91/
     powerpc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/54179066b1cd06798546f58c655a519afca23eac/


-- 
http://autobuild.buildroot.net
