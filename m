From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Sep 2020 07:10:27 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-28
Message-ID: <20200929071034.3A6F685108@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 28  |  9  |  0  | 37  |
  2020.05.x  | 19  | 11  |  0  | 30  |
  2020.08.x  | 32  |  4  |  0  | 36  |
    master   | 142 | 100 |  0  | 242 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 18
         libcpprestsdk-2.10.16 | 5 
             babeltrace2-2.0.3 | 4 
                  boost-1.74.0 | 4 
 Makefile:753: target-finalize | 4 
              asterisk-16.13.0 | 3 
               capnproto-0.8.0 | 3 
                 fwts-19.09.00 | 3 
             kismet-2016-07-R1 | 3 
                   libcap-2.43 | 3 
               target-finalize | 3 
                       unknown | 3 
               apparmor-2.13.4 | 2 
               domoticz-2020.1 | 2 
                  ffmpeg-4.3.1 | 2 
                   guile-3.0.4 | 2 
                   libnl-3.5.0 | 2 
               log4cplus-2.0.5 | 2 
                  ndisc6-1.0.4 | 2 
                  pango-1.46.1 | 2 
        python-m2crypto-0.36.0 | 2 
            qt5location-5.15.1 | 2 
                rocksdb-6.10.1 | 2 
              bitcoin-0.19.0.1 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                      gd-2.2.5 | 1 
  gobject-introspection-1.64.1 | 1 
       gst1-plugins-bad-1.18.0 | 1 
                harfbuzz-2.7.2 | 1 
