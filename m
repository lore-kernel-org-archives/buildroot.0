From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  3 Oct 2018 08:00:52 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-02
Message-ID: <20181003060052.4AC7620802@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   1 |   1 |  24 |
   2018.05.x |  24 |   2 |   0 |  26 |
      master | 155 |  78 |   0 | 233 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/fa74025032d433e5fd5b8a1f12e2759f24929977 |     
    mips64el |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/8857e887aa1c62eeaec51bcb6b8bfd9101be535c | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

     docker-engine-v17.05.0-ce | 1 
                qt5base-5.10.1 | 1 


Detail of failures
------------------

         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/1c78bddd4e3403e555df79705ed6420165b27e6d |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/2fbbde865102154bb66fc7c0851cc45505349a28 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 18
              ptpd2-ptpd-2.3.1 | 12
     linux-firmware-legal-info | 9 
                    brltty-5.6 | 6 
 Makefile:709: target-finalize | 6 
              glibc-legal-info | 3 
                   netsnmp-5.8 | 3 
             util-linux-2.32.1 | 3 
                blktrace-1.2.0 | 2 
                haproxy-1.8.14 | 2 
                 lvm2-2.02.180 | 2 
runc-69663f0bd4b60df09991c0... | 2 
                  boost-1.68.0 | 1 
     docker-engine-v17.05.0-ce | 1 
               findutils-4.6.0 | 1 
               host-efl-1.21.1 | 1 
                   luvi-v2.8.0 | 1 
                 mesa3d-18.2.1 | 1 
