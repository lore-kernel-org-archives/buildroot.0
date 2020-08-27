From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 07:54:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-26
Message-ID: <20200827075423.622F68682A@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 18  |  6  |  1  | 25  |
  2020.05.x  |  8  |  4  |  0  | 12  |
    master   | 138 | 36  |  0  | 174 |
     next    | 21  | 15  |  0  | 36  |

Classification of failures by reason for master
-----------------------------------------------

                rocksdb-6.10.1 | 3 
                       unknown | 3 
                  zeromq-4.3.2 | 3 
                     avahi-0.8 | 2 
              host-grpc-1.30.2 | 2 
             kismet-2016-07-R1 | 2 
            live555-2020.06.25 | 2 
                 ripgrep-0.8.1 | 2 
                 rsh-redone-85 | 2 
                 dmalloc-5.5.2 | 1 
   gdb-arc-2020.03-release-gdb | 1 
  gobject-introspection-1.64.1 | 1 
              gr-osmosdr-0.2.0 | 1 
              ibm-sw-tpm2-1563 | 1 
                libroxml-3.0.2 | 1 
               libtheora-1.1.1 | 1 
               libupnpp-0.19.2 | 1 
                  ndisc6-1.0.4 | 1 
                 omniorb-4.2.4 | 1 
                 openal-1.20.1 | 1 
       python-matplotlib-3.0.3 | 1 
            qt5location-5.15.0 | 1 
                      tio-1.32 | 1 
               wireshark-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e2a63bd5694f6828e973dbe726e212a8ee057782 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/79aecbb10a2464489308983554dfcac34965ad3c | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/72695f3d5b7fb5bda3bfde5dc772c2059a9e33ce | ORPH
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/4ba9e27cf42800359b9af7da525bda56e91bd10d | ORPH
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/3de9040495e134b3115b8100420c5ffb8acf2740 |     
   mipsel    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/b87d4c37d1db2b02bdbb35870eb2d273d57e0af5 |     
 aarch64_be  |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/118120af4f13cee72381178a33e82cbf35b82cb3 |     
  riscv64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/f7433e8acc93f09dc000a60c311daf16b5c110f4 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/76a39cd91a0611d46f3ac002a5ca9ea1a66dd66b |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/855c2e2db51737c20d31b335267c4fd187c73c31 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/34e16aa497dca6c3dd1ff1351b8570b64d1f2ce6 | ORPH
    arm      |         libroxml-3.0.2         | NOK | http://autobuild.buildroot.net/results/b6ac3664d61ad826515b57c4d057b6f001b5167d |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/c5de16aef04f2883d3416bfb50cd8b130e2b257d | ORPH
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/34525ceed96f254411888cd4ada8bf584db92b1e |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/7c6dbd65ef81d261cec41b1b4c404c8b2302dfe1 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/c7651e6f89a32ff651decb50f8e7d2aeeb5558f2 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e754a95afa1e99456eae4d630fdb3fa18a007413 | ORPH
   xtensa    |         omniorb-4.2.4          | NOK | http://autobuild.buildroot.net/results/b3d56ebe7e52ead1191671656cc39bac4dc7387e |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/87e7e1f28dd5214887b474728ff8b0844e7116e1 |     
    i586     |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/afddcc44b2fb7983244f24542bfae921869e4ab8 |     
   x86_64    |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/331b43f6ee2c35291a54feedf732edadd5fed49a |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/7dc5c92e3769b5c693e6e63d1e0345ab81534113 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/3b2264b8a17efbf0a27969f5566934e7443c94d5 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/4114f8f18a0f36bc1821a707ec6e1de49f0b6c31 |     
    sh4      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/71d111fe7fc15faf711e36aa6c982445d3c36344 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/5bf6ee27aa7d0403947a6d581e3c771c7b4d53d3 |     
    arm      |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/0d4b577d559707f9a1b9c9d1c8204bf957a39eb8 | ORPH
  riscv64    |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/f5e01eb2ef77fb10838e0f8ed2f25b3dd67b8b36 | ORPH
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/c38cb953d83f79c4725c04a68d764f336b4ee895 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c83bb9751149a695731f6af6b53d6d8cc45ae20c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1838876cd314626379e8a1a0e288b26181766f5a |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/6c63cc67d69dabe177a3fa52484fbe301f74736d |     
  powerpc    |        wireshark-3.2.5         | NOK | http://autobuild.buildroot.net/results/0b7b4c21f379d95885810b7a45f7338b7ab234ca | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/fdeac6b5693baf7cb670013fb719e16bb2b2318a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7f596cec4e32fe016edbc772fd80fb4a168c7df8 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/35f34b79204ea3adaf61ccd2cdcb9cf7a28c9784 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              bitcoin-0.19.0.1 | 1 
             kismet-2016-07-R1 | 1 
                  luajit-2.1.2 | 1 
               opencv-2.4.13.7 | 1 
                 opencv3-3.4.9 | 1 
                   python-lxml | 1 
            qt5location-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/29dfc9994652e937e230221b0385b1de5e087d7e |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ae7fb44562cb1857c3989e92f0479467d7b66b5f | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/458bd7e45ed6d5f1a090e8f9d13d3489c343de62 |     
  riscv64    |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/9365b8c51e49e7f1968082af0dd4f3bdce5cd42c |     
  aarch64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/25b81a433e08376999bf69c8d28518761092c01b |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/decb34bed87073abd24a45ad1e70159ac3229449 |     
  riscv64    |       qt5location-5.12.8       | NOK | http://autobuild.buildroot.net/results/20f5b61470e2ae64b0f28842eb7d989a0167f7d9 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               collectd-5.11.0 | 1 
          matchbox-panel-0.9.3 | 1 
                 openal-1.19.1 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/07d57dcb6e82c03efd248b738c9356a78e9c686f |     
    arm      |      matchbox-panel-0.9.3      | NOK | http://autobuild.buildroot.net/results/902c5b3dd72a8fbe1f04f0f83ba7eca6cc172632 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/a9cdad5cd8b2e1e62ffdf4fc48da803246016b43 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ebc684fb193d40eaca7135d13ae6873d2b646f2c |     


