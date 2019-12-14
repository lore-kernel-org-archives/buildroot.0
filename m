From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 07:17:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-13
Message-ID: <20191214071755.D644186B19@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  3  |  0  | 20  |
  2019.11.x  |  5  |  0  |  0  |  5  |
    master   | 117 | 84  |  0  | 201 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 14
                   libnss-3.48 | 7 
       alsamixergui-0.9.0rc2-1 | 6 
                  apitrace-9.0 | 4 
              alsa-utils-1.2.1 | 3 
                  gmpc-11.8.16 | 3 
   python-pylibftdi-legal-info | 3 
                   dante-1.4.1 | 2 
google-breakpad-7515ab13768... | 2 
              host-grpc-1.25.0 | 2 
         host-ti-cgt-pru-2.2.1 | 2 
                libgdiplus-5.6 | 2 
                ljsyscall-0.12 | 2 
                    mpv-0.29.1 | 2 
                 samba4-4.11.2 | 2 
                snort-2.9.14.1 | 2 
           uboot-tools-2019.10 | 2 
                apr-util-1.6.1 | 1 
               asterisk-16.6.2 | 1 
                bitcoin-0.16.3 | 1 
                  boost-1.71.0 | 1 
            host-mfgtools-0.02 | 1 
          imagemagick-7.0.8-59 | 1 
                 jack1-0.125.0 | 1 
                    luvi-2.9.3 | 1 
        matchbox-desktop-0.9.1 | 1 
                 mesa3d-19.2.7 | 1 
                moarvm-2019.11 | 1 
                  ndisc6-1.0.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
           oracle-mysql-5.1.73 | 1 
        python-alsaaudio-0.8.4 | 1 
           python-bcrypt-3.1.7 | 1 
     python-subprocess32-3.5.4 | 1 
                    quota-4.05 | 1 
                     squid-4.8 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 
 webrtc-audio-processing-0.3.1 | 1 
               wireshark-3.0.5 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/adb8768c10b99c6d198de4f26bdf4aada9144ecd |     
   xtensa    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/a8bf01af80ccc5f4bac6c07a95253c3ecb78107e |     
