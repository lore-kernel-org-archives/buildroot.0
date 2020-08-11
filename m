From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 07:48:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-10
Message-ID: <20200811074826.011E984499@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 22  |  6  |  0  | 28  |
  2020.05.x  | 22  |  7  |  0  | 29  |
    master   | 130 | 134 |  0  | 264 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

librtlsdr-d794155ba65796a76... | 36
              keepalived-2.1.4 | 12
dump1090-bff92c4ad772a0a8d4... | 7 
    host-mender-artifact-3.4.0 | 6 
               domoticz-2020.1 | 5 
                     avahi-0.8 | 4 
dvb-apps-3d43b280298c39a67d... | 4 
                qt5base-5.15.0 | 4 
                  zeromq-4.3.2 | 4 
                  boost-1.73.0 | 3 
                  luajit-2.1.2 | 3 
                  assimp-5.0.1 | 2 
               collectd-5.11.0 | 2 
  gobject-introspection-1.64.1 | 2 
              ibm-sw-tpm2-1563 | 2 
               libglib2-2.64.4 | 2 
            live555-2020.06.25 | 2 
                  ndisc6-1.0.4 | 2 
pistache-f2f5a50fbfb5b8ef6c... | 2 
               pulseview-0.4.1 | 2 
                      tio-1.32 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
atest-895b0183a89c15f5e2305... | 1 
                bellagio-0.9.3 | 1 
             c-periphery-2.2.2 | 1 
                   cvs-1.12.13 | 1 
                  dnsmasq-2.81 | 1 
                    efl-1.24.3 | 1 
                     fping-4.2 | 1 
       gst1-plugins-bad-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
             kismet-2016-07-R1 | 1 
libcamera-96fab38e02792a109... | 1 
                 mesa3d-20.1.4 | 1 
              micropython-1.12 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
                 mongodb-4.2.8 | 1 
                     mtd-2.1.2 | 1 
