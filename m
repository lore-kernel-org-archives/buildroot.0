From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 Jul 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-07
Message-ID: <20130708063004.87DD052C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-07
===============================

        success : 77 
       failures : 101
       timeouts : 0  
          TOTAL : 178

Classification of failures by reason
====================================

             iptables-1.4.19.1 | 12
                classpath-0.98 | 12
                pciutils-3.2.0 | 10
                    acl-2.2.52 | 6 
      host-gcc-final-4.4.7-arc | 4 
                 binutils-2.21 | 3 
media-ctl-ac40b79f002a2315f... | 3 
                     m4-1.4.16 | 2 
               libglib2-2.36.3 | 2 
             gdk-pixbuf-2.28.1 | 2 
               alsa-lib-1.0.26 | 2 
             util-linux-2.22.2 | 2 
                 libffi-3.0.13 | 2 
           imagemagick-6.8.6-2 | 2 
              host-elf2flt-cvs | 2 
make: *** [libnl-legal-info... | 1 
make: *** [libfuse-legal-in... | 1 
make: *** [host-cmake-legal... | 1 
make: *** [coxpcall-legal-i... | 1 
make: *** [dtach-legal-info... | 1 
               qt5webkit-5.0.2 | 1 
make: *** [libxslt-legal-in... | 1 
                 libevas-1.7.4 | 1 
                   ncftp-3.2.5 | 1 
make: *** [iproute2-legal-i... | 1 
                valgrind-3.8.1 | 1 
                   mplayer-1.1 | 1 
                      udev-182 | 1 
                   cups-1.3.11 | 1 
make: *** [bzip2-legal-info... | 1 
make: *** [kismet-legal-inf... | 1 
               libgtk2-2.24.18 | 1 
                  sysklogd-1.5 | 1 
                  ne10-88c18f0 | 1 
    enlightenment-0.17.0-omega | 1 
make: *** [tcl-legal-info] ... | 1 
                libtirpc-0.2.2 | 1 
make: *** [directfb-legal-i... | 1 
make: *** [libtpl-legal-inf... | 1 
                  zeromq-3.2.3 | 1 
                  webkit-1.9.6 | 1 
make: *** [libidn-legal-inf... | 1 
                  libedit-2.11 | 1 
make: *** [libtasn1-legal-i... | 1 
                    systemd-44 | 1 
                directfb-1.6.3 | 1 
make: *** [libconfig-legal-... | 1 
            libvncserver-0.9.9 | 1 
make: *** [can-utils-legal-... | 1 
                 libiconv-1.14 | 1 

Detail of failures
===================

      i686 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/735302492da6e875f3a3bb749af1182b31127f1c/
    x86_64 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/28cf570fd9bec9f7ec468be6daf3e10798d63895/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/c85529d9224c73616c1e07268dfe9206ae501c46/
   powerpc |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/8b120d41ae5f6f9c0cabef6d2095b954793bb313/
    x86_64 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/2d7c3d06a0d7e1552a49e1cf32c2cf8f71bb990f/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/dac238003ee123463e32c209277208499a37edec/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5345c6f25a93a3246887d69353d338cbe88d0554/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/786849731861161350e30d62a5e0a4577a9d9823/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/696748e8b932506f57b4f6d9294cd147b1e878a5/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/dc6e79f14b7403b6ee52d58df998d582e05e5c95/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/6476acab26b7418cf06cb1fc9c17095b210bfe86/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/46baea45d61ceba69f7fa3af5c33d24069b0095c/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/634c069c38e2b21f5659d66a55322bd6d4b77e8f/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b3ce9a4a163ee03cf3e9e141d29c15a6de23afde/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/277f5ed00d4016375fe7fb7178b89f11605d436c/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/8a356d0fd4dc534e191ddb3c7c431e4922b85c43/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/96618cd08b0bf8c16adc7d8b7180951977d95cf3/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b5bb207c49690bc515faf51a2264eaccbdc46ab3/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/c1382bb1901b3d5692987dfc42e266fd70164e70/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/e484553822bd2b4f47909ea341b5cc8951a7faa3/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/164fc0f1ae928b040702296d9c28eaa28646b5ff/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/4bb883082632a34f2b2bc42e6e1e520582dbba76/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/33ebe05cebf906684ddd07d65fefa708314d8990/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/b84037b56371d50236dc161768177d0d52eed7a4/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/fc518009156c859941e2b462992a60f950230542/
   powerpc |     enlightenment-0.17.0-omega | NOK | http://autobuild.buildroot.net/results/7d04366ff6f1bce4b84c675563be7ced01483d7f/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/d710807094c85edc165bddf7b533e8e4758772a6/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/e4aa6ea447081d616f90d2973c26ff07495cbf49/
       arm |               host-elf2flt-cvs | NOK | http://autobuild.buildroot.net/results/41ce1d830e7563d0176c3726e615d6c3d8462c58/
       arm |               host-elf2flt-cvs | NOK | http://autobuild.buildroot.net/results/e7a96ed1454ef3bf6d93d25429d83f1061f62a52/
       arc |       host-gcc-final-4.4.7-arc | NOK | http://autobuild.buildroot.net/results/70b329ce639455f4a98801cea03c66443bd0ec3e/
       arc |       host-gcc-final-4.4.7-arc | NOK | http://autobuild.buildroot.net/results/3e165e97a6dd415ca6514ea194f4807b8ba594a5/
       arc |       host-gcc-final-4.4.7-arc | NOK | http://autobuild.buildroot.net/results/08e8149c9889141d644896e1fd3e0d2f14299033/
       arc |       host-gcc-final-4.4.7-arc | NOK | http://autobuild.buildroot.net/results/4aa137902c9e301633984af8ddb52c160439960d/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/ab2640ad29a3d70256b8e0d44f433ba141434f45/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/a0d9d843e28d25d9daa5f3f5f3cae1d9e2dad995/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/d67157981afc7fb74e19a508e782d845f70a6673/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/b86927a7f9fa213c8fe66cb26cac9e8f774222a2/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/5bd4a4c75376d84423eb788ad17e6ef54561e1ca/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/e61378f5a7df0ce258e97107be47586c87221ae0/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/74bbf172cd7ae9a3a30e5b13e79f54c2e3ded4a3/
   powerpc |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/cfde7cdeb45b3a39f6dc37899d34030954e66ac4/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/1e06c75251d6c3a50cb0127fca5ff903add165e2/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/eb86022e0086f04196c6415eed5e94494cf9e4d9/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/3b1c42d32028dfd7f01e574125ce3f3d0223ef0b/
   powerpc |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/56780df4a7d611d4ff462b8f1489250526bb2db2/
   powerpc |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/f31d7b6a67be5fbd4f569ce21876f1d19881c0fa/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/3dd529781638b200a128ac3e54df48289dae3d61/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/4b948ca806411b02c859abab89ea1c6214eaf1af/
     avr32 |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/89f6a3226271d195c0020bf5b0fed3a5ed48f190/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/89816df31ac80aabbfae92f65820f81f050e3f5b/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/c95664286b2504d5927f5b8751683aab2d82d28d/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/546fb085d1907542c11226366a0188bd06b28365/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/5924f9af52c8d381bf0f89505b6bfd3c293c43fa/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/a9b3e30d8689867a04f754b9164cbfb384d9d657/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/b3e37ae7d9b3172fe2a959ac5070c9185cbaaf0b/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/3a68af9140ba410e96ad3c9876b14d48d3f1275f/
       arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/fb3b2fecd6a852efae65cefec84541c626d3e7a7/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/80ad3eef057e8040d7b8404f005b0431b9e20295/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/033591b0e46ba2b1349d4fb17b770ddbb893e371/
    x86_64 | make: *** [bzip2-legal-info... | NOK | http://autobuild.buildroot.net/results/fb8bbef4484341195a9f42b6961ccdc5ae28c522/
       arm | make: *** [can-utils-legal-... | NOK | http://autobuild.buildroot.net/results/fe2104d465b4f3ddbb5bc8674d2356376672867e/
    x86_64 | make: *** [coxpcall-legal-i... | NOK | http://autobuild.buildroot.net/results/2f983497f6a1764d926806766656bc7bb4611745/
       arm | make: *** [directfb-legal-i... | NOK | http://autobuild.buildroot.net/results/c395d5a34e8981ee8b5ad6df560c2710736dc603/
       sh4 | make: *** [dtach-legal-info... | NOK | http://autobuild.buildroot.net/results/37c72d9d974313588750e39448fcbe9008f971b0/
      sh4a | make: *** [host-cmake-legal... | NOK | http://autobuild.buildroot.net/results/068870164c3a42f1796ab7de9925a635686a6862/
    x86_64 | make: *** [iproute2-legal-i... | NOK | http://autobuild.buildroot.net/results/a90967fe32da5e97633f93c6e5b8d297b8fea227/
       sh4 | make: *** [kismet-legal-inf... | NOK | http://autobuild.buildroot.net/results/8f82c40699d8e9d45b5aafd7b7f548e4b65f8866/
      i686 | make: *** [libconfig-legal-... | NOK | http://autobuild.buildroot.net/results/e3836a9bb30cf86ef505dc08a21676ccdcb9f736/
      i686 | make: *** [libfuse-legal-in... | NOK | http://autobuild.buildroot.net/results/c8ac01b4853b64a8b01f7fbbc2617bac39dbd8fd/
    x86_64 | make: *** [libidn-legal-inf... | NOK | http://autobuild.buildroot.net/results/28fb54d921d7e10f8dd428838eaf0fa75e39b4c7/
    x86_64 | make: *** [libnl-legal-info... | NOK | http://autobuild.buildroot.net/results/f948ec2083a01515ad31fc421c5f3a4ef49f3a2b/
      i686 | make: *** [libtasn1-legal-i... | NOK | http://autobuild.buildroot.net/results/5edbcfc8884d98ed7c9f6c094b462fd3862f5412/
       arm | make: *** [libtpl-legal-inf... | NOK | http://autobuild.buildroot.net/results/21a6eb18da1fcc7507c66ff59f7fa807d40c4d1a/
   powerpc | make: *** [libxslt-legal-in... | NOK | http://autobuild.buildroot.net/results/c6288f2364b1792c3e7e85b44eefcda2ea261f6d/
    x86_64 | make: *** [tcl-legal-info] ... | NOK | http://autobuild.buildroot.net/results/10bc1d909ac7204ba421ce61ae7a32cf98afe5ac/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/12f36cea61bc1bce58a654429bb498b33088f3be/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/3345f73572d26f5d3aeb6e30446921a76c202446/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/50b5147032c79c2d214faf811ea86d411ceafa2c/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/6d7d95839f29fa8db3fe89754520c4af8430f38e/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/293b6d749f322b3864745058701b084d0cfc3dc8/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/9ec905ae6606d62389c11025d381981bc94d90c6/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/cf3ae1c052b55dbd578b8db20bd01d304844247c/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/7f1f47ed0616258115b3c1cb975da94abc097535/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/9b32e0015af13ac139aec1f7c92ae8192f7d67e1/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/fc78eff5adade5ab56d924061bd72d5740ce0614/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/c4d7208fe49882026beaf3779d10b48369c62e5d/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/ce25f2078f0f53f913e32a1664615e02155d0d83/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/c909fa253ad788c64ca59c793e2906f0a8013cf3/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/d19525f8c0064e2f90be762027b37945487c9cf3/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/da5a7cdde6294026ba2bb9af1764325f75316a1c/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/3c71d0d63288db084c014802e9b5e2d6ead57455/
    x86_64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/35254450ea214d2677efdf476995ebd317619712/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/cb218a4e24e69d9e763ae4cdde44b621d5b3f734/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/3de32a4f04267e988512b85b040fe88c7bf54cf7/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/be5aa5816222403a9b5179fd34d89ba384ddd89b/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/9513d1f35d3f6fe6edec5f25d0405b9efb38b8f2/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/504bd0e8c3af50427aa4079817ce17685d7a9751/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/7f39fa8f3892cfbcf3241ac4f650fb0e65562c04/
    x86_64 |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/820e60ef48bac7ed77f90146396c64ee39091bf4/
       arm |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/93da58453e1ca0cc491170976cfbdeb8bee5c648/


-- 
http://autobuild.buildroot.net
