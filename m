From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-18
Message-ID: <20150319073018.35B45100D3A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-18
===============================

        success : 243
       failures : 59 
       timeouts : 3  
          TOTAL : 305

Classification of failures by reason
====================================

              postgresql-9.4.1 | 7 
                   attr-2.4.47 | 4 
         lua-periphery-1.0.4-1 | 4 
                  boost-1.57.0 | 4 
freerdp-b21ff842ef3de583751... | 4 
                  libnl-3.2.25 | 3 
   libnetfilter_cthelper-1.0.0 | 2 
               linux-pam-1.1.8 | 2 
                 jsoncpp-1.6.0 | 2 
                  libv4l-1.6.2 | 2 
      host-gdb-arc-2014.12-gdb | 2 
                    vde2-2.3.2 | 1 
                host-ola-0.9.4 | 1 
         conntrack-tools-1.4.2 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
      kismet-Kismet-2014-02-R1 | 1 
                host-gdb-7.7.1 | 1 
    libcec-libcec-2.2.0-repack | 1 
               libsigsegv-2.10 | 1 
trinity-c8c41f99500b5854c20... | 1 
               host-qemu-2.1.2 | 1 
                     vlc-2.1.6 | 1 
                   strace-4.10 | 1 
                  python-2.7.9 | 1 
             armadillo-4.000.4 | 1 
           libmemcached-1.0.18 | 1 
                    qemu-2.1.2 | 1 
                    fftw-3.3.4 | 1 
                collectd-5.4.2 | 1 
checking for isatty... samb... | 1 
                libtirpc-0.2.4 | 1 
                     gdb-7.7.1 | 1 
janus-gateway-c632c1e9da5ff... | 1 
                libgtk3-3.14.5 | 1 
                   evtest-1.32 | 1 
                 cdrkit-1.1.11 | 1 
       erlang-p1-iconv-dff5ee5 | 1 

Detail of failures
===================

         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/5f153a33ef56425376f5bdd66dfdbb7cf8b27ba5/
         arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/d74a90ea3577192358c9214cc6a38effc532a8d3/
         arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/65437ab4b7e5b39197a43894cb6db272c5990abd/
         arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/5efe068abdb238fb5575810a0aa2c25f6c6a7fc0/
         arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/d20c16c3ac9e3c0a3fbb97f9f92b537a29f964ed/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/479bdbc12b194faa20b55e3049a4ddf17e3e5b92/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/bff85bbfb9a097b3ac8fd8b4644a2f3dc60d29da/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/afbaa218a257a9171caf4d8793d09c05d937e1fd/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/8229f6d1b94d0ee17dd201ceee52f661500975c9/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/f236ecfa638ebabe0c2357b4d22c359dfefb0ad6/
         arm | checking for isatty... samb... | TIM | http://autobuild.buildroot.net/results/9c56ec25ad5e8910774dd127d1002d0821ee6c45/
        i686 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/ce56e5d3ef28c39dbfbe736a6390849382dc0ba3/
     powerpc |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/d4db70fa07225616a4a429d649920e469c7148b6/
     powerpc |        erlang-p1-iconv-dff5ee5 | TIM | http://autobuild.buildroot.net/results/7ae1f8e0b147c128288da412bdb0ea55d86b35dd/
         arc |                    evtest-1.32 | NOK | http://autobuild.buildroot.net/results/0fd36a0d79c4d82aedebb5aca8d3ce4214b1ed61/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/282a8855ced48a943069ad4f0f67a18d1a9e1208/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/cbdeabd809660bafa30ea18d5781fc6560a169e0/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/06e71e916acaa47df007a8189cfd9cc30f68e241/
      x86_64 | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/1148cbe88fe59f251d6b36e7a97461d56f4c65d9/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/1cba56fa9eb5e5286cd898aa14e09c7376beeb75/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/476bf930856029a6dbed82fe7c9dc243db8ab598/
     aarch64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/2fcf1a40a08baf881fdbccd070b1a1a6c89127e1/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/5f16f2d3e5fb13d97b4d2fb708a6a397311512aa/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/1d9b60c755ed2659016ad70a60036a7c37bf22d3/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/1bb7dd8b7b21c05012e0a9257fe923670e8908f1/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/7cb86945556df991581d8a7ec8836588df143bca/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/ad57b2dc812942bb772c408eb41f65b88b2ff7d0/
         arc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/a0f7f5ac3e5fbf65af791f0d8866224f5f6748f6/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/1e54ce1944de791aeec02d53b7d3bb80412d0323/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/9e0817dea065efb74ab3948d2acadab14581f87e/
      mipsel |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/97b3333a46463fe2b4c3b9593be572b28de1ff81/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/7c65e371b0a7eaf1d814e3edadc6bb34696b0a7c/
     powerpc |                 libgtk3-3.14.5 | NOK | http://autobuild.buildroot.net/results/a0318e95d94e02f9843222fdf93f0e09755f65ff/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/3aa6852270c22c1d4433df619882314066a90849/
    mips64el |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/c7884e7c1f77b679fbc8e36f3bd3f051ca909631/
      xtensa |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/fb08cf7b50fe214f98bc7945f9b652b145e34093/
      xtensa |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/97515d82494856b824505e1f7425e2436f9c106f/
         arm |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/0134d90f295d622621c9bf63dcb7c536b64b7cb0/
      xtensa |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/3a9b76acadbea1d7725e2d207bac5e2d17e21225/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/2eca82f28eb56bb5b7554bd8e67a6605e7018627/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/253dbe6719bd7bf81766eecdcabe4090372e44e5/
         arm |                   libv4l-1.6.2 | NOK | http://autobuild.buildroot.net/results/b747e779eb0e289ba269e547fab5cb764c0647e2/
         arm |                   libv4l-1.6.2 | NOK | http://autobuild.buildroot.net/results/bb09815261ae5222a4b972ee2a189d4f98d5431a/
         arc |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/ffa6a95b973037f37f014b4e2c878e2453ef94bd/
         arc |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/cf741ade9b2855c6ac5dc2db07cdda5c65986ce2/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/901c2d922ea4d126bf6cb1f4e36324601e3a4664/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/4d795b723facfde23792e5e2a0c170902d89c621/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/a97d1bda93b5fa9ce975145b82a752c957c24cab/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/f01e4aa07856db6b7bb63ca07eac1ed0987f3e7f/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/745ad42bb99770e49a842ca812f798c350e9bf2e/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/0b12a3aa4160aa5a60328050973eff56717aca59/
         arc |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/050a799f2e9e864e02cf75b2a5697ece215ab0a2/
         arc |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/4a1cf5721af631e15e076a5bcdd8676839c2a98d/
         arc |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/8ea59872bd68d302a11681426a47c70d9aa1475f/
         arc |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/9b20513253fa68a3eb5588464a206092bb45e82d/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/6f1cb7c377439fb4eb358d9fcb46db29bff2ab78/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/8c61dc38ec8d6a38f54d0326dd85f5d867216391/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/654e6edee611c2f6ba75b365763c902b04aaf4d5/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/277040725e8992833618fa77172113c8fdbaafa2/
      mipsel | trinity-c8c41f99500b5854c20... | NOK | http://autobuild.buildroot.net/results/f9ef222ce1eee07406a7d2ce44412bf7ca017220/
         arm |                     vde2-2.3.2 | TIM | http://autobuild.buildroot.net/results/d1ffbd111f2e9c6d0bffc055ed850d37079b826f/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/880e1b9ad87051c8126a487ca1aa76d7b6f37b04/


-- 
http://autobuild.buildroot.net
