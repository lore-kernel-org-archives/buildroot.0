From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Jul 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-06
Message-ID: <20160707063029.E5290101DD3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-06
===============================

        success : 128
       failures : 102
       timeouts : 1  
          TOTAL : 231

Classification of failures by reason
====================================

               host-gdb-7.10.1 | 15
                       unknown | 8 
                jemalloc-4.2.0 | 6 
                flannel-v0.5.5 | 5 
                   dante-1.4.1 | 3 
docker-containerd-1b3a81545... | 3 
               acpica-20160527 | 3 
tvheadend-8e637f9f903f6d820... | 3 
                blktrace-1.1.0 | 2 
              libarchive-3.2.1 | 2 
                openssl-1.0.2h | 2 
                libaio-0.3.110 | 2 
             transmission-2.92 | 2 
                    nettle-3.2 | 2 
                   ncurses-5.9 | 2 
           libmemcached-1.0.18 | 2 
                  multicat-2.1 | 1 
              lirc-tools-0.9.4 | 1 
                    lftp-4.7.2 | 1 
                directfb-1.7.7 | 1 
              host-flex-2.5.37 | 1 
               target-finalize | 1 
               libepoxy-v1.3.1 | 1 
                  apitrace-7.0 | 1 
               runc-v1.0.0-rc1 | 1 
zbar-854a5d97059e395807091a... | 1 
                 clapack-3.2.1 | 1 
           libfastjson-v0.99.2 | 1 
          host-protobuf-v2.6.1 | 1 
android-tools-4.2.2+git2013... | 1 
                  babeld-1.7.1 | 1 
                     vlc-2.2.4 | 1 
              host-sam-ba-2.16 | 1 
                    opus-1.1.2 | 1 
                    gdb-7.10.1 | 1 
                cifs-utils-6.5 | 1 
             shellinabox-v2.19 | 1 
               libsigsegv-2.10 | 1 
                fcgiwrap-1.1.0 | 1 
                     dtc-1.4.1 | 1 
               libdvdnav-5.0.3 | 1 
               wireshark-2.0.4 | 1 
openblas-f04af36ad0e85b64f1... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
             host-boost-1.61.0 | 1 
                    dash-0.5.8 | 1 
                upmpdcli-1.1.3 | 1 
             spidev_test-v3.15 | 1 
                     tftpd-5.2 | 1 
                  libsepol-2.5 | 1 
                   audit-2.6.2 | 1 
                     fbset-2.1 | 1 
            host-libtool-2.4.6 | 1 
                   systemd-230 | 1 
iputils-55828d1fef3fed7f07a... | 1 
                   fwup-v0.8.0 | 1 
qt5webkit-b889f460280ad98c8... | 1 