open-lldp-b71bfb87fefb31c4b... | 1 
                 openal-1.19.1 | 1 
            qt5location-5.15.0 | 1 
                suricata-4.1.8 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/07d8486e0f8bd14f17909970d975695fbf1fb55b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4d8ac6691314e2190e68f65fce70bbc256938670 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/29724e32b7c925c91b66c3da034b8b0539ea71ab |     
    arm      | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/07bd614fe426daf76e3e989a468e614c2bda41f2 |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/35e2dd7e82a73600268d665cc33418ba6a556bab | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4bb10b77ba01a8f934d2e7ef1fdb516f53afc8b7 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e9e87e6f9c50fc019b0307618a75a5990b389ed6 | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f46ef6e1cd4049ecdf7b98b3d5324d92921deb99 | ORPH
    arm      |         bellagio-0.9.3         | NOK | http://autobuild.buildroot.net/results/0c02f845eabfbc276ee5989520a3c77fc47289ab | ORPH
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/cd96fff3afaeccfab4420d1f0ce8c01b1e0a494d |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/e9f1c48f3eee6d4214e27343b04bb1d0f94e29cc |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/d2b02af49536c1e427fff1dfbfd4e195cb2d5f00 |     
   x86_64    |       c-periphery-2.2.2        | NOK | http://autobuild.buildroot.net/results/5b7065f8abfd79a2d40eb98cdf360fa54fe949bf |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/69e731269b84534e3e49b2571a034946964c0648 |     
    i586     |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/deb10f7970f68d16c992b7e962b1944dab7f0cc8 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/c775ce36ae4e09f0accced22d13900c5f332b391 | ORPH
  riscv64    |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/614f1561c9a28308b43e489cca5733e30ecc804f |     
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/59d6590dd642bdd7fac44a6c07ec8314ab9fe60f |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/1e380029db7c1c3e493015a7b1b22a70476bd9a7 |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/3607112343af24df6ca7bafc660cb5c4927c9008 |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/86148aee0e318ee5ef403bf6d300e52e15ab1eff |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/91567754775c190ffb4864cb76ccc677b50bf603 |     
  sparc64    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/4080d7fbe677a8fd06e1bcc8aca41bae9ee13a87 |     
    arc      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/e8c65fc9e1723f56ea7b2020dc807e99e8c1a2ff |     
  powerpc    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/6708c778533a86138f77dd50e703852431c63430 |     
    arm      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/2d12f11a74c9718aa4b2192801c5efe8c35ca988 |     
    arm      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/82225dbcf01bb494775edfc3f841f9104691c3e5 |     
    arm      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/e1261ba32cbf99bdea592024f3f6f0c5fc3d07c3 |     
   xtensa    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/1590d7bd10059facc4fb29c2923b474fe9a1b89f |     
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/56d00b5d831b56711593139109e55aac74cf2246 |     
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/7865d749bcf8a750566482f494007bc8e0e036be |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/c951f4bd0339d86d1fb965e970a73b1598b13949 |     
    arc      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/f78f4a45eec720fe408310e54b3a76e5f9e745a8 |     
    i686     |           efl-1.24.3           | NOK | http://autobuild.buildroot.net/results/66528a9b1a83b0022a529ffb9aec9a98e1748772 |     
    arm      |           fping-4.2            | NOK | http://autobuild.buildroot.net/results/f5c8e546200594e2367444e93e31aa615bd73796 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/61d02d193ce3c012d02ffb0e8027b40aade8d582 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/840961074e02f1702931a0b7357d774ec1939727 |     
   sparc     |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/19605057c4956d97e9e65068680485db637282db |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/690090255453a1c05b5c3ef3ec1fb3c837db39fb |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/36a388c25271e19845e4d95eb7aa7787f7e3f708 |     
  aarch64    |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/e68b30e3962b99e80843c524c3302b872f0ce5be |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/183b01f66a290626f089db23ef3daf9711e335ee |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/cb1cd3e6d28515fdf9f0303e3123548a2ab64b27 |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/549c310ae0bc584f1d91e8450170f4a6cba2e641 |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/28e5ab8d80d1c1edb1095bd5076ffecb74afa937 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/de47681005ac520015dc533349978b3f279cf68a |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/6e55b67f4b100c803aa619a23cbd9663d35cde1a |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/da033df696534db4ae311e7944b0c164f5fcdad5 |     
  aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/984344c50dace796a2bf8e57b1ead78db128514b |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/9aa32b2a3638f020ddf2197bfae5225fa2de72cc |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/e931fc27c0da885fe9030ba5ec9efdc864bcf285 |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/54bd8baf7685adac42ffd5f21c5f771b542c976a |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/f34c040c84d3bd36f44a585c260e7933af9f9b28 |     
   nios2     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/bc4ac4e5380b547ab8082c1afcfab13ccd3be3b0 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/4756b7e83a2602b7b1268aa0f9805899bebc9f15 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/e1ca68439f5bc6e5a8443618cd7a89ec869c80f0 |     
    m68k     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/b64cc9ccdeb35b0d3f9eb6f118ce4fd320427dc2 |     
   nios2     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/837582578ef4000b940b47e32ed64a05fda97c4c |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/bad43e47f46018d045fc25e7fb63ce8081144d4d |     
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/7d4ff9e0bb1dd8b48527f3b2792c6de2e1b7e12b | ORPH
  mips64el   | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/cb607a77fb401434006196a93f16de8db226f2fe |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/953fd0bfca3c886c72da11c786db45256374da09 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/26aa2eae461f11553d33a23743842c2853f4220f |     
