From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 07 Dec 2019 07:16:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-06
Message-ID: <20191207071653.6D870877D6@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 25  |  1  |  0  | 26  |
  2019.08.x  | 18  |  4  |  0  | 22  |
    master   | 127 | 90  |  1  | 218 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              alsa-utils-1.2.1 | 25
                    libffi-3.3 | 14
       alsamixergui-0.9.0rc2-1 | 8 
                 uclibc-1.0.32 | 5 
toolchain-external-codesour... | 3 
                 acsccid-1.1.7 | 2 
host-gettext-tiny-73fc3e7ef... | 2 
                 mesa3d-19.2.6 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
                qt5base-5.12.5 | 2 
                snort-2.9.14.1 | 2 
                       unknown | 2 
                 xvisor-0.2.11 | 2 
                  bind-9.11.13 | 1 
                  flashrom-1.1 | 1 
                    git-2.24.0 | 1 
                   grpc-1.23.0 | 1 
host-google-breakpad-7515ab... | 1 
                     host-llvm | 1 
               host-llvm-9.0.0 | 1 
               libsigsegv-2.12 | 1 
                 libv4l-1.18.0 | 1 
           libwebsockets-3.2.0 | 1 
                     lxc-3.2.1 | 1 
                  ndisc6-1.0.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
               protobuf-3.10.1 | 1 
           python-pynacl-1.3.0 | 1 
              qt5script-5.12.5 | 1 
                 ripgrep-0.8.1 | 1 
                 samba4-4.11.2 | 1 
                     squid-4.8 | 1 
                suricata-4.1.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/829b69ca27671bd4612f39733149ea278f5f6b2d |     
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/0de95bed753e4d5a2fd8d77a6d5a5be6f193c5aa |     
  riscv64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/eaaefbed2ca120d8e2ce4f9a941e7f7d272fa97d |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/c4463409cdfa6682e982f32a21b5552403950afe |     
    i686     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/78ec35660bf81322383fdbbdddb909dc47ed4afa |     
   x86_64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/9e5da860c6b4b67bdfbb8876179703bc9ff75f49 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/2a1b875b6e615d693520f6c2137b3fb5769da7f2 |     
  aarch64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/ed3dee097e220cef348ce36c3f5a72082e578c25 |     
  powerpc    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/c7fb2867e6dfdfe5ab8ff53a91dee3ef32229b43 |     
  aarch64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/258c3f758c0386b627152da3df49b9faa501331e |     
    sh4      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/16db558355eb714c993ab7909eb9f200051cac5e |     
    arc      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/c7b9f205b950c7c65ffe977be72feafe597b1fe4 |     
    mips     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/4eb85fd07686c186799852fb7462dc6473a7d551 |     
microblazeel |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/eb57bffaf7d37ca52d90cb23280be16b86f10985 |     
    arc      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/062a20397ccb1d566f47c658c4846446c9140222 |     
   xtensa    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/25f8d782b4f36b84d468d41ea4c71d08ad85d6f7 |     
  aarch64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/4d7acf5a5d78253b4f8639d086d5ce8071f5134c |     
  aarch64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/71be952b350624a16e52190cb0acd706fc9f5bfd |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/d7cfe2145ebc50cbb45c3482d6f8b6e935db5578 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/d093b864cf73449366cc7e5bf62f95a5c4193d68 |     
  riscv64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/c85be117a7a870f2b0a046f0d61f16af0d68b496 |     
   x86_64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/1c39efe8c2e41f182c107830c1027051983871f7 |     
 powerpc64   |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/9cb1ddf8388cc57e1c2d2649f9d9147e668a13f3 |     
    m68k     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/10d329b864c04bbc2cbe2649b9fddc7b9a6b4d88 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/aaded8b5da5d5feb5f5b79f747f2a9d0fd075fcd |     
   sparc     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/57530113de466e6adc4f95344d06c5e3dd188870 |     
   nios2     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/233cb3f39cf677810e9424b557e75a2d32e3c19d |     
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/153653a00db502de828e97e609b2976fdae1ec8a | ORPH
   sparc     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/564559bd7b0793df1cf8bd45ef2dfaf34ac2ed1e | ORPH
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/6be778f97e53ff3d60d75e6c4579f5658ac99371 | ORPH
   x86_64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/282d824fb6f7929f55821c202a18264cd27b51c7 | ORPH
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/a951ab39ddee2db925b606a580920e7708c96e3d | ORPH
  riscv64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/6665b5b41aa2e694ae4677fd49087d390350643f | ORPH
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/8afb743cc5bdf9d277558379a70665691540071a | ORPH
   sparc     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/f70538dbed9c84ccf7fdbeb0f9e956fd57111a78 | ORPH
  mips64el   |          bind-9.11.13          | NOK | http://autobuild.buildroot.net/results/f503dd3c4cd1faf342aa5cf4dd7b21660fddd85f | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/a0d8ac0b5bf543d4287d258d4ace45c09f38ae72 |     
   nios2     |           git-2.24.0           | NOK | http://autobuild.buildroot.net/results/3c4a477b14bd77654e402aa7ba339cd280b0358a |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/52e4da747df6aaab4178dccc4aca023e5cefbac5 |     
 aarch64_be  | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/d55b10a56583fc3436b0413b597d4d613226a01c |     
   xtensa    | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/ac64befc93159f908d2fc5d9260600e0992cc344 |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/6669063c92581d66b7286bd65fffe0318dcc49cf |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/f7ba90a01245d5a3044ba55a450cf05637620e30 |     
