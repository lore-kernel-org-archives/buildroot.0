From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Jun 2020 06:27:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-20
Message-ID: <20200621062718.B5892887E2@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  2  |  0  | 15  |
  2020.05.x  | 17  |  3  |  0  | 20  |
    master   | 126 | 109 |  2  | 237 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                iproute2-5.7.0 | 23
              gnuradio-3.8.1.0 | 14
                  boost-1.73.0 | 10
                      ell-0.32 | 4 
                qt5base-5.15.0 | 4 
              tinydtls-0.9-rc1 | 4 
                  assimp-5.0.1 | 3 
               domoticz-2020.1 | 3 
              host-grpc-1.25.0 | 3 
                       iwd-1.8 | 3 
          janus-gateway-0.10.1 | 3 
             kismet-2016-07-R1 | 3 
                       unknown | 3 
                     avahi-0.8 | 2 
              fstrcmp-0.7.D001 | 2 
              ibm-sw-tpm2-1563 | 2 
                  zeromq-4.3.2 | 2 
               apcupsd-3.14.14 | 1 
               belle-sip-4.3.1 | 1 
                          bind | 1 
              bitcoin-0.19.0.1 | 1 
                   cvs-1.12.13 | 1 
                  dnsmasq-2.81 | 1 
             freeswitch-1.10.3 | 1 
   gdb-arc-2020.03-release-gdb | 1 
                 gerbera-1.4.0 | 1 
                 gnutls-3.6.13 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
libcamera-96fab38e02792a109... | 1 
               libupnpp-0.17.2 | 1 
                   mimic-1.1.0 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
               rabbitmq-server | 1 
                  rygel-0.38.3 | 1 
                 samba4-4.11.9 | 1 
                      tio-1.32 | 1 
                wayland-1.18.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/abb487a250550a16375530d1fe2ae737eda604fa |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5f5f62064db836b2512529b70ecb9e1628700436 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/13430e644d4d40d733e8f8aec0c063750dbfa2f1 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/bf19b1dc3f91d4efc51f1febb41a092528d0632b |     
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f5e09cdba1e20bb8dca02f4841e9b971cbb875ae | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/abff0a8ca4d1af9ba49d80006acc21ec52834a5c | ORPH
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/f01cd6c10d9d103de0774c4bae31778f6c5cc3ff |     
    arc      |              bind              | TIM | http://autobuild.buildroot.net/results/c6df1d643d0a2e46b0f131475af47fa6e0a92fc8 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/1320b069e049fd8de1fd14cee78b97a1e151f350 |     
  riscv64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/2ca0cb96dda5028a5c0db6cdbbf1d724154f8008 |     
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/f2ee0b6b16571a1f3f858238c1c23f389539cc2e |     
    sh4      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/1af223ab2c08e677a216c928eea40483f598a8f1 |     
  mips64el   |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/5afdf16658e5f2a32378e331c8495f2cad9fc5a8 |     
   mipsel    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/4371ef2c32e4b31b94705a8a04de13018512eab0 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/355d4a915da53707d0acd9e252ce67079ef03f9b |     
   nios2     |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/915b9021cf1cf2e0b32568c47bc9a91609f3b5d9 |     
  mips64el   |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/663989d97078d8940cac0259dfeb8a4443878b83 |     
  aarch64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/5bb5d14ae1baf7988942285b2cf56de9d2015ffc |     
