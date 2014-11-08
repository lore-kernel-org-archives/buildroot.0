From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  8 Nov 2014 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-07
Message-ID: <20141108073013.7C0431015EA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-07
===============================

        success : 168
       failures : 48 
       timeouts : 7  
          TOTAL : 223

Classification of failures by reason
====================================

                 schifra-0.0.1 | 9 
                    urg-0.8.18 | 3 
               alsa-lib-1.0.28 | 2 
                 clamav-0.98.4 | 2 
      dovecot-pigeonhole-0.4.6 | 2 
        host-gdk-pixbuf-2.30.8 | 2 
                 libssh2-1.4.3 | 2 
                      bmon-3.5 | 2 
                     radvd-2.8 | 1 
                  weston-1.6.0 | 1 
                    php-5.5.18 | 1 
                 cdrkit-1.1.11 | 1 
                  connman-1.26 | 1 
                  tstools-1_11 | 1 
                  acpid-2.0.22 | 1 
checking sys/uio.h presence... | 1 
                  zeromq-4.0.4 | 1 
                      qt-4.8.6 | 1 
                  libv4l-1.6.0 | 1 
                 webkit-1.11.5 | 1 
               host-libffi-3.1 | 1 
                  thrift-0.9.1 | 1 
                nodejs-0.10.33 | 1 
                 samba4-4.1.13 | 1 
           heirloom-mailx-12.5 | 1 
                minidlna-1.1.4 | 1 
                elfutils-0.155 | 1 
                  python-2.7.8 | 1 
               qt5webkit-5.3.2 | 1 
                       unknown | 1 
                   perl-5.20.1 | 1 
           libmemcached-1.0.18 | 1 
                rrdtool-1.2.30 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                   czmq-v3.0.0 | 1 
                   attr-2.4.47 | 1 
                 omniorb-4.1.6 | 1 
make: *** Waiting for unfin... | 1 
                    qemu-2.1.2 | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/8db92ab8933bb7f6c44c5fb8afe820cbad0912e0/
     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/dfaf36535b48554b2937f7b609c5ec68338836cb/
        i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/6d95c389e2d9e9dbcf4b864fe337a216064a3106/
      x86_64 |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/8033f1c7a6bb8d5dbac7766d751583deb5f208ed/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/caef285361f59cba4e285cc852c0f0bdf02654a2/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/2981cdcd295b6022f71d9d0930e0e4fc07aec4ec/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/a35a77477e36b902717e693f49d8b3cd20895ca7/
    mips64el | checking sys/uio.h presence... | TIM | http://autobuild.buildroot.net/results/0e6c67d1069848623ca2f62209909eadbc696d62/
         arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/c913f261e02d4b1b7b80c091477747a6fbe9b2eb/
     powerpc |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/855c4eca9f6e544a99cc901bbb3b62fd9ea608cc/
      mipsel |                   connman-1.26 | NOK | http://autobuild.buildroot.net/results/64742a1d3a07f86a7c801da5ef30892c1f760031/
         arm |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/59c5a27c5ad9de6a6ded3926e01cb04c609ec2f8/
         arm |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/3e6c258d7636fedbb87ba62069094291666e6a85/
         arc |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/410b68afece06ddb03a00245cfdc3de4d9a4e5f1/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/037bb6ef179b32b834476e485026df9c3bd5bab5/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/5b241b223191a41c41b838c047e8d7ae6ae62532/
     powerpc |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/c487a1fff7c74218a31024074aa2fd6255b6d09f/
         arm |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/576d110cb02a8bc655e227bd949bb58ae39c2e38/
microblazeel |                host-libffi-3.1 | NOK | http://autobuild.buildroot.net/results/83da9d018a9c8c60c7c470cd90b86dfaf213668c/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/19fbb1af9266b2f1531c602d2c56b7f67ce3a365/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/7e99118a0ec69378fab94958920f88c122fd99df/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/df7ff65c5f8dbaeae6e4acecb9960084e1367778/
        i686 |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/bbd34d5378354e9db7822eaae8d3c4a75a67ac23/
         arm | make: *** Waiting for unfin... | TIM | http://autobuild.buildroot.net/results/28d82be3f2ce72a1937d86e5fde57efb367d19ba/
       nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/8da85a05e2b2e471586dbcb173a2e05c7c83810d/
         arm |                 nodejs-0.10.33 | NOK | http://autobuild.buildroot.net/results/8b72b0c311f2f7f7430aca5f7cca1f7d82d1c213/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/5b2be8326891bae313ecd505847b1109aafb567d/
         arm |                    perl-5.20.1 | TIM | http://autobuild.buildroot.net/results/2298b068132f2b93b43318df0e61038054302bf3/
     aarch64 |                     php-5.5.18 | NOK | http://autobuild.buildroot.net/results/0c6682e2770b417a476c93f909d1747c553a4fd3/
     powerpc |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/8dde42bdf8adb7ed02f59800752f0653efcd8e9c/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/ef3881ee4d9aa2f3c2820de315527e6e1e955bef/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/21167ed2d9707cd8cd332500f049c64252519210/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/1b0c604907e5be912e06bac39614fb6eda6eecbf/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/90ecb38674a686a1adc33613641f0b797edbd2a0/
         arm |                 rrdtool-1.2.30 | TIM | http://autobuild.buildroot.net/results/bc70b054feb1b7de71c532a98a71a3f25979df87/
    mips64el |                  samba4-4.1.13 | TIM | http://autobuild.buildroot.net/results/d7956295a2da3208fb26bf1ab06d13cdfbaf0f36/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/e409f1a84e7bd477f019a7b0b073d49ec9a7b28a/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/8511836be1bc47f5c9f96c3ed482d5c26c369eaf/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/98275dd8b43ec9a36e7e746964bcfecddc243f40/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/9e2dc61ff9a5bfbbe6d5810df98c89fb7b282065/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/bf79733f3290151698eaebd28f1bba9be9c8aa18/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/5747b8039021bc58c5f150be6a521704dfa1b738/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/4a441d9205b4eff806c5456c4ae2de4e40645ee5/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/467ecdd34753bfb29b76577a01b339f7e927a114/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/e5ccc12047a681899cbc4236a5c1daa9a9464818/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/f95acd7e94d4195e2f342a4225f760d8393bb41d/
         arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/287249ce9d337d4efc587f833f811851cafc607a/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/5f576501e632e0e8d9e28fa96d62f670b7b0b52f/
     powerpc |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/898ac53660691698d910d38657ee475c83782380/
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/36db6539a7080aa53137c7dc9161740ef3622b42/
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/3b504ef56692f6e57ab0deb060da9dcf72307e56/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/ceb2a495a6efac7c9729eb995a56bda79143a6ee/
         arm |                   weston-1.6.0 | NOK | http://autobuild.buildroot.net/results/14ba2da4fca83a0aad3240aecf6cd5d4e4098f76/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/82340e18db5f852c8cc8751d122f9c0f34a61041/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/f9ac1f5136c8a1625bb1fd716d3009ea1a40a188/


-- 
http://autobuild.buildroot.net
