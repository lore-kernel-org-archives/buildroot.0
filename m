From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 14 Jun 2016 08:31:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-06-13
In-Reply-To: <20160614063031.5BEB81014E4@stock.ovh.net>
References: <20160614063031.5BEB81014E4@stock.ovh.net>
Message-ID: <CAGm1_kvZ3bxzAZS=DpAYaMycUOKhG6fs48e5JjsoxGko7QzbWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-06-14 8:30 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Build statistics for 2016-06-13
> ===============================
>
>         success : 225
>        failures : 141
>        timeouts : 0
>           TOTAL : 366
>
> Classification of failures by reason
> ====================================
>
>                    efivar-0.23 | 18
>                  log4cpp-1.1.1 | 11
>               e2fsprogs-1.43.1 | 10
>      python-dataproperty-0.3.0 | 9
>              bluez_utils-4.101 | 7
>           libmicrohttpd-0.9.50 | 6
>                   boost-1.61.0 | 5
>                    fwup-v0.7.0 | 5
>      python-pathvalidate-0.4.1 | 4

same problem as python-dataproperty. I'll handle this.

>                 flannel-v0.5.5 | 3
> host-gdb-6be65fb56ea6694a92... | 3
>                libsigsegv-2.10 | 3
>                  jack2-v1.9.10 | 3
>                linknx-0.0.1.32 | 2
>                   openjpeg-2.1 | 2
>                linux-pam-1.2.1 | 2
>       kismet-Kismet-2014-02-R1 | 2
>                 pinentry-0.9.4 | 2
>                     cups-2.1.2 | 2
>               host-libxcb-1.12 | 2
>                      vlc-2.2.4 | 2
>                    libxcb-1.12 | 2
>                     lftp-4.7.2 | 2
>                  php-zmq-1.1.3 | 1
>                wireshark-2.0.4 | 1
>                      eudev-3.2 | 1
>                      qwt-6.1.2 | 1
>              ntfs-3g-2016.2.22 | 1
>                 directfb-1.7.7 | 1
>                mosquitto-1.4.9 | 1
>                   gamin-0.1.10 | 1
>                    jamvm-2.0.0 | 1
>                  mplayer-1.3.0 | 1
>                    assimp-v3.2 | 1
>                 blktrace-1.1.0 | 1
>                 beecrypt-4.2.1 | 1
>                 cifs-utils-6.5 | 1
>                    systemd-230 | 1
>                   apitrace-7.0 | 1
>                   connman-1.32 | 1
>             lttng-libust-2.7.1 | 1
>                    erlang-18.3 | 1
>                     owfs-3.1p1 | 1
>        gadgetfs-test-undefined | 1
>                  weston-1.11.0 | 1
>                     ustr-1.0.4 | 1
>                     opus-1.1.2 | 1
>                  lvm2-2.02.155 | 1
>                 wayland-1.11.0 | 1
>                  rpcbind-0.2.3 | 1
> tvheadend-8e637f9f903f6d820... | 1
>                polarssl-1.2.19 | 1
>                     norm-1.5r6 | 1
>                    dvblast-3.0 | 1
>                    open2300-12 | 1
>                 openmpi-1.10.2 | 1
>                 mongrel2-1.9.2 | 1
>
> Detail of failures
> ===================
>
>       x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/2aae37eab514570f340f1604a3edbe2ec0679149/
>         bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3da59f16fdfde8e3c69a18d92884df0fca5634c1/
>          arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6810bd61e39ce11446500cc81d3ca96ccc2b8b93/
>      powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/74adf61ce9d08b8d45ab5749ce914a7f1ff90e0f/
>         m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3658339e1fc8282945d8b510d8968782db814104/
>          arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/614fc0a72b4e28419028fd48cc1b0b9527374fb6/
>         m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/bdd89f2745c6580a88295071ee575e39c1987f90/
>         m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5e0db9145aa780771b54bd80c55af8ab0c9b0064/
>         m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/d4284f2616b7f0fab2e667c7c34e7b065ebf2fd5/
>         m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/a0f2db04f9905d013c494ed88df764fab889fcaf/
>         m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5370e00f8db9a93b28f7d6cde5c2e99367bb06ed/
>          arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/4220e275dcc90e64545ad2d5ed3e0b51044f6426/
>         bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/0d8031b0d68847606019d08ac94088954be129dc/
>         m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/80d2d49ad751aecb763722ff9d1cb9e759d1bf41/
>          arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/c6578b5e167c58ee2d5564e8cf488e87edca6b38/
>          arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/c07950b7d479c3364b4aeb74ea3c6c2ddc585270/
> microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/aad6586565d5f6d25bbc20dc97e3b6ecd43e70ef/
>       x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/2c28810f92b48a07f2557a6a17606dfc5ad2ec75/
>       x86_64 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/b7d29838a3121153075b88e5b58f0805c96c6741/
>          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/0f8f559e5fa479ff3d4dd2bc47415a5de065b6b2/
>         m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/9a5b157fcef71a7d18e61f4b6d15c827ca25ce5d/
>          arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/7db635fae2ff08537e211cc942f5b0ae1b4746ba/
>      powerpc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/9d28297d09b795ea5ded0363f1591a5659bea7f1/
>          sh4 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/7a0f83653e4d276394cfe88ff8a4bde6bf2c7b33/
>       xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/b0168b7205d9f62cf24764a238c83cfbebf22c70/
>        sparc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/9083319723716c976c89f6554d1f3c9ab71f40c3/
>          sh4 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/f0da03956a9a491770235e2031fa6137e61c30ae/
>        sparc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/2ad6f74ac4bde1c2b55f8a48e896e1250d5ddac3/
>          arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/8015571ba800c3357aded29599c8803ab253f84c/
>       xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/78ba41c6e47264be7e7287fdda4c08b974aff45d/
>         i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/1430e08508cdb1106d535b5acd15386b2814098a/
>         i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/309570ecd1483beef2269aac00a0ab2a8bfc54ed/
>          arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/bb9d31c16b8865acd2ee8fe3f61848e836b0c131/
>         mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/56fdff9c5e14168b559e97ec6003b7dc75663b74/
> microblazeel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/533e6747c6df002f023e9e362c66edc8d4a5204a/
>     mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/8772470a16725ee67fd02631f03cc3ef16dce276/
>          arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/98e96e5d8aa0cf50d28b4229989142317869d2b5/
>        nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/8f65745c87170fdafb863848d778f85c3f138c06/
>        nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/d3d33974c686ad207bf6dd6aeeb5b615de136834/
>         mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/a8e7fc85993201be4843adc5dfc0580647886d95/
>          arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/a5d85bf0d1e64e773cc52d83370983f6f4761ed8/
>        nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/83756fe7dd5d21b49a7f5510481521804551fc8c/
>     mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/297a1f4aeedf628c16a72469a0c162095ead5d1c/
>         mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/63402b09b85e4301b4c002979f58658d420b66bf/
>         mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/17ee8db6fdc630dcb32661ef8f8392d500db1c1b/
>         mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/2fefac23c4e023afc9dfd1556df3e51dc0600243/
>      aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/a5a171d6083f718ab88342a4dc24f50c65d9d52b/
>     mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/cfb3a35450cf014798707421eb9ea26133d9e590/
>          arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/b321ee03d84f9bcba02e7dd4b203c4b0f92f033c/
>     mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/ba30bc71a79714fa4b164faa7697bdb69fe11484/
>          arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/1ae8d6b64a11a31b2b97a846f90e04c3494d18e5/
>          arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/693a5926e3b6cbe99dbd9f8e4656ba5abb602b73/
>     mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/932ab978381f754b36322b3fd95e0f2cb0cd28cb/
>     mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/b6cc9d87855b01025acac6572866e55499f9022c/
>     mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/42f9f51cb5a985abefecb0a022e5ef213afce226/
>          arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/3e5c52c575612bf5ab58f86ed4e1c6169e0d69e5/
>       mipsel |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/1592d10afbbdb8762017014c3d265fb735044738/
>          arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/5dca6ef5717b7307e83a9ddf6c722f42a21175e4/
>         i686 |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/bae61150004582b16664dc77c5fd542b5ef2cc53/
>       xtensa |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/ac65b3ba88c9e1b31e24ad1a29be4917d4a71667/
>      powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/800b4d960aef81766925bf37d7edc64ca2828fbc/
>         m68k |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/966bbb1bb46daba2820eaab3fe54e37f7e054e2a/
> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/15878b5f87389e08edd2421a49c2e7b4eeb024d5/
> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/eb8dc012f579047a7481ed19086cc21ce3a7ef16/
> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/0aca87ad0c5e2e6282a3be3962197736f2c64293/
>       xtensa |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/d41bda9e60cb595dbcdff0fe29b274a74eff8ac6/
>         i686 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/eb54555dc35dadc460dcf0455c6adadbb5dcb673/
>       x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/c11f2a6f3054847515ff86d8f9c67bb04ac5c3ec/
>          sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/efd7a79e3fb9b630653d5f9f8897f7b81ec4b0fa/
>      powerpc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f34b2da0a8bac545d3d93cf71416fefadf8027d6/
>       x86_64 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/fde6ea18c8f88dc1a8f15918713541dd7dc590de/
>          arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/5e9a52118ae2037ba2be4fa85976c7b2ea4022eb/
>       x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/6ad75ee7065e001cc380c3da433f63ce4b4b3a7d/
>          arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/339cb146f3900551b6050d2ab6d1314d174ac058/
>       xtensa |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/0838b6afa9fbbb44aa3a865f4d0a729a1e956bc0/
>         bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/d3dc04a59f3ed6c4747c9469d86e591d0bd86be5/
>          arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/ff058a378b91740b5b399f32a6b375fbc3c8df06/
>          arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/d03d36bfd4a97ff8091a815a45b4670bff992233/
>          arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/cee5f5aa6662c818dd9c749bf5cf6112337c3445/
>      powerpc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/734652bbdd7b6b18a8d67a30fe03bed62cd644e7/
>         bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/593b5050473a83a9ddcada9de39f8f14ab38d554/
>         m68k |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/192660aa9fc20160db0256c1f2958993c46ee764/
>        sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/4f9412e1846e861edc3163559f488185ad5da7e1/
>        sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/bd8a55b59fdc95fc210bf361d3ab9ce5aa82680a/
>       xtensa |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/81eec881e645ea14a23e6170747f464175281502/
>       x86_64 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/6c8000aec3e61df7ea9cda0c70b0e18c81559514/
>       x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/da221feaa56f7dd58f3e15220e36eaa61c41e67e/
>       x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/c0f59d3f9eb115072d410ef199f4773f2c380d6d/
>          arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/8027e52324d225261bd889688179e19b8a332c97/
>          arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/8194ef526045eb36a7084183a5274dfcf3a3c8d3/
>     mips64el |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/b7f94ec60b9c1e6616e021c0f4c16711304b9f9b/
>          arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/4d6660dc0b00da89521db762de5a1cf680056189/
>         sh4a |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/a3f05cd9f96146f1bf9cd216bfa444aa3446abf1/
>     mips64el |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/3533a32a7de7dae288558f43eb2b068081939e4d/
>          arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/16d7b6f25c2de7cd26d64a6b7844d7c406dd843d/
>       xtensa |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/838976bf9568d9da3ef1a02c7bc4e7788c66db4d/
>      powerpc |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/d2df279700c0e758ba2aef3003667f9f73d7ec66/
>     mips64el |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/6a8239c4c7375f864a47be1bfc5cc1b0eb0d876f/
>          arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/f28d8320a920c83646cff86c70f1ae51d9a7c520/
>          sh4 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/8ea90f76cab07fb2238e2a59e4e2c6abbe43068a/
>          arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/844e17b7d2304c52952a67b7b5ecef2244811f8d/
>       x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/a4d0d3a26977ebe693860233495625db03dfb651/
>          arm |                  lvm2-2.02.155 | NOK | http://autobuild.buildroot.net/results/dcd94e8dfedf1f51eddc1added642b3796ad0b16/
>        sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/2812ce7efe20585e0b393b4002e172401f1f5c1f/
>        sparc |                mosquitto-1.4.9 | NOK | http://autobuild.buildroot.net/results/4e0896cf7848bce604d8204e5a02a61315ab9bcf/
>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/72d0cb20d848011341577ac3e6a231cdbe8c7cca/
>          arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/98ee11ebe29f85d3fdc0253a5d86f51d990ea67e/
>       x86_64 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/ca406f5face4203d73c2236f24d7c6598904a34e/
>          arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/ab1a2b18bd003b6766a6ff727a961cc7ff91d82d/
>         bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/9f34679b5ae48c529f70c4d8b7a69985eceec7d5/
>         bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/c9efc8552394740eea5fed13eba3058fe6a68fbf/
>        sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/99b79121f802a1aec3511aeeab91caddec966320/
>          arm |                     opus-1.1.2 | NOK | http://autobuild.buildroot.net/results/cedead79988880b8e8700e4354d463e0462f99d2/
>       x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/34f05970c8379fc9f009a161f3a39fc4af777b07/
>         bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/da67a515eff825a57e523b9f80485a4c50fffeda/
>     mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/242e99e66cde0c11c739a5ecda5ca990e6bb4865/
>         mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/6436fefcac0eba6a0ed9c0f2f410bbd98810d31c/
>          arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/d28603376217779fe99a29c1d1631d19c7a1fec5/
>          arc |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/d8672f6195b317ff70afc149f89db5a148b41d68/
>       xtensa |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/7a5ab17fe5473e7c395154271a6099cdd9622f6d/
>          arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/bfb3cb583437bcb9329f2bae2d64e93cfc01db10/
>     mips64el |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/450b28661c2c27ce9245389d4b0f4a5aa6eb286c/
>       xtensa |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/e3c333b6bb0b1bdc998043606d066dc6b73bc183/
>          arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/55121f6f74488713dd48ff181033bea08306d237/
>      aarch64 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/fed49c3fc9cd2b55b0530c7c130a2abae8535932/
>          arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/02433f2e90e9b95d7083ce1d97d3655c551663a7/
>      sparc64 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/7e82807a33f38dd6cd63c10c538e688f23ac9ff8/
>          arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/4eb960c5707e6afd5d281df6efd91c1a7177609a/
> microblazeel |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/380d9c5849ec0228e37b0b73500f4d04228db192/
>     mips64el |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/5efa6f538ff32143cf481b0fcde6a98cd949a4ba/
>          arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/828df60c101df1b45caab79c51fe4e42d9bca6b0/
>          arm |                      qwt-6.1.2 | NOK | http://autobuild.buildroot.net/results/2a8edb18ab7f8a9e324966282858014e9b5bbea0/
>          arm |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/f93db269b616a7a5fea35e8faaf5fa84f347d935/
>          arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/19c98e8cda42ceaf37b8a29ff6e6ee19cf6cc9bb/
>          arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/98bfea188d3a3c1902ce19298aeb7554cc332dc7/
>          arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/84979552982ed85319fe40355eb5e99dcd29a512/
> microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/aeb3ff1ef362798672fb0578e49459887b81bd32/
> microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/2033f4a20bff3a84203f4a028910aa505487b512/
>       x86_64 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/e42619310977be7fe9cf3691dfb277c9cd4b3790/
>      aarch64 |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/0068332ed7001181a17962495a1598789fd77955/
>          arm |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/3f1ec8400a2db1341dffa98b3a6bc8e5211ccd20/
>
>
> --
> http://autobuild.buildroot.net
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
