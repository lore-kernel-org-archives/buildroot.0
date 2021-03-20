From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 10:26:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-19
Message-ID: <20210320102623.6C5F6402E6@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  6  |  0  |  0  |  6  |
  2020.11.x  |  5  |  1  |  0  |  6  |
  2021.02.x  |  5  |  5  |  0  | 10  |
    master   | 61  | 27  |  0  | 88  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.183 | 7 
        host-sentry-cli-1.57.0 | 6 
            qpid-proton-0.33.0 | 2 
x264-35417dcd65a57321fbadf9... | 2 
                  zeromq-4.3.4 | 2 
               domoticz-2020.1 | 1 
  gobject-introspection-1.64.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libkcapi-1.1.5 | 1 
              netopeer2-1.1.53 | 1 
   openvmtools-10.3.5-10430147 | 1 
               qt5webkit-5.9.1 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/e5002af643855fd4172b6b9069bbfbdb4a1471d9 |     
   sparc     |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/0dd35e24a39ab7dc4e9284609eae41f026058148 | ORPH
  powerpc    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/393c2363ede879de069e324c168a8fc4205c5552 | ORPH
    arm      |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/e0afa26f4489ffcc94567e89893fe4c8e13ab0da | ORPH
    arc      |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/c06f97b3d2365e749f8859a7f054bd113674d996 | ORPH
microblazeel |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/2d7ab518fa961fda976be92edb0823ed402e6c00 | ORPH
  powerpc    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/76bf19b8ea5f6dd16b42cf3751f2ad232936b997 | ORPH
   xtensa    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/a2d12a92f39c69abe524fe866837af24ae27082c | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0b4f8bc7d59b05f56e3ea9f30d2703f10499ba6d | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/73415fb91be5c4ee028db6faac34ee5d37d6d433 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3735fff3c5f3326ec577bc6ce0d05614bca22220 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/849ca6d863bd9c7084c5e0248b0b26df5b43d684 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c553974a984906f96fba9762475c58c0a72d86db |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/09a996d09339bef369cdfc7b1836b1edc7cac243 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/afb5f9876f9210173cc19cb428a850704ef83c80 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/049cca730e1c417eb848c207bd83f09a3f726502 |     
  riscv32    |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/f7418ae3463c99d1e7d62b35a109b0fce502b48c | ORPH
    i586     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/8f731278ec3b1cad841a679c6c2c9a029fe16436 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3a4289acb66f98a349100e737cee05bad68e6915 |     
    i586     |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/f24390660a0eb9cabe6fedc4d5dcfad5e724c3fe |     
    arm      |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/3352b45583600e71b5c814bda8b959f172ec8d1a |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/f551aab977d70f288581070e8dc0ac8144b084d7 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/b530e7d89071501bbb7800f148674c99b6b91cde |     
  mips64el   | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/e5d80eb89bb9a8bbf69483f0e3a3070de7702836 |     
   s390x     | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/c2fcd4aa6660e3c2f9c6f85646ca7dfe0db56040 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b0acd8911606132a77d41edfcd95718937bd6943 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f3365a4edd75bbdb3decb20c0dd936a38da6eb84 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                rocksdb-6.10.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/461d8d5e5b049aea6c588b16992a50ea59426261 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  zeromq-4.3.4 | 2 
                    lftp-4.9.2 | 1 
                rocksdb-6.13.3 | 1 
                   tor-0.4.4.7 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |           lftp-4.9.2           | NOK | http://autobuild.buildroot.net/results/36e82eebefd7691064af3e7d9d3b00690e57037b |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d2e285ef1689259a8317e9030a78ccee0d62c509 |     
  riscv32    |          tor-0.4.4.7           | NOK | http://autobuild.buildroot.net/results/f66abaf1258a77c276ff08219b1479c3e1aa1ecf |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9757ed7422e3f09a50dcd92e19bf8fc0371b489c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cfd76704426e88499566f3e766895b81b8b9b600 |     


Gitlab CI results for 2021-03-19
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859101  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859103  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859105  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859108  |      
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859110  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859113  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859122  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859128  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859139  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859140  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859143  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859144  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859145  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859147  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859148  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859150  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859171  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859175  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859194  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859195  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859196  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859197  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859199  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859201  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859202  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859203  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859205  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859206  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859208  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859211  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859221  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859223  |      
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859227  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859228  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859229  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859232  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859251  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859252  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859253  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859260  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859279  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859287  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859293  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859297  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859298  |      
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859304  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859306  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859307  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859310  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859309  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859315  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859316  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859375  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859381  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859383  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859384  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859386  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859387  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859389  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859390  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859393  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859423  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859439  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859444  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859447  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1107859448  |      



-- 
http://autobuild.buildroot.net
