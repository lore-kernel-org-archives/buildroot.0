From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  9 Mar 2016 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-08
Message-ID: <20160309073018.DB2C5101A70@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-08
===============================

        success : 188
       failures : 100
       timeouts : 0  
          TOTAL : 288

Classification of failures by reason
====================================

              host-libcap-2.24 | 15
           libimxvpuapi-0.10.1 | 9 
                     dt-v18.32 | 7 
                libpjsip-2.4.5 | 4 
                    ruby-2.3.0 | 3 
                  multicat-2.1 | 3 
                blktrace-1.1.0 | 3 
                 libraw-0.17.1 | 3 
                 setools-3.3.8 | 2 
                 mono-4.2.2.30 | 2 
              rabbitmq-c-0.7.1 | 2 
                      qt-4.8.7 | 2 
               linknx-0.0.1.32 | 2 
               libcap-ng-0.7.7 | 2 
               libgtk2-2.24.29 | 2 
                  cairo-1.14.4 | 2 
gmrender-resurrect-aa3d02cf... | 2 
                 mesa3d-11.1.2 | 2 
                 lvm2-2.02.144 | 2 
                    owfs-3.1p1 | 2 
               valgrind-3.11.0 | 2 
                 opencv-2.4.10 | 2 
             webkitgtk24-2.4.9 | 1 
                libgpgme-1.5.5 | 1 
                    mosh-1.2.5 | 1 
               openswan-2.6.46 | 1 
             lttng-tools-2.7.1 | 1 
                  gamin-0.1.10 | 1 
                   tor-0.2.7.6 | 1 
                  stunnel-5.31 | 1 
                collectd-5.5.1 | 1 
          chocolate-doom-2.2.1 | 1 
                  connman-1.31 | 1 
              gst1-libav-1.6.3 | 1 
                  trinity-v1.6 | 1 
               polarssl-1.2.19 | 1 
           qt5multimedia-5.5.1 | 1 
        lttng-babeltrace-1.2.4 | 1 
                 igmpproxy-0.1 | 1 
          shairport-sync-2.8.1 | 1 
                oprofile-1.1.0 | 1 
                    yajl-2.1.0 | 1 
      kismet-Kismet-2014-02-R1 | 1 
          libwebsockets-v1.7.3 | 1 
             netbsd-queue-1.70 | 1 
                   lzlib-0.4.3 | 1 
                    cups-2.1.2 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/e55502cdee5beff28ec0507cde94eece7419f188/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/2334633c8e63729c4d2afbd1b61ac6cfbbb2131d/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/eebee0065124a8cc0ba50f0461b356f6bcc4e8bf/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/c51846fc429978ad22d3e2902e4e6f04ad22658a/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/cc368d68f90be992f6f326eceeea5198a8b08569/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/c44062ad3c1d8ecfc4029de8ebd1e4c306f65293/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/dc008f7aaec924b480fef99baaf8d419ace12f01/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/785140c38b42c037a486a551ac72115710d28479/
     powerpc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/962b2c185028ab83e03c5288be188b59cfd6af8c/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/0cf247a51514d2fe574dc9faae95142efc126dd4/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/07c0f49494c1b39cced35b0a51b98d1bac5121ba/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/f23f1d0fc664b85b1220a2de373286937309ebfd/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/3a124dcf654426c84ebac02ae84c62afdb20a486/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/95aaac30d40efc99d9e648e6d2caf8de15f863fc/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/57086ca9723af17443fd596b7c1a6fba71cdd369/
        mips |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/d15eef0fdb5571189160bdd124ee10fcb8573790/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/4d8eff65b0f0c2cae37e9e3fb9519bb17effa370/
         sh4 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/a051a2c651e787f7e557662d07eee477c6d35e7d/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/dfe7c713ef08f97bb1818707cd2d19c2a0d6ca53/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/06fe6004d16b10bc4f35941c168fe12847ebc99c/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/630976c1562a624cd4da7c190aaed168dcef383c/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1965022c793e9202c0c3d3f5151950017b39ed66/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8e9e17614f5e843dafa71250c14d6244282e103f/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1ab3fd0248a6465e9432d3de90c32b4c8fb224a4/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/22fd79e1ad26b357aa8aa2dc7b74c7b0b5492c05/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/eb765fc77ed1e6ad78962220cebab7478e31c661/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f634555cdbf786bd4ddbd3641bd121a4a4058c16/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/27366a4cf6bd78db41e195b7e3f74cbae14c76a6/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/265f6b62e3f630693c99e21016e2ebfd0de8d173/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5805a888d82726005afda99085608f3c66798a6e/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1d4c7e80e6cde380766a3d097ffb29fe3e25ca72/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/61c82841823af2bdb4a08fe8b0a3d5d416e1e9aa/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d3b6df66cbc251bebc089dbe26abe2ec65bdf46f/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f9bd61757d21a038f9caded875fd4f97dc5e8a75/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/81309b621e9f654e7c638e6c5ef1103a6d1914df/
         sh4 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/610cf0b6f25dd66009c622062f981eecd6a02e61/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/4a3966387dc86dbd6d5a46303ba3b38d72b0310b/
       nios2 |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/226a87ba01cdee9a603e08700c8d2d0a1b1c67d4/
       nios2 |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/990d7ea0eb6777cd8da15d7d82cff4260638cc0f/
         sh4 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/da4d1c073bc0b78e26c9d2eee3ab00091e6fc2cb/
        sh4a |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/aed580e9bc68603f75a23d415998ee812ae15e03/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/0542efe1dd02d5f147056a71cf067be54ca7a467/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/a6ba8242f6a0826823ba079e76b8152c2d299ee0/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/aa9494305a226bf0707587a8bbe69cb7924e6091/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/1cd56fa4d3c86034f418bd3d84374e996e1ca5e3/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5b085b346cede1ba111476a7c72308b0ce0a6519/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ebd45dfec8178bb62932ce799bc80137c4d0112b/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/b38e8fe7b81caa57f0cfaceea3c1765e2dcc0db5/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/705517f05ed40f39cdf1c0db6443f9da742315bd/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/21eaf550809cc71848acf1e7d0717aac12c63634/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/69c909539fde20a8b029467ecd10894410c0afc8/
      x86_64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/92d946e8dc0dae7da1008a336a32111b05f1bd4a/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/a1bda7416ae85d248300ce317f27cac3ef62db6c/
     powerpc |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/b9b2e6ba310ba45934ddd14dc56a2f51030e63dc/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/17be939cbc6def6c6dcb0d6062151b86e0e9697b/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/8e8e800552e5fd50bcc1bf14ab582b38529bce8a/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/16f13716f6a9f13f6f4e0797ce2b04834edd4cff/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/8ff759ef3a8ac8af1072962c85adc5a828b8654c/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/ad993a9a3803e82946f46a21c629f6ddb1ab23fd/
         sh4 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/7149045801645bfea89554c63dd42100aa4126d1/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/4bd04b7a3ca0092b50ad5c5212830d8935f54d48/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/dd69b1a14e2c990e526ee98cd4eed9e29b23604d/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/ac9aa3b6c468a0a6ba84758d3c9c8acc20d7fa00/
         arm |                  lvm2-2.02.144 | NOK | http://autobuild.buildroot.net/results/fe810c005a356a93203b1a71b0ee3d5f0ac2a512/
         arm |                  lvm2-2.02.144 | NOK | http://autobuild.buildroot.net/results/4d228bccd1b181d3622778519aa69e46c7e492b6/
         arm |                    lzlib-0.4.3 | NOK | http://autobuild.buildroot.net/results/d71209c3e5235f507afee38b618d5740ef91fdcb/
       sparc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/f14efe1f30b3aea875e46e610ebf8ca1a5e7e701/
       sparc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/d0cad4bf5701e09e091db0ddb79c9b1cc385584d/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/284f1b582e02458212cc6af1b2cacc10d4b3d832/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/b5c5ff3b179e9b426a1985d618494ce2cd98c537/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/0eb7aff4ec3c2786875b9ae36ed4dbd667f530c3/
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/3b1cff27511d88bf9e2f6c55c8b82e1164e7af52/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/00c883b501da60529b2899ecdda4573a5a017a16/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/aed2b9abdd7083ef1e11e3f5f41a8913fbc65f21/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/534de6f6e433319e45dd30fc4ef7c3783d9da1a4/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/d53f5a8d965dce62e7ebd39c45c6f857b9565926/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/bc353a906fc83c3a229dc708a84fd05705374444/
         sh4 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/b9e88e31ba6e1b596f7db5828df3dca47a03c828/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/0bbb523f472c051cabd99ee11a5cb096ffd8012c/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/3a85144753e4f18491d62dccf6d5843170f8daea/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/d9e918c2791cd5523b2fd6478bbd4ce21e58f4f1/
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/fd06a94637251d4d119994095f8d316b1bc6f03d/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/259d2f8bffa2116199980e51426ba71c83cbdeee/
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/db68b1dcb8144f9e8f433999fe53bbc0afd8eb62/
         arm |            qt5multimedia-5.5.1 | NOK | http://autobuild.buildroot.net/results/ad415a1a66967a2f44329f9dfd049c9b14863777/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/27e8769387c1c65fb297d5ac0068a0862cf6f3e9/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/f46b66a1d78c0c5f985116db44701c8f85db5238/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/559cf8b88476be3ae4b8ea357be2c14436d18517/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/fa7a4b2882c37c9f29f3d7398302ff581f529e8d/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/41dbdb2886cfc34c36999ebffd672ea6793e1e57/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/b83eec1a984db3173fc489384318e1a5f86cadbb/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/b3b60acc04b7f4a41a2774b87ae8cf5e700cd607/
     powerpc |           shairport-sync-2.8.1 | NOK | http://autobuild.buildroot.net/results/7fa440458aa45e732adeae50be4042f52d68776f/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/6a3f96c6525c2e19d1e944ab0f0f1396eec8f7fe/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/9c7fdb2a3566448142cd33106786d397b352e8c5/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/359448a37d140cd9f7397979454823442d1d4ea7/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/1365ae0d80dff9b4d08595ec5b15763183fe2d3f/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/6b28c7a44a3df3582630f1c5eb5ba92a11937a0b/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/1e3785d030b2094f29c4e65e9a674d797239b519/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/7f76f3285a56a2683174a55ce8e3772525983880/


-- 
http://autobuild.buildroot.net
