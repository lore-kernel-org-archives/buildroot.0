From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 20 Jun 2016 10:37:06 -0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-06-19
In-Reply-To: <20160620063029.9F891102C76@stock.ovh.net>
References: <20160620063029.9F891102C76@stock.ovh.net>
Message-ID: <CA+-urNS=53BUamK5Gy_y=vh9R2Lh=hcqSWMUW0qQaJK_W73RnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jun 20, 2016 at 2:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2016-06-19
> ===============================
>
>         success : 169
>        failures : 148
>        timeouts : 0
>           TOTAL : 317
>
> Classification of failures by reason
> ====================================
>
>                    efivar-0.23 | 13
>                   boost-1.61.0 | 10
>               e2fsprogs-1.43.1 | 7
>      python-pathvalidate-0.4.1 | 7
>               host-libxcb-1.12 | 6
>              bluez_utils-4.101 | 5
>                  gflags-v2.1.2 | 5
>           libmicrohttpd-0.9.50 | 4
>                     xxhash-r40 | 4
>                    libxcb-1.12 | 4
> ti-utils-06dbdb2727354b5f3a... | 4
> python-libconfig-b271c3d9da... | 3
>                     gdb-7.10.1 | 3
>                 flannel-v0.5.5 | 3
> snowball-hdmiservice-f75c99... | 3
>                   autofs-5.1.2 | 3
>           xinetd-xinetd-2-3-15 | 3
>                 blktrace-1.1.0 | 3
> host-gdb-6be65fb56ea6694a92... | 2
>             python-crc16-0.1.1 | 2
>                  lvm2-2.02.156 | 2
>                libsigsegv-2.10 | 2
>                  jack2-v1.9.10 | 2
>                 mono-4.4.0.182 | 2
> qjson-ba273682a9d33a7b3090e... | 2
>                    fwup-v0.7.0 | 2
>            python-dpkt-1.8.r98 | 2
> host-omap-u-boot-utils-3f07... | 1
> sunxi-mali-prop-1c5063f43cd... | 1
>                     cups-2.1.2 | 1
>                      xen-4.6.0 | 1
>       kismet-Kismet-2014-02-R1 | 1
>               sqlcipher-v3.2.0 | 1
>                  mesa3d-11.2.2 | 1
> tinyalsa-f2a7b6d3d81bd337a5... | 1
>                openipmi-2.0.21 | 1
> python-configshell-fb-v1.1.... | 1
>                 beecrypt-4.2.1 | 1
>                libcap-ng-0.7.7 | 1
>              iprutils-2.4.10.1 | 1
>     python-rtslib-fb-v2.1.fb57 | 1
>                 pinentry-0.9.4 | 1
>                trousers-0.3.13 | 1
> host-imx-usb-loader-f96aee2... | 1
>                     mpv-0.17.0 | 1
>      openvmtools-stable-9.10.2 | 1
>                libupnpp-0.14.1 | 1
>            libfastjson-v0.99.2 | 1
>                linux-pam-1.2.1 | 1
> android-tools-4.2.2+git2013... | 1
>           sane-backends-1.0.25 | 1
>            linux-zigbee-v0.3.1 | 1
> tvheadend-8e637f9f903f6d820... | 1
>                  mplayer-1.3.0 | 1
>            python-docopt-0.6.2 | 1
>           python-pyusb-1.0.0b2 | 1
> sunxi-cedarx-b8f52d913f7372... | 1
>              rabbitmq-c-v0.8.0 | 1
> libump-ec0680628744f30b8fac... | 1
>            host-heimdal-1.6rc2 | 1
>               micropython-v1.6 | 1
>                 mongrel2-1.9.2 | 1
>            python-pydal-v15.07 | 1
>                 directfb-1.7.7 | 1
>                   openjpeg-2.1 | 1
> iputils-55828d1fef3fed7f07a... | 1
>                   xl2tp-v1.3.6 | 1
>
> Detail of failures
> ===================
>
>     mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/481735017cd0dee755257ecf94400f9ce3943bf8/
>         sh4a |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/eae1112991b02da68a0e4ec5b50b2214cc2fbc6a/
>         m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/04aefb489ce49c131d19f6b315c11ae9df20a808/
>         m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/cfcbdc53bc8970d3da968612753076c8aec3f5e2/
>          arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/8cb64b60835d9765b4e30da0dabb777152389183/
>      powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/6679315208b2794cb11279f1f6bd28472f34db42/
>      powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/16846044b3b91336a2bc822d643bee2b87b5314e/
>      powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9f2d54fa29a0589a1443b552409053bf417db7bb/
>         m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/73ad34d4ef1202fca1558322a52fa1996a0e16f9/
>          arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/936ef6ca9e42e6bcb9eb816b04d37107e929ada9/
>         m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b49f29b2c8eef67b5a88297a0fae609dd84defa0/
>          arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0ece599c60b2c488e3140d2a61459dba31b03cbd/
>          arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7b2e2657c64c85843774cd1938093f2997d0fbfa/
>         m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/2b3baf6a8e7f8b9dd22fde4c45ab2f3f951fdb26/
>         bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/037f2fea371ff5bc87753fbe7eaa6421a99ca8c2/
>         m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/3e9ea7f6b9f796d40f46cd3e2e9d4e9841e1e907/
>          arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f7103292892d8d35e8ef2ba61a1b8a6479d761fa/
>         m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/73cd2b21c2a44151cffe2d938fa8558ba05d3ec1/
>          arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/38bd9d53c637713f97899fda5809b7075abd46e9/
>          arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/11080cac84d54308d0756f0bf775489d2fcb4981/
>         m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/db21789b1f242a20614c70ff3c27e59469a23223/
>         bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/508c439b632f0f9c167cff140d271cb3c47bab16/
>         bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/02f98a50340ecae01f723ad48c2d54d9e28388f8/
>          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/5914bf6f7dc3e0cd5cedf0f3ccfb5e50b1e76278/
>         m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/db7dfdfdc66495d19e27bb34e74d617dc7737a68/
>       x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/8402b47493282b5ded5c57874125b6c06a7ab6b2/
>          arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/92a175988c4d278ee570911f1bb94dbef1caec16/
>       xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/64d36e6a31e58155e6989cc07ac10cdc4541818d/
>       x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/6f629ed0fbcf040358b3d11c1b39628eec2d031d/
>       xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/d5a416a6a91c1e0919f6620d0ed7eae6bb0e8921/
>       mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/41e6d4a6d8be9e5eb744c42b996732448b4d1121/
>       xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/9de914ef4fdce44bed45f977cb840c2aecc8367c/
>      aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/40595c148f026f7d076bc6c0dc4fe642c2e59a3f/
>       mipsel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c7719c196be41d36d52279410fe7d3593168c23f/
>        nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/0b606389b8f8e15df94b1590d2cadb4129ec26be/
>          arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6687294e6a810bfceab507ab006acf821da8c730/
>     mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4edfd5541f0f3825dad61882b9c0694eb1c4717c/
>      aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/81e4a65b027eb973c53cc9af8053731ed5128c11/
>        nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/23c675f2dac3f8cbcd4204c2cc7e35f2316eccc9/
>        nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/97876f8d1fd01ac3e3711009a6ff56bc74b262a2/
>        nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/65482edf8f72d8975eaeffd0756edc9ff733e592/
>          arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/b82581b8030fa15442c0d44771103e27c04f7ca8/
>     mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c7aaf1599f7dd3a5e932bbdd4fe220964792af3d/
>      aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/421e03b9573a1971e0da080c8d42dd39b8f9400c/
>        nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/283b501091890b77adcf6f030fb4955244a187df/
>     mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d0b2452fa211ac5528dbd3357d50a6c66a99aa4a/
>     mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/083f679f65c31aae80d65684f4c39e517eaec234/
>     mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/dbe7777b8e70feec6102b74f30e215e8479ff710/
>          arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/30ad12bf0fe451aefb21cf59a76b059758746c2e/
>          arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/a1503e0a053bfd724f9085908d2df51db798d068/

I fixed the fwup build issues upstream. The next release, which is
imminent, will include them.

Frank