microblazeel |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/5c60a7ffb9e1d1b689ac0db76b493734f3936609 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/1c2b16da84a0daeba0d034ed835862be4db558d8 | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/c76be481ecf4abd2259a38785a94f085d7f19495 |     
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/ad98c7f12829097912e8aba1e0d04b58e7772e5e |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/26f2f28368ba6fb86ed04dffd8cd7effc45738d9 |     
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/1c5b79e431c2f2e9fb1adf23d5d691708968c2a7 |     
    sh4      |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/c4baa6480f8c0d15bfb2c8beec386a778a1efa2f |     
    or1k     |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/515e11f4025f3a491651eacacabd5485fcc47aa8 |     
    sh4      |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/57f8f8c3b64dcc04acb042a74c93fd623e7f77b8 |     
  mips64el   |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/2c1806d18b1fde5d12431174dbaf9849d739cc3c |     
  aarch64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/aec80e2860fe08f691a2b069405e10dba529061b |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/b16a736f6d4a9205539aec264de276ee21f8fa7c |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/5b2a5b1b05c3ca9c8f1cd54d22a7eb7e0806a8fc |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/5a2b89f5b1bf6b2d7d552f798f8a2a783260ba6b | ORPH
    arc      |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/ee365f792feb0fe69ed765fda625afabc91ec769 |     
   x86_64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/53db4e0b9d61d1aa98bafd58af5caebeb8cdabec |     
  sparc64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/9f2820c0c60fa82ee94b60f164d89bd5fb762013 |     
   nios2     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/11b5b45fca1a762060c04715977b75d77afd839e |     
   x86_64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/6c60f1df0be934ffee0355ae4ccf03e846848fc4 |     
  aarch64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/130b016ca657e873d1645cd964b25b00323bd82a |     
    arm      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/82e1b1123d4e13b904b7380d2448aaab49e29106 |     
    i586     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/5d5c81bcaf234ab2d9192d34bb84f875538c3238 |     
   sparc     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/13c258283e5beb97543b606e4e4c156b0e3fb7fa |     
   sparc     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/d418659b3392a74ed1e302f07adcc44f07ce8419 |     
  sparc64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/cbee9139d28abe83b634dfcd8331005a7f776b10 |     
  mips64el   |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/b22454ba7f99536d5bae9410213ed98d09cc984b |     
  powerpc    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/72a5be4246f4bdfd64112458b15b2425caff8f1e |     
    arc      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/d6561c3dfc14b845efb21737d1eb1b6245b03bab |     
    i586     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/97b945105e7b51acc73bf35383e7d24334118260 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/7c4f3b08abe218faeaa653128e402cc448649462 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b8e6d8159f51bf2d0f10440bd9f86e0d059712e6 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2da1f6377370cc40702e04e8e80822449cb05825 |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/09263bf933846dea544ec622dd179f27654bba08 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/db54557b364275e02a691a767f4de0804bfbf7df |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3f036ebbb5299551268bafdf77a6e28d2b71d1ec |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1eff1394f81a10314c39e62434f55611f99b8ea8 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/8285e653a5e736a2ba5d0d70659f59995fa01d20 |     
    m68k     |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/975bca7b3c88ad1a41a7fa6c8404cf616fec4e75 |     
    sh4      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/dd82fea9e9ca1a9a2846b1bc5ebbed495d76735d |     
   xtensa    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/4e794a1a1893f35b6bd95188980aff6fd67a36e2 |     
    arm      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/f35717fb5e24e4abf8366608c1df85b0ed6e3a97 |     
microblazeel |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/0afe4565f3e21e11d75e6a6f97c488c6109cd98f |     
   xtensa    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/29f7510c18def1a049025e84d1071b69975086a2 |     
   xtensa    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/8b79f09b95cff1658298678c536c94b801cf0056 |     
microblazeel |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/6dbecc7345c7299f9342a79fbdaa56757d3e1fe7 |     
  powerpc    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/cda7d723f57e0b6a90b5a2297cb5c93fe818a359 |     
   x86_64    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/edca4091624c9eb70907550959c9bf9c63617e83 |     
    arm      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/b4a7735b920c475111703d40140ca8b98d2c07f5 |     
   x86_64    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/09caeba43e900e2593133606df5ac4cc169f8331 |     
  mips64el   |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/0da72d86b13fbfd187a85190ffa0ecbc6efaba04 |     
