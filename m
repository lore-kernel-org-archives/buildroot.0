From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 02 Apr 2020 06:28:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-01
Message-ID: <20200402062824.9D60F86BC4@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-01
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  4  |  0  | 16  |
  2019.11.x  | 18  |  7  |  0  | 25  |
  2020.02.x  | 12  |  5  |  0  | 17  |
    master   | 165 | 83  |  1  | 249 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   cegui-0-8-7 | 20
                libtirpc-1.2.5 | 14
psplash-fd33a9b3d68c89fa22f... | 9 
               libglib2-2.64.1 | 6 
         python-markdown-3.2.1 | 4 
                       unknown | 4 
                coreutils-8.32 | 3 
                    brltty-6.0 | 2 
              host-grpc-1.25.0 | 2 
                 mesa3d-20.0.2 | 2 
                    mpv-0.29.1 | 2 
                     vlc-3.0.8 | 2 
              ejabberd-19.09.1 | 1 
                         flann | 1 
gr-osmosdr-46698a67e7e06419... | 1 
          gstreamer1-mm-1.10.0 | 1 
            gupnp-tools-0.8.15 | 1 
                 haproxy-2.1.2 | 1 
           host-nodejs-12.16.1 | 1 
              host-systemd-245 | 1 
               libupnpp-0.17.2 | 1 
                qt5base-5.12.7 | 1 
                 qt5svg-5.12.7 | 1 
                   systemd-245 | 1 
                    xen-4.13.0 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/010a4a1f2e338e3a6b097bce2934f918e53c01d0 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d5ecc475185571b7cbcae1a246e13b397a108a29 |     
   xtensa    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/123db6c45ea5c468a18a60e971e86724545a941c |     
  powerpc    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/89fa9b66fe537af85f60d3a7156d7b78e0b01a86 |     
  powerpc    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ead31e374978e4600e3024554cdc7326a95d3356 |     
   xtensa    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/b26d07f9536a92d6a76de7dab2bff0082f22eca8 |     
    m68k     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/3c4d464c77c254a1887edb519008df44779e4bcc |     
    arc      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ff7380a0ef225b8e57339b7e0dc01014ce4e7d52 |     
    arm      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/33abd46677705e88e3b530202dc0a2c6f446a5da |     
  mips64el   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/a97dd2dedf52878b525679b353ae174ff1940845 |     
  aarch64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/7427ac1c557d006ce37617eb1e6436ebcb792b66 |     
  sparc64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/e3887a806d882ce475a543d5642beb8b598e800d |     
   mipsel    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/59a593a76d83cc0eb629b4eff71a9bdd502c7a12 |     
   xtensa    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/6a29d1e2a68a113de17a44765830110b1f01a0cd |     
   x86_64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/d55f5003fd56559bdb43d3eb92e76a2a0d6d87ab |     
   mipsel    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ecfc702f1b67e0505af3e97db84ae14aa11d987b |     
    i686     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/781b9eab23b9c992256eab240e0c314de1e5e643 |     
  mips64el   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/2a4cc7376637335086450c3a8d2916663ea27562 |     
  mips64el   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/0eaaf799a097fe69d86ba1c6fb2bd30d81c965d1 |     
    arm      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/a7c5eb37b1d1bd5c95122d73001b793ad882b056 |     
   xtensa    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/0991238df6df681ac6866d46ccde4acf2d8c17ba |     
  mips64el   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/59c49dcf02ab4232fd7eb4846cfb3dcd5dd24523 |     
   sparc     |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/fa283fdb2ed4ff591d013cd71f007ed1ab1c31f5 | ORPH
   sparc     |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/085e707f6b5a746048e900518348f96819ac879a | ORPH
   xtensa    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/388065e34659b8feefd27e3af01aaf7f24eb78a1 | ORPH
   x86_64    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/dcae803381a5295a1e86b7a464bf4d3bbec2e44d |     
   xtensa    |             flann              | TIM | http://autobuild.buildroot.net/results/858e98feb12928022915b243b95730e255ad177d |     
    arm      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/ca46f3ebbcdbd7ac7d7c3b9781354638769fba6b |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/9a41dde011f032f11fb6287de4bcf39aa110e247 |     
    arc      |       gupnp-tools-0.8.15       | NOK | http://autobuild.buildroot.net/results/f8fb7593546ab7fcab6f842a9c2725082c72da0b |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/4ee3f70aad6b29a385c4583899b2093ed9316bc1 |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a7b6f2e0ec0d6190ad3d8987bcae23807add768b |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/037d82099173fc017b446f45b760e92eb16eb8a7 |     
    i586     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/8ad67efd68b45a7e7f7734377e3863c4ad7fa101 |     
    mips     |        host-systemd-245        | NOK | http://autobuild.buildroot.net/results/dd01ab176928161056c2699751724bcdba180ecf |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/b8a9bf4e5f5b1de916e6c403c093207cd1784ef5 |     
microblazeel |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/722b15b325be6c6e359895832be13f3e8377254b |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/81f099853c434e9a6ae5dcc9f843dcea1dd8cb0a |     
  riscv64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/a3a5d597fc09b23b1c3d80ac0f1bd1e543ede906 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/01e567dc890663383c78d59c0bfc345ba9bae142 |     
