From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 07:08:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-16
Message-ID: <20201017070855.3770E20529@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  2  |  0  | 21  |
  2020.08.x  | 25  |  6  |  0  | 31  |
    master   | 102 | 62  |  0  | 164 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 8 
              asterisk-16.13.0 | 5 
                 python3-3.9.0 | 4 
                  boost-1.74.0 | 3 
               capnproto-0.8.0 | 3 
              host-guile-3.0.4 | 3 
                       unknown | 3 
package/gstreamer1/gst1-lib... | 2 
        python-m2crypto-0.36.0 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
                  uhd-3.15.0.0 | 2 
               apcupsd-3.14.14 | 1 
              bitcoin-0.19.0.1 | 1 
                clamav-0.103.0 | 1 
                 dc3dd-7.2.641 | 1 
                  dnsmasq-2.81 | 1 
               domoticz-2020.1 | 1 
              ejabberd-19.09.1 | 1 
                 gerbera-1.4.0 | 1 
  gobject-introspection-1.64.1 | 1 
gstreamer1-editing-services... | 1 
                   guile-3.0.4 | 1 
                 haproxy-2.2.4 | 1 
             ipsec-tools-0.8.2 | 1 
             kismet-2020-09-R3 | 1 
                   libcap-2.43 | 1 
              libostree-2020.6 | 1 
               libuhttpd-3.4.0 | 1 
                  luajit-2.1.2 | 1 
               mpdecimal-2.5.0 | 1 
                    mpv-0.32.0 | 1 
                    quazip-1.1 | 1 
              sigrok-cli-0.7.0 | 1 
               util-linux-2.36 | 1 
                    xen-4.14.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7a2cc7a4ac2237c185817f75e55e05d144efd100 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/aa6c85646be9692b62fc2745ec81d7ccb4bcecdd |     
   s390x     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/628227be9c6fed9e7311a2b5e0a6672377726c99 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/c4ed3d82665c606f9adfeac599d15f6ecbfda679 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/352bf302ca411a12c1be11f24dbc8524ae50382f |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/dbe284e177c7ff8ba4564435482b1b0cbf2fc2b0 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/9106af9e6342b8a51a3a556f36cdc3464b739bc7 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/84920402513eee6f30536e348bc4f1d40d49a409 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6a800004456e2094d92082b018aa2b2235ff9e91 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/899e640afbb374f5ed23c37ab04124138cf23f72 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f4d91d51a2890e5adf461a5e478df11be91d965b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d29a8498cc5c36474adfd42e1dd6ef16df7a136d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/63e7ce31fcbff39840bde661d3517e6a93a5e645 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/e539e3ce23c8fcf0fa4c690fe4b41fb0adee544e |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/628ae4ca56812ccaf3ec481404d88b899dcb1eef | ORPH
    arc      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/af6a99ad87ba462d324f639a884d3f8ba85b6aa7 |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/430bd0cb1f88eab30e7047ee0848b19bc50d7ca2 |     
   x86_64    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/b1ebc850769c26aaf81e3013c3c0cff5631c0493 |     
  aarch64    |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/97017ba07361cae2250ab14c10d009f2cc9cb923 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1c11fc7306b58d5efafa3864fc32173ab88b3c7e |     
 powerpc64   | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/e9d96a63861737d82734559db5e5ffbf5996ffde |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/a3983a0627f5ec4aeae5b74377c666dc36d49cc7 | ORPH
    sh4      |         haproxy-2.2.4          | NOK | http://autobuild.buildroot.net/results/f5cac97e60f27588eaed26933f45bebb20702d2c |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/8026f8f132358917691bed113e41ee1e939f2e80 |     
   mipsel    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/0b678997297cd9c3c852de9ec3c48369f6f9e639 |     
   mipsel    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/4b3987372644229b6bcb67791528187ded829f0e |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d1d4898ec8b722e026c03de92acf2a3e5b41f373 |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/564031c67b25a3a8edd5e885e9bbb8c935773e4e |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d2b72fbb09e558ba22bd1daec44e5d2759c0de8f |     
 aarch64_be  |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9f60cb402ed4ab4763eeb6a5c11fa6252991bc27 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/6a429f9702583ffce54d647b59926b3858005442 |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/42744bdeec7999113fc59d4eb96304499d6a4566 | ORPH
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/6263701ae0b39de265767890903ba34792579aba | ORPH
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/a5234fe71b5c6fb390aadbb7d93ecdefef894fd1 | ORPH
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/327a24d51cdafa28cc1d5b1b6e7a83640fef8ce6 | ORPH
  riscv64    |       kismet-2020-09-R3        | NOK | http://autobuild.buildroot.net/results/9c3d56ef837c7c5bfbb34a0ec51b349108e201b1 | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/c8a6de6d485b474561f2dfc6d0de71cbd5f0b60e |     
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/fd8c40d32a22cd4e5f2208b8f3d534f916c49b27 |     
    arm      |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/b2bbd0681705b94e6b531996b39f62e47f089c92 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/01990df77c35302793d073f74bd6230bd3a96438 |     
    arm      |        mpdecimal-2.5.0         | NOK | http://autobuild.buildroot.net/results/40e50ffd00dacbaa697cde67846e0fc570069f56 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/7acdfa6c615a64b7d3953353e07c7f335250b38c |     
  mips64el   | package/gstreamer1/gst1-lib... | NOK | http://autobuild.buildroot.net/results/5dc145d1eb62ed1f60cf21e6151ac2e39665bb0d |     
  aarch64    | package/gstreamer1/gst1-lib... | NOK | http://autobuild.buildroot.net/results/b8eaf73dfedbf3f2341cbb697d8a997a510fb384 |     
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/28ec2d2f323742436b18a0a8ad58b9cbe776b3e8 |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/c159c7f4c4ac3dc9252e134e1ce1b5cdee2178a7 |     
    mips     |         python3-3.9.0          | NOK | http://autobuild.buildroot.net/results/55e03f23d2870be78925f517d882a9679ac3e154 |     
    arc      |         python3-3.9.0          | NOK | http://autobuild.buildroot.net/results/ae3e2801295ad153d84b84cf0ef6d9415770f4bf |     
    arc      |         python3-3.9.0          | NOK | http://autobuild.buildroot.net/results/5f39e95cac37ada7eedaa06e0c49abf736db1b10 |     
    arm      |         python3-3.9.0          | NOK | http://autobuild.buildroot.net/results/5caab38f62aa21a00dfe0177aeccfbebfb25b49f |     
   xtensa    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/a77a191ee1181114ccdc36562b36462ed34ddf6c |     
    arm      |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/8f340a1bf035be251b44726505b600565b23e3e8 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/7f346800f109be3f8dc2ecffed49eeba26a7e852 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/291afb71ba85f1a1735adb829705a626b8b8dd40 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b04375d25da7e74f4d4e45a80d799cb9970ebde6 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0b6bca88b5386e8e53a254b8ba7260fd8e60f036 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/dc1eb6081f269f205e15d9f891c0cf453d2bd2d9 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/6c4f8d0e3bf8c7f7aa9c116d13e65f148a376a52 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/8cdf72ec03841135606d067cb55314fcab93bca4 |     
 powerpc64   |        util-linux-2.36         | NOK | http://autobuild.buildroot.net/results/20faef7f04704e2785ca7a9b8c4348d309e9bb5d | ORPH
    arm      |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/08948e4c4a88fbf09cae524949e5b656882a6e9a |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/29af0c50d75252d138ddf70580f75c5970fbf239 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 qt5svg-5.12.8 | 1 
              spandsp-20180108 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         qt5svg-5.12.8          | NOK | http://autobuild.buildroot.net/results/71005ff50db12fc217b27a6bb9ba228c4c8c5ac9 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/f07bd037a7d2e359a06dd505a2781be12836e68f |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                  ffmpeg-4.3.1 | 1 
                   gvfs-1.44.1 | 1 
                   nanocom-1.0 | 1 
               protobuf-3.12.4 | 1 
                suricata-4.1.9 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/4d7842ff17b6d6471d1c74a0720845834b193e12 |     
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/e4e385e5ee70141c0b335e5b8ac8f9ea33ca98e5 | ORPH
    arm      |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/13f695c41966494278958a402985f9bf8b006200 |     
    or1k     |        protobuf-3.12.4         | NOK | http://autobuild.buildroot.net/results/86aae45c3fc530c9815bb7e07bbbf2eeeb91347e |     
    m68k     |         suricata-4.1.9         | NOK | http://autobuild.buildroot.net/results/e52d4db2892220a4f2297fad9a96b160e24e2458 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/6260160b094c9ca9f8102af6f8acdca21128867e |     



-- 
http://autobuild.buildroot.net
