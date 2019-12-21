From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 07:16:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-20
Message-ID: <20191221071653.AAF1A20108@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 23  |  1  |  0  | 24  |
  2019.11.x  | 11  |  4  |  0  | 15  |
    master   | 108 | 66  |  1  | 175 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 10
                   libnss-3.48 | 7 
                       unknown | 5 
              host-grpc-1.25.0 | 4 
                tpm2-tss-2.3.2 | 4 
                  apitrace-9.0 | 3 
           uboot-tools-2019.10 | 3 
       alsamixergui-0.9.0rc2-1 | 2 
            host-mfgtools-0.02 | 2 
                oprofile-1.3.0 | 2 
               protobuf-3.10.1 | 2 
            python-cffi-1.13.1 | 2 
                 xvisor-0.2.11 | 2 
              alsa-utils-1.2.1 | 1 
                apr-util-1.6.1 | 1 
                bitcoin-0.16.3 | 1 
                  gmpc-11.8.16 | 1 
                libgdiplus-5.6 | 1 
               libupnpp-0.17.2 | 1 
           libwebsockets-3.2.0 | 1 
                 mesa3d-19.2.7 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
               mongodb-r4.0.12 | 1 
                  ndisc6-1.0.4 | 1 
           oracle-mysql-5.1.73 | 1 
        python-alsaaudio-0.8.4 | 1 
                snort-2.9.14.1 | 1 
              spandsp-20180108 | 1 
                   sudo-1.8.28 | 1 
                     syslog-ng | 1 
                    wampcc-1.6 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/9bce1912dfe6464ac7362ad3b66dab03495b0608 |     
 powerpc64   |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/0de732c2c7d617a5a642995517defeaf6cf3360d | ORPH
  riscv64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/7389082874e55fc97f8411142d4cef7f5ceb5a75 | ORPH
  riscv64    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/bc722dda792f456ee45f09379c3e45ded111f47d |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/53c679726fb282672222ef879e62b7997f365547 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/6e2a97c0b5bda3c486d5978a34486edc1058f0a8 |     
   nios2     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/f71bef98f602122dbd29cfa11ec6b8ce955918b7 |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/d3aa632ab952164fb12800cdddfafeeb46d08d62 |     
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/658fbf56b29e1a55656243910f21a3a648d69583 | ORPH
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1867984a5200607c38611c102677143a48a60b42 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e6f84b601b25144bc3958c06b04e0daa949af8ae |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1a70c23d6148420658bef3610cd7c3784299d25f |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9391c8719bc798d6ac0efd88f2edbdf74eaf4989 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/70f1f49613465bfcbf7e43a619f0740dbb2142e0 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/6f19f7cb783e255d76adeeadf773ef7b51e74e55 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/4d567e9c58519b93633a35bcd5e0fb77830170a0 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/4aec4e87284022bdf86757765917c97ea09846dc |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/779d0cf1710eb798fc4f2179de97852701480977 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e9225fa475d0496fb1f0cc82a7dc7396ca1f46c7 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b6c2238c49d73dba9effdc2e6a478ba3c2d13d5e |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d7bd603fdbc2886127e5fb33406c2274b751190c |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/62972e56afc6672048de6a9ab32e441277be2802 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/3c4b53766159ed2c7947a5fecd81587441c793b6 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b95906bbd4738375aabbbf90517e904c02a847ad |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/500cb8da830555bd20d78b9a0e2b12a45009274f |     
    sh4      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/236b7fdf6dc06b9d30da085c2aa4f355149a57b0 |     
   nios2     |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/30c7485af8c0fd712d4f7844efc858d83aee6024 |     
  riscv64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/8a29e70a8114c4c1e0de371f3c41d2579c721614 |     
   x86_64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/bbcf0e3ac039865a1f8cb3ad2212eebc77e7a8c6 |     
  mips64el   |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/e29efa7cb6662f7c9b9b618780468eadbbab7136 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/2b32064f52002849a118b42e715ca50806898604 |     
    or1k     |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/efbc2a748bf76f7b95747dd652ae6ceb15571c96 |     
  powerpc    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/529d33544841dbac54ecfa8a11cc9a5ed8679aba |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/314e42e1a6d5e5f13c4b1ddac9a12a15d5974021 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/3f95703ca9135d414a8bffac3f4f4764ad974c6a |     
    sh4      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/049c9a21b711d2194e1302c7848b53056ad17e98 |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/21eaae55cdc7b9310d9164a59fdd61d0a026d488 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/bad5d7b8653318abd5145656a2780cea84563505 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c0297c6c43b685ff78b7d433ca9335feafc61ec0 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/91029d1499d8170bc9564ab44fc3acea42f7c09e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/da67248c4c6be822ddb818e1be52e01dfb00e7c4 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/6ad83ebdf9cbfd91da515b04ba9b89a8b290d796 | ORPH
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/f3c960208935cdeaec5fae6918ff5acfd604d335 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/8fb36b06ccc01f840e6008b11af0394271e6ec2a |     
    arc      |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/2af9acc75f6dcbd921bc0cf9ea1e7cf7a2a93afc |     
   nios2     |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/2aa4c798d888fa28e1c28c4519815d774377ab6a |     
    arm      |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/f7235e0bb1780afd65c4b8f4678aec13ddb49aa4 |     
   xtensa    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/5e65686b11c30a65cc44f54274c656123cb8df4f |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/4aa505ebd69cde4511080e3fcbde421586fadb60 |     
    arc      |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/c6936206d22a301159c4210b5264b9cdbe3c6f0b | ORPH
   xtensa    |           syslog-ng            | TIM | http://autobuild.buildroot.net/results/3cc80e95f0736f61c0ece32a42836e288ee52d73 |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/d724c680969e13c714746515db52de96f9b0799d |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/15a2fa2188ac819fafb7f91407931d62d49aa8d4 |     
    arm      |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/cbf4f2dd6da8cd833a2f38542c29e5d62300a928 |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/914a59b79a49dfb7a6395d737f98457355e8ce9f |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/11eded8b7dc1f069eac29e185ed07799287325d6 |     
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/bbd14814fe9e4f9c8381a63147f6fcd020978851 |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/a65ba83c3b43273bd3e3913b42e82315f4ac35a5 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/a8d1362cc17e3ea6957a8208afbcacc6fc196e8f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/ccd78d15921df3682ef8699ee937e489aa2c2a2a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d1c5ad34ba928edfbb5901eb936c7e4457cc9083 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/55a69c6c58303272b0a196d47c373af37f5300f6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d4655db6f21d3e5ac63a5504b79e5b95bd1d96ec |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/e4e23660c2460147724b566e63dd96390022d370 |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/74a94ff6caf213b5f2a1b4aad537b7ffc7fc97ea |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/f73e6275bae66a96c2b9be98ce54df559292f422 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/f9806139ef8769e7504c0cfe6e7f7393eb4dc4f1 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
   atmel_sama5d27_som1_ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408006  |      
       atmel_sama5d2_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408007  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408008  |      
           atmel_sama5d3_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408009  |      
       atmel_sama5d3_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408010  |      
       atmel_sama5d3_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408011  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408012  |      
                 atmel_sama5d3xek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408013  |      
           atmel_sama5d4_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408014  |      
       atmel_sama5d4_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408015  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408016  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408017  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408026  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408047  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408077  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408130  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408148  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408176  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408287  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408268  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408274  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408336  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/385408397  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/ad17d46fd52c36434a82bd13cb4ffdf2442c3cbe |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  gmpc-11.8.16 | 1 
      gst1-plugins-base-1.16.1 | 1 
                libgdiplus-5.6 | 1 
                    vnstat-2.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/631997ae167bc5622800f1a7444e9c1e384b21a1 | ORPH
    arm      |    gst1-plugins-base-1.16.1    | NOK | http://autobuild.buildroot.net/results/0352391733af5afa5c13438b71860b776cd538f1 |     
   mipsel    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/db84c48d2a9ffb678135445498006d967e5d1c62 |     
   mipsel    |           vnstat-2.4           | NOK | http://autobuild.buildroot.net/results/b919150bf339928c65f77d159f3338981b402244 |     



-- 
http://autobuild.buildroot.net