microblazeel |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/986908bf20712acbc73b91aa29089203ad08e794 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/c3d2ad3e3d7664eb3f2887568b78951eab78474b |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/547b1efbfbce02fd460bf62a2332528b98be949c |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/193fdc9e71f69711918e56c4398d488b956a9922 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/56d3688ef84315cadc5d1191b252317f4ec0d548 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/193237e23263603a96f38cd162fb9673d965778e |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/67d6002ac655637ae09147b5568e87df45ce490d |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/51e18b59a39d014517a0ba075e747afe41a5fcba |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/208b96959e39f74016db814075f5c4f779e70b6f |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/eb536539b1215de455a09a11f753305957e9a1a8 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/f66aadf5969bbb6fac7311eb7daf2dd97e00c56e |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/955a37a5e87fbc9654b184c031a53561acd4ff8f |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/c513c65d466be6c6b0fba2608f55570cc8a4e5b0 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8d278fa89ee78a0214ea760e3e60feb5329de3fc |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/49701e2ebddf14f45bc33e1bcd7f48f06801551a |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/36cc3e3d46cd3da974bf33757fa3512bbdd100de |     
    arm      |         mesa3d-20.0.2          | NOK | http://autobuild.buildroot.net/results/4de315bae015a3c2116848f300332fc649935318 |     
    arm      |         mesa3d-20.0.2          | NOK | http://autobuild.buildroot.net/results/aaa3c7d9687f29dbd3fa5f129a27046934267371 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/db7d26ef7cc488176b67a73546df7d71c3ad0d8a |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d709358fd5f7d7d336d5150fb4815cc23298644a |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/51fdea956ea4a337c231bb6970fb14ee83839126 |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/698fa96c124b8e47831dbc90d6cc6b0ec9994543 |     
  sparc64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/6e5e2e51d783c8d1d9af4aeefc5e4ab9df4b1f63 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/4b6d65f8a40bf547031da55da459d289d722c3ec |     
  riscv32    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/28239fe53d23996fd81a2e931e12e8f050617274 |     
  riscv64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/55a0690733852754f6ed76cda58a71979dee9305 |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5d3fce92797fe018156318eed21ea97e732d2190 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2569dd6add0962fe400f37abdfa075494ef24751 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/929a17b2ce3eed226c5eb50f6fcaf88d8e522db4 |     
   nios2     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/04481149ca4210d54ec88b0334306e4dc20253ec |     
 aarch64_be  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/d751dc38352860b9c9c9d7c43fff4162d322179c |     
    i586     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/0849a03f500288707a39b89ffdc41b74f75cba06 |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/59ff62b705aca618efc930e334823b924da79c53 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/7901b0372f36eb98464d3056c83951e20c9b49a6 |     
   nios2     |         qt5svg-5.12.7          | NOK | http://autobuild.buildroot.net/results/47a9e2d3babe7977009f84ba74190f21da801772 |     
    arm      |          systemd-245           | NOK | http://autobuild.buildroot.net/results/520dab2253f4cbe408a8177a6587dcb38c6ba215 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/d39a6653a9109ee5b3a5820e819c04269d23651e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/5a192cf0b3525f010db3e992424918bdcb9aad31 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/7768dbd85d112cf0e5cabd4ffa60b084f7f88c2b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/3a3b72f36cead59dddada1b7c13f036c7cda2edc |     
microblazeel |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/c9d529c55d003d2cdcf33438a744ee4c50dff321 |     
   xtensa    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/20a80a8374f61ac33235aa72682bfca7e832522b |     
  aarch64    |           xen-4.13.0           | NOK | http://autobuild.buildroot.net/results/3b7dc940bdc771ac12635e80528a03a1c60b5c34 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c0773cc4b4f7d21fbb6282627119228890315877 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

host-google-breakpad-7515ab... | 1 
           host-libselinux-2.8 | 1 
          host-mono-5.14.0.177 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/eb416ffb204b06a25dacfb0842e1ea8f9c0dcf7f |     
microblazeel |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/dae0c39bfba9eedd2bb67058b67891044e6af64c |     
    arm      |      host-mono-5.14.0.177      | NOK | http://autobuild.buildroot.net/results/2657a6d241d0efaaf0a2285ff7a924705077ff82 |     
  riscv64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/75d647b63780a86124f8f2aff3b53225e0623237 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 3 
                host-go-1.13.8 | 1 
              host-grpc-1.23.0 | 1 
                    mpv-0.29.1 | 1 
                nodejs-12.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/2df871d19db1427203bb2343538fc8f0a961fa08 |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/459af3eb9e05ae56559b6318ae2e1e364f1f6987 |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/a457c3d1867ddc1e964dc0208b18a67f26884af1 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/f0d4c8d47bfa88c5f7d60a3da5e9f373c9137702 |     
  powerpc    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/ce03269899cb2cd62451128ab0b15b0697f4a672 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7c2e32426c8d284b7cd960237610860a3f458a6a |     
  aarch64    |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/af82fd236b536bf1415e5992ca749cd640abd7e9 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 binutils-2.32 | 1 
                  cairo-1.16.0 | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.12.7 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/4e1071f97d3ec387a82f5bd256f4ad27e8480d20 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/bc0094465b4d0616edfbfa7ddb2d0ee5bf6df7c1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5c1a12ced85d24fb3b942ccfc61034802aaadac6 | ORPH
   xtensa    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/3e63fba85b4983dcaf89e5fbac34d1f11e3a1b8b |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/82b30833d905062b5f6679896d42906dd836f108 |     



-- 
http://autobuild.buildroot.net
