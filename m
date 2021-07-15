From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 05:48:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-14
Message-ID: <20210715054822.74A0D83BF8@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Autobuild statistics for 2021-07-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 13  |  7  |  0  | 20  |
  2021.05.x  | 14  |  5  |  0  | 19  |
    master   | 47  | 50  |  1  | 98  |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 8 
         host-gcc-final-10.3.0 | 4 
                    qemu-6.0.0 | 4 
                   seatd-0.5.0 | 4 
             libsndfile-1.0.31 | 3 
                libsoup-2.72.0 | 3 
                qt5base-5.15.2 | 3 
         host-gcc-final-11.1.0 | 2 
                   libqb-2.0.2 | 2 
              tpm2-tools-4.3.2 | 2 
                   gconf-3.2.6 | 1 
                    gcr-3.34.0 | 1 
  gobject-introspection-1.68.0 | 1 
           host-mono-6.12.0.90 | 1 
                host-odb-2.4.0 | 1 
        host-sentry-cli-1.57.0 | 1 
              keepalived-2.1.4 | 1 
                  kexec-2.0.22 | 1 
               libtheora-1.1.1 | 1 
            luaossl-20200709-0 | 1 
                 mesa3d-21.1.1 | 1 
                 openmpi-4.0.0 | 1 
                  polkit-0.116 | 1 
                          qpdf | 1 
              syslog-ng-3.32.1 | 1 
                usbguard-1.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4660880a927083a5a24b6c2f7c646f5b7442fbce |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/afcacae99ebfc4b5da376920b58c8001d00237b0 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/adeb9764d2dabfadedc550efccbb719cb221fa04 |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/067a524b021f12c9bb4d1d6e90169a360acf426f |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e154007935b2082e774eb04e2fea9cff66db1c8f |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/bd1c8d5358f59886de424a8d47b8a0f53334bc5e |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/57b03937152db028d2932f14f0343fed40daec64 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/23bdc3e9ce7041da7ed9a156befd21d60f4d493b |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/cc28901c5bfb8ba088b91288bb88e1ae456e4a4f |     
    mips     |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/20a7fd76d57c9bc0914d47c824d0a3af0e3b12c6 | ORPH
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/27781ac32fcab85b27fc6d8941e822dffd7d7f4f | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cf2a83467bdcc21a984ef0a9bd44750f66d936e2 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0e129d7f7cdabdb70458ef4b730c06cde4ce3191 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b0a9c4e59bd91eadff634b24fbc15e4ddcfaef5d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1d63db5553f19dfee35362340bded4090a04aa41 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/71c3bfafede43267b59de5f79239783d82869ef3 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/82a3d2f13746cf8355d4e972c8ebe9f8b15c971a |     
    arm      |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/0362b5b99a64e5f3851aa65d0bd23b3e68ea65bb |     
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/53e56f66c4972c34c335f7cd6d40d086df19aa12 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e413f800bc1f20ffd568b1711de9f8e3e07e21c2 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/ff28c70b9364f144196c451754f4c154ec969f34 |     
  powerpc    |          kexec-2.0.22          | NOK | http://autobuild.buildroot.net/results/34df5ecbb8207c9072ea3421a7ced52c8fbeeb1c | ORPH
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/9fe157d04e44dbd4bb6aa57409609a6a446695c1 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/774590b86dad76d217e1eaee151a913aed885b54 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/61aee24349aa18bffa5827e9f49ad2a0dc81f1b8 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/9081e020513f9fa75d04e03b32b633a7ab5de6d2 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/7d9daaa023f680b9336033dfebf99f5e2b5ad339 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/09dce1d0643776c3a013c8f36017bcb1b30ad3b5 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/e149b7ab40beb6e5f2d441d765f9dc77f90edf1e |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/e3dba7c36e06d08a6bb054c529b9f044d3099bd8 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/c8e327429318d910e0be653f1244d59105bccf42 | ORPH
  powerpc    |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/89df9b71c6a57854c4b2ba09b338b45a15732e68 |     
    arm      |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/a56634b25bb31b3bc65863e6f036ff89f57af684 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/b86727f54c2a022d4d18bcbb0af7c2c9b9c00006 | ORPH
  aarch64    |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/0966e21ac36938e2212252b1cba4779ecc8b5fbc |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/ad33b29dc85040f4ab9559daa8af0776e7329b69 |     
  aarch64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/74f1eabb58235312f722d892f07d7cf26603dd61 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/ca054a83c72a3f711870a0ae8eedbda0f6727ceb |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/dcf7eb100b8cf2790f44215cb92a9d70929e77fb |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/0a215f840f59a3c52305ce3132b15ca1080481dc |     
   nios2     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/041b30741d0a75c581c26ebeea8eab20bd662e37 |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/54f4633a86fb0555906c39f50927328f025bdbf4 |     
  aarch64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/cf4260af09e342b472f1fd33dd510c71016b5e58 |     
  mips64el   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/767d9fdf6f2120249fbb26e2433720f151054aaa |     
  powerpc    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/ec0a4df1eec7c494c6d58eb0087c7e86602e86bc |     
    arc      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/ec2a2f23ed59b3efae4999a92c9ed0ce89b93d3a |     
  powerpc    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/6fc16729d8dd183ddae1a8c00dc3deca34bc39cc |     
  riscv64    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/749a5c314272aef996bd474f901faeb573d2a504 |     
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/36191ef9c6b824926215b03d6b10f8de8267da5f | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/4ae1f8d15beaa2c2514d0829961084d7c1bbeb96 | ORPH
    arm      |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/a2713089d951a01d7f9416f7b5fed1496aa45e7c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 2 
               domoticz-2020.1 | 1 
                  exiv2-0.27.4 | 1 
        host-sentry-cli-1.57.0 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/3f398fc07857c8dcb9fa1f99bbe7335dacc7c546 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7d463e29bad658ffb732c999ecfd27c934632ee3 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5b9297e8386112133378b472dff00d50de6b4972 |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6ad2db67fc30df239295e447e8cb5cfb915f5d47 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/087a3b723fd65a37127c466113e8e31984704057 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/272d63a6f0ea695a8147d49d1995c3373e0572a4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/64a9d6331d39fe44453220b7c41c52e027bfae4f |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                host-odb-2.4.0 | 2 
            erlang-jiffy-1.0.6 | 1 
           python-pybind-2.6.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/58c986f9e9a567489330da459a36a2b6ce473f00 |     
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1685693d38ddfbe16cf0f8cba7a65804ee14c8fa | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a5bec908b05316e95511204199884227e5394ae6 | ORPH
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/5fba7884d4d64ecb412fa51a45e2c4432d11115c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8ea9c6bb4130d6190f760a4abb0a50773f02742c |     



-- 
http://autobuild.buildroot.net
