From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Apr 2015 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-08
Message-ID: <20150409063021.88D74100DEE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-08
===============================

        success : 192
       failures : 59 
       timeouts : 5  
          TOTAL : 256

Classification of failures by reason
====================================

                libtirpc-0.2.4 | 5 
                     vlc-2.2.0 | 5 
              procps-ng-3.3.10 | 5 
              postgresql-9.4.1 | 4 
pulseview-19be0af16af83ca10... | 4 
      host-gdb-arc-2014.12-gdb | 3 
                libevas-1.7.10 | 2 
         lua-periphery-1.0.4-1 | 2 
                  boost-1.57.0 | 2 
freerdp-770c67d340d5f0a7b48... | 2 
             armadillo-4.000.4 | 2 
                host-ola-0.9.4 | 1 
                   perl-5.20.2 | 1 
                 rsyslog-8.8.0 | 1 
               arptables-0.0.4 | 1 
make: *** [qt5xmlpatterns-l... | 1 
                 libxml2-2.9.2 | 1 
           aircrack-ng-1.2-rc1 | 1 
make: *** [qt5multimedia-le... | 1 
                 cdrkit-1.1.11 | 1 
                     php-5.6.7 | 1 
                libupnpp-0.8.6 | 1 
                    qemu-2.1.2 | 1 
               libsigsegv-2.10 | 1 
            python-numpy-1.8.0 | 1 
                numactl-2.0.10 | 1 
                  libevdev-1.4 | 1 
                   erlang-17.4 | 1 
              strongswan-5.2.2 | 1 
                  xerces-3.1.2 | 1 
                host-gdb-7.8.2 | 1 
               kodi-14.2-Helix | 1 
                  usbredir-0.6 | 1 
        gst1-plugins-bad-1.4.5 | 1 
           imagemagick-6.9.1-0 | 1 
               libcap-ng-0.7.4 | 1 
                     gpsd-3.11 | 1 
                      qt-4.8.6 | 1 
                    quota-4.01 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/d0481620c9db6cbeef1b90eefb21c7f813bce7fb/
      xtensa |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/e6f2bee98464dcf0a4e48978b3fbf64a18af3928/
      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/e3bb67f03fb607d6d5fcab3da7bb0f6028e972a7/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/032fbf3302e6af9d84c7bd4b1395e99ea2eba890/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/ac9b51bc0215574d3e65afb2b8634c39b0617c61/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/c115669956d3089ad687fa5ccb1e0db0de9c7d24/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/228de5a4274fcd24074dcf38d37b9600f9b0f240/
        i486 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/424bad662c839deb461d15f7ad7ef2ccdf8dc812/
     powerpc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/a69adc56b55ae3c7610ee4407499563927505d3e/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/b2d45e42361fcb33e4f18a93f0d00d748c2f6c02/
         arc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/90883ea408907e5b0facab8aafec9fc844d408dd/
      mipsel |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/232bf069d1fb729e1fe98ea6323d2a81a58724e8/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/59b53bdc5fdb265337ec9e4d8c191a64151cb8aa/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ef6e12eade360ab816c36ded59fa58d4be1106da/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/4c27044caa6188353de7bdb4e5384cfa4ed3065c/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/8298a5c72c897a53e8f05309bae127c921b3251a/
      x86_64 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/433512a9df8759a5529d080215b71c90b0c6b751/
         arm |            imagemagick-6.9.1-0 | TIM | http://autobuild.buildroot.net/results/af95d5e11d822418b4d27b655cc0423da6f009eb/
         arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/d2e9571f5747e609eb4f9b64ac6ab99bccb92767/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/9d21a2e397803efb49c6cdc036ec39bcbfc40315/
     powerpc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/77661a52d86d4238cdce4418692a31b018f5cba3/
         arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/f112810f9f0eec9a24c50a6f8bf0966fea2425ea/
         arc |                   libevdev-1.4 | NOK | http://autobuild.buildroot.net/results/bd54581d7b0cc73bc501072d27e870a443dfce79/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/e40cdd8f9fb6620191417194c2df8374a7d2c090/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/7ae07d0c3bf5df6daedb0d3c92320d68d08d4e7b/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/0293a2a2cbe6559c16304b339e9cd2d7e0f4d214/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/5c6defd1882194d995d22a6ac0baea88b705e0bc/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/76278d58eea44435269ae882a7852c7ae4258ca3/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/52e452f6627b92c2db46c918f1480dd4b85c64b6/
         arc |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/a2bc8015760ec512cda3fccae60139cb485846a3/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/e78d82dfb8c486acfb681ea47ec24ee7c8431775/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/952aea4f6e6c65e76babab96916fdbc1a154770e/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/1a39d6caf85b3696f1a8fd16599af5dba94d5865/
     powerpc | make: *** [qt5multimedia-le... | NOK | http://autobuild.buildroot.net/results/7cdf6c409b8509b45aa245b8958223662679f1f3/
    mips64el | make: *** [qt5xmlpatterns-l... | NOK | http://autobuild.buildroot.net/results/00b9cbf77279b12827bb97a12fbf07506e8725c2/
      mipsel |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/a14a6b88b914e2d18e0b085f8a3a8c2ef611e524/
        i686 |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/3a2f6648f37fb5002c7353c8ae2b754c20d7aea6/
         arm |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/bdada4eb3d131c5bd6a7f23e340c6c532de679a0/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/20559dc75290a8f0efaeb26f5e0c4905f0b36e2e/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/da3a56cc19ec2915e9558f038dd6844fe158e950/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/e42e5325d7f519b1477c95f7fea657f95ad1afbd/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/48c02e83f751deee573cd97b7242a94b3cb29c2c/
         arm |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/d6d56f34a351d8457b0a972ad5c1cfa4f14dce2f/
        i686 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/c0e057b3fc9e18674ed55228323950ae6d8ca111/
         arm |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/97dc7f238457609c861c24f81b556973f5dec9c1/
         arm |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/4e71f686342f59b181842a3d29ecac709c64d0fa/
     powerpc |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/15799f08f450f79b5ab095a67d2292773cdf6123/
         arm | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/1f018c927c31e5302bfac85fd8e4ecb2fd5d38f3/
      x86_64 | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/a4ebb507798b94272bbad02456dace90472785a7/
        i686 | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/1f60a9084935c3a91c6726043348353c2910c6bd/
         arm | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/d5dc56f230695167544d1bc9aad68006a9215915/
        mips |             python-numpy-1.8.0 | TIM | http://autobuild.buildroot.net/results/06759006e406b7f2092a2415240920d37e9df05e/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/79e176102ba9e3b654515c6aeb546665dc764f91/
         arm |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/32290d012fbfbfc4b7342c6197492477fd7b3606/
         arc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/1ec18d7c3b7af27a3d9bd770d2ef48b8533e840a/
        i486 |                  rsyslog-8.8.0 | NOK | http://autobuild.buildroot.net/results/cabf2352307de58ff357ee59bf273ee487a2b716/
microblazeel |               strongswan-5.2.2 | NOK | http://autobuild.buildroot.net/results/3d13ced1b142d014c5bc098137174c4369a1e3b5/
        mips |                   usbredir-0.6 | TIM | http://autobuild.buildroot.net/results/b331d8d6a40400bb5ed26a5662bf268524af74ac/
     powerpc |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/104ce2f5daa418e1e40ef0fad04d42ca7b9227fe/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/49772406ef7bf134f1dce86a86a183d58d930118/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/3bf089c13722a4c21cbfdac803a67974c633a6cd/
        mips |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/f81caffba2dcffd6b25dda455d339732dcb83ff7/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/0f89f3d4a0b3e72e91bbad3829f9be3ba0cb38d1/
      x86_64 |                   xerces-3.1.2 | TIM | http://autobuild.buildroot.net/results/c6a667d7b6528972418dbf58b6fe1ea7b5678329/


-- 
http://autobuild.buildroot.net
