From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-20
Message-ID: <20150721063018.2E5DB101102@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-20
===============================

        success : 222
       failures : 105
       timeouts : 1  
          TOTAL : 328

Classification of failures by reason
====================================

                  fan-ctrl-1.3 | 16
             libselinux-2.1.13 | 7 
libsigrok-fe473123ba836445d... | 5 
                  zeromq-4.0.5 | 3 
             armadillo-5.100.2 | 3 
               libglib2-2.44.1 | 3 
          c-icap-modules-0.3.2 | 3 
                 qt5base-5.4.1 | 3 
                libtirpc-0.3.1 | 3 
                busybox-1.23.2 | 2 
                  ffmpeg-2.6.3 | 2 
           host-heimdal-1.6rc2 | 2 
                  boost-1.58.0 | 2 
             expect-2014-05-02 | 2 
                  cppcms-1.0.4 | 2 
                    bwm-ng-0.6 | 2 
                 libpfm4-4.3.0 | 2 
                  mysql-5.1.73 | 2 
                   audit-2.4.1 | 2 
            host-nodejs-0.12.7 | 1 
                elfutils-0.161 | 1 
                   eudev-3.1.2 | 1 
                   cppdb-0.3.1 | 1 
                 lrzsz-0.12.20 | 1 
                   tinc-1.0.24 | 1 
             btrfs-progs-4.1.2 | 1 
                  mono-4.0.2.5 | 1 
               dvbsnoop-1.4.50 | 1 
                 netperf-2.6.0 | 1 
                 webkit-1.11.5 | 1 
net-tools-3eb367aedf1280f35... | 1 
                  guile-2.0.11 | 1 
                    libiio-0.5 | 1 
       host-erlang-rebar-2.5.1 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                   sudo-1.8.13 | 1 
                 setools-3.3.8 | 1 
           libfreeimage-3.17.0 | 1 
               arptables-0.0.4 | 1 
                  udisks-1.0.4 | 1 
                 libebml-1.3.1 | 1 
                  cc-tool-0.26 | 1 
               libsigsegv-2.10 | 1 
              gst1-libav-1.4.5 | 1 
                      icu-55.1 | 1 
             util-linux-2.26.2 | 1 
               libplayer-2.0.1 | 1 
           aircrack-ng-1.2-rc1 | 1 
           qt5multimedia-5.4.1 | 1 
                iproute2-4.1.1 | 1 
libatomic_ops-libatomic_ops... | 1 
                bellagio-0.9.3 | 1 
                sysstat-11.0.5 | 1 
                     rpm-5.2.0 | 1 
                 empty-0.6.19b | 1 
               mongrel2-v1.9.1 | 1 
                cegui06-0.6.2b | 1 
                  bcusdk-0.0.5 | 1 
                  redis-2.8.19 | 1 

