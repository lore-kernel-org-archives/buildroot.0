From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 07:55:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-12
Message-ID: <20200813075535.4E64286A3C@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 11  |  4  |  0  | 15  |
  2020.05.x  | 16  |  6  |  0  | 22  |
    master   | 90  | 55  |  1  | 146 |
     next    | 19  | 20  |  0  | 39  |

Classification of failures by reason for master
-----------------------------------------------

               libglib2-2.64.4 | 6 
              keepalived-2.1.4 | 5 
                     avahi-0.8 | 4 
                  boost-1.73.0 | 4 
dvb-apps-3d43b280298c39a67d... | 4 
                qt5base-5.15.0 | 4 
librtlsdr-d794155ba65796a76... | 3 
pistache-f2f5a50fbfb5b8ef6c... | 3 
               collectd-5.11.0 | 2 
               domoticz-2020.1 | 2 
    host-mender-artifact-3.4.0 | 2 
                  luajit-2.1.2 | 2 
                  apitrace-9.0 | 1 
                        bullet | 1 
          gstreamer1-mm-1.10.0 | 1 
               host-go-1.13.14 | 1 
              host-grpc-1.30.2 | 1 
             kismet-2016-07-R1 | 1 
            live555-2020.06.25 | 1 
              micropython-1.12 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
               protobuf-3.12.4 | 1 
       python-matplotlib-3.0.3 | 1 
              spandsp-20180108 | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/3d748e6b54c1ee081fe2f7c8d7af6c2be0d52ab8 |     
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/059c845fb0cf882bf99c9af00458f3210f0934c6 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7f7532d1b5b05434831ed4bd6fd77d48bbcd4b72 | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/439bee9fcd6bb6747d690a6e1f2bb975d695e289 | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c03fb8052e025fd3a2da08cd86e806848010544c | ORPH
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/07b60d132ec25736505b0cdef82fb8b2d9987074 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/56b24443d1c11507e011defa367776cbcab00ff5 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/0dd13908399f4c96a48d3134a81487e63f48de3f |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/66a9fd3cb0eff9f9adb8372e7ec8f56b9385cac7 |     
  riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/051e29aee85d745ed6f09ff44eba8e2f16adc350 |     
    i586     |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/6c1d45dffdf4bf3c6226748d19653a17bbe494bf |     
   x86_64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/10d1383f0edac29d2e87f8e45410655808025607 |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/c1537f7dec4d42ec67e2c9f7735ab9b1c3c389c9 |     
   x86_64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/048f338572289f684d6c3e4d1568ee927d6b083c |     
   mipsel    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/31d78435711d2a9df37802f0562ac8ba829683bb |     
    sh4      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/7bcc3e4d09a43bc3fd7b86eb22fd1e867b974aba |     
    m68k     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/f46b1af20748acef826e6d2ce55566342157c693 |     
  powerpc    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/8596658fbe811ded3b18f494935a9765ce2dc129 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6782e82077c650b8f8c74edf745f3ac98978316d |     
  mips64el   |        host-go-1.13.14         | NOK | http://autobuild.buildroot.net/results/624853733d569b20936f298a9e8ca68aa895fddf |     
  riscv64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/5aee11922fb34f3d4317d94af7f37e621699decd |     
   x86_64    |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/a4bc5959455c690d1491f09fde5a9cf841f0985f |     
    m68k     |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/ae8e1c3aefe5b8479e91cf698671b32f8af00a92 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/b7ae17d804cc20e4974976242cce34e4ee012e8e |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/66f796b8eb42e36143450553503deaf5c972afbf |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/c1e7cc1131ffeb0e0d33f00255253975ce834c2c |     
  sparc64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/62a2e6cab273910688436d95665f9e8fcb2d319a |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/89c2bb19bad20a94f33377210282d151449588dd |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/51f85990ad4e9abc5480110ef6c2d233ef00800a | ORPH
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/7e593b00893e5084899e54209aaaede5ecbacf41 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/2fc2f0a7b3140c60f446cd6bc227bc55b9212fe5 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/c447beb4fcac2efd78ba70d3212d4ca92bdb7c49 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/d3e9bab8aabf47f1446e8457406f08c2545c324a |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/9305061310f6cfdb2669679886728866e942f477 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/5e7f09fa3ac310b63826a30b09418388a3aa683a |     
   mipsel    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/becba782b0927b39fe0e85b14f080ca6f9eeded6 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/40604b31f26a97d4c73c81b540d4a1260da3a92a |     
  aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/8659b958c96dcc0d088a5a1ca6a3e0d4fc13e616 |     
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/d409f7e5054f36a52aada79d4a2d02fbfd90c854 | ORPH
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/d39879b6b55e96c466a6720b086a2c0c1b5e3f8d |     
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/8d7efce0c422ade5f95e6654729abede31baee16 |     
   xtensa    |        micropython-1.12        | NOK | http://autobuild.buildroot.net/results/e893c2b26ef7a0b7fa6364d92682884464d83998 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/83cc2ac22f5471115a38d99982ce1d5a37314d5a |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b023c048c556eeaeb5c9d0fea25bab657c3a194e | ORPH
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/966396313f51c168146ce2b3c11cad2e0390d972 | ORPH
  riscv32    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/c76a7ae53b274cea57b23200efcdacdd3c150d14 | ORPH
    arc      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/4ed7aa813c9e807a8bca44291bae33a5ee6a063e | ORPH
    or1k     |        protobuf-3.12.4         | NOK | http://autobuild.buildroot.net/results/c076a8e2f793d969337fc6ab24ef3d9d8fd3aa26 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/50e0cd713efb85163d18ba3042dcdb907bb17a6b |     
  sparc64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/1b4ba99ed6b811e118c9d70cfa4a740c2ddd1001 |     
   mipsel    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/c196d406ec4dd4003bf79b10ce5bf04e5dc28243 |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/16a78cdceee9a1805b6c1668aa73b6093d4d295d |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ee0769bbfa01a5da956a998ef5fcf3742d043c20 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/d89d77bcf91afb75e94eee0863c216e79d126307 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/91ecd4724012d18d09b772965dfafcbef0f99dce |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/2575f8e8c45502b18f84088385ca2af5c080d255 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

           host-nodejs-12.18.0 | 2 
