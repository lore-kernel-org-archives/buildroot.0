From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 08:30:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-17
Message-ID: <20161118073030.5147F20C28@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-17
================================

      successes : 148
       failures : 27 
       timeouts : 0  
          TOTAL : 175

Classification of failures by reason
====================================

                 mplayer-1.3.0 | 3 
                    mpv-0.20.0 | 3 
                 opencv-2.4.13 | 2 
                 openssh-7.3p1 | 2 
                collectd-5.5.2 | 1 
                  gauche-0.9.4 | 1 
                ipmiutil-2.9.9 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                libcurl-7.51.0 | 1 
               libdvbcsa-1.1.0 | 1 
                  libsvg-0.1.4 | 1 
                 mesa3d-13.0.0 | 1 
              mosquitto-1.4.10 | 1 
                    mpfr-3.1.5 | 1 
net-tools-3f170bff115303e92... | 1 
                 qt5base-5.6.2 | 1 
                  stunnel-5.36 | 1 
                   taskd-1.1.0 | 1 
               tcpreplay-4.1.1 | 1 
            xapp_sessreg-1.1.0 | 1 


Detail of failures
===================

      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/ef0e87b496d18cb5dd3011524237e4daabd062b2
 powerpc64le |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/ccb48eba54b9b02000f165ab5f146d111b30af30
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/ddf516f41f7fd3b3f0a383bbb014db89eba75e13
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/893fcc051f9f2277f292ffb9d02a92864e71842a
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/a788a63bf1baeab494d8f86d846e66efccd04e99
        m68k |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/6b8268ff1a15c04de70fddc4cbd3a1d94f0630f3
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/354b0bca3f9ca1093bc600359de612147afafcac
   powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/c7a4939eb4e003df82a35040f0d2327cd9f7758d
        i686 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/c0ca3778c390a33c27073553ca3bef7ac7c5784b
microblazeel |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/b81583dea1bdf3777b2f2736c84fef90aa10f30b
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/ef234c0c783bae4895833027a7d3070f3378bf4e
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/2b2831b3b755c2ce78730371d6fbae7318c75858
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3e6a7cbf050ac2a9d9e041655f1956bb70182944
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/dbfbb991ada2946e2bde01d993b6509e584bbb02
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/8b7929817f66cb7f815dd7dc4ae4c1e667a326bb
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/98107cd6e9fda1c490f448d81c5fb0776c0dd985
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0aeb31892b0f5bc4404f928f31d5c5d95e042fec
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/b0bb2bab5d8810b428f3ec655cc50fa73caf30e9
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/cf894b6e65972c90486c7e09b88433b49c5f236d
      x86_64 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/fae950f9d482814404993380df828a54cc72a13a
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/c5238d2015a72535e3e8f4c9843c0c5025d28510
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/c5fd950a353b25ee005d95e96bade27993f0b1fc
         sh4 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/2623d48194b778c92134f9bceea923749b26ac6b
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/dabe0888761afc1476b7d372f2a9c07ace4f8429
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/6a4e4951bc361744cb8ac0f2e77ad464e315713c
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/1d489703fe0104ae1e5d72d08244f75d5764d911
        i586 |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/c3fb899cfaaf217b7e5758631ad10f8b0f53fbb6

-- 
http://autobuild.buildroot.net
