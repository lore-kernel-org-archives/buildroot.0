From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Oct 2019 06:19:13 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-22
Message-ID: <20191023061919.7C07B874F3@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-22
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 25  |  3  |  0  | 28  |
  2019.08.x  | 23  |  2  |  0  | 25  |
    master   | 158 | 168 |  1  | 327 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libselinux-2.9 | 67
                    brltty-6.0 | 20
        host-dbus-python-1.2.8 | 10
                    bird-2.0.7 | 8 
             dbus-python-1.2.8 | 6 
                       kmod-26 | 6 
                      icu-64-2 | 5 
    python-pymodbus-legal-info | 5 
           host-libselinux-2.9 | 3 
                host-lld-8.0.0 | 3 
              libgeotiff-1.5.1 | 3 
               libupnpp-0.17.1 | 3 
              openlayers-6.0.1 | 3 
              host-grpc-1.23.0 | 2 
                libdrm-2.4.100 | 2 
                libgdiplus-5.6 | 2 
   openvmtools-10.3.5-10430147 | 2 
                   dvblast-3.4 | 1 
                  gmpc-11.8.16 | 1 
                     gzip-1.10 | 1 
           host-harfbuzz-2.5.3 | 1 
                   libnss-3.47 | 1 
             libopenh264-2.0.0 | 1 
               librsvg-2.40.20 | 1 
               libsigsegv-2.12 | 1 
                       lmbench | 1 
        ltp-testsuite-20190930 | 1 
        matchbox-desktop-0.9.1 | 1 
                   mimic-1.1.0 | 1 
python-libconfig-b271c3d9da... | 1 
          python-uvloop-0.13.0 | 1 
             safeclib-03032018 | 1 
                    strace-5.3 | 1 
                       unknown | 1 
               util-linux-2.34 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/5caf9c0a55db67d554a64ad4026ab6a506144a09 |     
   mipsel    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/cff829b83a2b6a5eba8f1fbd14ce69e67eb34bfb |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/0f730d953eb3b047e60f34c257b351c51f6cfab8 |     
   sparc     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/65a6f0dca275d075872df72016f431daf0d0e18b |     
  sparc64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/79ba2c428810bf48f6108cf00220b7abed4b97e4 |     
    mips     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/7722caeb126197a90438664ab92baf4753fe3bcd |     
    arc      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/9a8073ebccae0946cf0c5932b70e63afe06a4717 |     