host-binutils-arc-2020.03-r... | 1 
               libupnpp-0.19.4 | 1 
            live555-2020.08.19 | 1 
                  luajit-2.1.2 | 1 
                minidlna-1.2.1 | 1 
                   mp4v2-4.1.3 | 1 
                    mpv-0.32.0 | 1 
                 opencv3-3.4.9 | 1 
                qt5base-5.15.1 | 1 
                 ripgrep-0.8.1 | 1 
                samba4-4.11.13 | 1 
                 uclibc-1.0.35 | 1 
                  uhd-3.15.0.0 | 1 
                    vlc-3.0.11 | 1 
  xdriver_xf86-video-mga-2.0.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/e037db68bfdb5c504a48fb5ae213e84e36551a26 |     
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/3fa4f94bff2ab660d86c7b3db313dfab14009cad |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/ec1fcbea9b75fc08287327be420d520e8fe7360a |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/237b082f739a691097112e17f62b7ba5ec5ebdca |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/25aec88b1463abf7c219da96e438ddf1795ce445 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/f35523e49fb6ca5faa8bd3dfd82eaced108c7d0d |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/63e20d5a236a9cd33ef73d951ceb964e33082e9d |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/700de3fdd2cb599fc407850ee494e73778eaf6c9 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/993ccf58fb0e4f42023eca2195cbb6ec4002975c |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/2dc59680e6511b0a53aaabec424c69d143900011 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/d39b2edef46c4b2e49be0e3a0c77d13ec7e78001 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/9c8f9c739a20f3824e29901b9686b21072421d18 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6a2a2f75b324a0ddf0de858d92747e6921ba9a6b |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/eef1864d4d3e001eac8288ee99ad93de8333eac6 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/65411011c3b74d5622670a1d96e8d391c8436d21 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ed88bae3ad54b4bb1389c6ac7d4441dda4aeefa9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/cbd6de3f8dfd5e48d00d1474a892ebccb2836e53 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/6a639496811ea08d46a32bcdafee09d0702be4d0 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/360c0693b7f8bde881b25e0d292587f269a2a438 |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/914c88008b92637c72b125714a20b70653d0016e |     
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/0090fd2bf4f7987b7e11c47aaf2fae6a3aefaab8 |     
    arc      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/179988189d769763fa93f0fac02e77fa84873423 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/95e279763160cc40539467e4eafd795ad5be1d3e |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/b79eadad00509a362a059ccc43d91a794bb3cf27 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/1d7f5bff81afc98f51118d067d49c6ad4cb08675 |     
    arm      |            gd-2.2.5            | NOK | http://autobuild.buildroot.net/results/86c9ec2d7af3b4d39b68a8dd393cd243390fc9a7 | ORPH
   mipsel    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2f4d8b50a19be3ca3427b28a40ab5e613e89249b |     
    arm      |    gst1-plugins-bad-1.18.0     | NOK | http://autobuild.buildroot.net/results/ce07ccfc482b02c7612290ce2e73a2ac3a8a19fa |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/a96940748e8de9b2321e24de70d2e5c53175af2c | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/4fb4dd5f743fb6d1a1e7ad4856cdf85ec5c9e846 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/9caa491679c2b69bda115827641bbc06186b3d09 | ORPH
    arc      | host-binutils-arc-2020.03-r... | NOK | http://autobuild.buildroot.net/results/538994480a437ae6de110c1d1229ab9e9972bfd1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8989d7e9123cab258f8f71135ae7651cc8bf5c58 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b5bcf447384005aed2c3b7dafd338b258db7994b |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ce566ec91a8f7d69f2525892a7a034c829db9dad |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2c9fe0fc836c75f9784705bd9dc39dacdeb992b7 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d03d9fbd419b5df775bdbe43ea2fdebbd65ff3ac |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2b4e87af16c416f25ab522f42b3f089950493394 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6dd97943656ebc48586d393020dc41914eb7746d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0d7e2e4bdd489752eded2b6f288780055b4292c4 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b4e751102ce59ee60c42f7b8a4fae943379f54f6 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d845df52bc34c66783e0892a92b7e1a5ca31eb48 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a569cd2f38c9abb71e6e174cf36c8ba4c665dafc |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f9483e80fb2bf6b09bed5892fb5bc987523d3c5c |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dca2f0a7daec428105fcbe56039c8dccc9e66c63 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2def306d970409636f9e874d2aa6bb8485711837 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4532175ff9e74e4970c93439fe8c0fc3232b34a3 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/57f492807940c8665c72c14da59c0164b109d2fb |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/975bf9d9c85e4d147144acc4cee7dd2b1ebe4f5d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/32f668cf91fe2478d4b89dea9acb906bbf036b21 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/b35b2a241c5060cf1375d3391c20a3204f3af090 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/cfd2a81dfa182874f4dac1f52ca72669eec48274 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/1f00a4ec0d735eefad7a4cdacd92ccb1065cf5f4 | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/9e92ce52ae68491da8e6e4e43ab0527e022cd8d7 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/0930230407d689c6898c43132b242446befc2c37 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/1730b94a0f1233b60bdd136b1cd31e8d1dc610ac |     
    i686     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/29abb0c11e690bf20aebc48f79c9852d788f1e88 |     
  aarch64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/b258095161504b5ae3776f6160eaa3adee191780 |     
    sh4      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/5d37c417053b21cc4f0469773ee8ee507c03a7e6 |     
    arm      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/88db58beaf0be9717ab90cc31c0ca086db8e7779 |     
  aarch64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/9a65650745e05313df4d7ecefd395b47c9d030bb |     
   nios2     |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/ed11b44035892566a5bd29a84073c487d635273d | ORPH
  mips64el   |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/a95872f6b3e031c774bf8e5d435bae89a89235ba | ORPH
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/7ed29ee976f8e5e879ae579156be5f94714d5b09 |     
    arm      |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/81509eb557bd84c46a90b5799ec2b2d29a3655dc | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/962687b23ec582134d349f5bcb1b5709fdf16bc6 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/2935cbd09eb9e0bdabefd65f3f8598bf9901ed21 |     
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/a405a2281b63859d51ce7808c8363fdaf57ea2ed |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/081c47481327073c7c7c8f251a4643361d6782ae |     
   x86_64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/e25c2dc6b318f4ec045561b15e34d0e3f84c6380 |     
  aarch64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/7a4840c098b1e531751231d41933f6d83b055650 |     
   mipsel    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/a4a53a4a38bddd896c63fa69f470279bcd5855f3 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/d3a5051fd37a34036df334cf6005950290930b33 |     
    arm      |          mp4v2-4.1.3           | NOK | http://autobuild.buildroot.net/results/c2735a77f892e226789017cd58d106761c1912c3 | ORPH
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/88f647b8a9e94d1f1e8bdc31578ef93cfaac12ba |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/371578f8a5126e36a9fd7c53ebdba6b79e4ac27d | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/55c46dc4e6aa45021b9657be7f6457bee25bb5e4 | ORPH
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/46476491c24a4be907ea2f055f700216733831d4 |     
    mips     |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/1ccf37b9cd068c677f2974de76bd8bab04e25a2c | ORPH
    mips     |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/5c3121713e336974efff3302686be9c255805e0e | ORPH
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/2bd11f5e2a2cd3460c61697772f582ecb132399a |     
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/3c8b7d681145cca7a9b846e5eb5cfdbf8a44c245 |     
 aarch64_be  |         qt5base-5.15.1         | NOK | http://autobuild.buildroot.net/results/c0f11e46aea80f6292f12ead0643015d43e11fe0 |     
    arm      |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/c7ac39fa6d0bd8c59ff451f9c12230da91753db1 |     
   x86_64    |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/b123ff9bfa84fd5f93c00677421049221ad29951 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/1839cbd7aa55c0be150eb01ace0ae8b548b850fd |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/1d8135de7edfb73b3ae986d89d31ee0aa521ca33 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/c02057c489633b1a852212b70b2f537e16e2bc13 |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/d173c6ef82d4a896e3cd1f2b5335bced4f91797d |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/943ea62aed98c77d0e7efda56630880043d0e887 |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/c97c42d0243c057e40f98c1631a664cf25a5317b |     
  powerpc    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/827e3ffba8ee13865f8f6b03525ae705a2c86a90 |     
    arm      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/37ee6401e42936fe111c2207f192d0c297a77764 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/39b6f497ad1642fec7054c6faa611ef4579cb4ca |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bb86d143f8e7157f373786b35de163c24acc1996 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/6feb03efde961484b857e943e9607b58928d7e58 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/01466afabf162c9b5e01675705d3fe0b39c4ba72 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/e3cdbb387d56054010366a1bb7297ea69c1c0d73 |     
 aarch64_be  |  xdriver_xf86-video-mga-2.0.0  | NOK | http://autobuild.buildroot.net/results/1fbccecc1dfeac8c693bde32c98f3da45380d790 |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/822b9ae1330de9fdeb21760d519f1f695d4e6314 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                qt5base-5.12.8 | 2 
                 binutils-2.32 | 1 
              bitcoin-0.19.0.1 | 1 
             libnetconf2-1.1.3 | 1 
                  luajit-2.1.2 | 1 
 Makefile:753: target-finalize | 1 
                 mesa3d-19.3.4 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/a340845c3ba85757c177be16446ad9ac399e34dd |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/c4cba84997d1b24b9ad56c2b435a00700a604b87 |     
   sparc     |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/bc494a109899f423293d079ae817e69dc52b809e |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/fa62e2082b09ea9cf9de3241d6ad904f67ba131d |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/eef0969bac04800cec51fa27f1e1ecd3a4c8211e |     
    sh4      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/b6984206c6dc0c779ce4cd6c37cdd541b7f9e5fe |     
   x86_64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/f8edcff4bdb7de86f3dd71c2da6f12eefebf5831 |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/2489e9fe62a611169117043f9a1dbfc811fcaab7 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/3708c35b9f87a0a735849d0444b5fa7beaaf5ef8 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

            ghostscript-9.53.0 | 2 
              host-grpc-1.25.0 | 1 
              luabitop-1.0.2-1 | 1 
                  luajit-2.1.2 | 1 
                samba4-4.11.10 | 1 
               target-finalize | 1 
              tinydtls-0.9-rc1 | 1 
                       unknown | 1 
         uvw-2.5.0_libuv-v1.37 | 1 
               wireshark-3.2.6 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/483c7778eefa5cc5241e8dd27cbb1168ebf57019 |     
    mips     |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/528748fbc921deb15c0ef3637f3f7a7739928887 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e4867273408c446551dcd39949aa0fc26722b1e6 |     
    arm      |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/412d253e1424638224f088348b858be816c3403c |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/06ec0cc52c5c53d07bbed7209424754ea7d34f21 |     
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/719a6f26adacc0686fb786a50bbd67c8f8706d68 |     
    i586     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/76b580000e6311e88584874f942517badd6fadf6 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/b51db3e4223e1f07192abcbf0140ac3c1acc2cec |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8a067aa2ab71d3f8acc49f89e2d6e1fca4cdf057 |     
   nios2     |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/5ba80c40359ccb9eb823b49a0bb343dafa3881d1 |     
  powerpc    |        wireshark-3.2.6         | NOK | http://autobuild.buildroot.net/results/158aaca014a86763d4863d7807e796be2cc287f6 | ORPH


Classification of failures by reason for 2020.08.x
--------------------------------------------------

              host-grpc-1.30.2 | 2 
              bitcoin-0.19.0.1 | 1 
         libcpprestsdk-2.10.16 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a6e83dc8d5cdfb0234da2e6cee9b8eb5b3cc9426 |     
  mips64el   |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/43f1954dfaee60fb7eba6731e2c0fe2eafada9ff |     
  mips64el   |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/72be163861775e282c0fd7dcedd098a8ffe26387 |     
   nios2     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/9b85d36f0ea53d122fd64392a78314c0ebad8e54 |     



-- 
http://autobuild.buildroot.net
