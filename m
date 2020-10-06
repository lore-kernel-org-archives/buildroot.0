From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 06 Oct 2020 07:10:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-05
Message-ID: <20201006071028.49DE020337@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 21  | 10  |  0  | 31  |
  2020.05.x  | 11  |  6  |  0  | 17  |
  2020.08.x  | 28  |  6  |  0  | 34  |
    master   | 169 | 77  |  0  | 246 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.13.0 | 9 
                  pango-1.46.2 | 4 
                  uhd-3.15.0.0 | 4 
               apparmor-2.13.4 | 3 
                  boost-1.74.0 | 3 
                 fwts-19.09.00 | 3 
                   guile-3.0.4 | 3 
        host-sentry-cli-1.57.0 | 3 
                rocksdb-6.10.1 | 3 
                       unknown | 3 
             kismet-2016-07-R1 | 2 
                   libcap-2.43 | 2 
 Makefile:753: target-finalize | 2 
                minidlna-1.2.1 | 2 
                    mpv-0.32.0 | 2 
                 uclibc-1.0.35 | 2 
               apcupsd-3.14.14 | 1 
                  autofs-5.1.6 | 1 
         conntrack-tools-1.4.6 | 1 
                 dc3dd-7.2.641 | 1 
                     efivar-37 | 1 
                  fbterm-1.7.0 | 1 
                  ffmpeg-4.3.1 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
         libcpprestsdk-2.10.16 | 1 
               libupnpp-0.19.4 | 1 
                  luajit-2.1.2 | 1 
              micropython-1.13 | 1 
                  monkey-1.6.9 | 1 
                  ndisc6-1.0.4 | 1 
                 opencv3-3.4.9 | 1 
                openntpd-6.2p3 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
       python-matplotlib-3.0.3 | 1 
                samba4-4.11.13 | 1 
               target-finalize | 1 
                    vlc-3.0.11 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.6 | 1 
                    xen-4.14.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/eb6b2d667d6f6de1c813d54c06aae112da4908bd |     
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/f6f2c2fee87adef3723e85a6174717b9f5862e2f |     
   mipsel    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/86f3c13e463e2296b8fc642e6e1f5b15a1d72bab |     
   x86_64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/523993df1d25e96b8bebe7bdd1d4af8b487223cb |     
    mips     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7606a4c557d8227eed91faf40498bdb02e432ec1 |     
   s390x     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/9f20851e941fe03626ab0cb45dd186feda0dd0dd |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/fa89f6ba7341b34541d4422ca677b2d22c5b84af |     
    mips     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f1619138ef7ad6b4ef671aab7e2c60caefe1cfa0 |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/2f77134dc7d7d7a0ced7b50466447cfab9afc478 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/1564cea18c8a3d94fe50460e1e3620167d95364a |     
    mips     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7f36daac2f1f8e9bf5f6e7753033714b989e7426 |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/086f8bfd6118ee24eb038f9bc840c1967df4c987 |     
   s390x     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/0a722d99c5b8dccab3254a5877a921df2be9ce53 |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/1d8c09265fc404eb5b67ccc14305959634dd6f7d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/74e11f7026257e6cc76c865adfadefcc6e80713a |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/7a0fa12c57a6b646a6763ce19a1d8f562c240550 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/919f698b25fefde9cce89241fb263562321e5345 |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/b431a263ddaeef0c709b26860707f6cf1dae42d8 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/58ae8cdec61fcf324e4dcb9ead61831ac0fb32a9 | ORPH
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/7c59b8d1485c9d1c20144ece5e70d4de135aaa18 |     
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/21ede59686d4998c9e643ea874396a11b1c0df93 | ORPH
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/b5ff3ce8b80e6f3833aa0db49c5d9502619258b8 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/69eba6754e306ce8001baf80edce37b1419c33d1 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/78d8c248871b41ff5a99f79d7861a11414f1681b |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/52f21fcfcc75c213fb0fc97b07ce75c24b5589ea |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b41d0a55e8a841f4eb9931dcf5b9e1a9c859136b |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a8aea14f2bf14ab215c0db715207f467dfb253d0 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/b9c5336526be0367ffad2d40b0c497aaaa2b35de | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/f49df8ebdfdd08f99f58cb96e6bd0832a5143d33 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/bb8a1db3b832b81a8691a4a49ae7d4528a541b68 | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1e1951738510162defeeaddbdfc8da1121333dec |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/94a9e5a2060929e3f1ce6697147fb8fb8187d4fe |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c5a109baa20565f9c8050cd59a631de8efee935a |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/043a696618f5b8b676ad6cf5bcfa8537391833b4 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/411e0109884098844d1fa8e53a923eec215f39cd | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/f743c08b2be90dd77d93a51c8dd258014fc3cc5b |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/2430583d85d7d813986f70bb59c7da381f59594d |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/4f35f3124dcbad2daef1d625f9959979d2275269 |     
   s390x     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/d5565b2189d7ec516687f6dd7f716fd05269f7b7 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/d9ba6f445b2b238fcfddcc7fa17691b872fb20af |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/5b9eb4c7e393c35fb36e2959183df4783a231e68 |     
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/6da3177c78c2c573d093450a49c4a2c0adb68f29 |     
  powerpc    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/cd1b787da33b92f49daed7d2e208965947889cc5 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/4b30feac3bbb70e65079b8befe9ba06e20b27f18 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/ce1de60788eacee7dab4e90d0f1a2b5b3fffa4b5 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/5d363bbbcc503e8fa853b5253bbf168f2381dd88 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/a53a7df2b2b351cae5c20e83bf4e3147430d2607 | ORPH
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/b83fe6acc10f882077dd9885a6c75cb3b1c934bd |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/38c73275fa5e5fd2cf96522a235c41718bcea9c1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/95a69947577e2822582d4fcb5b59d90d8ce70d92 | ORPH
    mips     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/2b4ba55241e95466f5f0fc34994b594c4adb1c02 |     
    arm      |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/abd36b4f4484fceb98daf4b56c9edbc979141787 | ORPH
  riscv64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/bd2bef19e496a8244c2fd10de98caef1d241b646 | ORPH
  riscv64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/aeb841b9ae5e27fdd792fbd39f0d9b809c14b2bf | ORPH
    arm      |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/d17de7fde9747008ac611981408e94ac4f336cdc | ORPH
  aarch64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/a9100f4b8ef84bb578120a10ed10224ffa99a917 | ORPH
    arm      | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/76212834a3065c4c3d479a49a16297d4679098a0 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/aebefdfaa4075986eac4b832c683ae4e541aee94 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/364d827b7f5f7daa3d405e7da90c1e1ff64cddb6 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/a0d61e0c135fb0cc8d5d020702a892ccd8bab351 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/61b2d99f8b30524178c89663ab6c065782ab148f |     
    arc      |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/3010730107a48c4cfdbd01080e7a955ccd972c55 |     
  powerpc    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/18bdeac94e86ec3e31bb8ab5090aa5e4ac93758f |     