microblazeel |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/3e990bd81399262884a282cc0bd96163471cfa09 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7c4e2ebdfab7445949cabd969e0fc355030e319e |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/242497fd240761f8d1fa6b6133dc0ceeea7c39c3 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4fbc9c5036fada6bd5e4ee85903adf1a1ae91064 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/cc8adbc9433c635a2e216c6d7fce7e7df2808ac3 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/84d9fb7e06a0f74082c7b3b17a4b734570923558 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/94c1d3ec93aa497e8f12d396d3efcc9c0075fdb3 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/42a214598ad56f21b8c0878d63a9142f954e1917 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ae4a5f7b7934be7212e269bb162e937cdc764351 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b68b2f814619a3160e00dbdd3322630097e93fd2 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/35766998a8488c590ae48c2403855f1c49eb5349 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/674585bc0b12cd7db9bbbb66fc301a1fa1da78c2 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/05e4a3c5267cad9bec4b8912bbd62932f232da1b |     
 aarch64_be  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/17c2740f3c553b6128c1fd7e8a64c807c548a546 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/16b9449d880fcb4cde76b6a5afaaa8661016c4f2 |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/189e3575d0207282ec960ecf4e9a3c4dbc5d1dc3 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bd09e8f63b533d6a1a50c4589640f85f99e7764e |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6a0b8bd13f3e0b021741be966c5e5e00e3ed341b |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/782003123588b6c13385acbf5d51892f45adb6a8 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d9d256b916d4c785d4f04edb1799d342a639296b |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/de0a14380600e169b323207ab8c44c3b9782e65c |     
  mips64el   |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/732571b55ad2a8b2428b2614f7f048cd924ee4d9 | ORPH
    sh4      |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/f427ff24e87533a1e64953430547ffe451c062e4 | ORPH
  sparc64    |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/a0c4c60bb7388d0d11c5cdad9aa5307b527de2ac | ORPH
    sh4      |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/7432f225b36d3fd383b6a583c2d27df8dd130771 | ORPH
    arm      |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/aa0e3d07ca6fcf74cf22d43b2dc03023348dd932 | ORPH
   sparc     |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/ff312ac53c99f0a248bd2fa771f321af19901ca6 | ORPH
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/9ba21336c50c3bc625adfd80817ff60f35c9969b |     
   x86_64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/12e3d32414d40f697e535c186e5d768cb0c19e9f | ORPH
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/a1b1dca14131aa968ad09616b1aff5fc5bb84563 | ORPH
    sh4      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/ddec1f0385741d7ab64f57907b6b4f8c7c62f704 | ORPH
  mips64el   |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/e809c84c2839d2df21f5e3170ab8283ec523626f | ORPH
    sh4      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/a6c1ccb34f9cbda4f75fb4ff1e8ff91ddd611fbc | ORPH
   nios2     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/bfd339fbb0457872fa8923b26c0f16f8cbf1b671 | ORPH
    m68k     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/7daaf334117ba08e8e1721bc44decf12c6cdb29c | ORPH
   x86_64    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/30ac8519009e8b2a70a807384da917cb65883025 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/c9b6077b6fa55d94084a6d2b6f442241fb53936b | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/e765670baf42ec9365f0560dd54dfd5984743750 | ORPH
    mips     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/3446f6f6e5bb7eb512731bf06a46a4e357c463d9 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/c999e67204e20357c5a8a41836782a2609a12416 | ORPH
    i686     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/d56b6d0d18900a4d5c24480f6fa649dd7199fe7d |     
  powerpc    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/da182180cdbb239489b6222863341a58e10c6c77 |     
  mips64el   |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/65a8d0e57da81f4488a69bf0a1076136c8f958f5 | ORPH
  riscv64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/651a9dfdf3ac68dbaaace62ce52386304fb5e5ca |     
   x86_64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/81e109caf3aa5010ff61672a5a038ebc3790c79a |     
    m68k     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/54bd5d878415d6536f62376018b1db7f46cdea44 |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/a179c6caee0f4c00371c6acd58b14ad511c8953f |     
   x86_64    |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/76310241a335a99a4ff2726edb517b067367fd41 |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/88cbfae219fd4475be376c9558b5760cebd2148f |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/e1e706666f9699f7fa4d58d9428b88a26e723b61 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/11830ca848ddb474ca5a2b7367d28d56bc7e01bc | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/5666892c11f72b64b6a6c79cb3fae7762a431505 | ORPH
 aarch64_be  |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/16bae9a9465325f00c161e82cdb8889813ff59e9 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/5325ab2ca74f83e3d64534d4f395ea6cc4f11e4d | ORPH