microblazeel |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/d4ed0f3cd60cf7d84f057c83b31579b43ee3f88d |     
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/3ed4c42a5590ff05a760186072671216f308c933 | ORPH
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/ebe782b46e375da0003afe39e6cdc269546ae168 | ORPH
   xtensa    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/4cb745d82afd289792cf123e6decf110cc2a2b80 | ORPH
   nios2     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/789fec7651a7fa039c0ddea4ff16a7fc6f3ef71e | ORPH
    i686     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/710d365ec9f70162bc4a1f1634627fe3d2e07c1d | ORPH
    or1k     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/34e34f88e5370a107596c3fa2d1f94faf16916c4 | ORPH
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/afef576b4c36c9a987e773d9044e79ee04ba0621 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/d4dae778811c5bf356997a0b2fb36195f6392d43 |     
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/11191c80ad81a6aa65304a03554f45092ee4b45b |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/c3da7956505db65440de2dd0937da28d8932faa2 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/f8e0866091898c4bbdfaf6840d09077e3a19c1b0 |     
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/cedb64f6d292513ecc686dc62e3b7b51b58ab151 |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/54a6d27b567013705ab122adb15defd2b538f6c8 |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/69d28b9a4214509c520dd49a3ab0ec4f43058ebb |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/1f0482a420835b7dd2046367a29921fe6bb73b2f |     
    i686     |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/14fd054e1fcecc0ef3bfc8a911ecf763c96aa361 |     
  riscv64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/4fb2a4cb652e810c727635639359b1ad594679c0 | ORPH
   nios2     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/bf88ccdb700d26494719e1b45a1f35b2ef11518f | ORPH
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/baf073709f82dfdd0b2f8de5933769ac5c358abc | ORPH
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/021aa8388ad367931f2f24d392d4a2bc2c91a300 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/8de24759bd0655144eb570128c5caa18d312ba16 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/de4dd210507075249ab870b6cbf425927ce7cfec |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7ddcb712995ab296b4c62f7a8c834a8af94b6309 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/0ba2b704c7f95e4f1b26170e19b564e0d23af485 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/63ea04111594eb9f19d3ca15bb09e8321102a345 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/0da4cdc2e59220cc047d8df1ca098655ad0fa07a |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/ca22af2d31a5670f46a94772e8a238d996fa03a0 | ORPH
   x86_64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/88320ea1e978c20cb94b4375f022db21a65aa8db |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/683947e00bbfb30343e18117a3a4547de6964ea2 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/4283f031c3cbc775add6d1f27a0f079b5f96c04b |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b9ccbe612bf9cfc0dc1724db23340e6db9f7968f |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/150e7fbadd80e4609c446b306a7cf00074303c70 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/bd6579b322db06889f41aa3745cc59d5d7347634 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/100c76f4c2b6ed568aa9d78d48c4fc0d499ce4ab |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0e6f3c773cb88972e832f982b7562be49bcf5d3b |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0d998fe8855612e3af760abf46a89061e79020ee |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/cc26d5f2db1e4fd6187aa6e20518ba1412ebc497 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/2c3e42299295831e0a32aad69a0501aa45c5a3c4 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e8aabcb5df04a623808067ff09925527e3d13188 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0d8551f68c6e016c98f05cdeda8be56aab98798e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/146fa9886146df1a7463271f08bcc7af9a1ee23b |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/78a63ef56c9be6448abf49d244cbbc792c6f5788 |     
    arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/e93731ec0f69e8afdd01e49a0c547a111054cc40 |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/55223b9eee8e73a597cfc822a6f5305261240b16 |     
  powerpc    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/c45d0a2c0f4f583a8be056965595829dea32053f |     
  mips64el   |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/49e3ce04131e5ea5561fb751383e770d42ef13fe |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/66358fb2ac587545fc0adead3457d52b4d4fdfb7 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/97a53fb6027d28402110249a93202221e604c9f2 |     
   mipsel    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/4e4514ccb249cc78c9a0d652231d56dfba5d3aa3 |     
    sh4      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/ce05b8a4366758b4060f8813d89b2cfe7a306daa |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/c2092e4f9d93318f05b5eaf400babf086c089e65 |     
  aarch64    |         ljsyscall-0.12         | NOK | http://autobuild.buildroot.net/results/2eb27d16b87c792a94805b5dabfc0a834fa958f2 |     
  aarch64    |         ljsyscall-0.12         | NOK | http://autobuild.buildroot.net/results/3f84c42ff3ff0148dce3032f7cc92e43c8d730b5 |     
  aarch64    |           luvi-2.9.3           | NOK | http://autobuild.buildroot.net/results/4da7353d21d5d7ea1c3f65c3fbf8b065c0af3875 |     
  riscv32    |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/5ad41c515e73e93ecc340455d304f560409a8805 |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/0576a093b1896f374880aaae6f31724e152389cc |     
    arm      |         moarvm-2019.11         | NOK | http://autobuild.buildroot.net/results/476a857f6dc69cd90f18833a201429ba5900f330 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/16dcde8fb71e908f21752b68fd16205bfb245882 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/dd5a75ed45d5ab44986fc45c5f3330b5df157d31 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5570726b55f826251cd797191a580598b448efa3 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/5f4c6c82126ce1a327d195e26c3af695205f4216 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/dabe5f6370297d7ddd875e410c8650e616531e8e | ORPH
    arc      |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/5f765624f48669c5bd0236f55ef4818d01c56847 |     
    i686     |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/3185f9f82415ef3e9b12f15ebbdb0d28a1b57fe7 |     
  riscv32    |  python-pylibftdi-legal-info   | NOK | http://autobuild.buildroot.net/results/f03045d69b7406103d0bb56283f31f607dac3012 |     
    arm      |  python-pylibftdi-legal-info   | NOK | http://autobuild.buildroot.net/results/0d89c79830c5b308bafb77829f17e32f2133ff42 |     
  riscv32    |  python-pylibftdi-legal-info   | NOK | http://autobuild.buildroot.net/results/0e924a7238cc34170bcf34f6e64c9267f1b78ed7 |     
   nios2     |   python-subprocess32-3.5.4    | NOK | http://autobuild.buildroot.net/results/4b55c12c482b3ea4ac94f7f941186b0a92c59812 |     
   xtensa    |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/b3a3988101213b046d724d613916e62c5474b1a6 |     
  mips64el   |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/070dcf62fa14a1fea92040c3001be10a84405635 |     
  aarch64    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/610725eccb368f32707fda73b4d7d191638a4b6d |     
   x86_64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/afaf1eae9590a4e155095c1de9b7b16576b71064 |     
   sparc     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/c6b26fcd5cb8f371c501a9a6c9c0b218c8d04d70 |     
    or1k     |           squid-4.8            | NOK | http://autobuild.buildroot.net/results/eba594bda5002b648c6dde9411eb021250007957 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/0dd40fe709e00f364f95888bc1d5e06499b041b9 | ORPH
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/2b890d402393896abd2e6ca577ce80a709fcf4e5 |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/d2f41b36b569c3cc14dbfa8100c406b4338cdfda |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/552069df2f8214600dd982787ba8e939c4f10c92 |     
  aarch64    | webrtc-audio-processing-0.3.1  | NOK | http://autobuild.buildroot.net/results/9cbdfb76ea38864fce1acca88714c48c41c77255 | ORPH
   mipsel    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/219b93f455dd06b61c5c55329625cb0b01ad261d | ORPH
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/de925857604f6f1bd447d922b304c72ad2aadb0e |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
   atmel_sama5d27_som1_ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314226  |      
       atmel_sama5d2_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314227  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314228  |      
           atmel_sama5d3_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314229  |      
       atmel_sama5d3_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314230  |      
       atmel_sama5d3_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314231  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314232  |      
                 atmel_sama5d3xek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314233  |      
           atmel_sama5d4_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314234  |      
       atmel_sama5d4_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314235  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314236  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314237  |      
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314247  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314249  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314331  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314334  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314412  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314429  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314458  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314502  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314607  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314597  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314600  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314645  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314698  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314684  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
                    wine-3.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/e4b9f186678ff6bcf430e5fc7fa075f8c84ac448 |     
    mips     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/8210ebdd782dee1dd587842195adaf448f92e3b3 |     
    i586     |           wine-3.0.4           | NOK | http://autobuild.buildroot.net/results/97b920f3f40c1605e659ebe1ff1a19ad2195293a |     



-- 
http://autobuild.buildroot.net
