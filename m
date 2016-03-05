From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-04
Message-ID: <20160305073022.BEADE101B7B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-04
===============================

        success : 189
       failures : 98 
       timeouts : 2  
          TOTAL : 289

Classification of failures by reason
====================================

              host-libcap-2.24 | 16
               libcap-ng-0.7.4 | 5 
                       zsh-5.2 | 5 
           libimxvpuapi-0.10.1 | 5 
                    glibc-2.22 | 4 
                 rtptools-1.20 | 4 
               valgrind-3.11.0 | 3 
    python-rpi-gpio-legal-info | 3 
                  trinity-v1.6 | 3 
                  multicat-2.1 | 3 
                blktrace-1.1.0 | 3 
                     dt-v18.32 | 3 
    erlang-p1-stringprep-1.0.0 | 3 
                 mesa3d-11.1.2 | 2 
flann-04b4a56533faf8c8228d0... | 2 
           lksctp-tools-1.0.16 | 2 
                  prboom-2.5.0 | 2 
                  boost-1.60.0 | 2 
                   tor-0.2.7.6 | 2 
                  stunnel-5.31 | 2 
sconeserver-c4b8e14f6e9e06c... | 1 
        ltp-testsuite-20150903 | 1 
                     lxc-1.1.5 | 1 
           linux-zigbee-v0.3.1 | 1 
                   mplayer-1.2 | 1 
                   crudini-0.7 | 1 
code/CMakeFiles/assimp.dir/... | 1 
               tcpreplay-4.1.1 | 1 
                     rpm-5.2.0 | 1 
                  gamin-0.1.10 | 1 