microblazeel |            kmod-26             | NOK | http://autobuild.buildroot.net/results/bebcef79bdebb5eae7c0e8082a8d5ba77622ceb3 |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/8e22dbca39588c100c93a8b3654e387c1932df5a |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/4bb169e3e8506ca9de8c854f79d18050a0446c97 |     
    i686     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/4a813c2a64b33bcb2aafb4fedd6d3bb72e1dd7fe |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/a4bc8c4c59aaef25881369d512c9965e0e4611db |     
  sparc64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/157ee002e52d833c1c876d6ecfeb41604c6393d4 |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/d563d07efb36b55f294119dc0698be2a218c1c71 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/3b541a1c0f746c4158e1fd29b3900c1f74805dfa |     
    arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/f4c37ff1352228fa3d1b3f35d3b9b17386135a33 |     
    sh4      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/20d9cd993c8516df6f97c18567d17ac8c04448fa |     
    m68k     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/5d38527ae6163013f9f3eb3ac3c55694761050fc |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/dbafb8734027a5703d9c675602a2ab7d940385b4 |     
    m68k     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/ab005c640afb31a1e61fa464669c0c821863d82d |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/1342d305d1aeebef7af54a83afc094fda12421e2 |     
    mips     |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/2b00bc98a3b013aed142ffcd104fcbf970e9aacd |     
    arc      |        librsvg-2.40.20         | NOK | http://autobuild.buildroot.net/results/750a7d35c99d33c2618ef4a4891b1a6fb36a07b4 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d87e14e68079cf1152b2361b94bc52749ff38fb0 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a40f2b6726b53cb0c9d1aca26accd64c0b50acfd |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3380cc249c1ce1740d4ce04077c31f4087a9ce88 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2abd393d5117402cff33beef3e610d607649f5b7 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bc5ae803790ccc9ba007958182427218ea3a1980 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c5a326d7465a775bab8742edfb3ad9ad10e394d0 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c0595d83bc47b35d1ad5ef3cc094e0dc9e78f9db |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/231ee3a188b929a88e52797672f918a42c3e3064 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9de47adfbefba018af4492f7939968f1067f96f5 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c5d713c91ac3030898f6913c2167f6c213c96bcc |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ba7b66c3a3ca9c29bfd057979f30039e560fa82c |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/42dfe565c8527bd74e25318d96c2e5e6b8185e3b |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/61130c690ba60242dd9b493b43b0a8dbfc10c7da |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/aab4b2dc1e4cc1b116529e0466b04e70c1581cb1 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f4aa4ec68110b11a6cc29ca6f031d11d62fa170d |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f4ab9873f3aa2bb806b0025c7fc1fe3a46028d81 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2305533189514071c38fe2cfffb87e74732ae820 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c8c94a55784c694e97a92497351704a6c322b592 |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f49d12cad4b1dfa1ae20ac3dcc7fa24af9fcce31 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/856d7187268dbe67bad8506f77abb1d2c5af80b6 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/de2e1f5ae24c9fac8ac74be98593226d2cb472b4 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/db968aa9c37d25ccf9c14b462d7a5675f63ed8f0 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/898b668657f713b3f07e944cdc2f0de7a9b2e678 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/11458367dcc14bfc60bcd45d7e869fdf82e3c18e |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e77ebe49247e2a1e7f368ff9bbddce790de361df |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/17971280016e545369e2b78423beb3684d640d15 |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/31f87dc83fac2b9e90fab6b1236ab1253eb6e6ca |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/dd4003a5d20b3023b29484c510e143a7ccddb3df |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/60d92593a79d2d81f1c47f17c157c98c9b01b2f6 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/65781e8202d8dffefdf59b6508cd9c57fd82ca4a |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/93ae967b257939be7595afc4f9dca1220cd763e3 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4d6df56cec4d40e7543a87258ececc614f332cc1 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e48f475fe347e50e1e0eb68667a30272e3f5845c |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4fe7ba47bc67502c0af50aa6f3d0e0f5cf5fb15f |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9feb3ebd498ee1f6a99c89c1c53d0ac7e980903c |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/14cc766ca25349edcfb8c28c87f338c0b6917428 |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/af2d2edb1840c6a70f606b833363ed57244ba811 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a946f9cc14bb52a6b20200d3bf01afd08927d002 |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f5d6c0e6a79ab5f484746d06095413a3ba404a6a |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b2f7d72dd92c832882401a486f99394a9c15f865 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1e07c40cc2a5fe1ef6fb41e51df15232839d72c7 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cfb022d19c369059bb937aa9ee385ba0f0c4f97d |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/15083c01e3284f608cd31677b4dbd6ce65ab4963 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a89920e32f69593ec9447b79bdb6d47bcaf6011b |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/604276355d3af6d2358a357bd77851c2c4d9d25f |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ead87bcfed9331ac9ed865d1749f3399d11c1ff9 |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9601eacf3eac293048925745493966d35f322661 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bf4cb1fb4b9e237485d747401f64bf68b0157d7a |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/af8d0e58d016b495fadb05bf42908c211fccc8be |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/950a836bf6d6dccab182cd48b1554e6eee5902dd |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bdd4a5f9dfc4e7f5e7e3700fb3451afcddf096b4 |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a1415ebb1344e8a3a425414d1b2779094e6cee48 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/32fc9d4e3c9eeab198f619dccec515b95a4e1c9b |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/318b291935b37fa6d1d9c4101c1c177d559124f9 |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e655061f48938f865929c477a8be8bc9d12d583c |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/05da490fad1b3d359bc750d30236ebafaeb69bc9 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/575fcbc92f3f33d6a1ef7fca14775a2f7b5bf194 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/431fd987011121e7324895c446d3ff4ff889b14b |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/576d7c9654dc048bf4350e43054485ef15d09a3b |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/edf5e151be96eba92edc927b444ef0eaa9640f56 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/299454a8627e4fdcddc7f3e2a585850a1d0fe032 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a902322d8049647369dea5a535bb8e37efd9a988 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2bcd576cb4b79c55d2847fce0ee0fecd95070da9 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/931cca638b9be12b3ec56b40e88973752cae3b77 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ac00dd8c45e8fd2cfe8a3ef8b65d38bbd9530173 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d501cedbd4763e9413a3a08072e0c7d8c771b294 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/89444d4ca8449279a6c2368744b3a9998c873c8b |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/8d6cade2562404b9800736a3b9a2beada98bda88 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/83a3c1c6dfdf1bc70df8422980aa789509e4cff2 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/10244974c975a5c45f4b7bad7c034eb94444b51c |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/9dd354aa93837fad1d0c6a610863e05dc636091d |     
  riscv32    |            lmbench             | TIM | http://autobuild.buildroot.net/results/d47e46889d7bcc5864c738cb948afc168327b612 |     
    sh4      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/679eda19b3077c1551030530a6603ccdc3efe565 |     
    arm      |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/d40e696f8bbfd7464944a5e3811b8a195133ac4e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/7e07e83e364d19d4dff6030ced97b6e9f82f89be |     
    arm      |        openlayers-6.0.1        | NOK | http://autobuild.buildroot.net/results/2517897b65eaf4c78f4ef09b783713816fe31a6f |     
    m68k     |        openlayers-6.0.1        | NOK | http://autobuild.buildroot.net/results/8ff64266b5910846575ae4ed7df3bfff0f41454c |     
