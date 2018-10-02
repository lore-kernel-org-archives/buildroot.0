From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  2 Oct 2018 08:00:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-01
Message-ID: <20181002060023.3DA6920DD5@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   1 |   0 |  25 |
   2018.05.x |  22 |   2 |   0 |  24 |
      master | 177 |  97 |   0 | 274 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

host-android-tools-4.2.2+gi... | 1 


Detail of failures
------------------

         arm | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/eafa44cf583dc55cb96cb8d00c9d2e855318b3a0 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

host-vboot-utils-bbdd62f9b0... | 1 
                    links-2.14 | 1 


Detail of failures
------------------

    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2af5daddfd7c2a929b877a0e7dd262eebce88526 |     
         arc |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/4b02713ed5c10b58f390f96ea25f2a45c9a47af4 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 28
linux-firmware-44d4fca9922a... | 11
 Makefile:709: target-finalize | 7 
              ptpd2-ptpd-2.3.1 | 6 
                    brltty-5.6 | 5 
     linux-firmware-legal-info | 4 
                blktrace-1.2.0 | 3 
               boa-0.94.14rc21 | 3 
                 lvm2-2.02.180 | 3 
                  samba4-4.9.1 | 3 
package/linux-firmware/linu... | 2 
          synergy-v2.0.12-beta | 2 
             util-linux-2.32.1 | 2 
                beecrypt-4.2.1 | 1 
                  boost-1.68.0 | 1 
                   botan-2.7.0 | 1 
                   dante-1.4.1 | 1 
               domoticz-4.9700 | 1 
              ghostscript-9.25 | 1 
              glibc-legal-info | 1 
               host-efl-1.21.1 | 1 
             host-gauche-0.9.5 | 1 
        ltp-testsuite-20180926 | 1 
                 minizip-2.5.3 | 1 
                   mpd-0.20.21 | 1 
                   netsnmp-5.8 | 1 
                    pppd-2.4.7 | 1 
       qt5serialbus-legal-info | 1 
      qt5serialport-legal-info | 1 
                     vlc-3.0.4 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/26017f5bf3c1d782994360278d0febf920039b6e | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/40ef583874bd6b3f718952a7a5e71bc4f375aa5b | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/6c3f62c5776227339fa0abb83912673560b0dd10 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/d8d568cc23982421f2199021194b0431a717dddc | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/8acc95e8000b476a8a23f1e4eede75750510b821 | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/54c1275b15572bcc6cd2b01e5120c10422e61943 | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/fcd75a783e3736b1eeab65ca88541938cfebf672 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/78aa5180e08d64e9e7ef733806efe46bf2df4464 |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/82c5cdbd13bafc1bdaf4bf63040f82a80f12d7fd |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/f2e4fb63c4c2f02ee7b8cb18570289fd9896ebb8 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/7b0f7b01fb69e2f7f7db7e2bbd987d40dbb1b89a |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/515dc802eafd72f0b540d935b6fe95d6a6b876a8 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/f97be417799f0ffc06776a8f34fb6b9221b084c9 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/39737bbe8c514cbf76380f1e57c25b2293ab6bec |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/42a608c6539506ed9d196fb5373c37a3f4a3fb85 |     
         arc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/86edee67339f05212070c153ed07f905dece9086 |     
         arm |               ghostscript-9.25 | NOK | http://autobuild.buildroot.net/results/0bffcf5ee2800e05c4e487bac4a021ac2676432c |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/2a605c77a43384d7b1fd5934802177e86ab777aa | ORPH
         arm |                host-efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/2b4c8c56b7534234cfff5e7e37a4afff1379f7ea |     
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/23fc0f43f864de88d8db21c990f6ffb3dd86768a |     
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/66005c1ccb52fd38addc343bdd2dd9c3804e3c0e |     
         arm | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/1fe0c2f0dd28aa3a5597cbcc091ea0cd4fa69034 |     
      xtensa | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/3ad7752ebf1daf42f02eab2a9068dac27f57fa11 |     
        mips | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/d056e125ea5f6bf0aa18a31447b3960e196c4028 |     
        i686 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/fd787dbacc2e4c324c70051862dcd61c83b3b0be |     
    mips64el | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/b9c2ab29c29e78f4957f4ac84c3ee88bd66fcc94 |     
        or1k | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/6d5c4c1b98e912b05fd353e9bc38a9d2e0f3d7fa |     
      x86_64 | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/8ffac0abe0e63461b046e0434aa26041020ec848 |     
      mipsel | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/d10102bd728e368389ebef8eda7a3eb75caa7d4f |     
      mipsel | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/ee4f5409f13069ffaef1e6213e2c055180e21763 |     
      xtensa | linux-firmware-44d4fca9922a... | NOK | http://autobuild.buildroot.net/results/3308271fc641cadb59dbf1b5ee529a84f79e6d5c |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/ac2b9955e262042216b22dbbcade4245363bcc98 |     
      x86_64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/0568b2c0846932d4c0edee455a557cfebd691fbf |     
         sh4 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/0634bc79a95989bc1df46b51ab0f895b32207049 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/5954390e0652fe7afc62a747794d1c5ad87ef09b |     
         arm |         ltp-testsuite-20180926 | NOK | http://autobuild.buildroot.net/results/47abceeda8044029b6d3200f3877d4d2c494202c |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/b8241e874979cb22a7e1bddb32fbfaf7297ac543 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/4e155f589c82f3c64d76ed78380c4d711c542486 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/0425af690db4790693b93e0ebb5de83666575861 | ORPH
         sh4 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/2dbbf1289302f9a8632244de9f38b5aec812777f |     
       nios2 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/d250e7082d6dcd5fe8b812a942a381abce2a5833 |     
    mips64el |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/7a83c3aad4b4ee1d0698c48d21bb9bdef512ac4b |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/7773ea6f5947316a05eeef49b9e69b5bf819f458 |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/6028c7627412e3ea1f7df3206f68c625c3a0c7c7 |     
         arc |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/5d99cdd47cfc6e68de09f4ac3d3209f77acb63a2 |     
      x86_64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/dcf655eb7dc06420f01011c805ec06d2f0583fcf |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/df2dcbdceaa01a2ae37bf09140e4dbef0a5b9489 |     
         arm |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/b750cd1bf1b3aa06882130399e805b585959e3bc |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/7069ab011e1fd3ef261104d37210e21d8b048d24 | ORPH
      xtensa | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/fdf47e2f169c3396eeaebe00d7c1ba367c26f5f3 |     
         arm | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/2241b539be6294d3e95058e11a8cefb62d1d95c3 |     
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/19d81dd86e02e958e8af69dcc0a16cddb016e554 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ce75b7f0d96682d55a0f8bcbb8ad5c3abe40c86c | ORPH
        i686 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3c616d4dc18a72db8b96d319f0ecf9dd1080d744 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4da58c0d444b9f9ef65f30c849dd0ddfed4cb6ff | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c1bfc4d5381ff96c400791c928a650f5b2d6a880 | ORPH
 powerpc64le |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/036ffe280566f08263bb07a8881c8bce4c5385cc | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/cb3543e4bd7d51e6cc7fd72fcb5818d90b2de4c2 | ORPH
         arc |        qt5serialbus-legal-info | NOK | http://autobuild.buildroot.net/results/f8dba48bc1e71332f3983e78c40989e5f864abf3 |     
       nios2 |       qt5serialport-legal-info | NOK | http://autobuild.buildroot.net/results/320db38e94d68b2ea4451c3cc0bd7742c125cedb |     
    mips64el |                   samba4-4.9.1 | NOK | http://autobuild.buildroot.net/results/6853da4be50147e32b6bc0bda2ac3501a82c06dd |     
    mips64el |                   samba4-4.9.1 | NOK | http://autobuild.buildroot.net/results/eeac9b350cea6eec79bf098b15b280afcbc086d4 |     
    mips64el |                   samba4-4.9.1 | NOK | http://autobuild.buildroot.net/results/68f3fb75ba8a2f138e9c3f37b2681b81441e2cd9 |     
     sparc64 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/46cebf2674b7b1d757cdc2999c7ddcdf14ea04e2 |     
       sparc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/08bd68b36882ad930b162028a026615a86db8362 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/a0da291bccc4305062372f13079342c837e9f1c4 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/090f459138ffede8b9725f5ff2d1725f34af51ab |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/e307f5c51eea070be93fd1bb36fe67552133839d |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0ebe7193a9a03e550e37d6e22f840785ea2adbcb |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/234e6956d9399f92e5ff0c198fbdf66fa1581745 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4777177d570ce3eaf919a310606873421ca3d2f1 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/6eb69641d2dc878cccc953a71c80ef13f7973b32 |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9cf22fc0d8a284d634d20c79c3e9867b0a786d65 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/38fae697e14d22d9e286d3417866862afd297370 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/7595341bfb465f16cb7e412a41c26dae0a42d66f |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/cf103af5748fe05261a044b2af68f4a8d80c1a10 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/5d77b4198876e883b6b79697da80fad309bbfc78 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/eb796ca8b32021ab422ae5b03977fe946f2420b7 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f00e1cb5783676b13964260373d3fedbeb2699bc |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/1aed99738b1035a06c31555e2c916b5bc662811b |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/cb4dbb18a71e29b10092764d43e516f81c063451 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/bbbff8c49b9d4b29ed14f403689acf6313177a47 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/f5923756c8f9913b5d5f960870f93502befae3a2 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ed25cc6c061e5fffc7e7bde17945fea24a138f3d |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/7c57a089bb6126fbcc97d30e750fe6714609b136 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/58325ff1991ed7988b39fe7003ec1b0f468d6f1c |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b47fc5dfaf43866c1699cd83779991790e58878b |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/6e91fe3c19cb0fbd40e0b34309601efb530ef6bd |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/fc00660b11090db743d30fceb620a797dcd67ac0 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/c0d276d164446571c3ff79fdd8caf0a8c23eb7e1 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/4d20a783fe185644f10dc2b2e83f8251dccf0b67 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/e9ab0b02400ff9a6c143c344ed36f4ac2db161c4 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4a5b2da0074c7827f695960cbf9cabb8f7a02bb7 |     
    mips64el |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/bc5e771660255eb8919fd7413c6de4e3156aa00b |     
      mipsel |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/3bff483ed18cfa826cede6050b754be163812705 |     
        or1k |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/15a3c5b90de6c67db9887e3db67b3568f6d18e3a |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/f6ea88324a8f9ac8ee780ddd71ec61f922e20210 |     


-- 
http://autobuild.buildroot.net