dvb-apps-3d43b280298c39a67d... | 1 
               protobuf-3.11.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/88f968cf72108ca78a78d23efc2943fbb4cedec9 |     
    arm      |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/04a9ee3e980b2843396d9f169da20b9c4ade8dac |     
   x86_64    |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/1676fa480a7daa13b19bc44e08b4694e689c3b69 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/7498e41cab230d80793bc6b069d606208c976974 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                suricata-4.1.8 | 2 
                   cvs-1.12.13 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
          gstreamer1-mm-1.10.0 | 1 
                qt5base-5.14.2 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/43108bce38e6ab1789f9730e727ebb822c7d76fa | ORPH
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/ad9e56b08434a085725ee40f649701c8bbda42a4 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e63739a618c2e33b2837b3bff2a0f3faf333e593 |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/3f304019266991e8e6b4d23da0fe5c35cabbc3ea |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/b22296fa485000f4ccfc840d83be346387c8aaca |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/9a2e6a9ab25909ea7eda68aa36f055753d3d27df |     


Classification of failures by reason for next
---------------------------------------------

        libabseil-cpp-20200225 | 3 
librtlsdr-d794155ba65796a76... | 3 
                  boost-1.73.0 | 2 
          fuse-overlayfs-1.1.2 | 2 
               libglib2-2.64.4 | 2 
               domoticz-2020.1 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                   gdbm-1.18.1 | 1 
              ibm-sw-tpm2-1563 | 1 
             kismet-2016-07-R1 | 1 
                qt5base-5.15.0 | 1 
                rocksdb-6.10.1 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/1c987bfdf2d835f94877961590c954e07337ab79 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/c98e43f8d0402d55644a3a599c18d96bb74f21fe |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/01e4de272976ba71d83bae41bceba12ad12c73da |     
  aarch64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/af9e59c555dc5d9cf20b4ff45015fdf0e10f2505 |     
   mipsel    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/502c688ea946b67558fa751d260a79211ca24c01 |     
  powerpc    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/865e262a86d81457cb4927d3f7c02f09971f8ab4 |     
    arm      |          gdbm-1.18.1           | NOK | http://autobuild.buildroot.net/results/77c02901ff36bcf634d24136da97dd936e0e404b | ORPH
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d095f0f48098d2c315feee501a639639dca36f03 |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/e5d2cc1c48414ac958c1fa1123f663a99f96f18e | ORPH
  sparc64    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/ae3f08ee47a50ede44abead74206dcb645a072ba |     
    arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/862bbd41f0b5177ce1234a2124dfc40c026cca6a |     
microblazeel |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/93e752cc24e7681b09ecac78c6d5d85e477a09b7 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/af85a83782b97f7538e481ff33ae7482b120c300 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/ecf56d9328d96edd15fbbfa2e54fcde6817daffc |     
    m68k     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/732062281dd4b918aacc3d4eb7caa120ec1c1058 |     
  aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/20d06a9b0dc23b328bc649b813e3ac4c7c816648 |     
  mips64el   | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/35085d48dbeffbc2383a4525131cbae210bb1428 |     
   mipsel    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/df67720b6723712126eadbf03a7ff0eee9b06014 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/a664d7fff6c0cda449db56240537437ad45d841c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ddf294790bebd624b419d4e2cdd09aef6ffd9c08 |     


Gitlab CI results for 2020-08-12
================================


-- 
http://autobuild.buildroot.net
