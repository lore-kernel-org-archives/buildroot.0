From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2020 06:27:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-30
Message-ID: <20200531062754.4B21886341@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-30
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 11  |  6  |  0  | 17  |
    master   | 70  | 38  |  0  | 108 |
     next    |  8  |  7  |  0  | 15  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           libusb-compat-0.1.7 | 4 
                       unknown | 3 
          host-acpica-20191018 | 2 
                host-gdb-8.2.1 | 2 
              host-grpc-1.25.0 | 2 
              ibm-sw-tpm2-1563 | 2 
               libgtk2-2.24.32 | 2 
                   mp4v2-4.1.3 | 2 
                qt5base-5.14.2 | 2 
               wireshark-3.2.4 | 2 
                  zeromq-4.3.2 | 2 
               apcupsd-3.14.14 | 1 
                    brltty-6.1 | 1 
                   cvs-1.12.13 | 1 
           host-nodejs-12.16.1 | 1 
             host-pango-1.44.6 | 1 
             kismet-2016-07-R1 | 1 
                   libnss-3.52 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.19.1 | 1 
               qt5webkit-5.9.1 | 1 
                      tio-1.32 | 1 
                    vlc-3.0.10 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fb9cfa1306959732c3910a7e35608a2cf7f2f524 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/c014e11d6bad554d2c91b8c019009532e4ab3432 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/1a0e02f063b757fe4474f177cc89d2d655fff9a0 | ORPH
    arm      |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/a70688bf1d39359cc0803131490123a8e4c2d65d |     
    arm      |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/26b14d58feb9400f6c2a9e8e6ed8f004ac37bbc7 |     
  powerpc    |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/2c0416dadf530b377eb03d4c9a1bdf5fe63f8c93 | ORPH
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/93ed2c6202bab8af5a124791d568a43e80e6d0c0 | ORPH
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/60fb22a73915466c239c82381b16c73a7c67202d |     
    i586     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/07721bcbca189ecde74ae0173a077e8bf774a4ee |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/b3e12ff96d2ba56782278cf70da8fe2813488599 |     
    mips     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/f08d1fcf9a5e85d7209117ae5b6c3f5deec1375f | ORPH
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/dfd5b1472eed248e700725f77d7c2b166b291f59 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a3fe65f66568b78d3fc2ae889d72caefb58e86e7 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/dbaeb76226c90683c44cb06ae8be445e1f497f10 | ORPH
  riscv64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/f0ef5e821f6d48f7a2e5efda6543a04c05ec635e |     
  aarch64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/61b620bb3965f4dc312e184bff9c942dbb719cc8 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/3b32eb85b21b9e7d7aebd375e8cec92da4a63586 |     
    arc      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/3da2c80a57169fb3c6b2cba08ac9a23ece65e82c |     
   xtensa    |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/c2e08267571f1739ee0feb01a19b972063b3720f |     
   xtensa    |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/224242ba853c68bd2b9770a8ee8232bc9c4b9afe |     
    arc      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/12d771d85d30594929cfe3e1c783fc70857e7f5f |     
    arm      |          mp4v2-4.1.3           | NOK | http://autobuild.buildroot.net/results/3d3ac5aa427a51bbb7d69d4e14cb019d3fdbbec4 | ORPH
    arm      |          mp4v2-4.1.3           | NOK | http://autobuild.buildroot.net/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9 | ORPH
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ff0e35b25412e44c97a075b8683cbaabaa597220 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/286bcfcedc32d01d4edb370fae109ee8d8c9e079 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/17047b3b4dace1edf3b8214bf9f6ea1b39910e50 |     
    sh4      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ea68be63abf5ea1281887afa94c592a6ada153dd |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/a5ff1040d17d95a3a8aced41ee92ff3d76ccb0bf |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/bdfb869bfd3cc42ee0d060f5ee2d281d1260c385 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/bdd4ee6e5f0fd29349095dfb505634d4e63b23f2 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/f04e33ae47650abfa29da3baaa22b332a4f62a97 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/20dfc06bce657f13d29ec50e76fafee798035e4b |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/4c5704d8d8cf8574e42d9e6e1147e09d6c3e770f |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/6127ab1e4b4c8e66d81d25967629ce580b0e1de3 | ORPH
  powerpc    |        wireshark-3.2.4         | NOK | http://autobuild.buildroot.net/results/654244a06b273f2b9729eae15904b2bddf7889d3 | ORPH
  powerpc    |        wireshark-3.2.4         | NOK | http://autobuild.buildroot.net/results/4de5c627ec17552916a930dfc71c43015cde96ad | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/de0507ed52c0130de19e8d51850cd32574a0f3ee |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e91a36be06d0f727131c3443d99473174dcb9607 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-perl-5.30.1 | 2 
                 mesa3d-19.3.4 | 2 
          host-checkpolicy-2.9 | 1 
                host-dtc-1.5.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/5b36ad708a514ae09c23ff0327e99ed85d7555c0 |     
   nios2     |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/d4b8a59a37ec298b4afca2d1692123849bf70164 |     
  mips64el   |        host-perl-5.30.1        | NOK | http://autobuild.buildroot.net/results/7972472040b186f98da107ec8fc897825b48b91c |     
   x86_64    |        host-perl-5.30.1        | NOK | http://autobuild.buildroot.net/results/8791289a2375ea212a6b0cff22c6bc890eea3dfb |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/aa02fe43a5b211eb484c313ecf05b93b99cf112e |     
   mipsel    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/bd63e097d7d26a9c947dc40450e83b2d40caae95 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.13 | 1 
               host-efl-1.22.3 | 1 
                   mimic-1.1.0 | 1 
                openblas-0.3.9 | 1 
             paho-mqtt-c-1.3.2 | 1 
     python-argon2-cffi-19.2.0 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/eee8db273ee15c91173e5fa8631bf909d7f657ac |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/2dd511a11dc439f8c1dba3628366a43925b5ffac |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ceb3b7ab8b4e4f3f5bcad6746f58106676fe4427 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/cb5e9771b6285b86c0b86de31f933b64cb9c8833 | ORPH
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/28ab32705fe325a6714b8187ee83a8420ab24b05 |     
    sh4      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/750fbe432ba351930ef1d98f69590f6a422ba250 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/68d251025e7666cec7651a2731200e5c94acfda0 |     



-- 
http://autobuild.buildroot.net
