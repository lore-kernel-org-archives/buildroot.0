From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-09
Message-ID: <20160310073022.721CA101716@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-09
===============================

        success : 197
       failures : 105
       timeouts : 2  
          TOTAL : 304

Classification of failures by reason
====================================

              host-libcap-2.24 | 16
                     dt-v18.32 | 9 
                libpjsip-2.4.5 | 5 
              gst1-libav-1.6.3 | 4 
           libimxvpuapi-0.10.1 | 4 
                 mesa3d-11.1.2 | 3 
                  cairo-1.14.4 | 3 
  getent-buildroot-2016.05-git | 3 
                  ffmpeg-2.8.6 | 3 
                   systemd-229 | 3 
gmrender-resurrect-aa3d02cf... | 3 
                  connman-1.31 | 3 
               ipmitool-1.8.15 | 3 
                   fio-fio-2.6 | 2 
                  stunnel-5.31 | 2 
                    cups-2.1.2 | 2 
           lksctp-tools-1.0.16 | 2 
       openpgm-release-5-2-122 | 2 
                     fbset-2.1 | 2 
                    owfs-3.1p1 | 2 
                  boost-1.60.0 | 2 
                  trinity-v1.6 | 2 
                 opencv-2.4.10 | 1 
                sg3_utils-1.42 | 1 
               iptraf-ng-1.1.4 | 1 
        host-gutenprint-5.2.11 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                  multicat-2.1 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                  zeromq-4.1.4 | 1 
                 igmpproxy-0.1 | 1 
                grantlee-0.5.1 | 1 
                 rpcbind-0.2.3 | 1 
                      qt-4.8.7 | 1 
             netbsd-queue-1.70 | 1 
        ltp-testsuite-20160126 | 1 
                 mono-4.2.2.30 | 1 
              macchanger-1.6.0 | 1 
               syslog-ng-3.7.2 | 1 
