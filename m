From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 08 May 2020 06:28:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-07
Message-ID: <20200508062902.E3F9D21543@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-07
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  3  |  0  | 19  |
    master   | 197 | 129 |  1  | 327 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              exfatprogs-1.0.2 | 11
                       unknown | 8 
                    atk-2.33.3 | 7 
          host-checkpolicy-3.0 | 7 
         host-exfatprogs-1.0.2 | 7 
             paho-mqtt-c-1.3.2 | 5 
     python-argon2-cffi-19.2.0 | 5 
                    brltty-6.1 | 4 
                   gssdp-1.2.2 | 4 
             host-gnupg-1.4.23 | 4 
              host-grpc-1.25.0 | 4 
                qt5base-5.14.2 | 4 
                  assimp-5.0.1 | 3 
             gstreamer1-1.16.2 | 3 
           host-openocd-0.10.0 | 3 
               apcupsd-3.14.14 | 2 
               collectd-5.11.0 | 2 
                      fio-3.19 | 2 
                 gnutls-3.6.13 | 2 
           host-nodejs-12.16.1 | 2 
             host-squashfs-4.4 | 2 
              ibm-sw-tpm2-1563 | 2 
               libupnpp-0.17.2 | 2 
                   mimic-1.1.0 | 2 
                    mpv-0.29.1 | 2 
                  ndisc6-1.0.4 | 2 
                 openal-1.19.1 | 2 
                  stella-6.1.2 | 2 
                    vlc-3.0.10 | 2 
                    wampcc-1.6 | 2 
                   cvs-1.12.13 | 1 
                    gcr-3.34.0 | 1 
              gr-osmosdr-0.2.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
              host-erlang-22.2 | 1 
                host-gdb-8.2.1 | 1 
             kismet-2016-07-R1 | 1 
               libtheora-1.1.1 | 1 
               log4cplus-2.0.5 | 1 
                       mongodb | 1 
       network-manager-1.22.10 | 1 
                 opencv3-3.4.9 | 1 
              python-pyqt5-5.7 | 1 
                  ramsmp-3.5.0 | 1 
                 rocksdb-6.6.4 | 1 
                  rygel-0.38.3 | 1 
                    strace-5.6 | 1 
                suricata-4.1.8 | 1 
                thermald-1.9.1 | 1 
                      tio-1.32 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/63165340446d755e2b07dd4212316fa7d5c49fe4 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/acddaf4fd240c69cd0ed50b3dd797f386c13d3af |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c001021bf9ebd86debbd7c46a7cba521bc80a059 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/e6a64c5186eb2b574b01af60890b4600355beedb |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4d285a703af52be95ff58ede20843eef7e815c86 |     
   mipsel    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/c4d537ca78382a3ffe3f42fb4787ae92f90b36f5 | ORPH
  sparc64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/617a792a1a01e26e99428470c1c65eba4ad7f849 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/25315256c4130eff4e38dc692609f0e0a566af95 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/2f202f65a77ac6536c636f79c4008482b992798b | ORPH
   mipsel    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/f8d190e98f62e1c0f3bc264894d98f0c46699429 | ORPH
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/645037e00e3b66d16ed52482e1474c807ca7b68c | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/af261b60091a593c942a5d966473efe1ea3a7811 | ORPH
 aarch64_be  |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/a99f7e54b8aa6830c74f982ef3893322553313fb |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/7cb70eb70fafe91a249e15c4a7a0ee917810e600 |     
    i586     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/dcee7556ecdc9437bf4502360d3942b500ab53ec |     
  aarch64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/6ef22a5511aa846b8305a0514330cab800710764 |     
  riscv64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/e2577aeac84475da6e4f3e9ca7e1c0f19293a3d4 |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/fb7207355f7799b1b01e332502b9a7cf3b09df30 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/24b3a9aa7cefafefac2fe8d9c290c90ef7cefce9 | ORPH
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/2f4a8921521ac27751b8a07ea04dde2ab125876b |     
 aarch64_be  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/b294c06243218b86d828a8aebd3d262d65c499b6 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/819f63363f81f64f8a62ef0dd1516c693e9a61e6 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/17a4dbfaa4fd443cdb3121c69f5865efd2f6bb5e |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/0d0eb2fe17407e43262fe701e9d7bfe75a86c592 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/d3c9eb57ce9d6b6b9da5bdd9584d208f85929b68 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/842ec59ab496a61367af3e6f18f2985ee4e72689 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/b1c3f8254a93c2077cb4891b7fe240d61ea55ea3 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/d4a5fe7a5a63d95ebf26b047429c490247dffc3d |     
 aarch64_be  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/32bb79d93bfbd1fb4754e94282f54b5f01270826 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/f54ee140b41cf646754f92dbfc58d414e00c6a00 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/d81647db3f380b92a94dc123a62c3314d697e99e |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/1bea75402330c23feea9dcc32a6fb68499910da2 |     
  riscv32    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/5786447316762b0360acde9d3fb8d3065c6fe36b | ORPH
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/c70a88c6b8be70159306a5b384df34ff717e2831 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/b7ab1bb6bc809eb1b3b4c347b92a9ed3b235c271 |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/3580b6b65635cff023f8d882252a15cd462ff98d |     
    arm      |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/85147a2379f21c77f7ca65c7f99b9a8a125e1b9e |     
