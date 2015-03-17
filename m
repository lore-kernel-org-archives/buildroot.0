From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-16
Message-ID: <20150317073020.29948100F72@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-16
===============================

        success : 216
       failures : 69 
       timeouts : 6  
          TOTAL : 291

Classification of failures by reason
====================================

        host-e2fsprogs-1.42.12 | 7 
         lua-periphery-1.0.4-1 | 5 
              postgresql-9.4.1 | 4 
                   cmake-3.1.3 | 4 
                     vlc-2.1.6 | 3 
                   attr-2.4.47 | 3 
        host-dosfstools-3.0.26 | 3 
                 jsoncpp-1.6.0 | 3 
       host-erlang-rebar-2.5.1 | 3 
               libecore-1.7.10 | 2 
        host-libselinux-2.1.13 | 2 
           argp-standalone-1.3 | 2 
                  snmppp-3.3.4 | 2 
                    wine-1.6.2 | 2 
trinity-c8c41f99500b5854c20... | 2 
                aiccu-20070115 | 2 
                  boost-1.57.0 | 2 
freerdp-b21ff842ef3de583751... | 1 
                      qt-4.8.6 | 1 
                elfutils-0.161 | 1 
                  libnl-3.2.25 | 1 
           libmemcached-1.0.18 | 1 
                   perl-5.20.2 | 1 
               xfsprogs-3.1.11 | 1 
     host-python-cheetah-2.4.4 | 1 
               qt5quick1-5.4.1 | 1 
             host-thrift-0.9.2 | 1 
              libarchive-3.1.2 | 1 
           heirloom-mailx-12.5 | 1 
                 qt5base-5.4.1 | 1 
                libtirpc-0.2.4 | 1 
                  fbterm-1.7.0 | 1 
  1950K .......... ........... | 1 
                cppunit-1.13.2 | 1 
               harfbuzz-0.9.22 | 1 
               mongrel2-v1.9.1 | 1 
               host-qemu-2.1.2 | 1 
               ipmitool-1.8.14 | 1 
                    sox-14.4.2 | 1 
              cryptsetup-1.6.6 | 1 
                bellagio-0.9.3 | 1 

Detail of failures
===================

     powerpc |   1950K .......... ........... | TIM | http://autobuild.buildroot.net/results/7aeebbaf9db86037139e238cc86475fba6020992/
         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/03d1dfee9f49635f433b6f426ae730d28c748a8a/
         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/573b3558587e103e35cf0a1a3e20e7b6e0ad1026/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/46e3ae4b382b9c3f1e997d504cd42bafe9d21275/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/b30456878ceb9799d3b35b2bfc415ef7bd437d70/
         arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/c180cbfe65df1324593f14ef4f978e8ce3b78356/
         arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/05f38c19dd3c1ee94b01f22b3a82c9ff6e3c9280/
         arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/2f78f8be7c3f4a8a855cfd283fc73bc841a036c1/
        bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/e9b18697e3c519d38ea3666f69bed5cf008d772d/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/093c623ba685751946dc98dd421e2ac1acd9acb4/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/63683515901476a68c998c8b81ffe980ccbd9d70/
      mipsel |                    cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/f8b0a4a5fb76a902a052855bd0b2454dcf9019a5/
        bfin |                    cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/9f7c8d5078cd1f3cd493f9ae8e95c8ee728f98fd/
      xtensa |                    cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/0f1afc62e91ab798fa65685af3dea3caac663f11/
      xtensa |                    cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/de9021fdc63600536ffa91e4b8718584e3e5702c/
        bfin |                 cppunit-1.13.2 | NOK | http://autobuild.buildroot.net/results/802544b265cae5c4513f5a5b67d0f7e19cb871b4/
       nios2 |               cryptsetup-1.6.6 | NOK | http://autobuild.buildroot.net/results/4242ea39fa5a26610dac2370e3a6bd1b0f362591/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/446381db5b89f9f39e931278eeb4e82652cc06dc/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/6e8a691b5e4cfca66400f4623b4c0eb9f68c971e/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/ac9152bd19e6d87cb69dd374d15832495f5ebe6f/
        bfin |                harfbuzz-0.9.22 | NOK | http://autobuild.buildroot.net/results/51ff21e395962ded9d3d1080a90d3956ccbd1b51/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/e10837f1b9956aeb3a7662b3d7c1aaee4e507416/
        mips |         host-dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/add3ece4e67be53a9c325e2277ee62c64acab09d/
        sh4a |         host-dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/b19b84728a4148da6d5f543e6975d9cc6aecf32a/
        bfin |         host-dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/33f9fa1a54aa05071d91fda4134478e681fbe2d3/
     aarch64 |         host-e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/2d59e3ca379099d806b21ccf98bae4191a2b1da4/
        sh4a |         host-e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/e39e8b08b5374bf2b6619fb2ae89f1dc9df73e78/
        mips |         host-e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/880b4bf39e0b52ca0bfcadf519a86fcad73cb3f3/
        mips |         host-e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/98281433ad6cad2e4511a012ac644654df8b9d3a/
    mips64el |         host-e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/91d61b17f1f9f632d54f6fb6650ce24d8e7cc7f7/