Classification of failures by reason for next
---------------------------------------------

              host-grpc-1.31.0 | 3 
              keepalived-2.1.4 | 2 
            live555-2020.06.25 | 2 
               apcupsd-3.14.14 | 1 
                  boost-1.73.0 | 1 
               collectd-5.11.0 | 1 
                 gnuplot-5.4.0 | 1 
                hiawatha-10.10 | 1 
               iptraf-ng-1.2.1 | 1 
                    mpv-0.29.1 | 1 
                suricata-4.1.8 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e8b86ddad8a4be6d0ec53d79e017773081b8b61a |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/969d7686f1a128c4a0b84f2a8d2425841e5b7172 |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/8bda6466932e217eaac5d040b650a730a2e47290 |     
  powerpc    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/75665a3087fd6d036ae9300ce44db42b621034fb |     
powerpc64le  |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/03af959b54d9cebfef1644671d887d17308b548d |     
  mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/24b6ac32c9542713b7bd9d3fadf5ce4e470a3eda |     
   x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/c65fb5f89ca5517b387158c95e159b37d04d8fde |     
   mipsel    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/a98d3203f68f0f929c544537244e7621e80ce0a1 |     
    arm      |        iptraf-ng-1.2.1         | NOK | http://autobuild.buildroot.net/results/480b00b4b264cfe1da533c762595d21b72fa8211 |     
    mips     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/cb5b95af00f3ccbc1ae07e4c57416d6015d2f12b |     
  riscv64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/e946f4497b8b8106cc119c2ac6cc0d32887c6c42 |     
  powerpc    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/97cbc6894ce7c1f4538acb1aeae6d9d187155965 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/49c6a24633e2b2ad8327593ea7679b7b9b98cfa1 | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0e6b0773c354406afaada9347e5e13193c3e53a1 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/7d571c95792aae73b97be166e40027130159fc19 |     



-- 
http://autobuild.buildroot.net