microblazeel |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/a794013a3897f6ddd56eda76549410235d8ee463 |     
    arm      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/1ceb63182b1adcffa3aadc896649933c695da5b3 |     
    m68k     |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/a732aae00b91f0e9212b2805536f2626605e432a |     
   mipsel    |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/af4a82cbfb2fcce6e8ac790e20655c448f4b6043 |     
    i586     |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/08d44b723e3af893654a96fa5cfec5e49abbb774 |     
    arm      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/37ce36e12eccd5307ced6331a46fe60fab1f99cd |     
    arm      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/980fbc29d98414269a21a2d776e5261402e42f84 |     
   sparc     |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/202b2c7eb4acc37874a6cbb01215296559dc4d74 |     
    arm      |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/6d05c0d7cfe071d214d949c92b474e6699a20b66 |     
    i686     |         iproute2-5.7.0         | NOK | http://autobuild.buildroot.net/results/af7db079a61f54f01bf498a427f52ac9ddbe558b |     
  mips64el   |            iwd-1.8             | NOK | http://autobuild.buildroot.net/results/8bbf7e1d0929d0883c0c2445990f62f5a1d54163 |     
    m68k     |            iwd-1.8             | NOK | http://autobuild.buildroot.net/results/9cc57e098b970790f47f79348c410590151a08a2 |     
   xtensa    |            iwd-1.8             | NOK | http://autobuild.buildroot.net/results/6f6de2a1b8fdb769087e47c0f458dab087aa84aa |     
    m68k     |      janus-gateway-0.10.1      | NOK | http://autobuild.buildroot.net/results/6ba395d023b3aa3e7d4f1725b9e37dd566321eb5 |     
    arc      |      janus-gateway-0.10.1      | NOK | http://autobuild.buildroot.net/results/e9dd68127bd8e6337eac23d43e99399ec370b1e0 |     
 aarch64_be  |      janus-gateway-0.10.1      | NOK | http://autobuild.buildroot.net/results/b36b4cb6425d2c9986980291333291c39f27d756 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/7833c3ad4560c13bc9a3bbfe13c8826c99e68cd4 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/bd42b97f32ce53e6f26a85d8edfff2c0bc720439 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/d5dc1e311de24c1ad8213fb317a9754bb5e1c2f6 | ORPH
   nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/d8c0c343b5cea4ac7e338178efab89faaea3d449 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/69f2f0d6b0f1db9452afece05ee2d5b04c35f681 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/bb94a759cdd2e93bd7d911e967433608ec778f67 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/64133696b251ed1b761146b78ba1f82924e66c91 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/fe309c8acb7196341850ff1410e4aede8fce8f05 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/ba4d01aa45849da15b38173e8ba890a923ae99d9 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/26e8dd7c0307c50522972ea9572d719c6a4e1012 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/980edbe4efd67e01ac4fea01281cfe93e89c5933 |     
powerpc64le  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/2d58cb43ecbab1396ac9f07dd459cfa7bd4a23ea |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/551a8cacf54b59b42c8036c9a9e5915c02f540f6 |     
   mipsel    |        rabbitmq-server         | TIM | http://autobuild.buildroot.net/results/9fdd27edaeaac3eb744ad42319559c8ab14cf9eb |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/daa24d5678e28dd8e3c2cd356c438a118742f598 |     
  mips64el   |         samba4-4.11.9          | NOK | http://autobuild.buildroot.net/results/546eac37770ab5810d56d011437527076191e5a1 |     
 aarch64_be  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8d85b75fab568399055ce8e3944df62429f8c71e |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e53e2f82f943ce0103b58cd94797c659efbc2d5e |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e87180efb122c32809edb0e927f18907b3cdded8 |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e8704e02fdede7b63e22da552292977b23380b32 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/06165bde48744467ea74089625f08031ed66338a |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c48cd8778e709705bf9f3b24160aac9669382c9c |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1a44e407376476a96b802afa4cd04b0233e4a809 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7b93ba952bfc471f0d1b03dd8702773b4973cb60 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/e68174f2612751738232786ae86693291229ee6e |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/18a131866864ad37702514ff71bcd88eecc6a975 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/5889939c0fb1dc6cfa55c2891932f708df361dfa |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399496  |      
       acmesystems_aria_g25_256mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399498  |      
    acmesystems_arietta_g25_128mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399499  |      
    acmesystems_arietta_g25_256mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399501  |      
                amarula_a64_relic |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399505  |      
                 arcturus_ucp1020 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399514  |      
                         arm_juno |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399518  |      
                   armadeus_apf28 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399522  |      
               asus_tinker_rk3288 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399524  |      
                  at91sam9260eknf |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399526  |      
                   at91sam9g20dfc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399528  |      
                 at91sam9g45m10ek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399530  |      
                     at91sam9rlek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399532  |      
             at91sam9x5ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399536  |      
   atmel_sama5d27_som1_ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399541  |      
       atmel_sama5d2_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399543  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399544  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399800  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399873  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/603399887  |      




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3032a7f74c622a5fba8aec915b13ca2a50385b54 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/eb5a0ac82ad4fdf3706f1123ad00496d1c803b2b |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.14.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c72167a8cfdd09d2e6ee23e5a810b5f042d9bf0e |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/46d0928a5be8e27695df06511719493886434321 | ORPH
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/553f1caeb55871fc8e0dbb9208d78da8f91d801d |     



-- 
http://autobuild.buildroot.net
