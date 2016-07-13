From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jul 2016 08:30:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-12
Message-ID: <20160713063028.B34DF1023A4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-12
===============================

        success : 175
       failures : 67 
       timeouts : 0  
          TOTAL : 242

Classification of failures by reason
====================================

                  libsepol-2.5 | 5 
openblas-f04af36ad0e85b64f1... | 4 
               acpica-20160527 | 4 
             transmission-2.92 | 3 
             libgpg-error-1.23 | 3 
              e2fsprogs-1.43.1 | 3 
am33x-cm3-11107db2f1e9e58ee... | 2 
              lirc-tools-0.9.4 | 2 
            lttng-libust-2.7.1 | 2 
                   dante-1.4.1 | 2 
                  cairo-1.14.6 | 2 
               libcap-ng-0.7.7 | 2 
               netplug-1.2.9.2 | 2 
                  mono-4.4.1.0 | 1 
              alljoyn-16.04.00 | 1 
                  autofs-5.1.2 | 1 
           libmemcached-1.0.18 | 1 
                     eudev-3.2 | 1 
                    lftp-4.7.2 | 1 
                   fio-fio-2.7 | 1 
               openswan-2.6.46 | 1 
                  ffmpeg-2.8.7 | 1 
                acpitool-0.5.1 | 1 
                   fwup-v0.8.0 | 1 
                    mpv-0.18.0 | 1 
                   duma-2.5.15 | 1 
               qt5base-5.6.1-1 | 1 
                 mplayer-1.3.0 | 1 
              swupdate-2016.04 | 1 
                cifs-utils-6.5 | 1 
                 lvm2-2.02.159 | 1 
               libdvdnav-5.0.3 | 1 
                    libiio-0.7 | 1 
      kismet-Kismet-2014-02-R1 | 1 
            python-meld3-1.0.2 | 1 
                    cups-2.1.4 | 1 
                  snmppp-3.3.5 | 1 
             shellinabox-v2.19 | 1 
                blktrace-1.1.0 | 1 
               libglib2-2.48.1 | 1 
                flannel-v0.5.5 | 1 
                 php-zmq-1.1.3 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                alsa-lib-1.1.1 | 1 

Detail of failures
===================

    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/7732ed0127c4cdfc365f1873db13907b90ad09eb/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/e7b113b53f8296ea76d924def59683d4dc86f27b/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/6340c910a6c327cd5970aa848b6ddc43183fc157/
         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/8ed8c596e5e13760539bf6aa13c4199a11b2f6b9/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/7baa31a320ea9008516c8ea739528c887f0e74c3/
     sparc64 |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/82faad1f8dc46ad127f737dbaab044927b35adda/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/3c676e10a2f4d69e1d7bd7c6b8630ffa3a4e9355/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/bec012dbfe95e57765a3545aefc89151923b9f88/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/ab346c28d4ab2ba21c9ca5a65586d44d72058e36/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/222f7559a1b3629ac5faa617a4e567cf45d438e8/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d38f01845eb072c20551c8f1fba1fe15453f11ca/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/1ca306ae48e248d3584ddbd182fcefd74a6b817a/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/954dbda952bcb52eca5b9ca22ca08f8e800055a8/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/68b4735220e90fd73f0fa1a043edd77e9faea5b1/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/da95807b21f7ac90de443253f70b542c9823e3ca/
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/c79b971fd61be2ca5cf3cffb5eecb2fbc5e35590/
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/da3cf5e82cf15394a8bb82f5c59be0e4c7fde329/
         arm |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/c767cbf6330558f5f38dbbd9e631c62aa296114b/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/a88bc78df6e7a49702dc749bda47f508835230ba/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/69bc4cd981fa28aed8cc89f58a442ebe8364f453/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/1f0124bf2954b522bedf6ca4943a7039e679e0c9/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/60c02d50bb82f9a886d31a46d8df295c137da690/
      x86_64 |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/ec0b36a2a2a4b040c292c3111cb967a61796dca3/
         arm |                    fio-fio-2.7 | NOK | http://autobuild.buildroot.net/results/c44211f20d91b93ebb85cae8a98e2f2058e00f3e/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/04e6466c9df5aeb10c02778bd0aa30473df992fc/
      xtensa |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/8a5967c44902ce7ccec20a3aaf87f9d930798b5c/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/cab131e93483c781e95cdaa97e4ff49bbd9110e6/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/fc0bdf272213961328633aefd27428f8f0ed1b46/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/b257743a4f9b16f50c8dab29a9a12c537652c1e2/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/eb17f738aa290436505ba79ca2c229d8bf7b83c2/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/326b29cbca8b4ed29a1fccf70745960627fc3d4f/