microblazeel |        openlayers-6.0.1        | NOK | http://autobuild.buildroot.net/results/727fecf3cbdc62cb2b375c706091cd39404f3a2b |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/aa4a642205e53a3750b81344106febe3b5f4965b |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0a72e69c546b9f434c12a44a8dc76b070078d404 |     
    mips     | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/51877f58bb88da9ce54e03039e6e84df807082a9 |     
    arc      |   python-pymodbus-legal-info   | NOK | http://autobuild.buildroot.net/results/8ef75d8b96ab38771f2cf819662623b5f3c06a40 |     
 powerpc64   |   python-pymodbus-legal-info   | NOK | http://autobuild.buildroot.net/results/6701b1e038b58fcd49240ceb7f972885e2e037aa |     
    arc      |   python-pymodbus-legal-info   | NOK | http://autobuild.buildroot.net/results/669889d178b1f0031c82be12000a7fd068f6d995 |     
    arc      |   python-pymodbus-legal-info   | NOK | http://autobuild.buildroot.net/results/399e202c4549925572cb8230ad4ca92923e05960 |     
   mipsel    |   python-pymodbus-legal-info   | NOK | http://autobuild.buildroot.net/results/68f4754d92df80897143671e34f5ebf1a8b4f281 |     
  mips64el   |      python-uvloop-0.13.0      | NOK | http://autobuild.buildroot.net/results/e3b67b655724f4e384cef61ca17e5a8ea5ebb55d |     
    arm      |       safeclib-03032018        | NOK | http://autobuild.buildroot.net/results/1283af0e4fe82125607db8677fea82bd285d2c7b |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/233cec7af0fcd6421c0bd2982fd8f9f8a3431a92 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/c8a64f937f3ea5db2c46dac89bf62a7dd09094ab |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/55bb5156dcbbf6dc5fe0ced1e046ef8b3443b89d |     
 aarch64_be  |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/673fc848f88bb6d3c55468098d7d1688c27837c2 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 2 
                 opencv3-3.4.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/0b4cc561d5c48b5c345467db8dbc8c402118fe9d |     
    arm      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/4ff13140b9a4cb1847b39cdc406ac52ff8db75fe |     
microblazeel |         opencv3-3.4.3          | NOK | http://autobuild.buildroot.net/results/01352763bd6b2dd00eabd182c146782a91192c56 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                     gzip-1.10 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/a53c20f5b98bf146a6e2f3db9aa84637464ec267 | ORPH
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/ca7c64d82571f9ed051c8593ca1fd2bf8c0da9db | ORPH



-- 
http://autobuild.buildroot.net
