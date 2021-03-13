From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Mar 2021 08:15:13 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-12
Message-ID: <20210313081518.88F9F6069D@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  1  |  0  | 15  |
  2020.11.x  | 20  |  2  |  0  | 22  |
    master   | 142 | 97  |  0  | 239 |

Classification of failures by reason for master
-----------------------------------------------

                      bash-5.1 | 55
        host-sentry-cli-1.57.0 | 7 
                  zeromq-4.3.4 | 5 
                       unknown | 4 
                  janet-1.15.0 | 3 
                     mc-4.8.26 | 3 
                  boost-1.75.0 | 2 
              netopeer2-1.1.53 | 2 
                 pixman-0.40.0 | 2 
 glslsandbox-player-2019.08.23 | 1 
  gobject-introspection-1.64.1 | 1 
              libostree-2020.8 | 1 
              libxcrypt-4.4.18 | 1 
            lttng-tools-2.12.3 | 1 
make: *** wait: No child pr... | 1 
              micropython-1.14 | 1 
                  monkey-1.6.9 | 1 
                    mpd-0.22.3 | 1 
                proftpd-1.3.6e | 1 
                qt5base-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 
                rocksdb-6.13.3 | 1 
         s6-linux-init-1.0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/96afdc00d70989901f5d62826f0e28c791de8a63 | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/38236eeb0d702907d8890ba61b274b6479099986 | ORPH
  powerpc    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/2194de530f2b307f0d0a0dd52cf288deb9748d24 | ORPH
   mipsel    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/609157929d232822b5542692cfafe83a6d83d0e9 | ORPH
   mipsel    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/ef1d8535bf99e3bddc016e4206578fda446f1d3a | ORPH
microblazeel |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/b3a1c3165c9264f383ca0e920d7aa7b16e94a7e7 | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/c1942fad30e2762e8e17bec27a51b786461e7f42 | ORPH
   x86_64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/a54b885bc1bb67716789ee4b02287cd1099949c2 | ORPH
   x86_64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/83093c3013e0b5a8d6444b5767a7835a87dd2885 | ORPH
 aarch64_be  |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/eccbc4287ea91197fb76ba298cf4336288309016 | ORPH
 powerpc64   |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/52ddbad63a99fecbd7b191b2e35b0802f63f6116 | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/c83fcc0a8f8da54a61325dbef72689757a92016e | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/1c175eb34668a7f91bd50931330f3737e9188bcd | ORPH
 aarch64_be  |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/6bc8b9708fbb4be9e3b5247d8764ed3b9466e388 | ORPH
    i586     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/a81e52787cec0e140b19541983757676dbd4660a | ORPH
  powerpc    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/7638b0338c4348d839eb6f882018693fd57a03aa | ORPH
   x86_64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/2e97232b5d94e9eb0944577089af0d2b0edc3e48 | ORPH
   xtensa    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/0a6845c81b3644be63fad4efa9394e57bf6da075 | ORPH
   s390x     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/dbbbe8fd7ba192c115f3aa538a974c31dce06b0e | ORPH
   nios2     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/080ec8c9045577e6ba5d5c7fe652cf50a8874343 | ORPH
   x86_64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/5945512782b812334680f0581448257f30b4d2f6 | ORPH
 powerpc64   |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/3f5cf438b5778397517e94205c379de4b9cf7db3 | ORPH
   nios2     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/d60be9894f6601dd8491ec0e2294ab440b8a386d | ORPH
    arc      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/145c8502d762f4b311061fd47524607892f4c782 | ORPH
    i586     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/4088b52750fa6e7a473adb1c84f4c088255b8696 | ORPH
  riscv64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/93941f2c4992d4b1fd680cc8ea8b4e942af2dc74 | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/40eb3337f3fc5f9c73c4dee66a26252a3156a7a0 | ORPH
    arc      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/475df5fd74af93517d4331d21c1b7ba841c20815 | ORPH
   nios2     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/5a0bf6f9334f7e93995644922db677509160a5ed | ORPH
    i686     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/12f880a3941d2c436365d575726bb3de3e108012 | ORPH
  aarch64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/2d9a8ac09b6b42bb9a686145fdfa717bb2cbabf9 | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/29e69c3a7198595f02778cabc03bb83f020ddb50 | ORPH
   nios2     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/d4220a99f380a3a0a352946ca2239f24ef3e2adb | ORPH
    m68k     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/22b38a6f067eb46b37cab8ba55a006043f7acc46 | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/74ecf4432224eacae94a083c02ccca0c8827ddb0 | ORPH
  powerpc    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/53e2d7d867e6fe80a40f82074f9bbf53e34b7821 | ORPH
  riscv64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/54e74c4344453c23c17d47f7d9b02eacd2d42949 | ORPH
 powerpc64   |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/763b1393b68f49f32a54627ed941d3536691e45e | ORPH
  powerpc    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/856ead78f0dc956ce3460f6e3ae9131746d7dd4b | ORPH
   x86_64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/36fb9fa2c6a2a7024762e145fdf74728c326cbc6 | ORPH
    or1k     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/03f616857593c407ed5fbc8a06a128b0586baf4e | ORPH