microblazeel |                libglib2-2.48.1 | NOK | http://autobuild.buildroot.net/results/eabedc30ea75ba5b797a8bdc8ff1330fdc9408d6/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/5e3b9c43179db604d0cf935c1de906a9f49babc9/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/d76a4d7cca5c22957f70f5c30d5e2f36303c2e88/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/124ccf41259ca1cb43c46ed5cd943e3dbef7361e/
      x86_64 |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/22e52452add7f02bff627f5b4aeb715c57a12dba/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/3139ba3c6df7e240ea56d515b157bbffb5b9cf8f/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/6165edab41ed98481f3b071cd9e9c95bbefac726/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/8b41d5a54b60ba86a5fbdf14d08473dcbb754c4f/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/9ac1791f8e27f8886c24257cf508a8694a476d23/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/baf108b82076892225fe85c61485170a9427c37f/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/7ec3a92ed63c3f906217131f1302ef48961d9d55/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/c3f4f54deb561b9bbd1ce5736c7231bd7c95a232/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/37ea7bdc8b1a115c227cd3b7bf2fa942f0096e4a/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/862485c47647cdd4a61d52e8f466ee81b9bcef13/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/28c4bc6bfe010bf98ade474595fe64c202086d70/
        i586 |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/3d8fae56d27c2718a2e0c179643e2304243183ed/
        i586 |                   mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/bd8d001dd318c8f25c70ec351811089fa49fbfd3/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/270dae01a83655a8fde58009874f6a450575ee68/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/717e1fb647bf555d79a029d3cf33b2de80b2688a/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/ea40221684004db2c21433d69f36c6f7f805b76d/
        i586 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/ddf17dd4cafda38a95437a5bd85de4542c5a9fe7/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/b8636a69a44fdfd6fa4848287e7eb336c066cc07/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/58dcd729e8d25afe3805eb8e09cd8dbb88eac1e8/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/8202a977158826df8867baf53ef1db7633938218/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2c4b1404e98e39551600919e4ff9b29508930637/
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/6a5a62c6383959a71b3baf7b1284e53e1d325045/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/fd9f4732a32fd782ffefa69b33fb0d5d45123ee4/
    mips64el |             python-meld3-1.0.2 | NOK | http://autobuild.buildroot.net/results/dfd37426ac5bbfdaa13c1b250b6e283e58bc843c/
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/b02201fca6db9b230f2f43fd02a12c67c8ade0ea/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/c20f8958096558e4c58582daeb07c50c6ffcbc2c/
      xtensa |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/115d6371862521f46b95ea6283c91a46530fdf54/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/b9e212421247a88011692288dce1301330cc3e16/
         arm |               swupdate-2016.04 | NOK | http://autobuild.buildroot.net/results/d2e70565c2332ecbb593c437bc750ac9da6aec3b/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/4aa799bd5c4b89f4983ce514d0fe365b3116ad2d/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/32f4b64eada6232eda317126de971bf5bd401194/
      mipsel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/29cf31b2d99fb3cde146391984a27f8b15c7ea2d/


-- 
http://autobuild.buildroot.net
