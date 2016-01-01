From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-31
Message-ID: <20160101073021.9A8CA101DBC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-31
===============================

        success : 207
       failures : 181
       timeouts : 3  
          TOTAL : 391

Classification of failures by reason
====================================

                  boost-1.60.0 | 31
                   assimp-v3.2 | 19
               tpm-tools-1.3.8 | 16
                  libffi-3.2.1 | 15
             host-boost-1.60.0 | 8 
                      qt-4.8.7 | 6 
                  libogg-1.3.2 | 5 
                bind-9.10.3-P2 | 5 
zbar-854a5d97059e395807091a... | 4 
              pcsc-lite-1.8.10 | 4 
                  ffmpeg-2.8.4 | 4 
             host-nodejs-5.3.0 | 4 
                  prboom-2.5.0 | 3 
host-vboot-utils-bbdd62f9b0... | 3 
               libcap-ng-0.7.4 | 3 
canfestival-7740ac6fdedc23e... | 2 
                  connman-1.30 | 2 
                 qt5base-5.5.0 | 2 
             lttng-tools-2.7.0 | 2 
               ipmitool-1.8.15 | 2 
              cryptsetup-1.7.0 | 2 
                   erlang-17.5 | 2 
              rabbitmq-c-0.7.1 | 2 
                   glog-v0.3.4 | 2 
pifmrds-0bf57f9ce0d954365a3... | 1 
                     fastd-v17 | 1 
                  libssh-0.7.2 | 1 
        ltp-testsuite-20150903 | 1 
                 mesa3d-11.1.0 | 1 
                 libusb-1.0.19 | 1 
code/CMakeFiles/assimp.dir/... | 1 
                    kbd-1.15.5 | 1 
                   libnss-3.21 | 1 
             stress-ng-0.04.16 | 1 
libubox-e88d816d6e462180f03... | 1 
                iptables-1.6.0 | 1 
                collectd-5.5.0 | 1 
            netsniff-ng-v0.6.0 | 1 
                    efl-1.15.2 | 1 
                      pv-1.5.7 | 1 
       openpgm-release-5-2-122 | 1 
                    ruby-2.2.4 | 1 
               libupnpp-0.13.1 | 1 
                 opencv-2.4.10 | 1 
                     fbset-2.1 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                  gamin-0.1.10 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                 libdrm-2.4.65 | 1 
                harfbuzz-1.1.2 | 1 
                           all | 1 
                moarvm-2015.10 | 1 
                    iperf3-3.1 | 1 
