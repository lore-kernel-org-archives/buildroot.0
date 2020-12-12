From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Dec 2020 08:15:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-11
Message-ID: <20201212081542.70DB4869DD@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  2  |  0  | 18  |
  2020.08.x  | 15  |  3  |  0  | 18  |
  2020.11.x  |  9  |  4  |  0  | 13  |
    master   | 57  | 61  |  0  | 118 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 26
        host-sentry-cli-1.57.0 | 6 
                   rhash-1.4.0 | 4 
                  boost-1.74.0 | 2 
                 qt5knx-5.15.2 | 2 
            quickjs-2020-11-08 | 2 
               belle-sip-4.3.1 | 1 
                clamav-0.103.0 | 1 
docker-proxy-55685ba49593e6... | 1 
               domoticz-2020.1 | 1 
                     fmt-7.1.3 | 1 
                    git-2.29.2 | 1 
                   mimic-1.1.0 | 1 
                opencv3-3.4.12 | 1 
package/nmap/nmap.mk:89: nm... | 1 
                    php-7.4.13 | 1 
                proftpd-1.3.6e | 1 
            qt5location-5.15.2 | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                       unknown | 1 
xdriver_xf86-video-openchro... | 1 
xdriver_xf86-video-savage-2... | 1 
                    xen-4.14.0 | 1 
         xkeyboard-config-2.31 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/cb224dd13b2f5971db7b2ee826211dce41b7a0a5 |     
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5a626b19b4d4ee9600beac4f9cc0a313bc58c5be | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5f3ecf58a5cb23034dd4e8e3bad741a177ade608 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d78f63dba39c5170dac03a8cb005c33cc25a0620 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f76b0739486d119b50392cb52b1d91392cac9dc5 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e56f0642584917e29a9dd3b1ca50e70d190025ff | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/17b7abb2b90ebc3829edf2e1b9bdc4778fe2a93c | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f68a6838c50ed423b82f2be1ace4b3f1e89894a1 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/fe6d56dbbf9d1f3f6bafa1932b499db5bb74549d | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0c3417f15eb2192081b6808753185f19fe059e02 | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7ad54eba09a804de42bddc0a8067519fd4eff898 | ORPH
 aarch64_be  |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/849da7e2e50cccf8f3e385293a0b2027530e1c17 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/67eda2651af59578ea25354599e6be240939a4fe | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ec4734723175aec551f71948b4f486352accffa1 | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7eaf5bfd1060943ef82567e2f217cb30486737eb | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9479d60c16ea1d6fdfbc910ca09aace462030ced | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f6736d89a8e029c308244ab5f5bf3d3f79938d84 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/11673970c5703fb5f851378ff52769a427f9bf11 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8ee823eeaf751ef72d3819a71d447f9cb843834a | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d738e7b45e9dc8d3b3a41beeca9a67fd04fb77f1 | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/429920426da008c32a27d1e3d0ce1073d874ea1d | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/53ecaa79a050aa8f0136f6ab40e49d51ce8abdec | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/bcb85d39419867e50c9588d1a10728377eb33f8d | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8ade1f556d3b2c5be835381e173516c867144c79 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d468e7f89c5ecc74c0755dce1acbd8b2746b3aaf | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2a92f9da4af1045fd34edd3863d665ef80347ad9 | ORPH
 powerpc64   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e71e1e8b08edea465fce39ce20a1963ef945acd6 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c2a4799050022cf408ce6fab3da5dfb5f9beb689 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/23a70ebcc151973eb724991cc1a36dfaddb06c93 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/7ba8e87b44259f38d15908c2f36eb00fc5bcdac3 |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/09238898dadf062f041b15e1e90440f5f237cd48 |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/f90791298be540bd4d8c37f60b168e8be3aaf887 |     
  powerpc    |           fmt-7.1.3            | NOK | http://autobuild.buildroot.net/results/5dcd5deca0bb6c88aab070a5ebb9f47247715169 |     
    arm      |           git-2.29.2           | NOK | http://autobuild.buildroot.net/results/30c5bfef4bf642e94b0e8cfa03dc0999f8670aa5 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/baa88201b64b7fa9c6ccf13b13c8e6179d1d507d |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/15dabef88ef546357fd5778e9197446e2ccab829 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/db3981cf48c17d06c9f7b21a52e5ed1654907883 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/59ae75dee05d7911c6b4edda447fc63994f38465 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/812d75b89665b8310c9c003daeafc5bb0f299b70 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ebe9018797480cec124301f081bb9b4592694b39 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/657ebe6fe14b9edfc2433a3bf60c51deacfe91c2 |     
  mips64el   |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/2c44d996b7b81fdb53bfc1716ba51f710b959444 |     
    arc      | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/916de0c4f1e7c956b2431275f29c34edc5b480ed |     
  mips64el   |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/5dd140f69ab4907d2080205a1aa86801c3992a16 | ORPH
    arm      |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/b9d779752d199ba08522b685f05d2de4c3820944 |     
  mips64el   |         qt5knx-5.15.2          | NOK | http://autobuild.buildroot.net/results/e577cb1c56872f9b3f8c8dc9c3f9d3b4a961fa71 |     
  aarch64    |         qt5knx-5.15.2          | NOK | http://autobuild.buildroot.net/results/48172e7eff9d6d80c4c78cc6f31dad8986b6f24f |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/43f31b6c1353594d5f3be372a620d94f2b414a27 |     
   mipsel    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/7429d563520203e90fb40318d36c6c758b4abf68 |     
  mips64el   |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/8a1b33a1643468cb0b2bee3c5320b3d7f6e6c221 |     
  aarch64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/3958ae36b244294d83727edd6ab2d765526ce908 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/40d534dfd162e817faabd08912a294ac34defee0 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/e00fe003ad2efdb85557fc72a784dbdec3448b1e | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/4159cb0b21a53d4fa07a7794cdd78c7c84ee8246 | ORPH
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/8d0bff542d473d2b85088f777f035dfc417716b6 |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/d3488d66a4c02023cc98d7c0f81bb8ecf671d7ce |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cccaf5113d460a4d04994c76dfdc7ce6eff0c839 |     
  aarch64    | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/335419adf1eb994d76533802453853082e635397 |     
  riscv64    | xdriver_xf86-video-savage-2... | NOK | http://autobuild.buildroot.net/results/6686959a60d2634c630fe1ec483f77734aba5521 |     
    arm      |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/e9e9f8ba981d1f73b189a59d7bf6b17d7f5d7ee9 |     
    arm      |     xkeyboard-config-2.31      | NOK | http://autobuild.buildroot.net/results/be2da954ce74e92f5ceb0df2041703c91569645a |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                   mpd-0.21.19 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/f300fd8ddb27279777476510f5aad4df5bbd9ddf |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b7ea7e2d649246cc55031dd16246e72d3b31fd26 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                     efivar-37 | 1 
               protobuf-3.12.4 | 1 
              spandsp-20180108 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/85ce84784959c2dabff9b5ffd196f973ef2d4ed7 |     
    or1k     |        protobuf-3.12.4         | NOK | http://autobuild.buildroot.net/results/a1352d31f42373cd039095bcade035091f3f443c |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/c39781f508cfb27041149b712514753d43235e42 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                clamav-0.103.0 | 1 
  gobject-introspection-1.64.1 | 1 
              micropython-1.13 | 1 
                openblas-0.3.9 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/a8b4dcd35c785fd507f9ea129c7a683d2737b2de |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a293235499c343cafa7421f6c3ef155b4d45d640 | ORPH
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/b1b288aad889dceb0e2fc98f62832dc834d9a254 |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/57a065faa2e362ae04cc9dff71440f732c48716c | ORPH


Gitlab CI results for 2020-12-11
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   at91sam9g20dfc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921735  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921755  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921762  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921768  |      
                      bananapi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921771  |      
                 bananapi_m2_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921773  |      
                bananapi_m2_ultra |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921775  |      
                     bananapi_m64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921778  |      
              engicam_imx6ul_geam |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921803  |      
             engicam_imx6ul_isiot |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921804  |      
              freescale_imx8mmevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921815  |      
              freescale_imx8mqevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921819  |      
              freescale_imx8qmmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921820  |      
           friendlyarm_nanopi_a64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921828  |      
     friendlyarm_nanopi_neo_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921831  |      
                 grinn_chiliboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921835  |      
                         lego_ev3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921861  |      
                          mx25pdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921880  |      
                         mx53loco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921883  |      
                        odroidxu4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921913  |      
             olimex_a13_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921915  |      
             olimex_a33_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921919  |      
             olimex_a64_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901921920  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/901922021  |      



-- 
http://autobuild.buildroot.net