microblazeel |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/0b411e24240ff357950e1635de06c72028b9b3b8 |     
    arc      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/ed3503ad302cee59fc2d75090c49cf1bfec38a6b |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/dd982f488eab381bf94d0f1b70201d471c37c460 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/13b67e0ac6d1783d2ce14eb66593feb22c516b12 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0bbec30ceada2cdc2b7347b71df1cee4499246d8 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/ad6d1ac59a635799e3064e2e79513de51e95b770 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3f5e1bf52886cda85024585d25fe59b9de1f8207 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3992f682e5fe6b857638484bd23077b16f400d0e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1adb38dfd5f64a3aee1ba5f18cd99474ce9570e1 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/9085a40b705afeaeef7070b8d6351737fa51e8a7 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/8e58296a7904d969545651f0884811876634328d | ORPH
  powerpc    |        wireshark-3.2.6         | NOK | http://autobuild.buildroot.net/results/b6d3430e6b02894104e86f85f2b17833213a25d5 | ORPH
    arm      |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/1ce8aea5ed688a40cc4650edac93d25a46bebb60 |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/7d8a04d5254ec4a62ca279ec7fe1e46e67367d6e |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  ndisc6-1.0.4 | 3 
gr-osmosdr-46698a67e7e06419... | 1 
 Makefile:753: target-finalize | 1 
                   mimic-1.1.0 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.8 | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/473c08584dbb3f840feaa37d03f2f8eaac88ea23 |     
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/748d4213eb71319fecb88294f5210060de23eb68 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/847ac4e38dc0806a3727dca8f85ec1430b3d8b3b |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/6b8c45f686a45324243be59d8c178e8257f9ce51 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f97b01df2f5f0ebf8e80860a50446aad4d067d4e | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f0ca03b5514d6683f124e52d57d13d2d9fa4eb24 | ORPH
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f65462a6cf717b2a6d4564f3cd428a0c9c7caf8c |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/d6686d55ec210d83facf01f505777f8a6cb418e4 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/50f199bfe06d054cc6770760e73ac0de594a0670 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/70a363e687aa80862c2ab1c768fe96aa9893315e |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
             host-pango-1.44.6 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
         libcpprestsdk-2.10.15 | 1 
               log4cplus-2.0.5 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8d617d8850270b4b2df56e9bcb928c7ab6d4a330 |     
  riscv32    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/44f657ad0e1dc623b008abfea25c1180bb9a293b | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/0df4ea9535f41c05f06b812df7ea6505fb180a94 |     
    arm      |     libcpprestsdk-2.10.15      | NOK | http://autobuild.buildroot.net/results/fcee308b81e25a2c808f70a74ee9ae0de8de0436 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/561f61b7879df1c9dad5b055831a70bcd90be9b5 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/ec1c131e3e77e0df189a73423baa62b0d69549a8 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               apparmor-2.13.4 | 2 
                 midori-0.5.11 | 1 
                minidlna-1.2.1 | 1 
                 opencv3-3.4.9 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/26fec2bf7cd5dc75b04bca040f6cd5c06e8d2e9a |     
  riscv64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/df81fef4f48fcb51a33382a2dae485efad56c4c2 |     
   mipsel    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/5bc970bb5bf044f31c7fcd2eec94725aa1b1d2cc | ORPH
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/23fc157fda7dba79ff7740516ed42cd68e047f31 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/e9b290167975bb9e5d788cf9c31cc8af5f3a04d3 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/ff19c7652a7f293adfd8d17ff4e31a70f277234d |     



-- 
http://autobuild.buildroot.net