make[3]: *** [all-recursive... | 1 
                    libjpeg-9a | 1 
                   mplayer-1.2 | 1 
                xcb-util-0.3.9 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                    faifa-v0.1 | 1 

Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/001a6114f26d347852e7af23a6c94b2fbd1fc057/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c7c1f9d6f6a469333d18521413c23803a27a05b2/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/defb33958d5086c74bf0a5fe09050af02218089c/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2b6e7c5fce16e6a951ef47956d00b94898b1977d/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/772fb30290a633323be7de8c82bc271d2985522f/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1965292a783077c16e9a197bc78f28368ca4640b/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5a68a5a5c5f5ad0a16be36fccd64b4dd6841d16f/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e574f9dadf8948b143bf3fe245f4b2d24a0bc837/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f56c4cbe46578cca29fbd1659d78c093015fbc8a/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2fd840be88e47f0b2358e7db8fc34d27ce4e910c/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/6bd1778bbd4549879697d4f118bfbab611e0d930/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/62be4f018becdd99c27bfca80d5ea953f13815b3/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f209df4609acd68498ba0cf11717bd28e0b34b58/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f4ba24088b8c946530a61007c1a92b697660f318/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/52933da6b76fb17808490ddd19b77f45344a6a5c/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1576a95213113fa06d500eb2eacb7bdc02e0b58b/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/23273d9c5f3b0e3ab395525114b25f4fcd22efe7/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/891961bee5ad6d812ba30acaef629c4c0e3b5d5f/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5763bc8899fc51fabad2cf4a6b853f82196c78f7/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a9ca93d8d0cafde7620827ec9063cef3b3c169e7/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/4dadff6d2905cc14759c97d57d0267f39a9a9717/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/c0c16dbeaa1ea899cac01a7bd7b3a90a8b619aac/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/2f1e2425ec91de88e8727ae3163b6f1587828d4c/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/8d52396cff08ae0ad2e973c0f468a27816cde4b2/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/7facc3aed9e7d23330b427de6e0f3ae9a4d5e449/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8cf1caa3ab5714f849d65f2bf234f852b8938822/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5137b50c727fb85b81aafb79dd3bb2e5fcc0b3f7/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/03bef5b3f8529067750632cdd38964cf0c26298d/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0c585ffefc77bf513682af4365bcdd6639f9bf01/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0543f5eecc3a3a91b1240109a8183def5c67a859/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/36174c3932f6b90b59be04d5daeef15b5b4dd081/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/aaad9fd2f07ca78bbcb7ac299beaceeba2dd536f/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8eea3638fdb1f38d8f54d461b64ec8a4abc9f979/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/41f381a14921d945c487b8f1b7a575a1c6abf4e4/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/147d721cd83be6537a700bea310bc2a0e50be33f/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4343afc2e3f4a2c6ff5a0684694e44e903b3101d/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/68453bad242d30231341632780d885f696f64008/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/913254c3346087035ceb9187e52445e63ef8bed9/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/eda814d6264f192d7f942018d7dcf6ab14eff156/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3862c2303b0c4df4edba1d0b48a7dc6ec64ad212/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/09e02550250a49a5e67f07703f78c23bc627400e/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9a8d7a946ba760d5265d5094a690b0090cf45bbb/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/94ee496753f27884a615c2254175a4a449c3e195/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bd69d88ae0bc4c526200ea88b1411326db9dab23/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cdcf21abfb3d1c214173c82f277c5abe2b13762c/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/47c6dad80bb9051449364776cd75796c038d5819/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bec07250a71421a1139f413410a789ca862be2dd/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d3bb4f145e20e2e90d7997c3597426e4265f21d2/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3b106c07a769928b70c95b6fc3963b39785eb7bd/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c0d886ca901c6be9dfb2a2a87976f71269aef9f2/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1b8a33ff17a56411c9281395988bed81e6e00c72/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ff08ab174ec6696ab71622ffb2e1e0203e7ac555/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ac3276f10791ce3f98420baa39777cc87d476cd3/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c6fd280860a573fc0f4746ba8a44711dcd03a627/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d882703c7d8057570a84f1a03275b6c31e2b1915/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3723ca1ae85c9fc6459cf5c3202349d7cd682505/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/c634106a7cfc2962abe03faf6fd65e03e62a8da9/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/7a089d028745463b50e200c6dd5a26f320e7249b/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/06f94fdf463a403d1b8830206f9083ac19924b3d/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/34cfe8c8f7773813ccf8f120ec2165b20d416b21/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/6e85a3a867fb262797f5dd33232f4069ba793884/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/5fa299664f8f609e5e876e450d2c6b3d9ec9c979/
      x86_64 |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/050e127ad695295842ddcd8e6b6e49093b27baa3/
      x86_64 |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/9c2eaf269444b36803feb2a0f8ef0d319bb7e0a3/
    mips64el |                     efl-1.15.2 | NOK | http://autobuild.buildroot.net/results/5599b424c8849d76e1a8ff03f98a8bb4ab80efd5/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/02b3f145675802e671bef856496fd45fde451aee/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/0a80c69e031717eab1d4d71dba9f4115e0c4df54/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/f72da533119017d27964e2522d20935de054ce76/
       sparc |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/36ef58d8d11492fdadcb7e95cb0fd90abb9fba7e/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/6caa8a616310dc376765bbc870df77adb42ff7fd/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/e55a02b7b2beb85f618c7bfc0379f49adcc73459/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/752c26b226df7aefaad9e91bcc49c9c3fea75077/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/0a5efadbb16b5312ca10f9a6fd3c5da62112d469/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/253a5fe02b9cb6accc402a830a59e40d2b9d55cc/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/3167e11c8c580bbd02f70511c52c56bca2958436/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/5e12d925b9956c0c5c58a49904e9815bec910a96/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/f490d374d13d1b50399037807b462cddd9d183c5/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/f4c0a7a05754c35b8cd082befe7c07e468dfa363/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/d23cd7b459434594c6186c291410c0c766a92fcc/
    mips64el |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e1fc56cbd42548dfadc826347c3770a9bfa8197b/
      mipsel |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3bf20de1c0024a6f8483ec4fcbb6fc782b76386b/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1f65186fb5e6194f05271eab204a882cc15e96fc/
     powerpc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5dec182f7239022a22e2c504848203e15e33412b/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3939d11a9c90303b9a5aa7291146a064a79e12c7/
    mips64el |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7763f7e7dff181001c42d9ba0e94b7d80577f75d/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8b09fa4a380984c3fe5974bd55893a90d0898eaa/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3c1626505a8a81615dc8d24c31329de81bbe21e0/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1752790b683c988c6fc4b05740fd78af21d4db94/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/190551834f475e68046741655d32f68e58bfaba6/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/57ee4b073a28f68783cf70d84b8ced65a8f842ee/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/b7a9b45e91878b19f30be869ca01030ce241028c/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/f2222009631a8826be7723ff589bd337217dfcc1/
     aarch64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/52743512d53f60528d0f45c8a87690c4bad0d2b5/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/455c5c3ff5803019d88d47d26c4274f287e82e68/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e59796363fbaa5fee9cc6cd3ff9939bef0de4135/
         arm |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/e338d0e18ed7abe4f2ad465a951f231b2de75c40/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/d72753be7d1ff0bbdd7d54270b5daf9b8b7192b1/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/77a6df58445afdf518712779f11ee98e14887ff4/
         arm |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/f1ab3fe59d0dd7dd7b9a7bc6bc10a0019f0fa567/
         arm |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/eb4171095f07df3f6291e7133be93f3925199fdc/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/8b8ff353fcd8e89ef45848301cd7ed8658d8c780/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/9ba877153a66f7a02b0b98a03d6eb39f3422d005/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1873b1905764e3e477a86af377cd4e44fbb463af/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d9a5997d64a69ef47e80e26dc24ba7ea4820d5cf/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/33c76131e6b4b043ca19de50aab6a5bb38acf525/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6a268a87036f22c1e4d0688b9b65c7980c7a68ae/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/447b6e8b3dad150e831e8ba7bd7573d42e814668/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e59740ead1d8860c3a998aac1efd84ac1ed072fb/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2d172772b3d00c2164d700f4d162132bee3fa560/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/096cfbba9984b58c860be1627aadb312ae8fc781/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4d695c16f8efc3eedd96d65a30fcc3db713a6b60/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/acffae7df295be5c01d0e7e368aa11a1b65b97aa/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0e5f52ff53ffd693a9f2bb5a947c26dc103df0a8/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/99070f46c4e99005b3ec13b9fb37f87ab61d8b8b/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4d6c99a08b443f7ded3f2a9687f1b4ce589af6cb/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/193db4fe58a1fd142f732b71252d1412b71333eb/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/000cd9d535cfa3fcaa26fef41f9d156fe19e3bdb/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7bb4ce59674601af14c2e8c7514e3be4536ce034/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/700b9c3f6baab790ae4f6d3eff71ed60fb3794d0/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/279a1ab741325016f38f21c55357a5c90ae8d739/
      x86_64 |                     libjpeg-9a | NOK | http://autobuild.buildroot.net/results/5e7faa42bbca9109bab54b74fbf9f64c39b17f0d/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/005b8ad1681ee8a22aadf162ae1ef1e2be82d20c/
     sparc64 |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/3df8c5584124ceb0d39c40076a811d5d07074509/
         arm |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/afbf2ba9cf0e927ca38dd6c1d62eb6170264781d/
microblazeel |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/c896a890d13e7c88c56cfd08be00563e38bc3ac1/
      xtensa |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/12dfc75a8dd17169f1a57ee2fd94148ccabda272/
         arm |                   libogg-1.3.2 | NOK | http://autobuild.buildroot.net/results/6e7732d28d06a47d1e7b95c6c73424f3183f2ce0/
         arm |                   libssh-0.7.2 | NOK | http://autobuild.buildroot.net/results/ea7bd6beff4e2546595a5f46e6183e03ec4e94fb/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/9ab974724da1a3763ce2614677e90ff917e7a440/
     powerpc |                libupnpp-0.13.1 | NOK | http://autobuild.buildroot.net/results/40807fe84f67961817b6592a6df243c036cf3b4b/
       nios2 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/b4a8c54eed6bf75ab8ade0653953d19792155727/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/4029aae939aa9d6ce012e2be52d524d163fac34a/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/7c53dd586b9b8d6b79821fb46af30ab507b1d16a/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/1ef5f0a1b13a09f7dd4defe54e0f248ad54d5844/
microblazeel | make[3]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/69bc387f76cfe7910b48ac2b132b5340c0ea8b0d/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/dbe007772c23a7cf2e4fdfb501ce3cf5614a4b1b/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/14dd401abbece673604581bd11b533fed2afc67c/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d7406bcbcaba1b0e6a61c730b417faf3c44baee8/
     powerpc |             netsniff-ng-v0.6.0 | NOK | http://autobuild.buildroot.net/results/e1c9cb1fc963f2f5d7f645172f1dbc194c186166/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/9cbb12aa1096ea3e821fb6faa9847010c817d792/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/dc55b8ce1ce4f29af64e0f8c0b4b9621e5051bb5/
        bfin |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/a8dcff2caf0fd650d8a8831ac0ca82f57681719b/
         arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/e0b205dceb84303d1dfaf8b39562b934f6914b8d/
         arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/da2b404374b85f6cc43061e62d9a1fd5fe3b46fa/
        bfin |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/251b1d70d67688f753e7f0b3a328f5f9f6b89a5b/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/22814004505e93c67527f5d924cc857db7075248/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/decade1294665921182a72ce707bcd17d72b7b88/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/3bb5b62b725e58a51301aa8bccf7c51e63702359/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/5a952fe7555bb675ab963869ba1edc1c0e40afdd/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/81b2305e4f2e099f366e5a434e08a44418382702/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8883048c707e93faf7aa26ea6a9ed8cd8ae01061/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a099bf2e93c7ae2a610768e9cf12861540c9bdc6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0622932ad89e3ff8ddc1b6784b90dc6b1d9c1848/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/98cf377422ebe26ba7e1988d33ff01891f3ff59c/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a897b13940119ef297df40782478d8922d435f15/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/20228495af7e6b4608e3e00febb0920274c22804/
       nios2 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/83408b0fd63f01bdec15bff4fe48baa2aaffdc7f/
       sparc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/ca1e332e72e0d3b1b53c2fed77efd3a219c5ab35/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/1e9b655e846e3228414fdca1fa8324c2a1da8b1b/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/a21d81d85c3df493bb8b9af8b3391426104040cb/
     powerpc |                     ruby-2.2.4 | NOK | http://autobuild.buildroot.net/results/46a0ceaf605e5ec8b4a3b63be7f6c1e80cbbcaea/
    mips64el | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/198cf60dcf82e590d34b5aa93531c18c13948eac/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/56bb9a27a042289657d2cbe812cd68f6cd38e5ae/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/037ffb11915d092d5e59dd34e84eac6fe822b831/
       nios2 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/094f4ec8abbf9f621ba1670669a3dab6d268c2ea/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/a84345a0c42cdd7e9d4a54b5014b44cdbcf009ff/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/963be22f442c16c5a7a71260c27cdffcbca35155/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/9b4d453ea7b001c5063d8ed1960106fb4983f86e/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/3acfa865b6b3fd340cdb8155f4ac71dbb9600126/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/15965600ffd47f933230aec6e1c8632ec470105d/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c87ee6fa6edc1d9690a6addd95d838fe7006e29b/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d5137060da7dd89c202135a61e56e9ac896c953c/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/347ce9e57447469feffcc08bd5dfc9a05aa59ea4/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/da816db03ec21d0a8a9e672f2326eeccd1f209fa/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/b0cff2fb243201606547b40e4c1d883a0b3996e4/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/f9a7d24f557046ad3ea027b4761afdc22950d85d/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/4c3777a13d596a79014bf3e65e59ae759fbce18b/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/3a4b0b54f68510edd5dd1450ccaa9513cc2c103e/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/399f008f9260f0e860df98048e15b37f8237c745/
       nios2 |                 xcb-util-0.3.9 | NOK | http://autobuild.buildroot.net/results/f4a06c17a0c32563b815871c49c8b6de4c144c03/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/4b360d660db2cfe59143e77546146fb0d5a98366/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/6923537aa293b1eca18b45b6a9396ac0be1dae37/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/8ee9b88e20528745428625f7b7c62df06280393f/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/ee24ffe55a9a96c25cc356593b62237ab4275f79/


-- 
http://autobuild.buildroot.net