powerpc64le  |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/b155b1609aade8b755032ec8bd0e7079c15e4f10 | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/f8085fe7378c272aa92da7e9033dd1bbde062721 | ORPH
  riscv64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/c7cc84c9b6cb5bffc3317d2c9e95296fbd93be54 | ORPH
    or1k     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/e7ee9eb04610d6f9d008af5bfd093e9ed5fc2f99 | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/2cdc673e8b21df81aec429daf4eeb6375fbbe203 | ORPH
  mips64el   |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/f2515aaf1d05428147a2937f6870787dca73f421 | ORPH
 powerpc64   |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/3524e31a21ea25755c76fe3875b23113d6c82d60 | ORPH
microblazeel |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/9118ed88215b04a631023cc71487eed4f62f0e8b | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/a336a776eacb487565ab1ebc6a78d8d742e18217 | ORPH
   nios2     |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/b4cc2e990312da249db3d393ece2e5996b24f961 | ORPH
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/d133a17fa9436229f12198db910215d43e8750e0 | ORPH
    sh4      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/cc1a05ee284e0ad5c2a0b49a327d551381d3feda | ORPH
    sh4      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/1d54ba9ff2c392eac7bcf4428dd99d5daf5c0c2a | ORPH
  riscv64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/d83f5d260dccd38984ec6fdb340835ca928bb687 | ORPH
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/848d7c4d461895e364ffa29aa1fd8c1c6f49e3ee |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/800358c8f48b11668e47d57f31c1b851892bb837 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/c68931a97f14671f12ad7cc1d9e34bdc885092f8 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b0b745ca5d6937e03d22791b9241db63b3565482 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82937d5431d5e58968709b76b8fbae13a5d1e176 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/835e53cad43b5923b7780684607b47ba53c67b4d |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1e82428b855a14d8576780e34b3cf7f3318a35a4 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a33558d538993712cf2e451ba86a59dbbf411add |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8c3934ab54f27990d18f2e614c2df72a859eedb2 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/45f4a0f3bbff7dbe3dac5d0d28cadc9a5bb0c2ed |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/010807b9528d1f074254dab74d8ff73cfebeb86c |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/a4f927f73a7b80e65408c992d7b6023609a1eacc |     
    m68k     |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/b30dcc13365e15bc9199328e7f9dca05788de811 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/c91b66e9914acac88c80474369760c603c52ab12 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/478638013589408fdc12be41def94e6383c53178 |     
    arc      |        libxcrypt-4.4.18        | NOK | http://autobuild.buildroot.net/results/1eaf2c08cba9390ca5002b1f3e1872fedbe4b960 |     
  riscv64    |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/0ec2254819bb9036a2357cacec7ffa935537fe32 |     
   x86_64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/2542a2404ac20597d69179a7ff71cc935f9852a9 |     
    arm      |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/159e7d07ea01d2d18737549a2f4113aae247ab4c |     
    arm      |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/b77aacb7436ceb43cf81e48d10a7274a07460636 |     
  aarch64    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/9aad3f489f8b69772f4a5e040da90bd8ddfac128 |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/807447ca913e2e36f9ceb2c2f11a377340d7e28b |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/6c7ab7116cc64cb8dd7a2c3d9e80c3f10f73acbd | ORPH
   x86_64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/7eb858585b440d290557309fa5d4cecd7afd2c2d |     
    mips     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/88d0dd5efe19bffb8522661a23da4988a691afd9 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/08b921ed3c68b924228ed06f4d3b18899df732d2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c506749f46b0da7f29bc1fbdf5ca67d8216d9d5d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/10066bd63a31639a0cade678e631fba59c474246 |     
  riscv64    |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/701929f9ab90b9fced01afbd5fdd5cd66a951e4f |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/db169858c853e97140d4441d7febd8c67c284171 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/c7b7d5f1a5eb0400a21071db404043c0573b23b3 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/e7e7615f04995677b76ea92807dff7acd160e2de |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/366ed021c02ce61a39c93867b03430bf3ec5f08e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c3ed4ad1926cd69f6c8a845c9eacfd0534070db7 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a82c464df01b066141e6906ea43a59060f10caf4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1382f08e35519cbe15d6c61993d6e0ffd5b813e9 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0e87eb29f12951e0319ed77aafbd22b2a7c1d3b6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ead3def2b595c10861533c237b6666008f8cb5e3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/97938a763eef1b030cdf304ad157a8b88aa45649 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/38ef0619a18d6eda54a17aab664a2e75d412aa9b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0951d7ddfce0408c8c138c9ee55d09dc07cc74ff |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4e5591b360f040def17f44e52d7ed4dc2076b490 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libopenssl-1.1.1j | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/d54bb000b8e232792b85e1b9ecebd07cf5eda034 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fa63ad4c389408f25e09be29ee034d0e50a0d781 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a9c91c2886029a00c94da37db9bc0c2b7e017e0a |     


Gitlab CI results for 2021-03-12
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1089053939  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1089053942  |      
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1089053944  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1089053946  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1089053980  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1089054081  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1089054085  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1089054215  |      



-- 
http://autobuild.buildroot.net
