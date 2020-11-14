From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Nov 2020 08:13:07 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-13
Message-ID: <20201114081312.D890C204E2@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  0  |  0  |  8  |
  2020.08.x  |  5  |  3  |  0  |  8  |
    master   | 61  | 17  |  0  | 78  |
     next    |  9  |  8  |  0  | 17  |

Classification of failures by reason for master
-----------------------------------------------

                 dc3dd-7.2.641 | 2 
                rocksdb-6.10.1 | 2 
                  boost-1.74.0 | 1 
                   gvfs-1.44.1 | 1 
             ipsec-tools-0.8.2 | 1 
          libpam-tacplus-1.6.1 | 1 
                   mp4v2-4.1.3 | 1 
                    mpv-0.32.0 | 1 
                  ndisc6-1.0.4 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
                    ruby-2.7.2 | 1 
                samba4-4.11.15 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                    vlc-3.0.11 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/3e11edf1c8ec02ce3cf7d203d96ad64db2ed5245 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/efb6529c53ed59f1f796683d987a7dc5ae88a67b | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/fd63971b23c8fc03b2f32e53d87bba67d8ace10c | ORPH
  aarch64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/9bdc7ddb9b7de65bd39d78342febfc6ff8caa629 | ORPH
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/1fb964880ded28820c68f4ce25303acdc6525f2e | ORPH
    arm      |      libpam-tacplus-1.6.1      | NOK | http://autobuild.buildroot.net/results/5c17226f12eba104d907693ec37fc101cc6d447f | ORPH
    arc      |          mp4v2-4.1.3           | NOK | http://autobuild.buildroot.net/results/4655626f1827245648a566a7223f247a130714c5 | ORPH
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/81ed9c79b8edb7b5f1752da8b405db3d392c27a3 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/69868610344dee5bc364200d458e52516a421724 | ORPH
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/52eb2aa8d3d986d950c0004c4447508f5c2801f8 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/588e427cec02d69c9a0038d64bb7a22da046cff4 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/7f25b667019f888b774e3ba282666eea7f992aed |     
    arm      |           ruby-2.7.2           | NOK | http://autobuild.buildroot.net/results/8aeefe724b15da6a2b4396f156629fc23be06b65 |     
    arc      |         samba4-4.11.15         | NOK | http://autobuild.buildroot.net/results/8d0875f8ee3841377110e0c8f310908a596a7745 |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/0b77baac6143994897343ea9f11b89c6e4b55fea |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/852c1bcfba452f4dde24223d6f487e75aee31e58 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0a523bb962bd764d1f87f508e9946b1f66162eae |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

              gnuradio-3.8.1.0 | 1 
                rocksdb-6.10.1 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/43d756a991ace2fb192600408ab9e09560ae007c |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/3c010155b8220929b89a110fc354df22c5bd4553 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/b65255d59061a25e7143a0f545fc34e4ff43177a |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 3 
              bitcoin-0.19.0.1 | 1 
 Makefile:753: target-finalize | 1 
          modem-manager-1.14.6 | 1 
           python-pybind-2.6.0 | 1 
                   rhash-1.4.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d31913694e5f5e1ceefc89fa2cf4fb261396d2ff | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2ca9091156826e87aa8b1d9fa141b3c995e35571 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/99caaf3ed323794cdcdeb0cbef1c255a621fc297 | ORPH
    arm      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/ca647a8c9f3b7d878a3b9bc0a475b50c131229e4 |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/cd3484a876440ba6ef9765fa4cd0296e398aa4fd |     
    arc      |      modem-manager-1.14.6      | NOK | http://autobuild.buildroot.net/results/3d133f58100e37ed016a584e33c39a3d50f1cc20 |     
  powerpc    |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/39ac62a547aadd38740b1a9a607300bdf4ae9349 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/029b64e7a215aa03f4c0237a2a19084af8a4a538 | ORPH



-- 
http://autobuild.buildroot.net