microblazeel |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/ed9a65511df2a510bbe66e31b96fbabda6cd5c7a |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/063c663e3fb1cec57431ed53c7d1ab98eef9d439 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/8c364e87197fbff5fcdf4fc9a49cbabc9caefa19 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/eeea6ff47cf98d7aa6ce0d94a84ea5e4835a208e |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5f76b53ee62834417e9ad16783f4c5319c30ae04 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5bad82047042327e5890b301f9fb7f40d6b10ef7 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/db150055fd5133f4c93331b8a91555afd5dc7f5c |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/bb8426b5e85cf2ffa4ccccfee56c17dbb6893669 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/f472e5ea4591cdfe9ad584fd0fffab1011f2ae7c |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/30b3e9e5cac49eab27925b47916bc8f6bb1b2643 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/126b88321aba1ebc4d331b1e6bab50baee1c279d |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7abdfaf2ec040e875f9aa64fe33b86b76e1eb144 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/f4365fdca57ee37eb8c49c09c54162f02a1e3735 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/4319f9d3c09f17f0b8fb6f83ad010cb234ff586d |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/077a62c26913592fdd834487eb003fc98fa8638d |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/46f5562852f05f8b3abc1ff9830ef89305028753 |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/f6d14fa0827d5eba9e020f238399396a121a45d6 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/0a2ffbafe47bcd5d6ad03f5340c5eb897c5d93a4 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/198aa1438baab006d5f3de6b06654b94ef768627 |     
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/1e22eb56e190312f8a83819cbf0fc1c750f41de0 |     
    sh4      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/7b7ed1e1db249158ae8affa522158e70441de6e0 |     
   nios2     | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/f6ce8184558fb427970d8b4642769b990fffffc6 |     
   nios2     | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/82e55b4a537ca56c8d5ed3f11b6de24e358bf4e3 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/390c0b67fd1c3789c0ef484116836bf93e6f7422 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/1d168e18e9a96c86f098160340b4357995904e6f |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/422ecccbd11bb2ec75cd9d034087e3e78dc1d77a |     
microblazeel |      python-pynacl-1.3.0       | NOK | http://autobuild.buildroot.net/results/3ea5af92b3adfbbaec659a9d25788be20ab56956 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/4077d9e7bcf635b4d20145db038d45dd342cd7cc |     
    arm      |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/73545c64c22cf5d1edb7f4c66c836bead51362c1 |     
   x86_64    |        qt5script-5.12.5        | NOK | http://autobuild.buildroot.net/results/623a540b99e51bd2f1caa68e4b542e57c683476d |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/748e0149a7c19539a4abccd6aa09d107f9f27f43 |     
  aarch64    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/821bce33459a6a20e2f4ac2a95951747b89c09ba |     
  mips64el   |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/aafe50a563f1a5911cdab6c4b296237ee04b92fd |     
   x86_64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/070ecb895de971e18f5fe09b4dc318950121760c |     
    or1k     |           squid-4.8            | NOK | http://autobuild.buildroot.net/results/a1d1c993ab80ece68f81866f90c014c0e785318e | ORPH
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/72e96b100f6dad0d7aaa6d4fd597ad0253659281 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/4920cfb92c14dea5683e50125305e50eea7dc86d | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/4103e1982026d54b0b6ed97f570f78a1b910aaa2 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f1f6621956ff609cbf631a66d76d476b71c5491c | ORPH
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/913b62f4385667778aa5d114eddb17b80147a4ac |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/26738f832f69747fa18aea11e5335053972152f6 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/f49004b7548273b910311610b538a5334be7870f |     
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/4cce5782fa0b78c131bc817f2d291a2b19104fa2 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/d36c554affa111000e31657658412ddbfce3c2a9 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/eddcb433c4f2ea5860c64a009007c93a0239b682 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/d986c76032a834fb0788a345999f9063a2458480 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/5f7be8127e25dcd2dfd01b282c6e463fd2b31221 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/499a38e60c4a94a293011dbf872e86d3e333b600 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
   atmel_sama5d27_som1_ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286025  |      
       atmel_sama5d2_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286027  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286028  |      
           atmel_sama5d3_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286029  |      
       atmel_sama5d3_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286030  |      
       atmel_sama5d3_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286032  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286034  |      
                 atmel_sama5d3xek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286035  |      
           atmel_sama5d4_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286037  |      
       atmel_sama5d4_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286038  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286042  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286045  |      
                        bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286056  |      
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286061  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286062  |      
                         lego_ev3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286139  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286141  |      
               linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286142  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286143  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286194  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286195  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286202  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286222  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286253  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286348  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286388  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/371286430  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   dvblast-3.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/51db305f8ae337a43f75d356aaa44fa55074cbe0 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                  flashrom-1.1 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
                 libdrm-2.4.99 | 1 
                      wine-4.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/47a9ccb5f8b0896c3656134022a74bfc2f968fbd |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/b00a5bee0c0ebb2b5668be5df9a0d3baa0a51cdb |     
    or1k     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e54712912cc0c3ab5f3f5ae93af82addcaf45f3b |     
    i586     |            wine-4.0            | NOK | http://autobuild.buildroot.net/results/220646e58ed1a0bf2a345e071b68399acbee102c |     



-- 
http://autobuild.buildroot.net