make[2]: *** [code/CMakeFil... | 1 
  toolchain-external-undefined | 1 
                   lzlib-0.4.3 | 1 
                       unknown | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
       host-erlang-rebar-2.6.1 | 1 
          modem-manager-1.4.12 | 1 
     toolchain-external-1.1.12 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
                     pound-2.7 | 1 

Detail of failures
===================

         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b9a9462976b8ca1b4ff122a71ff565ac19c0e6a7/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/944686eaf17e54525413efd5435bdd21e1155bc4/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/cd8f2cb47433b22b6afceb135fe891f2740c018a/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/eeffb77e2109d91f3acc3fd6f4c32ebdeb2fbf78/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/60c23a0866524ba1114434a263af40f987527712/
         sh4 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/45284d47047e078d46333a5e2289de4f60554d15/
         sh4 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/7ab9460c2dd80d4a6e5a23581904c8c5cac9bbdb/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/b4582cc604a7625ce0e3c37ee85771ab983037a7/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a5d9d15fe52497b201ec823f44dd27de78527324/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/5de904b846c4939959538c28b7eb52d71e9c8132/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/112200e474901a53c7b0e37a52871447aacbdd0b/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/cbcf823aaa6c8cc2e6b60f46e959da5adaa12c8c/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/eb4e2062e47706f907a8bbcfb8797b3d13acc929/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/c689b646749222a6ffbefe4dff9e0438bb932172/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/165fd9e88aab5118c29dd92651076b8306d01b60/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/130cf560cc036f46741d80e48dfa8ba08f78d003/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/26cccacac778080a9c5b1ab608b3864443425f1a/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/c942ccbbb8dd4fc56839626a4288d00e979450e2/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/dd3e98ffc90812bbb1cdecc247a215c182091d2e/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/08780714cc22665b0508dea4643c53967dd84f10/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/cae934d053f461add37da638edb4bc6a10a5a702/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/b95e027496db81b8f017589af05f1c5c7e929285/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/7bc8059eb4926e908e70a551dae2bff207cab263/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/2e1b0c78184da37058761804c7a90cc9bd82b03c/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/f95ec6144113d46847fe7e69a4bfd86c9626c637/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/3d453b1744b6233d4bdaa7687a7dc76f99b80566/
         sh4 |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/d4c5011aeac8e8f7f00046a17cc1054be201c29f/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/014c7a3b07f8e441822d185dbeced174c1d08972/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/557dcb09e3871c375b2446afb3c7cb80b05724cd/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/601c917e1415776aba39fa9f54c44b6feb01ffc5/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/b04213dc31d72270cc518f435b35c6719023b7a7/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/5ef044dfe565344906954f37c125bc716f9eeef8/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/d872c6dbe6810f7c606d3e1c4ee23700d07c56ad/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/5d643acd954a3fa41cae3cbaee79332760e85338/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/144b3018eb3f3c06c5d149ea59bd93f4f8471e42/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/4ae2b46ec4f42590cd7e4990c1dec87efe4908c5/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/b843cf71516d20d1de385aa9046e023230162b48/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/0bc5f1f46e277f812d644d04f745e282a87f9858/
     powerpc |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/617cf32f85ff2e012f705bbe8bf135330601bfc5/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/bbdca59caff21aab48acd2be3ed12dba39fc8fd4/
     powerpc |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/0290e463ffc52d60fcbe799390a6519fa88f930f/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b3dd800d2af6190e72ec6353e5f890d66db8d5ab/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dddb72d2b858a2a9c86af4c368709c1d0962d02d/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2741f13b0492942b984dea575b598f0c0a140062/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/84ae878358485acf71fb53c89e639281d2f40609/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b0e1682bf6dd01e57899d9cee1179e9f2ec21b2f/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ced3c0567911251cf6f37adfbabcf7f6825d398b/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5a72347ccf3aae311e94da9bf5345c5b38f3d334/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6f5183e23d5afb6781fcd0e55203250f74158e57/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d27e4ab9a20632020a5ce45c424d7a8cd22339fc/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1b1aaed654d0a8ff8a1cc65338690ebabeb2333d/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2062effb8e4124f8ebd9b8ad66de46add6af8e29/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fbe0146256d795c14efda4a0be8037ad0dd68049/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/adaa37cf5b9349ed0ed295198c688bd975c4079f/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ceb6cf16b8668327f0e425a4bc8533de33480a3b/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2d396477f06e20eb155233fe3d81e52f320dae9f/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/efb7e9ac5bd011ec9131325916b4d5ccdcf90330/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/64ce71d722756275169c1d45084234946862b8d0/
        i686 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/66e82233dcfb6e95c78ddc1cf1881d58de7ae8a5/
    mips64el |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/4b68e6718416df09231008bc10f792bee7f4f525/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/8c57706aaad4580c361c9d4cd7d00c0f450e3462/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/b00c795dd0687a2bb287c394af66c36243235fc4/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/ac22cec46d3bb831f024835504bf155ed6e540c4/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/edaf04ac29100c8c31caf41aade4a1e689c69eb1/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/3887c6286331759bd2d401f28a568537aa19f990/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/af62df0144b0ce53a1e72831d451e17a74829a53/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/2dedfc6971513d231d8c5dae7fee48561a9b84e6/
      xtensa |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/3b599dab609bb11600c6ce2436c88ca0ebb5df96/
      xtensa |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/9a1ec14bd93bc5c2220656bd456cd3fb84d68e80/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/7d920907e6508ca41bf28c49e1a9eb356b9acf2c/
         arc |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/8502c5526690753084ddf8e86aaa2955de190ee6/
      mipsel |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/30fdf3171b179093a89bbeb81130a3a89b12df9d/
      x86_64 |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/d7d1c6a13ad788ef74ac0487bf2bdbdcd7d52d40/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/06a76d80701b126789c6c8e867db067e3b927caa/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/252746c2a84cc479069f46a528b0a6c857faccd2/
      x86_64 |                    lzlib-0.4.3 | NOK | http://autobuild.buildroot.net/results/f0851f8089f8982faf37f07a5e8c54c6ebc1a60d/
         arm |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/44ea37d16c5762a61d816430b76f5d30b469aae9/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/ff91a53d3f49187e908d6dcafeb86555efb54d64/
microblazeel |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/c98b74d1d1342ca18fb161d010e94d45462ac6f1/
microblazeel |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/bd8fb14deba260e3a8464709df3d078feb3f2be8/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/997b8672e7cef827d339aa575d4d96fff753bfe5/
         arm |           modem-manager-1.4.12 | NOK | http://autobuild.buildroot.net/results/84c3bfd5a80aa5ccb90a5867d72caac9f868b6b2/
         arm |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/fcd3a46e7f2e76145100a4a6b1eb17a763af77c8/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/1283ee080e26ee908795b68967bd5fcaf51c289a/
         sh4 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/9c6303f003c7be771846da05b2a179ce953510a1/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/ba7193cfed87144e051eda4a066f1f4270ec8aae/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/e6abed09c29a5679ec1b819dc6ceeb051239ac3c/
         sh4 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/ed7dbb1dc2f8d9df3a467ea9370a172dbab386a9/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/c907f7da89c20407b2754611354ecc6651ce98ba/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/b4e8b5c074b57dfdde815a176e7e9258e387153c/
      xtensa |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/271793420a3e690b765acd13150166a3260625ab/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8fbc15a9d19f3b1ee9f3b1b1948827316274d610/
         sh4 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/d55e77e794002fdb0c6b6bd8508206d782e8b8ff/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/d4bd855d02e650bc250109eebb7eadd14f81e75b/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/36797b6fa1b6d993b72f07c9b3c05ef764006d6e/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/3b342b6609ffe515610716b3efe8bf16e9ee3a29/
       nios2 |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/0e19e5da0ed3938a50eb2ac511b6632c7d04ba89/
     aarch64 |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/f09d1d1906b6503b87a1938e96c2299a56850ee3/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/d5d614319a2cc0d3557d2bf3506a2c657faa877e/
      mipsel |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/8e36af1f9bcb4d9c6959ebabc82226fb44a520e2/
      x86_64 | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/37743b3e73fcb0df9fd50113e082eac712c25e35/
         sh4 |      toolchain-external-1.1.12 | NOK | http://autobuild.buildroot.net/results/b7eee1ee5a84546d20f65adb37cbc6c19bd7a957/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/aa2890e0cf773c14859345aeffcd1c9062ed792d/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/5f35128bdb0fa9e2a9d724bda9cf3061b8b7cf28/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/92d528b57e23b4c039600c53dda7f98494662c54/
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/87b126e45b038747e5eceb29b2d9611f62518521/
       sparc |                   zeromq-4.1.4 | NOK | http://autobuild.buildroot.net/results/4aa32b38699f1e9b4b3daca75508be9196d9cbc1/


-- 
http://autobuild.buildroot.net
