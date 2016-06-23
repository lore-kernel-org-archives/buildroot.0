From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jun 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-22
Message-ID: <20160623063030.85D86101D9A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-22
===============================

        success : 171
       failures : 116
       timeouts : 0  
          TOTAL : 287

Classification of failures by reason
====================================

                busybox-1.25.0 | 32
                   efivar-0.23 | 17
              e2fsprogs-1.43.1 | 7 
                 gflags-v2.1.2 | 6 
              host-libxcb-1.12 | 4 
                  boost-1.61.0 | 4 
          libmicrohttpd-0.9.50 | 4 
             bluez_utils-4.101 | 3 
                flannel-v0.5.5 | 3 
           libfastjson-v0.99.2 | 3 
                   libxcb-1.12 | 3 
           linux-zigbee-v0.3.1 | 2 
                   strace-4.12 | 2 
                 lvm2-2.02.156 | 2 
                   open2300-12 | 2 
                cifs-utils-6.5 | 2 
                     xen-4.6.0 | 2 
                 jack2-v1.9.10 | 1 
               dvdauthor-0.7.1 | 1 
                    lftp-4.7.2 | 1 
                    cups-2.1.2 | 1 
              micropython-v1.6 | 1 
               openipmi-2.0.21 | 1 
                dosfstools-4.0 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                openssl-1.0.2h | 1 
                  ffmpeg-2.8.7 | 1 
               linknx-0.0.1.32 | 1 
                    owfs-3.1p1 | 1 
            lttng-libust-2.7.1 | 1 
                  monkey-1.5.6 | 1 
          sane-backends-1.0.25 | 1 
               libdvdnav-5.0.3 | 1 
               linux-pam-1.2.1 | 1 
              gnuradio-3.7.9.1 | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7e307ff8836f359dbcecf791e33943dbd8df0490/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/cb72826d87603db9688dd69fc66d842283d4e95d/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/1200a5685b0d36bc09cda5045074f2d018f4a15d/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/692569a08752f9ce90375fe9492d7e6fbae87bfd/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/eaabf9b4ae07b307262cd2bbbd5950f955a8b725/
      x86_64 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/eef8eef639729a06517acaa763217efd83542a22/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/9677db32223d501bbce4e769be78694e894547bb/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/eaa6d4a1c0247aa592d1dad3ccb4c7a2e8397670/
         arm |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/1557601d6df072d72187df740da62fd0a1ad5267/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/46f58e92f8969589ff31f7299758e6dc1b7fe032/
       sparc |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/f1d0d8cca61cfa4da08c7cef2614eac13e8f62dc/
    mips64el |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/c719c3bdb988c0cd7ea681500064650237acabab/
         arm |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/0822c090bcd5ccbe8b6230fcba1a3def2cd5d46e/
       nios2 |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/b882d6273143310300fb620f9ed5bde2863bde31/
        i686 |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/f5e2ea972d8b43bf61dd3f284f722c117fac0a40/
microblazeel |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/88a9087851093f961fb7b553d8b2ec6ef2dbcb18/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/5ea21de586ab892a35ca7d1dbea88f64c42e4e91/
         arm |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/36f08b86b0bb8f514b67844064f329d60fa8f1dd/
     powerpc |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/6abf767da28f1d73e887df094d69dbcc160a3283/
         arm |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/b5d6ea7f8563f3cff17cd9af5db9799f6c7f535e/
microblazeel |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/70a2a499fa69a73ad8f6059cc733912ad1b6726a/
        mips |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/126d3ef02c3c962dfcb4c9a9d55d55a11ae8e8ac/
      x86_64 |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/42fba7517ee5a218f358c5c62cc9241c6894e492/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/7ffc3c98971c7b1393099c2fe067e87de38399d1/
         arm |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/31da2a695022ce6c81fe415e85257ff3ba6d4cdd/
         arm |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/3c38623b183104773690d77d95a551756dfa476f/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/9352fabfa564f1a9af93f1aab2d73883246a331a/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/9cce91846a9c3e2983e7c99d9a9d0ef64f436e18/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/6302460b63d4adb2dda283fc99ad42d7066359be/
    mips64el |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/a9189dc2dff8b58d3b124d2a813acfc72fbe968f/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/46f3e9585e6b0bdb41029314e3a28d188dc127e3/
       sparc |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/48d0347f98416558ad4a23115c6ecc0146635130/
microblazeel |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/d745292125b4e526f8913ae3447183f9b694f16b/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/a32dac2c261f2ba13451c5bb2288a52fe4ed5567/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/c8a33f528ec35bf6e4a9923b340bf4fb7e4da6c7/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/b6312626b3938555c4e5a68ad42f6951b02d7760/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/d633c326730f9ffe05d4525bead1b291c5eebfad/
      xtensa |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/7e7912da80562c5a84e65396a0857ac4c869c7fe/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/16b5fb022b7fd8a300208642531f080e0f3e77d1/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/d67af9192a58e4546b3194495c6da8a547ac813d/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/60aa448e5b2d7fec9a8c23ce9f520f667031336e/
        m68k |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/aed2243f15fdd428f4467219e6f257202b4f02d4/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/293cf9c773f33e7e62f91b481682b4318a97a830/
      x86_64 |                 dosfstools-4.0 | NOK | http://autobuild.buildroot.net/results/0240b10edfe1c3aac675c7f4cb4fbf3a377596e4/
      xtensa |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/6b2229d80bf2dabe35d8b6a6018444765df1cd38/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/e37f6bde73776a75da64a54eedb065180d41b01d/
    mips64el |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/b15d5cfcf242cf7cc4c7a94fb0f7f551949284cb/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/97422055fb5f8c2905b36f7a69575a4c0a508f8f/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/2369a6672b0fce90cc970a9a7b838e48cc6d0181/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/98a4b88673c8592116bf3f43d202e71d91a943dc/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/a2df66dcd9bd98965b7939c9b5bb19552eb69cc9/
        m68k |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/f6bf4bfc85f09fb376fba89b74798ab501746525/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6e720c35484bb5770f3ffaebce3285f96be0cfc6/
     aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/604021a41bcd134e85926b6c3836599fe61a47c7/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/47be6f553b9d860668a3fd8bbafb6ffaa2088b70/
     aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/2c9e34ad1f250e8d13f9cf5f3e5d53d47f15ae38/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/44721f52e693654482c4f95cf946b8a45d7966de/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/76abfdd3e905c03b0cef4552fef343f7d1221cc2/
      mipsel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/0eaeb1e06bc1bd106877376b4b2678471640eaf3/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4b90250f6cd89c960a058656f6cb2f4aae5ac72a/
