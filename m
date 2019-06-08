From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 08 Jun 2019 06:00:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-07
Message-ID: <20190608060048.AEEA688184@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  15 |   0 |   0 |  15 |
   2019.05.x |  21 |   0 |   1 |  22 |
      master | 154 |  59 |   1 | 214 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                     host-llvm | 1 


Detail of failures
------------------

        i586 |                      host-llvm | TIM | http://autobuild.buildroot.net/results/0988a335154122d76ed705747ec2915fe955506f |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

    host-mender-artifact-3.0.0 | 25
                poppler-0.77.0 | 10
             iputils-s20190515 | 4 
                openzwave-v1.6 | 3 
                   gpsd-3.18.1 | 2 
             host-cargo-0.26.0 | 2 
                   libva-2.4.1 | 2 
            nanomsg-legal-info | 2 
package/nanomsg/nanomsg.mk:... | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
               host-efl-1.22.2 | 1 
                host-libsodium | 1 
              qt5enginio-1.6.3 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.3 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

      mipsel |                    gpsd-3.18.1 | NOK | http://autobuild.buildroot.net/results/c5eedbca4b5adbf40b8d8506d47300dd5282f5f6 | ORPH
    mips64el |                    gpsd-3.18.1 | NOK | http://autobuild.buildroot.net/results/ce977a234397ebb364bd84a5610c4c90d558c5b1 | ORPH
         arm |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/079e006a6c6147d789566ef83574f4519bdf9815 |     
        i686 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/cd749f292c2db9d0ca97d9323db11582d347f875 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/beacc8e4ad63314a933a4894b91981aefa339b31 |     
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/9ff9064cc457ab3373482503c03ac77489dedd75 |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/e0a13fb9ff8866c8a83d12cc47593963c550d264 |     
        i586 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/69e6d1e7640e5188fafab09dd75e693c6021dac7 |     
     sparc64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/e8b97e4f2d16ca2bdbb976fd6d9a93898d8daf26 |     
     aarch64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/d56d58f7f1491e669cc8f161c311a253b855d39c |     
       nios2 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/d9915521056b306aa53c174be2cbb0a710694155 |     
    mips64el |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/b610d735dbd2186592cf36f64e7d57dec80361f7 |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/f64f7450521bf40714c62aa5881b2b4fc647b21b |     
      xtensa |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/5702b376a77212950a16ae5afd4ef773b24670c6 |     
        i586 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/c2d1bb634177c4279a7479d73ed074b0dd530246 |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/fb11caecdc6230b3817349cb2e2e375326a0d892 |     
       nios2 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/d64fa05191c37b66250b4ec68ee41b49f41b0506 |     
     aarch64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/3e99cff6b5f1edc988f3d2736875aedc4103d62d |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/a763ba9d1746f0b0188ada787d38e629c8ddcf9c |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/c5456b2b4f0447fba9fed3bb73cde30308797737 |     
       sparc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ba74c0c02b37ede19137eb1487ebd535fc0376bc |     
   powerpc64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/a67c6aa8f68134e456c22da303f56c4408987096 |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/f50b6aac7b62b38e3bec5bfc2543e1fb103a585f |     
   powerpc64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/e1df9cab19f3cb39814fc13de14d31a33446104f |     
     aarch64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/2dcf6e6250df363de3e285ff74a944c5b689f9ce |     
        or1k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ce2d61015935754fcbcdaf5156e5d3c00ec55516 |     
       nios2 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/d583fb64f30aa0c7d6d6af85479a3a3fc4e1a17c |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/c335e10eb3dee945c4807b853790b6d00752fcfe |     
        m68k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/54e6962804c42e03d6794356905f328f992bfe15 |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/2bc3499ac20ec2732892476213ca8cb7f9d576fd |     
      mipsel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/f3c42af8497a8a38b645f0f762262c5efd2ff46b |     
         arc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/eddcf7832ed7a99c8e63f8ea666e96e4b1468838 |     
     powerpc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/99409bcd3f1576e89082ebeae6d4325b186aea5b |     
         arc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/90bdfd8b37db23481e6573a651c6e83e25fb9fdc |     
     powerpc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/997770caca060cdb36cb7106bd164568184dd8ec |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/da61f458d405082720b6a270f5cbff09fcbb031d |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/41e6077941cd44e5f0c7f691f718d92377cf17a9 |     
     aarch64 |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/80f058e81bebf7d744cb4284331793e3a5f15063 |     
         arm |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/05dff6b58c98831ad1eeb8dd40261d5ede5dd579 |     
        m68k |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/846fece7a82fa264008bc863ae09dacbbe85c440 |     
      mipsel |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/479e3438df31d8f02c93986d26ddae30045520cf |     
        m68k |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/d50a79384eb346078fd83ad3a1ba8b8a04cc4d53 |     
     riscv64 | package/nanomsg/nanomsg.mk:... | NOK | http://autobuild.buildroot.net/results/5c51b6cfc2c8ce66a906fa07616fda9c42937760 |     
         arm | package/nanomsg/nanomsg.mk:... | NOK | http://autobuild.buildroot.net/results/7b6208a38ec974c140d59c59c52dd70178f65b40 |     
     riscv64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/810c797f0321994a657058758fd7e7288f50733d |     
   powerpc64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/f499ef758425c8d72c3b13d53111a631e26a40af |     
    mips64el |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/18e2ad14ad4966315a1326b5d99eda52ef885e7b |     
      x86_64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/c5fdbdfdab76203421a6cc08045bc8be190d4175 |     
     aarch64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/1b3747bd6935692cfbf339b3cc6aa4bfaf685bbb |     
     powerpc |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/5fbd783c8ddd052614402b0783b132c69a61147f |     
         arm |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/33b6e7919bc2bbab510e97e13b6400f6ae17bed4 |     
       nios2 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/f837f1a4580a86fc9660c48b16b961ebfab4a6a7 |     
     riscv64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/0bb7f2573a591b299e5fac604beda94ea2728544 |     
         arc |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/7355bc71101223d1e58288ef12f79697be0828bb |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/0561fdbb3471759ab12f78c282ef0c9febee8009 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/619b783edecdf70d10980bf576fd015eedb2ecb6 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/69d7d137f72fb28006648f317d8df91839544c0a |     
     riscv32 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/77231055d8e89d1e144d9a7fc75fd8f205fce5ea |     
   powerpc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/e67bd9215e5e08b116b6f810fc909ff7af90f1a5 |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/a7db29b3241d4e81fbbf1baee16ee6434cc1e2e0 | ORPH


-- 
http://autobuild.buildroot.net
