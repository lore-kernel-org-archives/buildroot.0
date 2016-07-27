From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-26
Message-ID: <20160727063030.B09951031E7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-26
===============================

        success : 189
       failures : 131
       timeouts : 0  
          TOTAL : 320

Classification of failures by reason
====================================

 host-python-setuptools-18.7.1 | 22
               target-finalize | 7 
               libcap-ng-0.7.7 | 5 
           uboot-tools-2016.07 | 4 
                  babeld-1.7.1 | 4 
              libarchive-3.2.1 | 3 
              lirc-tools-0.9.4 | 3 
                 clapack-3.2.1 | 3 
                     php-7.0.9 | 3 
                    owfs-3.1p1 | 3 
             bluez_utils-4.101 | 3 
                  rt-tests-1.0 | 3 
                    gdb-7.10.1 | 2 
               openipmi-2.0.21 | 2 
                pinentry-0.9.4 | 2 
             rabbitmq-c-v0.8.0 | 2 
                    libiio-0.7 | 2 
      host-uboot-tools-2016.07 | 2 
           argp-standalone-1.3 | 2 
                  boost-1.61.0 | 2 
                 jack2-v1.9.10 | 2 
               linux-pam-1.2.1 | 2 
                  cairo-1.14.6 | 2 
               libdvdnav-5.0.3 | 2 
                  gamin-0.1.10 | 1 
                    mpv-0.18.0 | 1 
                  libsepol-2.5 | 1 
                  mono-4.4.1.0 | 1 
                 libraw-0.17.1 | 1 
                   dante-1.4.1 | 1 
             ntfs-3g-2016.2.22 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                 raptor-2.0.15 | 1 
                 lvm2-2.02.161 | 1 
                  iozone-3_446 | 1 
                   systemd-230 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
        lttng-babeltrace-1.2.4 | 1 
              squeezelite-v1.8 | 1 
tvheadend-8e637f9f903f6d820... | 1 
                    mpv-0.18.1 | 1 
                fcgiwrap-1.1.0 | 1 
                     dtc-1.4.1 | 1 
                ipmiutil-2.9.7 | 1 
                 ipkg-0.99.163 | 1 
                 libv4l-1.10.1 | 1 
             shellinabox-v2.19 | 1 
                   ncurses-5.9 | 1 
               openswan-2.6.46 | 1 
                   assimp-v3.2 | 1 
               tinycbor-v0.3.1 | 1 
                 gadgetfs-test | 1 
                    lftp-4.7.3 | 1 
                flannel-v0.5.5 | 1 
                openssl-1.0.2h | 1 
                 openal-1.17.2 | 1 
                  snmppp-3.3.5 | 1 
glmark2-fa71af2dfab711fac87... | 1 
          sane-backends-1.0.25 | 1 
               qt5base-5.6.1-1 | 1 
                mongodb-r3.3.4 | 1 
             transmission-2.92 | 1 
                blktrace-1.1.0 | 1 
               host-gdb-7.10.1 | 1 
                acpitool-0.5.1 | 1 
                 libunwind-1.1 | 1 
iputils-55828d1fef3fed7f07a... | 1 
                 lvm2-2.02.159 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/f15247d5e89f2031d4e433dcb09031a81a069527/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/dd55c104f6e3f0123cb98bf93443445c168b37cf/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/cdc35f27a6e9e710e56fed7704f90ba47e83c2a3/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/cf0252c2be3b164fe72c3c2dab9be045d4b442c7/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a3beed59423dc6896c78b7c7b5e591243edc2702/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/7766359c56adff1b457fef2229bd20eef624277b/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/8764f7a9b943362d57afa07feff40cf00f8ad7af/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/71d569e47df9d47ada3ef7e8446dffd18e1850a4/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/9bc3d69781a5694a029effd1d48ab52e4ef7351d/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7ce412d0e45abb286a4c5ef66f30c129a95aef15/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/75376cfa81dc97b0121462994ea587fd7b15abc2/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/6cb008613c27e0494a79c13cccf7f3cc6d57b47f/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/804110c65441cf383e0d9612ead69b4fdf902bfb/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/6057012776470de3644df927dffeddb2e0ee3d9c/
       nios2 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/492c020b2a642b80c5f68c2005f847b27e2fded1/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/007a3506b796df268a9160d52826fed533b3f3f3/
        bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/aeaabedd8caa58e3315f548871aaac10580a7539/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/3b9eeec9e5b8ab3c83239d109c8034429b2f9079/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/59119349555b2979c546a302649b66a2c77cb27e/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/6532e0aab38e4f1c7fa1f2db1fd76c688e415b80/
      xtensa |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/fc8d9c627e28820a7de97720b145e8ad1d37ac4b/
        bfin |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/9d495f83fdbf0e59ede816c85ae3c4c6147f474a/
     aarch64 |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/db9c37015a2d81187d7e9d0db53f2230de68ac41/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/1794142f335c9c7ceceb737a71f156532838c71e/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/ed911cfd84369f6b2262c04aaad872d969783ff5/