microblazeel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/5930a395151467d6e7c81a1c267fc67674321330/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/198f29714ff10cd541963648c6a4596ce3172b9d/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4845fa8f5e67f09b1d6b9c7665b8818c4db6ef5a/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c2c2d8ca1a0d7125acebf0fbf72083ad7b9c73a3/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/8045c3c33b03a8f8362a8d9b47d438a811830611/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6639f9685bd6bd170c2517a226e7e40d3604d0be/
      mipsel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/824203562afbcdd55fa30af14be47339006f8c57/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/61fcc638f50c59bfce7a2ffb6b4a8c512caa404d/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4a8274b343b44b7cd329f49e151f5c21ec2215e2/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/dc1da634197813294ac104c6f5825a16c2fb667e/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/46f4ae03049957aab87b8fc8525811368dd8133a/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/09b05aa6352e8ba594bd67f8fcdff899054c7440/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/0284f12a72a190dc63402553ddfcafeee8fd7838/
         arc |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/489094412bbb8739bcea1d620b143692476e6462/
       nios2 |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/bb2e04a643784beb78f38c016a1c621786b575fe/
         arm |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/79cecd4fa98bdad5b5bdc57725d8cb8118b1cf2e/
      xtensa |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/ac92ec88c9e26df579a5e44f58c34a3e4dd5b2b0/
       sparc |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/695be21e982b92dbba69cfa5f89be44fe5acc511/
         arm |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/3604abce39476d4eda6d500ddb6242f817f92244/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ae7a0ec9eeb6cf58b25bfbf841cba745a7b92e21/
       nios2 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/ac95f7e44269367f139218b76e66530cdacf2710/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/8024f6741021de5414dc46e5922d161aea049aec/
      mipsel |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/2b53f29064a486d1681b7ec9b8611f9fb774cf3c/
     powerpc |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/d79d98647813da59a580a60c0fa987e016062e77/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/21a04a37a2bea682fc6a5a4a6ce2ce06bf883b1e/
         arc |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/d190bbcaeed28284026ea382638b102715160165/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/21b712654452bd9fe86468ef0097b28b631c6e85/
         arm |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/7b2fd23cba75808bf47c2cb9c0a8fe2b48d97c27/
         arm |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/271191202415a8a5f7804243efbecf2e18180d4c/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/ab25331a2fd7904405fe448b15ef647a0866f4ff/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/0b51e8779a4037f8df98c2ea5f5bb0dd60021946/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/5645ae5b6ac811d0cc805186ab70ef18c632d824/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/c6619aac62a2f9b1cb359e1e00e11da23888bb63/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/1830e614e3ff81856cc6993b499237adee7b4a1e/
       nios2 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/13fbfb507d9e9e5b595bab72a74c9d6d1efd05e9/
     powerpc |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/81fd3b13892ef4b9ed712049ba92df7a0f18d0b7/
        m68k |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/090942d8d17735832fda37486d90c96ab621f189/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/1ffd5f7d451cd45ae742c3310eb8be0b9f98ce9d/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/48f2cfd1bd5d31c2e1ecd3e2c8f09dc017bdb73b/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/16423d6eceb985b5a7a1d5a6e46865ebe5536248/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/77f943b33be825f0606c8bc9d1be71a9144b20b6/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/135ca95afacb8b01f4a75f07db6a5af86c4753ee/
         arm |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/99dc6c647e897f41a134292f7357d2725cba42b7/
        m68k |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/a1685107e9da9a502c9710efc9d276fa1dde58b8/
       nios2 |               micropython-v1.6 | NOK | http://autobuild.buildroot.net/results/4e93b725bd5df314ddd713641f84e25e2c8690b7/
         arc |                   monkey-1.5.6 | NOK | http://autobuild.buildroot.net/results/da3248aa9823e0e6a2ea3b275c8d4fde0e3cfba6/
      xtensa |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/42c8ee5312ff9cfe8cfa854d3693c40b3fff209d/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/2bc658e286349f3087de37110134b3d32543f87b/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/81ee9d6146118a0a90f0b37588da8fa43e7ba0a1/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/55dc9d6826defd2c9048c2991019d4d573d34af4/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/9e8aeebf1d1ba87ab8f85d8623e11b6b338041d9/
        i686 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/caa279e0232f6c332b1e74607ec58c63e406a99d/
        i686 |                    strace-4.12 | NOK | http://autobuild.buildroot.net/results/fd6e8b6386c3d3170168608c49a0efde7b7fa269/
    mips64el |                    strace-4.12 | NOK | http://autobuild.buildroot.net/results/87374d3377a27e6747ce39f284a1eec20210cda0/
     aarch64 |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/ebf332875709c50477fd4f397eaa080a9a775f86/
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/69ef0dee2994ff7e6d96c87e1e5d83649e4838bb/


-- 
http://autobuild.buildroot.net
