From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2016 08:30:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-04
Message-ID: <20160705063028.2A6C7102D6E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-04
===============================

        success : 138
       failures : 67 
       timeouts : 0  
          TOTAL : 205

Classification of failures by reason
====================================

                flannel-v0.5.5 | 7 
f2fs-tools-fd32210229d4ad7d... | 4 
          libmicrohttpd-0.9.50 | 4 
               libcap-ng-0.7.7 | 3 
                  libsepol-2.5 | 3 
                   audit-2.6.2 | 3 
             transmission-2.92 | 3 
                     php-7.0.8 | 2 
                    pppd-2.4.7 | 2 
                    gdb-7.10.1 | 2 
                 mplayer-1.3.0 | 2 
                cifs-utils-6.5 | 2 
                  boost-1.61.0 | 2 
               target-finalize | 2 
tvheadend-8e637f9f903f6d820... | 2 
                collectd-5.5.1 | 2 
                  multicat-2.1 | 1 
                    mosh-1.2.5 | 1 
                   open2300-12 | 1 
                upmpdcli-1.1.3 | 1 
                   dvblast-3.0 | 1 
                mongrel2-1.9.2 | 1 
                  openjpeg-2.1 | 1 
               libdvdnav-5.0.3 | 1 
            lttng-libust-2.7.1 | 1 
               libsigsegv-2.10 | 1 
                liboping-1.9.0 | 1 
                     tftpd-5.2 | 1 
                    lftp-4.7.2 | 1 
               polarssl-1.2.19 | 1 
                   erlang-18.3 | 1 
                   fwup-v0.8.0 | 1 
qjson-ba273682a9d33a7b3090e... | 1 
                  imlib2-1.4.9 | 1 
openblas-f04af36ad0e85b64f1... | 1 
qt5webkit-b889f460280ad98c8... | 1 
                     xen-4.6.0 | 1 
                       unknown | 1 

Detail of failures
===================

         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/69f52fc6e9579a6cdaf9314baa472f3c5e81170a/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/f7761b970d120240f0a5ad143ed1242c8ae1265f/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/3f8b16ceaa75a1b6b277fa9490247b7b0522a980/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/fd24a71bf3a54ed66111f830284a2d7155cae495/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/950d6f5ba29759286ed0a6759e06b5254cc65015/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/e673993af07d42598cd068ef37d0c0f7434ccc51/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/d73fb6b9a9476c1ace33e8ef742b2b1b7fa1c1c3/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/a2643fb919f9286d175340d4dc1e03d9d8075cfa/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/4bb5d648849e91ed685698045c4c5d003db47c63/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/dbe91dd6543b4b88fbf1e5b09d4997d2dc730747/
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/bd69ad1bdca8a64d0a0e17e823f20a5d8cab43a2/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/b45cceea99b9860ccf1c925eeda498a823b30903/
        sh4a | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/5ae336052fd32057d9631649279e142a81f5651f/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/5fc3abf4a1aea677f576e16c49253d00720a8bef/
     powerpc | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/0eab3833253573451bba59968c8d05598183d00e/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/8daecf01f2251337119eec90706e023ada9b8a41/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5ae4ce4a051316eb1b443f025a8609ce8db2eccf/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c5350319beae51ff80a4c74457d0dcef9c6506b9/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e6dd78bca369da4e1dd3c9ff20befd5d6e061b58/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/8fa67389f9558ecc158e508b5e36ffd5678a3561/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c3d539c6b1a05ebdc84d94adc9b0efa440af7124/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/a1761125e1d483bed337d087b21095b0e460ac2b/
         sh4 |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/7d6c08badedd3d93bc6ca459b91fd83ff5f5107f/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/d1a1f916102d7ba2bc7cb3b0e5c6056dddfc0458/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/365b03d8feb73c10141252b3131638e7f859d8b0/
       nios2 |                   imlib2-1.4.9 | NOK | http://autobuild.buildroot.net/results/9a3f0c31ab6a6620b6d099eec20531b80d1be111/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/fa86b1d2c50dfa341f1cc232e4ad7f96a9325197/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/812744924a4247961bae7ee4e927300419bc4a79/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/7ec0f2cedcbbb46a6083d80d31d6192207078286/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/043c4d58a96bc90c851e93517b3e3d856ba04277/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/f2fe074ae7cfb8006751a5e3c1c59f33e1f64951/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/ecb5141f21c5b0e298d8b9f513cc89a52d722504/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/05d4051341eed5dd77e344403bbbcd997e12340f/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/b4e6f42fa0dbd008ffc5ebb5bf40d88aa5006262/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/435e000a8fe96514618f9ac9008818726b533da7/
        sh4a |                 liboping-1.9.0 | NOK | http://autobuild.buildroot.net/results/c2d3ed8b1832492bc8747a60c81d61f64a36c27c/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/8f48b2c7ae965fcac11c3e8b2fddb74da6ff17a8/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/cfbab793d3cb0b7c79e6c58cbdf178a85812f1cf/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/64dbea6b95e6a88f7ce15176177d0660673a133d/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/423adc5310b7d13a61c1858501a27bb153e919b2/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/9b71f5d86e1f8c571a37934e9b7dcd1d7b7cece3/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/212cbbe8d0fd8c2d81a4285946b3de7cb9c39b79/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/fc0fc3a4456c8ffa4ea6135678b783a2d78ddbb4/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/f2071feaf3d3b07a93003e44e41ff34ae3862019/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/37c838bd826298c50e36f7df5d91e3dd7f6b23fd/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/fd304ac841ee7aaf2f1c41c639c3ef7d02a259dd/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/036c9088cfaae421c15b650f35e7ffe6ab934031/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/0a4f5364130afa517c916fd383ae9d84660b122d/
         sh4 |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/fdd7aecb3b6a6f32d5c0ce8e1493a13d4a688b63/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/0c300268e6fea2367ce543cca1484541775c93fe/
         arm |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/55d9dd15a25a2190c93cfa3cd45327a365cdb36a/
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/51c4b7dbdd26f684aaf410736fb19be04c1f2347/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/1b131697e98ade92e5b4cdd43f275b3e41ad6d46/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/0691ffc8f24d4f12e5ecf8877db184da8c200e43/
         arm | qjson-ba273682a9d33a7b3090e... | NOK | http://autobuild.buildroot.net/results/ffa343702727e118bb98b9c273bd0605de7e75e2/
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/a1c9c2e8d8a94705251ba6d7215a5eb089c18714/
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d6e0cfc2400ba1fd8d6ae0facf0e3681b1f5ecf5/
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5667ed522e7385b8ec6f103f0b36e20c6db9f2b4/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/25b75994d66f05d4d7a5db3dc44f6579f9e82452/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/e28084796861df03cd23f09296c4a8029327aa73/
     sparc64 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/9763844a4c74c22b2155705610d28846dd52754a/
     sparc64 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/bcdc704c48ccccc2f1203983574546dfca60ded7/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/45f6ad44d7ba7d121e93862a2b34b8f2aed68842/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/1b941fc4e34a2ba4b9505d56c1e0f32e22f26ef8/
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/d06e3eb9ef48540b71fbec267c534523632b224f/
        m68k |                 upmpdcli-1.1.3 | NOK | http://autobuild.buildroot.net/results/8afb9f96bb827b723b859ff73cdf674ca6434e7c/
     aarch64 |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/3fce626a3f1a3f80dc044648e2115978631f7e7e/


-- 
http://autobuild.buildroot.net