microblazeel | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/7c0b2d46ec574f8236de943b54f726c8de6f56dc |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/6b49a42ad1f6cdb41cfd5dc507c3e40549724d6e |     
   mipsel    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/5bb40910df2377771cdcde61d59a92c62593b11e |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/31a7edc1132660eaa2b8fd6e82d304bde084834b |     
 powerpc64   | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/ba1940910c107cce3b6deea7c12108f0d240c989 |     
 aarch64_be  | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/840f4bb330a4674e1e5e4faa34d7825fae207d68 |     
    arc      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/d015fce054f2f21a0a43b1255204c528fb0a4e9a |     
  riscv64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/ddc15d4870937f4981bb8ce762475fa0e3779184 |     
  mips64el   | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/f425073dda796652455363193b81eac1dda329fd |     
  powerpc    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/4c6975e3dbff6dab178c80858da15e3e34c92933 |     
    m68k     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/ce973343d339791f42f966b120e8f9a4f53fdb7e |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/d5c319bdc3f8139060e1a3f0c8b14603e2732f80 |     
   xtensa    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/52ee029dfe00a52edfcfd175cd90ca3b9ae973bd |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/5da60243bc785997a29f9e50ff5c5d3efed1f8f1 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/4c100eebebb75a6bcba0f0b9dd1586d508746c85 |     
   nios2     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/1832d43d0210c022acde5cb99173fbe8b3553ebe |     
  riscv32    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/679570feebbfba3c1a3a532e1b17e3470e61b5ed |     
  powerpc    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/9e1062569834cea453d4b38b7466665a38a1d885 |     
   x86_64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/e8bb54d7758142f14d2b5bf86da1c6ebd6df139c |     
   nios2     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/89de253995e3ea28c879263d0e24bad2ca073b21 |     
   mipsel    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/0fa6a2a61de70e80a161a1d2e80a20b39e6aeb6c |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/3b2d48fa62f8fd665f7f509ccddda201570050cf |     
    arc      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/f879d37892f45ed16cec174484ae427a4e2a2706 |     
    arc      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/fac0a95850d17391d2a3a87063d754780672efa4 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/6f2924cce2b226f7cab63c2a4d5a30e64fa5e8ad |     