Detail of failures
===================

    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/27735c7fc5604439610f00c073f1b01b792bfec7/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/a453161aa63cc82a3d683ae631c5676f47e0f45a/
         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/2fa372e93e4de372ac0a47d276e82befb704607e/
    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a6f3962c59eee3d0f7e816121dc15e3d63b55a51/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/c3ab2f54007304986315f7c76707a8a83d961c4b/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/2d3b2f8c2b9f7f2e04b88b1dccb83e183b5876b6/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/446646b9ac27ac48be79d61947ad26d1a04d444e/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/953a3b635356a0c095347ae3bbcb842f9cab6d4b/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/15f8a5d613a5e994d89a9a738f130eb7390b7927/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/8863b66d483d79d0586d9435ed30bceceb37211b/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/807618d5583d3dd06b917fb8c5c813a0bacac55e/
     sparc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/cb359c1f74544b9708d9d12c0d9f92a789065a85/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e737f65c610ede9cd08bb3072044e57878b04b47/
     sparc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/75a3803f27203201ab1ada3d1fa2976a76b904b9/
         arm |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/dc46056aa2cc85f520f778d1cf41b72b0a4914b1/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/3b6a8c3e739e22d500f6867e628498aec169c305/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/00dc9f4c68f5f9744b31dd63b30ae27a3bcbf624/
    mips64el | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/09a23c8926ce32408fbbfa1fb5b3ed7c4f8733e3/
    mips64el | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/2a603cd576d189f51aacb0b0abb9edbb8225dc91/
        bfin |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/628b59118e4254e6acebf99aedb17128e0077381/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/f9005b6c46f246cf1e5988ce1efb9631804a85ee/
      mipsel |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/75ddc1f00155720f0b697a92b159d703e6c49df1/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/63be6c7817fcc9290049fafeb402dab554d549d5/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/fc71f39d9393b7c0844290f10fc86aa897346210/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/98f9a1a12d5aac9b82a1fb17c14ddba67a9434a6/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/3594f33800857cf57302f9b58e30d68f1d9c33b9/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/3165d491125be881a864cc5bdf2afa25dcd669bb/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/0f1dd5f536755aedfcb02cdf2b6564aef1986d4e/
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/c52bedc8f8e5d1b157e4d3a04710630f8788ba3c/
         arc |              host-boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/8f91b2f148292c1d0b940a0e64a85fe34491f849/
    mips64el |               host-flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/252642b7d6ec3f77142dcbd158f56ed8e2426c25/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/46c5e17ea7503032f05c96f1bc84bacc6b4974cd/
        i686 |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/984571b2f86a8215b6f287a33d803378cbdb7ce7/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/b54d161a5a9a5b246f1186ba4cc789732997f50f/
     powerpc |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/a4e3168ac871d1b4f4215c1cc6f64e82ea21f384/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/db8026b7d5330a2f785e711db7feb524b3cfb1c9/
        bfin |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/b13f381362e041a7997081d2935aaaace0d9cd42/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f24e5680279bcd083698e4d69b87326ef1153ec1/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/e55fea3d58f0d509c74954283efeadef4131c083/
        i686 |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/36980e962f32579364d5afe72e77981e9d96bf04/
      x86_64 |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/758ad32562d742783a436e6a35bd231af024724b/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/a0473326600a43c2a5f1aaad3b28bfd923b1f7fd/
     sparc64 |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f729bbde2c8b9d76557a4cfeee091603ff8b2d53/
      x86_64 |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/c44fba907dde7caaa2a1d52b706ce9804684b3e3/
        bfin |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/36a4a1cf669c605144f2fdcda47fcd1b56addc71/
      x86_64 |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/2452adaa0670a103fa28ffcee2b3bdf1e4b95f11/
        bfin |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/1cb3d6eaa2e6963ec34468378a1fffd94ed35e4d/
         arm |             host-libtool-2.4.6 | NOK | http://autobuild.buildroot.net/results/6291046ca0552e11b79a84df4a7844324d78ab97/
      xtensa |           host-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/16389bb76e3bbfd1b3547c3c4d6cb6709d0f9c16/
     powerpc |               host-sam-ba-2.16 | TIM | http://autobuild.buildroot.net/results/2147c1177b49e767ab0240bff6cb7af6cab8a63b/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/8c83af61d6169a34c684944250514d4ad8ecd566/
         arm |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/c57fc90740277791f6a3d36fed776ea254d01c54/
       nios2 |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/7fa8fcfb9344e9bd76098a5908bc0994ae5d3071/
      xtensa |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/729ec1954796a66d4c97626dcfe0db13f20364ff/
         arc |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/584278497c717aa831c2031e2482f0f2b1e1454a/
         arc |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/4eefdede8003ad67723d0662fc1071e24c5bd005/
      xtensa |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/6a6051a414d467051b51afaf79a5441dc9c63570/
    mips64el |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/3918ca4fdd935e26d8e225a675b12983cdb19eff/
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/8a21d2f8c76ee85cdec7e12f40a3e09bfff03f1d/
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/563fcad6ff1f592bb431df17d5781f5377a2f0c4/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/72917a843df596fbb72553fac65ef573b9a79c0a/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/ee4ba7d66badad8679e0296cdf3021ad6469f859/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/7b5d4617c314b134da6b854d9e3b093800d4f11a/
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/cfda7b4b02b142f422a0ac881863be0b6463cdf5/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/12a2283c51f8a571e8c9293ae8383d63701e43c0/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/fa8b36f33c19a20ccc700d6e01f427bfd3189031/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/2d14394fb4bdeade7a65021a82b144612dd3fee3/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/cbb2bac69aa0708e587ba9fcd1efcead82e42446/
        m68k |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/059fd862bd3e9456783f2f4ba307df15dbab0d41/
      x86_64 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/8565c12b2999317698c2209aff662b915e4abe30/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/aa5bd6624ce4159808da6e6fdc9448b0f1078b4a/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/6dba7bb915a7ca081efbe04a40f68670c481f9f1/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/1dadc935feae44a27d88beb9ae8c51eceb18707e/
         arm |                     nettle-3.2 | NOK | http://autobuild.buildroot.net/results/e7df1f2b40bbb2417dcc0a6fd7b56bb6850338c2/
         arm |                     nettle-3.2 | NOK | http://autobuild.buildroot.net/results/1706b30ba668de08de663dd30785b26a11566a3b/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/be6428969245b738cc677de6e47dbb5c195b56f8/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/091b887860c6df3df0076ba4a2bfaf5c0b37cbaa/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/3b8e2379b6ffbc44cfc76a96a73d0ec98806a69d/
         arm |                     opus-1.1.2 | NOK | http://autobuild.buildroot.net/results/ffa12ab7abadd76901228fc82da24e81bb6da625/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/7e16bf0cbe63e69b3e0c649c49bbb752cf8d1ede/
     aarch64 |                runc-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/72f1cf194843b8519a3ebf213cdbf06873809055/
        bfin |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/63faa15d1a3274006fdf77869f65c2fac5dce4cc/
      x86_64 |              spidev_test-v3.15 | NOK | http://autobuild.buildroot.net/results/21b92651ce456f3819eef315cecd92ff70b9e98f/
     powerpc |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/c6c6e1784c44942045b0edf0839cd0b494be71bc/
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/55739cf0235394d65a0fa2f8e14f1ab926607f83/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/e7223a0100e0e27d35e2150e171fcfb58a19c57f/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/659dc6a2911a409992a083a7d81bcca03688ee8f/
     powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/b79e51140cb0320554a58ce59dcb33f53cd9211a/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/84914a0f48a0a01cde45fd240fba03243899eb2e/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/2800ccc6e7023ee1d25f536059a17f6836ae2f71/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/9cf6a922d9a472f9dfce56ac9a9e75a5d3b5645e/
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/b602da958629476ea002fc5ff2cb6c218c2b8e8f/
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/0c8ae60a7c0dfb64ee12d557b1660a4a1fc84703/
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/aeae337dbbffcf0812f407ac944ca5fa967f7b89/
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/4a7aaa0a2ce287b16e8501b39264e4481d101572/
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/c411c063011d85fd5a146715ecbd00406181391a/
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/5ac12f08a366fc15ec138c900df0e5f62d0b70bc/
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/a5968bd505d6380b0f31dbb6aa763a830546d001/
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/0e97abeec446bafe608d288c3e556a05b3bbe452/
      xtensa |                 upmpdcli-1.1.3 | NOK | http://autobuild.buildroot.net/results/60d1e574887ed9243af54525cf14f81a8316da0b/
     sparc64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a458d11e8ce0cc99ea9c9492f68e21c25c82e7ce/
      x86_64 |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/a3fa84759c66bb4b0ff8c46546c0c8b2eaa78c7c/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/072b9ef60b17862e49f995ffa227f57b075700c7/


-- 
http://autobuild.buildroot.net