make[1]: *** [libleveldb.so... | 1 
          sane-backends-1.0.25 | 1 
                 igmpproxy-0.1 | 1 
make[1]: *** wait: No child... | 1 
                    ruby-2.3.0 | 1 
        lttng-babeltrace-1.2.4 | 1 
                 opencv3-3.0.0 | 1 
                      qt-4.8.7 | 1 
       openpgm-release-5-2-122 | 1 
              ptpd2-ptpd-2.3.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
            lttng-libust-2.7.1 | 1 
                  cairo-1.14.4 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
              gst1-libav-1.6.3 | 1 
                sg3_utils-1.42 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/603fdb4fceba14f2a7a7dda667006779707988ca/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/206f3b6e645aaab0a21ea19f8ea8017cbf58b880/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a51a277d696e8654ca66ebf3a92400c6c1bb7613/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/244a4346784211b0c72c6af9d2580c4caf183793/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0c49256e9b8185ff7e150eafad74c6f30f921794/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/78e7c4abcac50e774011530a2b494cff64ee0af5/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/6888952fa9bb256d98a38239cc89803efa57974d/
         arm |                    crudini-0.7 | NOK | http://autobuild.buildroot.net/results/d2176ffb41e0518edd9bfcceec41e559ccc78f71/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/e7b803bd007c125e23eeae351acfc08628333706/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/22d18f0ca19898be02118c64e615ffbbb23ee46d/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/72ca2970db41463435765b90c069417b8bb8a3fd/
     powerpc |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/e8709e73106991a1aab58a548c0550acb7c5c7fe/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/34b8be55a6fc9b9f7aeb4a419565438bcbd7742d/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/e129ff7a183c27feb622914b12e84ef806a0f731/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/6d5b1384744fbb6bc189d968b698800b0e9e6d7b/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/518e74a25720d60a3830db02a461fb0dc923aa7c/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/2aaceac254378d9db7ab7664174007b8c603c77b/
microblazeel |                     glibc-2.22 | NOK | http://autobuild.buildroot.net/results/e8f9b661898d2e5473f758f2b44204d27663c3ae/
microblazeel |                     glibc-2.22 | NOK | http://autobuild.buildroot.net/results/abdd4f19fc070668779c591a66f97e529fa2e019/
microblazeel |                     glibc-2.22 | NOK | http://autobuild.buildroot.net/results/da6db443afb7810ff1814ebd8d605ed6a65cc9c4/
microblazeel |                     glibc-2.22 | NOK | http://autobuild.buildroot.net/results/67348953fac469affd1965e04d61485ebb41e252/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/01c691c82a3dc7215e3e81926bb745ae4bc4517b/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/626adffaffe9771298ff8f0ff1d6c76c53761fb8/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/86cd05eae5c20398764167ba0ca9975583321419/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/74bfae3f9bda5d6c94114bdd69ad064f59da9815/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/09a6712f2359091451be16322ebfd4b3b57b53bc/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/54a45b3fcfe55db411dfcb6e64f7404ac4930d8d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e68c21537644a8968bb4f33ef89a75019a13f9e0/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9b23aa8861483e52f22017900bad4084321c0495/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/84548bff839b81747a4f3ccf246a08adf5e50623/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9f0f90c9f99fd51f46041dcf2e8da8aefcfb69f8/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8506150166a5077ed8894c9616427a6e83ac37b5/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/777d814f38ae57773c5858472c2b32ec32ed2fb3/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b145727b622caf9c377fe3af3bfc1d8070e2f981/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/96153c6fac6bb6fd1203ac4e5438abbfcd2b2b6f/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/13b2613b7d3d76bf638b2b0fc31e7fa285504b47/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c109d07dd23ddf25d0f3a7305608c707e99a1509/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f70a1beca2d6616b6e01c00676e6356a35a0d13e/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9f87c5d92f816f9cae168c5fea63282148388dce/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c5f8577c6f698521f4d93e92e89ec6e6e6d4591b/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/d05c9b31e0a30cb4ebcb8d7ef67d71a082717bab/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/2c53f611a705506ca86fedb0f1129df1d315632c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d59903f9ee5c9e0e3279198ddabea5244890967b/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c3d9477688b55987591b5b5efed5ee65499aa0e6/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/3afc4c006a74fd7512dace90b5f884bf7be4cc58/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/052ff24f3985b652c11ac390f342e9ad3d862431/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e60ecb5ad742e2cff39c0fb06a28d2e1850e5d9f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/b9f4fe2ae75e2288b0fb35d2e20a03845a105390/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/0bcf62f2ca4d8d61a3dcf21b409cc66dfe917b9c/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/62ffa90e61f7e4559404d43b0cdd2563bfac803f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/a936d2cc9de59e5ebe8e0d6c5d7a4eb00f479bf1/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f514f40656ba2bc067745476fd005755f13e464c/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/68165fd7d387aca4b6a47a12aa680607ea542e15/
      x86_64 |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/a26c98bee407cfc325ac12d203af3f7c0d6fdb76/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/581695a8ed4115b066a5b850bf615166bfb7b6c6/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/4b40a39eacb6fc52fcb43a6cdff117b58e41517f/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/5f81ba09c24cf24f99b0c252a2677f6910a59b0c/
      x86_64 |                      lxc-1.1.5 | NOK | http://autobuild.buildroot.net/results/ac3184e95eda9edd08850efe5ee9feb42516183b/
      x86_64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/f45fb4c0eff3df2929bbd41932f2d353ee13dd99/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/5357c2bc7c490d8465fdc8f2c861de1821db405c/
       sparc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/efbfbb45c1feab6fdec5b6af42e3e6b0e75e4fc7/
microblazeel |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/bc044b5377711e8d9e79e26c82630e0a595b2d0c/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/472d355f3847a7fe1c44bf4394d7ce09befacce8/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/3f3885406a0029d35d5d1c37a78fab2e53143883/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/b3080f795810b51a4df30cdfb92488aec2d5b704/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/9ce1c694c81f7f9fb17723f697f7a8bd783d758e/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/d08ec583c3ac8de877ddb9e7e2ba27d72b3d9fd9/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/7234213763dc9ff65dc317014028e5b17e17eb31/
         arm |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/204523021df0683e81a91dc30a3fdec38e0f3cd0/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/bc0e11791b5f1258cf6be3d8dcd971a5eea682e6/
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/30b76b582bbe1f9df26c4f2224cbcc733a0bc2b0/
         arm |     python-rpi-gpio-legal-info | NOK | http://autobuild.buildroot.net/results/982ed6adb725d72abd535cd7b0dc0fc3e4262ced/
         arm |     python-rpi-gpio-legal-info | NOK | http://autobuild.buildroot.net/results/f9f5dbf306ecbf8f5f1837726dca264525452487/
         arm |     python-rpi-gpio-legal-info | NOK | http://autobuild.buildroot.net/results/d9e0f1b3fda69c822d3c62070f31267882daed9e/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0f188102bce5028701a6c478c1aaf217ca7c4235/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/e690e11b798d226bc4b3ad880b90f4a660c07667/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/46abcf15938c3bc57bf6c6cab20079a3f49f18cc/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/5999aa2bc1b9c5b559f2f12f796762ebeaa9404b/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/a8a42ad5cd6969d2cdc8c4670e45ce0394df43a1/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/5cdadeedabafebab54aa1c859a40b38e5e37ba6d/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/64c27b61d4597ce0e665f2e555d74c890184491f/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/f1de5720c39b09edcc9e6aad64e6c560fe608ab9/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/f1c1dfab101b47d297f44fafa66b89dba290d2be/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/3fdd7b6442c86e9788562256bb3de68a12f9d6ae/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/72fe3027f3baebc19e41b074b736644fdd48cf39/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/1927d42fa2f37446bed5e554f018ae46df3f1d5d/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/542e4cb53cbd31b32cfdd3a093c9beb9f4fa5ca9/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/9c574aba006a42665c006a7613d5611324ca1989/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/5bf654294f079beb48b8f3afd48387deb745fd64/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/38e9eb29c41a617ad87c004fa54ea48f4a121942/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/0cd988f1943825206beb88ff4c51b5421c173b3d/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/ef514dd17938f7aa73bd695fab86bb7a9ac6e901/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/a896ffa0b4468ef83e17346d6cfc5a39f9484589/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/a93d1aebe18da5e435749072241f1affe68f2854/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/b2cebb2af506c4c3493ff271c824df4c3cfed987/
        i686 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/6e4529d1e98f0b9cbb16edcd2f4f10dee37b635c/
      xtensa |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/6913a5699d786592a70d1f19a68e6ff1e109e5cd/
         sh4 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/be15acbf6c0ab4fab93a9a9663e98e896cbdac8e/
         arm |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/5fef265ae3ca275fa8d56c4c05ccb587f4db79ee/
      xtensa |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/42794e647506272ef02871a1c1d7170094c446cf/


-- 
http://autobuild.buildroot.net