microblazeel | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/fd5d7565974c2927d68a688d88c5df214d495322 |     
  aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/070bbcf666a11a8d33ef26239dd72f0f96fc137e |     
  powerpc    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/5201207dc8c40883cb3d9a62849b2181f0fa53fa |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/830238023e6f8f63779c2cbada61bb6f0e34af5d |     
 aarch64_be  | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/52c9f919e70c1efda3666db1fed3e36549bf0452 |     
    arc      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/3157bd8bc1e57f4d95380f7bab88fff67877d665 |     
  mips64el   | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/496dedc0d17cf58ccf106eb90e5f2b9d665ec312 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/cca57d52aacdfb6b1556f07832b3be943edf7c27 |     
   nios2     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/a2b1b493c466ad500b2d4b93383bb126d950cc39 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/4c465bf009f400e9b3dbec23da3b24b7e96fea77 |     
  powerpc    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/ebed7fafc9635afed17220490fcbe19a5ab55e2a |     
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/dd79b6478f8d1f5b09fc0d41f4ed6b42685061cd | ORPH
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/efb0ac8b81eaa0add6bdcc9388b7be91c1a504dd | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/74f6a58deabcbf76780fcd9ff12fcac13246e1a0 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/c57a84c338be47800b5b08e8a9ffa44411850672 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/ec3ffe694e3a7b842a0c9ab6c6eb71b8abb2f848 |     
   x86_64    |         mesa3d-20.1.4          | NOK | http://autobuild.buildroot.net/results/31aa1c11f0fe8e4e8ed187a15cee0849f722ba49 |     
   xtensa    |        micropython-1.12        | NOK | http://autobuild.buildroot.net/results/4b79270cae2a16d654ab0cfcb800befb2e403483 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5d62217d8efd8d89b4fe90ba934e6a41eff85d2a |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/176ec66b63f85e5125132247f69fdeb5b4143292 |     
  aarch64    |         mongodb-4.2.8          | NOK | http://autobuild.buildroot.net/results/c45d00557fa049d767f1778f6cc8e91daa19953b |     
    i586     |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/dbaeed9e9e2af191166808d2d6d6d3c2e5051c2c |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/68dd1538956d058d804d5686c8f2512dbfb2ebef | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/43f21946da713dce8aacedb0c14f108910b6e674 | ORPH
    arm      | open-lldp-b71bfb87fefb31c4b... | NOK | http://autobuild.buildroot.net/results/b6aaaa1e72ba9ce0c29730970911431558181c6e |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/132b622aa9ca3cae140fc259d11e359a51d0d4d9 |     
    arc      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/8df3b0c13a04fb3ee0ad25cecaea316f12044a02 | ORPH
   mipsel    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/7b226eccd3d4fb0cfa6aa1f6a8dda9c11229ea6c | ORPH
    sh4      |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/19cb3367fa75472bae7c34ce8fe8b0051053fee7 |     
    arm      |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/c65836eb723f34d8c3c67ad00f3ea52f8f65b5c5 |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ba06fb25c5b7402c1c505bd753baa215452cf0a8 |     
    i686     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/c723963f7325d1ea3f469b0329c2eb1736127754 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/a73fcc7888113097ed66a0bd18b419cf9d40d735 |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/2214bb9c39f981193795e258e281238e004548a1 |     
  aarch64    |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/728167c2f2cceee90e476088a8de386f0c783260 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/ac3f8572b9d2d10caccb39d72d339e6ed9fb2bd0 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/9d5a589a29f04be950e34a11ccf71071b1d7617f |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/ff5704a514dbe9b3f80b589005a860d8801b04e1 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/251b8614b88683a1f14a97f894733cba69f2b5cd |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b5a3c877c6f19226fd71ebcf68865483cdbc34a3 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/762de29e4201280539a16ed59fcb2ca1f88514d1 | ORPH
  powerpc    |        wireshark-3.2.5         | NOK | http://autobuild.buildroot.net/results/da97a69314327bc279829fefee76c2f8d499881b | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7cd31c8de017e28a107bcd03ad8f2f007378f702 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c62b914b495414de93ce5bcc1be72c38d59a22e2 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/cb3c8bd807ff3f5617f9fe4703f0682166c2d8fc |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/16dc66c48a4e96ee93bf04ba5d83bb9ca77bd05e |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.8 | 2 
dvb-apps-3d43b280298c39a67d... | 1 
          gstreamer1-mm-1.10.0 | 1 
             libopenssl-1.1.1g | 1 
                   mpd-0.21.19 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/848dde920c95133202ade4b09096280729934d03 |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/bbd0a5616842682557bfe764c63f9cf21797ff43 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/039f2d8a7855eccac91ffb6f67969ed0bad9af52 |     
  powerpc    |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/d43206f26ae2fbc6a23ba3f2ec9553b54497fb9a |     
   x86_64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/4ac4e6d7d59ad00e1de345bbc8c7af8741701705 |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/50048044e158eb5b641466ef54186839ce473e3e |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                  assimp-5.0.1 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
             host-pango-1.44.6 | 1 
                libcurl-7.71.1 | 1 
                  luajit-2.1.2 | 1 
                qt5base-5.14.2 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/e67b6ad3fbd685b620eb503d54b895655b1c2bf0 |     
    i586     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/1dbb8fe4f7427e35f97ccee8e0a56d31fbcfe4ac |     
 aarch64_be  |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/f27a3460aaf8ac5d3e262b10b52a68dd4aa2270f | ORPH
   sparc     |         libcurl-7.71.1         | NOK | http://autobuild.buildroot.net/results/cef38ab00213924eada0ecc284e9d025bacb7c48 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/13f4efa6cf9700be0e1df171adbd07b37be57a80 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/6f67334afed6293b6b51878f0d90b28b5ae28837 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/f509c7050f6eb303accebf07c589a68033cd9a5b |     



-- 
http://autobuild.buildroot.net