microblazeel |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/0ef7df11c327364547950d8e5b11fdd40787d7b6/
        i586 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/d3b11b4b16aebda284c8154d5d25b69b0271f3b7/
        i586 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/e02fe3c0fff6530c52632429115339e8d9869903/
         arm | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/aef9abe2d8fc383735c51b81dede06491af90b98/
      mipsel |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/2d0b97c06112e252d1eb10fb20b16378e18b5e1d/
      xtensa |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/b926bc116adfd0795b828b3f295b51836e52ee98/
         arc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/2e521715549232ef91bd6f797d8b6ecdbbc75c1b/
      xtensa |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/991f2e8772c53c2630cd8ca4870d5f8c13f11ec2/
        mips |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/fae90eeba103390963ad872ad50cb7c5914a947b/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/b7852bed17b806cab90fe44311e2f7c4f9c06693/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/d38cefe27361052236634fc5943a3c0c18df7699/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/2f355ed75bf7e97fc597258077b014f66d54c0db/
        m68k |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/3772387da58d5b6e9757d1d27499a6294a6f337e/
     aarch64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/98c58620eb85ec904e10dd239fd5a42a3a5d583d/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/bd83b7288cea0c7b37b7671bbcb102f60e1f5495/
       nios2 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/2c054a7fc2ec7a071dc024af67437e0baf1ab3a2/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/b551f1c33fdf2de7902f7ed0b2f9b44f2cf22e3a/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/283ab817133019b2d157054fd262802e83ac4e1f/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/53dc7dd846f00c61d683153c39fbe16eb91a9f09/
        bfin |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/cd84f2fbaf0c27fd60b6d540222c7974d7bbfcfb/
     sparc64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/aa5c40a356edc5934b8b38c2f9d124dcf0974278/
      x86_64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/4fa6e58d3d378480bcbc365ff9f78063fdb97865/
      x86_64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/9d576a1b7ad6f35afc40e3855b3fb6fce29db041/
         arc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/9d8aff435c9cf125a4fbb4a1c783a6b7eaaa59d4/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/69384a5e3421d668e984124dcf74d7f06369aac5/
        sh4a |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/3e773040a866ff6e4eb80054ffe2c492b61adc09/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/45bf2aaacc7a83a4e16ab4196afccc0f53d50b1c/
     sparc64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/ab0f36e7d39fdeefd6ceba4ac7bd0d8ed45f9870/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/b78932f583f0a162591131c2889a3fcdd9ce97b4/
        m68k |                   iozone-3_446 | NOK | http://autobuild.buildroot.net/results/2223f33785287df7e3b7ad24dcd5a9b8ebf71381/
         arm |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/6cf75e08795d9ab194ce4e882c0f4858bad979c3/
        i586 |                 ipmiutil-2.9.7 | NOK | http://autobuild.buildroot.net/results/97ed90b1e6e26c19ed03cb6999c876ff9a26856d/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/e7f9e07d5250839769777886c5ef924c596d0be0/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/891f2bed95c805d0148b414e5507e3bf351fecac/
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d3f10ec22a2ff31456ce2b9f52589420c6fb3512/
        i586 |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/d303935b7d828db6afae63aede860d121badbe4c/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/12494942bd18e7968af68c5000c1601927d190e5/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/97b34ca1048a18d8f0628eada956f03b47d2e9f4/
      x86_64 |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/279313b5454c408062acd89d6bc7e2025636bbe7/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/fa32bf9a072fc3f499d96465ccae1114c4be944a/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/de10ee54dbf316c8db6631295d9c15afa38d8753/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/326711ae29736ab232141696fe3e6a4274fb664a/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/f76347773e3c296a37e53374100fc8484481ebef/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/3cce3c6337595923acd1a02c523742d8fbff3b58/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/19fa52241439629a0fe9bb1d1183f0351794161b/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/84f3cab633aac5eb745820b70a11b52b901f2148/
        i686 |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/11de3a7d7ff337fc34d034ecb9427bd4d24fb1b8/
        m68k |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/ad8480385f91c45addc29092b9a4879574e378f0/
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/e59491454847358edf1679735ab6dc3278319817/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/f3eacc01ce7801d087845dff650008e948d4143e/
         sh4 |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/b4fa538f7aea395376af0afe6f94606aa110dfab/
       sparc |                  libv4l-1.10.1 | NOK | http://autobuild.buildroot.net/results/2e470a2c65a0a82425574a19f5bf4120e656679c/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/fdfd2e8f0e1a69b5b9e449014a055fb3b6d0834f/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/90e5fae328e83873e49cd47bc0b5077992da43fb/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/7e2050ca0d27772a3251b2197e970ca7d68727c6/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/69600c3f5b1840900a351e6cf6759f2de8984427/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/2fc98c02316808a85e8d2a30cf0ea8b230cd8754/
      mipsel |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/6b942c3384badf7e62e09f676093e0385962f697/
        i586 |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/dd09cf334e9e9f37e0a44f0752a18c457fcffbe2/
      x86_64 |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/ad25040b2a22fc6278c89337d485f527940d98ae/
      x86_64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/84185b4819d33d0cf2a73cc6fdbeedd90e3d101e/
        i586 |                   mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/897c2558ab5793adebcead3cc74b6d2b71d961cc/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/d0e8c550903b96ff5511358dd40f6393d8a3abc3/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/c97624cdb176f47f1d6e2a6757e86629e69f8c0a/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/92d8072acd3f988487ec17ce6a75d90abcd6b872/
         arm |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/a76702f008d0fc3f713b093984cc933865d33889/
         arm |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/78a3dc0b58fbb774761bc1ad1ac329740406d6e2/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/fe6811df2821a50c72167f67d29e989c0874a486/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/25bf51499495199bafc84e2d275e338413a9e405/
microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/fe5377a0ed4cb7a926136163c3fe2613e17ef80f/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/c6cc15e38f9dcb8961af44ac6853218859f4e2f6/
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/1776641d6eff27c691117de5cb3760508080504f/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/63695d09eecd4b5680822f0ce44f0bd06dd4bc6d/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/c1b2386ccaffe33b469502953f5913ee7457d4b2/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/a45b6305e37d9627c665c5b1950945942906d228/
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/3b4b6c5521fee372fd782f9553f121918493c52f/
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/0514e1462ab04f88e2f707ecea106eb90a1b9406/
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/17482355dffb186d1e4fe3402de722abf179ae4e/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/a2132cc9ae861ae96dd8576eba65df009ecbe47e/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/5c719dd9096fc07173768b033fbfd6420c23f7bd/
      mipsel |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/aa64150f8fac903c5de97a520530247dbabe5af4/
    mips64el |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/91a633a81a79d4470678455b1c84421645e67462/
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/e995de912e12490238e4e4f06168419895437b5b/
        m68k |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/1f50a44a173d88db7a9b2b3e5fe488e5023b7ff3/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/c16f091b751da13e7f583f47e7741d4d195d5852/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/d3fcaddfb770707e8ba6df510034666a3e99c63f/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/77861b77bb87f6b8977a598dc278c61f17d70298/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/d2613611f043140eda7db4767a51b18a681f6ef9/
        i586 |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/11eb4ec44b2be35eb9cc95c5f73f2de846f04908/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/b48a4008d50f9be06c2cf3d14190a90671662fed/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/1b2894167ca30a844395c64d2044eae2304ae17e/
     powerpc |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/62dc99803e5c2b82239f550ed51015b583d4e7a9/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e762860d922b2235330fca022117ab5c273fbc7c/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/c7a711ec93bc075982c51439a71240605169fbc7/
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/e56d1bc41b07900860b25f2f73cc0f93a61fff87/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/d9dc154ae63296b0968bf312723948ee1c897122/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/1ce25fb98c7bef36287a66811643c7997aad16be/
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/bbd96e1eb8ccc8f222897b6eb51fa16c83ae5b26/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/d16733f2331bc059f248acbba2ea9af362385cb6/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/dd7a078329268215f412eacb0cca1ce49320456b/
     powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/4b3b7b6bb0aaf71e966a5a9ed3a63b708d119a9c/
         arm | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/b1c156dcb507d8ece66ae6bd91688f559b8fd643/
      mipsel |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/07839d810d43762d28108980d4061c816f3ff6fa/
    mips64el |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/81d50706159fda61ca18b240a6172441fcb7fe48/
         sh4 |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/83fe8512814cdfdcd7602c6656054d99782b2bbd/
       nios2 |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/a3fd5019bda8e78814e3ea0ad70bdf631cee422a/


-- 
http://autobuild.buildroot.net