Detail of failures
===================

      x86_64 |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/c0181eb1f245b8eb11e5a85255e298d7f8d9cb02/
         arc |              armadillo-5.100.2 | NOK | http://autobuild.buildroot.net/results/2e035e297c4c458d3592a109ecf81f05c315ff04/
         arc |              armadillo-5.100.2 | NOK | http://autobuild.buildroot.net/results/224bf508b106af26fbf562f54ae723376bd73db5/
         arc |              armadillo-5.100.2 | NOK | http://autobuild.buildroot.net/results/a6af6ca761a00e8336c8340582443ecf7e1732b4/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/6564b6a58ddabb3383effcfb7e119fa6b7cc339d/
     powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/8a3f5ab116d2028f922baf13949ef59350ec1cb8/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/1ff18f505ce02ff361d8b515fb5e357f41cb0823/
         arc |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/34a81ad032ade13c7690a9cadb4f3130009d55ae/
         arc |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/5d5fd738f10697985adbc6ed58e6c52ee95b8b33/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/b079d3ad7bb73ba712c192cabc120226721dbbcc/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/50ddb98f05ee1b2b1ee7566f578842da97357617/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/f913097207ce5f0101e60544fac9a650f5dbc781/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6ec99efba703531b3027c92aa9b0fe6c35d34297/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/35b9d5cc239ecac98973e1b5ce18e8848d6a2362/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/7bf38b15c15c7aa1d4cf59b12c79944474a77771/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/18ceff8b0fd20265b1950319ea3f6c7e71994759/
    mips64el |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/862b71f98ce751a206be85c920e0f0360668d362/
      xtensa |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/44aa749bc2f4b19c9d9a81f159c3d93be8b804ee/
        sh4a |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/64433a4e30d31bfc28a73f880ae0a7b97884ef10/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fd1aa63ac36cd72c67289733b5b5adc23aa7858b/
         arc |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/7709dbc4b452dddb4953f02e298b58aee2f0420a/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/23b37e72d823567210b3bd5b910d978a1db3c78d/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/1e1fbc894741ca971ad663a8a894b12ebba06e63/
         arc |                    cppdb-0.3.1 | NOK | http://autobuild.buildroot.net/results/ca28f8df0c858ddcf18d389fe0f3fec05df9e184/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/067307814d36ccb8168d362364c7aa05a55fbc6c/
      x86_64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/7db6da0e72e5d161923010d708341b50d6d29e7a/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/c0d847bb910f76a91df6e5f78feec1a9372fef74/
         arc |                    eudev-3.1.2 | NOK | http://autobuild.buildroot.net/results/e1bf66e5072ab5ff1207ca20e3088f0277056ce5/
        sh4a |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/7741015b3ab6d75d6e7cd8cae3ccf1c12bf4d328/
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/19125ff6159a10a2075262b8b4a7365d7e459d91/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/0ca81a72cf4000e1ae55e3c4458e19f0bb6077f7/
        i686 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ff502b5de7a9ba635436753933a65325abb50759/
        i686 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/3cf259443d19a260b4988a8474e9b927b0feed24/
      mipsel |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/d6f93045bb7848096c9ac767d3aaaf186a68b3d4/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/6a5b0fdfb0a38b6e0da922a747b94c2d1aa318ab/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/4c6f305628e5117ce7f059abc27ba080122f7b01/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/f403b8f402d4cc78f478fdd3d313f3b44f06f1ba/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/d40031cbff9e537676787c56070eb3a9908b605f/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/a683fa2cce25710c8e9cbce9edadd64d445c8c11/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/e421b33dc7fc20a759e5e7c1a99ae64c749ea766/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/73835471394b1736cc0f01797d0ad1e8295e3eeb/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/7c7b7542c643ad200a8294af9c264d9396c1f857/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/603c7d2df1d5e404b69f64df7f9f7e130fb12355/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ad167ce1fe675427e7779a5e38fcaacb7dba1b2a/
         sh4 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/88ca00eb00087d4f807ea4bab3ef864ca6067548/
     aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/3bb1512048ca9d6dbe626b20b07bff9cc9691cca/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/0577cbb9e0dd608b97def146fa552c752ff3e676/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/f9367341df60a8a5f86e9281592e5ddfe9101340/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/31cce30a6182110d64aa516a2b9e3036dc91a417/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/24defb990d30f604b2bff85de4d1b3cd28a7cf6b/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a8767330dcd3ede7490fe00efe9ada5647c34802/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/66c554200e9da0784c39612dbacad720c49922d0/
         arm |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/432ca331ef452fe3a291fe5b5326f04fd2086b3c/
microblazeel |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/d1e001309deb9a732ffd837cdac73bf363ec1814/
         arm |             host-nodejs-0.12.7 | NOK | http://autobuild.buildroot.net/results/8321613739ba756f89a95da94c140fd5133a4656/
         arc |                       icu-55.1 | NOK | http://autobuild.buildroot.net/results/10073447f6df7b1b66a5f773929b3825dcab98dd/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/85fab164f36f1cf9a5f194ffc681b2e89963a4dc/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/e01b52c463a6a951cec3aab7de907b901ae125cf/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/c27edba8278b42e08a8947e1dc205a88802738c8/
     powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/3d6e91464794975601121c9f23080a620ca37dbb/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/dae7289a16b789a364184851abcb8fafb0863919/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/ce9a3505a00a0c320185b14c48508e30a9458435/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/d461064dd8662d2c96e93eadabf7efbdbde99e76/