powerpc64le  |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/498ca8fe26e83dc36890cd0f46836d4718061107 |     
  aarch64    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/68860f129dfe9bebb40be1889ec3f45985283ada |     
   mipsel    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/a3a1422d827ad18801fb42c5285db02ef182fd93 |     
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/bc449eaf2799e1dca3d81aed86a6642675b6ac0c |     
  riscv64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/952f0c2e21aeb4762dc64826357ecba1e6aa789c |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/664841fba634bc35029611fbbe3abb33e1146de7 |     
  riscv64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/e8acb97e2a059837ae62dc88b8358b5d8fb5efdd |     
   x86_64    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/437670f7ce2b67ed20bcd3f46465b52062f93bf2 |     
    arm      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/61b42deae8a144bba544a8173b483d6274b1de00 |     
    arm      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/7aa0fdb0df01927b8156aabc4cee060c79276b55 |     
  riscv64    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/814afed8accb08e722b09512b7206ad334f4caf6 |     
  aarch64    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/1c345e1873cb2c2d8d312ecf0af5781d22227b53 |     
  riscv64    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/791319bbdacced70adc7b9dfde0b0c6b4ec927fe |     
   xtensa    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/593109862aaf1f1fdc2dd96e30a8130af8fc4d42 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/fd485e7b2046d5ddbae1eb76c8b8704156e441b5 |     
    i686     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/a9eef7dea5ad364305d1ce591bb54639245eae74 |     
    arc      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/8e408a0653cc8dc9f73cc4650b1562bc48b9c0ab |     
    m68k     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/daf270eb223394e3c24cd9c78976630702030876 |     
   nios2     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/1b517fefe35037b803540f457223902a0c112ba7 |     
microblazeel |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/123f0079a0cd2eb4b713d9445296a4f4edbb82b1 |     
   mipsel    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/9082171ea23f4fba4a836382de2efdf18ab62d01 |     
    m68k     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/899fd854566c9c63b16d829126ba9e71a5a8320c |     
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/b75f108cd94f0d075f98f1aac033ccf0e3d43380 | ORPH
    sh4      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/cb282f125daeb163ba14b80c3af81123f78bef3e | ORPH