microblazeel |         host-e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/60bbe0ad9ccd35ec9df21cdaed32f14d28995f81/
         arm |         host-e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/8e08d154ee4c43e7b01c716747c1923c4b163cff/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/e29a451349661face23dbda7669d59a50fb10934/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/b419cbd1c793618de8aed6ceb9736210042166a5/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/d7facab6d907a00501d28605522753601082b33d/
     powerpc |         host-libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/314d1cdbbe3aa4cf61c519ef5e4855e254a138f9/
         arc |         host-libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/dbe26e754dadc948a7659fd6c712ca8accf7668a/
      x86_64 |      host-python-cheetah-2.4.4 | NOK | http://autobuild.buildroot.net/results/a78343cc14b23f6f38e275a539066102339127c5/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/a08799c0bd6ddb6a476b039782443c69fbbd0c7e/
      x86_64 |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/4bd491c99420f76f4d2bb31b19c30f7320722dd6/
         arc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/85031e1b51c2f65eaeb98c4a700ada5d9fddf057/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/83df07bf1b88d2004ae54847dd906954d85198e2/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/765724ae17cd8fbfb684b0ab001cf37aa8606bcf/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/6c75e8145c44b29e68ef84c22db518a82bd5754b/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/4d3cfb65b1865101cdeed7d293136a442d32e363/
     powerpc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/3689e861f38ced0b22c3bdd941a5cd5e9e3f35e9/
      mipsel |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/957a3b039cbcbd309d39eeb44f70615935f01aeb/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7460a8325d319210fd68dec963c16423ee9566f0/
      xtensa |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/58bafba12175d69f60c1019937f4893276da1691/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/57c55d92982062154219bebb8ad12565a36d7f10/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/ca7146661c8135568be90dd53b6ee569ebff270d/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/bc73e047bf11a5a1714c34d6a494d177bedfa310/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/c9c6daa24bc5526ff910ff3f51e5f4b9f502aee2/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/e3f3904ca445e03757d7a7e35aff2d3975d9af97/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/3166f570dd41628ad9b78554d0c1bf71f5886675/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/ab197b6fac2a97b699c9dddc764f225b04f6beac/
    mips64el |                    perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/b420abe5c64aa10eb8cc03cdfdbc837a9db24a48/
        bfin |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/eaa91439bdecdab19f2015d7ec7d7982a57553bd/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/822bd05bcb7384c671bfe13125db3a818982781a/
        bfin |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/c9c93156fe64e89f35627aa592c47d8c5181ed7d/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/fbf601af8b194effcad21a431ca447cb69c2bbd9/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/c3d5c190634d8e409b733a3c8a35218fbe54e367/
        sh4a |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/b9d38944587ab3861678a1691d3203e380d4b2e8/
         arm |                qt5quick1-5.4.1 | TIM | http://autobuild.buildroot.net/results/80a81f72ed1c4bb6b96bba23f901e6e92fcccde8/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/3d892bdf5aa7aca1e9f1a09106b1aa175ec89eca/
        i686 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/e382f08d4ce3bf5dd0a1c0c6adeec59b751fdc90/
         arc |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/bbc5c81bd6db8b7e50c986f1c3704b04e8211f22/
      mipsel | trinity-c8c41f99500b5854c20... | NOK | http://autobuild.buildroot.net/results/2ac20c454935c4e72c78479993b6929325d556b3/
      mipsel | trinity-c8c41f99500b5854c20... | NOK | http://autobuild.buildroot.net/results/c5155ab2af0bca64d3919ce8d9ed98d555716898/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/7d8c30814b598fc33beac49e91b79a3c16b65dfd/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/20e1ee6c1c7a7df87190fb035c537767ee8db6a1/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/cd3a3520efc155825268886e76adf6ed5bbc9c20/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/65a94872c8f9ddc0054741787c844d8c2ee92501/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/2a2919249c07be3a1fb52b07b5dc1a50106c73ac/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/51d70329d828aa838531f5e63bb6e39652a778ef/


-- 
http://autobuild.buildroot.net