package/linux-firmware/linu... | 1 
                qt5base-5.11.2 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
                     vlc-3.0.4 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/325277febd74903e5330487114c2ba71255e743a | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/d400f33c2cbb260ae6a71f6e0a019040372cb01a | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/09e9511461e1eb76e0e63098cc9cec16641b1c52 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/884d7258337d2970aad3fe311add50cb7089562a |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/e57201cacbb39e344da396065e9bcbe90a7da92c |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/00467135b8f7db4b77e1339b42de72f50a1146ef |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/14545b4890ee77456ffd23a4d19f6027031e6fd6 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/ce9e63330372116bcf003f9a1396fd3e62b13c62 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/fce8df9eca99ea7918ac65ced40131c601a5cbc2 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/0b161ce261e74deb11ae050124f5e49ed893d567 |     
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/1612f2f701c4d3baef916689cd89426c713e506d | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/4b57e236a082c15f12cfa7ba5154ea4bc25e4874 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/afd13a331c4894a32f92cc15a23b4474347ed84c | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/0e66fbf388570912e04c4642e88ee386718aac7e | ORPH
     powerpc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/b72108d211d6c1c1046e11150d0a89a03100cc73 |     
     powerpc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/7f24873ecdd9246c95c03bb8d2fcd4c16c488c6c |     
      x86_64 |                host-efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/794d63030453ca287cab64473f2b019df40a515d |     
      x86_64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/f72cc1578327383e4405c2c4336f50de1b1e13ba |     
        or1k |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/0e25b272a0f79abe763d3ec53b3b14f20439f838 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/95c9f5840748e7916c58ca068873d7e12c617aec |     
     sparc64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/2af74e2f8bef68ea09f93a7091b1399bd0bcecc2 |     
        or1k |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/12a466482691472f486c50984b278329b1d90369 |     
       sparc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/63a6dc9493c8757455c6acab21227eb02f96123e |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/e3fa759a1edd559eb9f56b52e766b3df1ac58100 |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/d67317f7409a3960d25484a14191b6e02603986c |     
         arc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/327e19c640bed41d0341a02d6dd15196692c3179 |     
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/8085e19d9cf6aad73a6b17cff23f53b86f394e9d |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/963af2c3d5ac744efb4d942376e9c1b92f729a30 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/048631ba6f271aa133afaafb95e2fda65f95e53c | ORPH
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/29a004631a632e021e72c8744e408a4663fa5566 |     
    mips64el |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/aeb7b794766d3a2ee129d7ad27a4908ff4412af1 |     
      x86_64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/c61dcb044b4cf35b79dd470da3ec17775357226c |     
       sparc |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/519c43e38444d2cfaad97e943b06d669a674c5f2 |     
      x86_64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/1e196d300bc7a02450527a14b0bf875715bdbc57 |     
        i586 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/0e9c7d4da245b608c032dc1c295fb7f999ea669d |     
        i686 |                  mesa3d-18.2.1 | NOK | http://autobuild.buildroot.net/results/36119f7ad9b2f46f5c00484fbc690366e69c023b |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/b4aec24e580015c456db175a47ac8b7182284187 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/9ef7af3629e2011127a6052369c2d8de64d619c2 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/8e73a318570a49b81ced9739fd41c04d4ca578c8 | ORPH
         arm | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/4c1ef2859088f710d53d88d450f0b78ec3eeb1f3 |     
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8e99f4262a75a1b9fa4ea3474e85a1cee3c2283d | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1e4901541d059483240943ae0e7e9b03f1e41243 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ad718a2f684351e387e59e21de04c2942ca75556 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a5527ef6bf0990fd166915a1dd668732ae546437 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/04ddfc776f2f5887e65139c0fd098002cababe2a | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d21206b09976ff06248a6f89e37e588d3434452b | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c9a15a909ca7d9a476307757acc8df5c9665682d | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/b4944e87044bc75592cfe357f1280b8e5d69f753 | ORPH
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d83a6a645f161070e9809cd74656fdf77d30355f | ORPH
        mips |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8e6afe88acf31894ef4e3bee9c92f1af6eb9d9e0 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/53483c2a1330d7bf60648c36b15703875aab94c2 | ORPH
        mips |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/656206e0369a4987dc7585e11092f45c3139c076 | ORPH
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/c60956005d7e79702877f5bc47460db3e5dac355 |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/032ef3cd0ee9507afe10a2c33477e5b17469ff88 |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/50ca34a57da3c86612a9e64ad75cad9d741881eb |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/44bbcbe30a39e76ea555c573af7bc73f36a12270 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d8bfb434c2a7d8993dee5b8051c8083f3d649703 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/dc82ec1b0775f55fac4cea6e200e72edfd4c8cd6 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/c134e40d0d087ec1fcc063d8970e2486b548dab0 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/04580317e0635ddd1cfdf1b97c2fe40f8d3b3711 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/4ff7b100e4a2bff7ccb7036f498a7034945aee87 |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/f20ccd6911c84d00be0e671cc4554328ae381d85 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/27ad6bb33efbf777a2a6b17357ebaabbce181876 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/1fde73f76f11aaffe6693ad48c41a22f4c4fdc87 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/09f79d920890a85daf33c2ea883c5f94b15911f6 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/84c595a31713f1fc795f03f45b1367fdca9b8491 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/adca956bffcb8f9690520532e880e9f3c5a3f4d8 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/d5800929c1fd95621f9b090884bfcbaa9b5011e8 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d2f7aaa6413591df462be4c009599e252dac705f |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/aef35c35a6d4968e4e92004bb21e7d2ee86d5c05 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/99c2ca8ffb2071547f6cc03963518b920b0dd699 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/c3ae0c4bfe6e43e58327b9f9ee8ca30c9ba92425 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/0d86c5fde770031836cfffefb300404031bb27f7 |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/26ae2ad54a09ba06bf1919bf65c66e42ebc03bf0 |     
    mips64el |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/8647bd299f5d748a3b42d49a9050387363648ba3 |     
        mips |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/5eb16bad7aeb376a09c03b816590e1c3ce5d3e79 |     
       nios2 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/ffdaa923c7abed826858748293801fdcc1d76047 |     
        m68k |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/7e3979c4c3c3a7137fa1d87d9e93963b2f2aad7c |     


-- 
http://autobuild.buildroot.net
