From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 May 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-07
Message-ID: <20160508063023.CA011102FBD@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-07
===============================

        success : 138
       failures : 54 
       timeouts : 1  
          TOTAL : 193

Classification of failures by reason
====================================

      python-coherence-0.6.6.2 | 10
android-tools-4.2.2+git2013... | 9 
                    mpv-0.17.0 | 7 
          php-geoip-legal-info | 3 
                collectd-5.5.1 | 3 
               valgrind-3.11.0 | 2 
                 host-go-1.6.2 | 2 
                       unknown | 2 
glmark2-499aa81a68fb4c8aac1... | 2 
                  ffmpeg-2.8.6 | 1 
code/CMakeFiles/assimp.dir/... | 1 
                    libiio-0.5 | 1 
                 jack2-v1.9.10 | 1 
                   erlang-18.3 | 1 
                libgpgme-1.5.5 | 1 
 toolchain-external-legal-info | 1 
                  connman-1.32 | 1 
                    cups-2.1.2 | 1 
  toolchain-external-undefined | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                pinentry-0.9.4 | 1 
                     vlc-2.2.3 | 1 
                 lvm2-2.02.152 | 1 
                  stunnel-5.31 | 1 

Detail of failures
===================

        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/8e1a4342f916f725be90f4ba41324f1589c7fa82/
     sparc64 | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3192929b7ce6c44bb4b06a9f8261b996e2df4938/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ce360d4dde7ecc3281d772b0d2a60d75c0355830/
     sparc64 | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d6fadc63c8477d6d70d62aa395f3ed59df90a706/
      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/32e98cd6b178817695ff59bde9c5c230f1aa7ea6/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/86beb9c48d31742f1005007a0b84c32714466c2f/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/dbccbdd62ef85e13f9a100c4142d9fadcc65b904/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4f1ec29e79732d09ef304f6c28b2fba6b65b6a03/
        mips | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/278d52c3ec97aa343d1bb78b3e7fab024a28cf0d/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/5d5d9a4ad9b1b7c04d318892c68988ea638cc970/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/aae8874497b6ea68c11fbfd4895f2b7ea68288af/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/86eb5f50e03e95d1a2a73cb19a72254994c975a1/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/818faedd4520d2a3126444c71d3ea02e11f23cfd/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/6e8337a9a79472d2d188ff83f19a6485602eaed9/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/fc685918bf61314fc92e541fbd37a559f37a50c8/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/90ba44e35cb34e88b011dce0eb6a4468a4703b8f/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/d967e4521e16a8a8e288059f4c05d1f88c0fe9ef/
       nios2 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/0c314883e485ad00aee62d08bd457ee4feee1970/
    mips64el | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/1acb1b2a301e492b5dd7e9c808357c6b1ed47869/
     powerpc |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/f4a5c609b704ef26db2d8e5529e399e75e0a9d50/
     powerpc |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/24d35a91bcebbe7dde42ca8e06185bdb464f8a29/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/488302f16465a7b8aee6f4022d94c53e9c207afb/
      x86_64 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/0db1b2aa0969d6cbae57b1400b7b766a5988abf9/
         arm |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/90ca0fe05401817b401db7dc3f21ff61c81a6085/
        mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/c7d94d3deb64f3d8319b031b2326f7d70a86a7ae/
      x86_64 |                  lvm2-2.02.152 | NOK | http://autobuild.buildroot.net/results/916ca266e7c6b873340f826edac64f2fb570fabb/
      xtensa |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/af95e13d9854f5e0c68e2637181e03e2627b06cc/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/a5a0e72083413f579f8a01d282478dcafa2da18e/
      x86_64 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/fb79843f41ea228bba448f47a32be7e8a9afe1ce/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/c3e97af17714d88ef06c18b91c1a0cd51553912b/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/e1dfb81543e2e195c32a0a8061ac2af254b951a8/
      mipsel |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/51395bb538fde10feb70b91b9ecb173d8ad9b89c/
    mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/cc2c11efdb2fd181af5541f41a914d32e621a2b5/
         sh4 |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/f772b9a7252ef2ccdbdbc2cbc56edfea2605811e/
     powerpc |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/33b7ac792c98cd348e15da36ad94a3766a12b75d/
         arm |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/401ebe8fd04276ae81cadf9d463115d7cfa38ace/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/ba5d92f33f2ec31ca862b8e9e703ffc408c2b3fa/
     powerpc |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/d58c814a5e412c356cef73d1cfaec9834ed05ad6/
      x86_64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/b8b506b28bbcdce06189389e4111d9fdf71fa116/
      x86_64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/507e75955c237c032e60b73f63d0701685138aa9/
     sparc64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/f7d61d22345102b41512e372ea8488f681a24bc8/
      mipsel |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/751b078736aae00924c9010e23247119c26db667/
    mips64el |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/ee53ee40e2976b0a4ef215dc1bd9dae23a433e66/
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/ebec3b3c61d7ce036b5b1eacb4eec1ade9fa54d4/
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/40fa4c9693e52d7c1a0b325840d79ee2aaf5eb5f/
      x86_64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/55e24d746acf22d1d875c7e82b63d251b142702f/
       nios2 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/b88cdae6a767420e666efcefaa8893f20dc6ea46/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/544041b34355d103a884893eb9903f44cdeafa3c/
      x86_64 |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/a21b26b3fad257d63ca718755079c3f327792327/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/37fc353b5aecada2116c9af511d7d49e64decef1/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/798988175d4f6af0674a034f12d7f66868fb7e0d/
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/ee6846242a878b930865127a870adb9aedd38402/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/157c01f36511a11f3d121b009c14ff0d1ceea408/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/ff26a529094631533b7f37afb33e1fd4105bf7f7/
      x86_64 |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/8254d8a5b6e572ae6541ab50f4349c10bb671efa/


-- 
http://autobuild.buildroot.net