powerpc64le  |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/43ec6ce4552448d6c9ef56bbdb63ec9db2ed69c6 | ORPH
    m68k     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/f29318e7a11e24a06445b6a92e9607930b508082 | ORPH
   sparc     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/7866a23fe28ce79d68963f93fbe145abe8f5e07e | ORPH
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/dcad37ec24de3b6cea97c8d8960a3ca627a82dc6 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/76c8f23c32fabf96d55fd95380676fe39ef5ff75 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/94aa413e86e464e22c30852815dbd806a1cdb280 |     
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6af54659cd1b367304124e9de4fa7f64049ca99c |     
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/61ea6fd0b75f3fbfdb56b507ea65236703f1da58 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/161fa2fc822972eb2cf9b3605e3b179dc4c7b108 |     
   xtensa    |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/01619f9fd07d7f5e068510d34cc3aeb7459ccf09 | ORPH
    arc      |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/dd378287c71c268aaeb968ef0a9e520764bf07ac | ORPH
  aarch64    |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/4cd0da26b7af35048ad96bb1c135c7e99a02e5b1 | ORPH
   x86_64    |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/4ddfb755d001f393de2c5559fa4b5df2dae0adc9 |     
    arc      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/058b2953e0d95ddb92d737ebb7b5788e77fe36b3 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a62e111fb9eb4c924a47336cf432b2b0631e8cba |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/01f4229d2f332a0d70002a60f73f851b1fd89e9b |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/13e11680ee397b1a2ccda27c664faaecefbd5a95 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/fa9df5da42e321e4c4ece924a7c8d292eb81e0d7 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/dfa8453104e74e610c20bb505cd0c86c7a387798 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/056d38efa7e0f92c2d8a14f8cedfb9fb8bf799fa |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/6bd4f2550b4e4279ba9cbf9cca1d01d715a05a54 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/02c54a5ba8aa0180c57f171aac757b4faf3afe2e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/93cfe097cbd5244c5e294696474f871d27ed3c1c |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/dc7a6df5f4cc3ac8d8944ad54b3222ebd6ef3adb |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c65acc361a314ad69b466a7f71298e8f0bf4a0e6 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d0d7d9340e650b75a78b2bb31c75b695bca0b612 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9fdbc214692d97c9db4df75882c0f42a9aca1caa | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7d97a6cfc11fc85e1e19cbd73f65601ac3c62065 | ORPH
    arm      |    network-manager-1.22.10     | NOK | http://autobuild.buildroot.net/results/f52b71ec120d9694eca7494bf1ca3d1202aec904 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/0adfdc0db185a268cccb5da444025208cb447cec |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/30abd0857013af03436014779ba82d33b1300eec |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/e56327dbfcce976d289526f12290e54f4b6ad826 |     
    i586     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/826913909c9c2905401af2ff530a3b4b5a802943 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/68f54fa5a64f682e76bad16af817c720c622d83f |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/893fe8a09f9787643f45c0478ca85537ee84e181 |     
    i586     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/8e84303053da6b4b2f7fb088262400642a3774a9 |     
    i586     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/658720cb7eedcdbbedaa46016f1c31602a51af30 |     
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/5b104abec3b0f0ff6e431203e4466050d482b5eb |     
  powerpc    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/913b842e9a5b9a2af8fdbba8f1561b4a8accbd62 |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/6623ff39b05e5cd7ceda6d81eac2d3942c4532a5 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/0306d66d081dd0807c577edd50d39075a46d0dd9 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/861eb4057a2fe3e33d0c33ab38cbc03a636d1b09 |     
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/b34e11cbaa812c00c169307a70b62c0a86f485dc |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/016a228307172004a6b904ab58011c36357e7637 |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/89d7cab4d79e510f4ac1d5d7c58b6c923d417fe8 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/39fe9dcbbb866a108e5fdfec76cfe98b8c0693b4 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/4256c6b0eb9fcab660c1a6ee6f0712ce8722a6b4 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/f39e7dd1d66533eae3147ed18912c58324a891c3 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/5482575b9a32ae6d2f80afbc64b950425cdb07bb |     
  mips64el   |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/0de3bcdb21a3b5814d40509983c205c8567f3bf9 |     
    mips     |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/63c91f2e90913fa8efb88aefd317aaa504d6ada5 |     
  mips64el   |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/8eeca05fd76186bae86812b1e5b0449aa0fe4c0e |     
   x86_64    |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/229eb0e990252e4010fea6b2ee076aae57dc009c |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/6d4665e80c23b8e1f85927bf8def29991bc372ef |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/77c5104e0bb7be87702517b3a8f112e590060f6e |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/960426734bab2bd52241fee287767ac3c3003dd7 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/315ed4171fbf648be039e81659cab0ed874e61d7 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/1b64f68167149e762f18a801227f27ab334e080b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/36c615bc88494a68b7095827e3b6995defd3bf99 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/929d5b2cf71f7396715e97d201be5fa7d6dc6340 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/083cad6a7a81901f8c398cd017b7351950124791 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/c606dfa4f4afa9b80069cf3bca152e39155e4419 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/64ac9292f27c536c228dd62c3f9d1889fb663cd8 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/158c6173dd6730550be9212034b764a1c346cba8 |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/347f22cc7c07d80b855c98f5d2743b5b09177aad |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/dc4b1e51222e6237b8e4e0d87e8426d272df7274 |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/262557bcd925d26ecc60b28b73fff3bbb7162398 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/6b50974100df370870b5ae8dcebc0def802d46e9 | ORPH
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/6191fc9bd988742f21a75947c3f3706b56e9bd22 | ORPH


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 binutils-2.32 | 1 
             libopenssl-1.1.1f | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/3515ae8975e9d9253b2d075976b2150f43384dd4 |     
    m68k     |       libopenssl-1.1.1f        | NOK | http://autobuild.buildroot.net/results/46921c0c0a2f93180748757a583af232bc88309c |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/da0fe06d084ebc2a50f276ba4b6ec670ee16f8cd | ORPH



-- 
http://autobuild.buildroot.net