microblazeel |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/a12774f60529b7420a387ae857e2faa735769ab9/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/a9f2ae52e676b656f8c85700e8e739176be76801/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/515ca88047f06b3821479c8e49caf223fcf4b0de/
         arm |                libplayer-2.0.1 | NOK | http://autobuild.buildroot.net/results/bdc83d99a5f9c73bf3e0df3ed9a351fbcd448bd6/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/97d72c64542f189abbca498d09a732af99c8823a/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/814d33e1442cf1202af301731ea826465ded827f/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/0c5c4959258de995d9eb75af9f6fb62db0955476/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/46f6d3fac087198826827f82ad5c03ba48e2e070/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/9149ae265cd10f59f7b54b19a4fc4bd3dcf3832f/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/4f86f86a5fc1ea277a660611347a970a517adaba/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/37016cc95b9e4d7c39da972027bd9f0a1ee8ce3b/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/08038c2453eace04407e809fa9f1b07e54a714bb/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/9df37f12841d74dbaeb866c1ff9222205924d609/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/57ba81109dd619ee448abc8a07c8c872035a2a31/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/2a63f5ab09214d7a99692131368787ea747c2f7b/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/0f9887e64704fbc3c9ad7cb8fe17f6d9363b35d7/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/f58839fd2210af0d7a139598f45792f3f210d4aa/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/7bf6fae3d447a0fdd8de2139b9bd62c8e080b222/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/6816bb7b5d9d001fcab87ae6efedafb084c99e9d/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/0146e52b8ae06dea50daf59aafe4f5c77758a0b5/
         sh4 |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/05a0f948b28de94a3cb557ec7a1deaacea1ee61a/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/3687cb4923d8ca41243e5401a3d401c0423ca8c7/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/e1a31667fc26cd9e9005537ee655a5332f237772/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/3cc237af749e4f024897eed714963a096d6b0654/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/b980140eee36461ec9f11c4013f315bc1b788e2b/
         arm | net-tools-3eb367aedf1280f35... | NOK | http://autobuild.buildroot.net/results/2a51ec47c07f7fe8208fd8e48819ed84d384c320/
         arm |                  netperf-2.6.0 | NOK | http://autobuild.buildroot.net/results/2016f2a6bdac2e55c3dac6ddf1f5b13f27274946/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/06bc8e67880f19e74928fba30b2748febb1d0dc0/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/2fca4774d67f0349ac52b812d618f739725cf5ba/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/595e74e2f83354f10b2d081cdc9f13d04907c56d/
         arm |            qt5multimedia-5.4.1 | NOK | http://autobuild.buildroot.net/results/0ddfa8e3593153dd676cde6e99cc857489909605/
       sparc |                   redis-2.8.19 | NOK | http://autobuild.buildroot.net/results/f69d7bc42122572dc62d078ae0605519be09c06b/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/65c5e85089805a28619d7f0b88bf440648c47bed/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/18d1de61c8936458d078a97a6b77436b4f680e12/
      x86_64 |                    sudo-1.8.13 | NOK | http://autobuild.buildroot.net/results/420679e12ad56f0ef48e85d3b5d58a9925e4028d/
         arm |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/39f6dacef1e47204eabdbb9922937f5a2171adbd/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/c41c59c0016730b5afe182de8990ff9cd1b6207a/
         arm |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/03947be76146f2dbc3e2d8df94211631b577b95e/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/e97db34881d1febdbf012a11b6f98a8b0852232b/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/8becd4db2f65609fa193cca79098e8be535b3fb0/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/13657d581a4ef2e522486fb45278a1fe5a27ea89/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/02474ac1b10321c963a6e6b49f266c30db694878/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/ddd39f4ed069c06e9e40cb7056af9c2d5d8f5dfb/


-- 
http://autobuild.buildroot.net
