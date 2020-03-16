From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Mar 2020 07:26:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-15
Message-ID: <20200316072628.01AFC89389@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-15
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 24  |  2  |  0  | 26  |
  2019.11.x  | 18  | 10  |  1  | 29  |
  2020.02.x  | 36  |  7  |  0  | 43  |
    master   | 181 | 124 |  0  | 305 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   bearssl-0.6 | 12
           mediastreamer-4.3.1 | 11
psplash-fd33a9b3d68c89fa22f... | 11
               libglib2-2.64.1 | 9 
                  connman-1.38 | 8 
         python-markdown-3.2.1 | 7 
                  ffmpeg-4.2.2 | 6 
                       unknown | 5 
    host-python-markdown-3.2.1 | 4 
                libtirpc-1.2.5 | 4 
              host-grpc-1.25.0 | 3 
             libopenssl-1.1.1d | 3 
               belle-sip-4.3.1 | 2 
              bitcoin-0.19.0.1 | 2 
                    brltty-6.0 | 2 
                busybox-1.31.1 | 2 
                   libnss-3.51 | 2 
                 mesa3d-20.0.0 | 2 
                   mimic-1.1.0 | 2 
                  ndisc6-1.0.4 | 2 
                qt5base-5.12.7 | 2 
                  zeromq-4.3.2 | 2 
                  apitrace-9.0 | 1 
                  cc-tool-0.26 | 1 
              ejabberd-19.09.1 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
                   gupnp-1.0.4 | 1 
             gupnp-dlna-0.10.5 | 1 
                 haproxy-2.1.2 | 1 
           host-nodejs-12.16.1 | 1 
             host-pango-1.44.6 | 1 
                libevdev-1.9.0 | 1 
                linphone-4.3.1 | 1 
                    mpv-0.29.1 | 1 
                openblas-0.3.8 | 1 
                 opencv3-4.2.0 | 1 
                oprofile-1.3.0 | 1 
                  pango-1.44.6 | 1 
         qt5xmlpatterns-5.12.7 | 1 
                 ripgrep-0.8.1 | 1 
                thermald-1.9.1 | 1 
                    tslib-1.21 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/8baadc1f5e33e3e17b3cb72ba17c165c0d15c753 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a293eeb1dc8644ea56053cdcccb2c4c2d927d6b6 |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/9f4a2edf078fb6730f4d1a3b2bf210ea59995096 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e0f75cfb92f086a0f100b9f5ac1e3b95e2f916cd |     
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/cebaf870b24cad52b40603353db0f91338dacd2d |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1b33ddd64dc0a2919932baa30e54c5dd5175114e |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/cdffa77b1be4514abbb716980a4251a22aa1d353 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2fb36cd2306e0cfd96e52c5c7ce7d07dbb66cc46 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c94006b84e2eeb187fa8e4416f2f0fa91dc77db5 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/9fd0203142001b2b69ed80768869c2507443b376 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f8c13d50b954be65a452910115b20eeb392e7206 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0c87c0280dc45c5f87b166b507a333d2c3964924 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0408b3fe4000f2fcc9976836a22548a104a618f3 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/efe7b995d6276a1f91aeb67224de43971515ecb0 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/62d3f1444fc28838c03df9aea3525d72a86a9c5d |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/b05486e88d858edb1eb267f9f8c5dd285bad931b |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/9bdbe0d7cc65fa3856ff90112d29ccd78b5f2d77 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ae0ac10e7a25628bf138a2c2c1cc04d7e8a4d209 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5e899a670cb8d570edf97553b2dc4c7023108d61 |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/85ffbb68e9ff4f1c92294b2afe9068fe1299e42f |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/12b4db3616ca70ad086dfdde1ec06d208ab38aa0 |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/5c88b6aa5c9a374f868ba1bfdbddb3aac9b9b005 |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/1dd9916346db848b892fd5329648cb12d20ea012 |     
    arc      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/62097d1b94cfbf0609f32e52296d4f26cd842c3d |     
 powerpc64   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/2f3cfa48c3cabfdb5b2036d14b9116381a366497 |     
   xtensa    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/3f3c8be38dfd2c75d5644ce2b797ade223ddcc34 |     
    or1k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/87d21a166d60776716db02b338092c3e168a1b6c |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/d7243cb1e8dc974b6c5572e4b77dc22e31b75a04 |     
    mips     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/72fb8ae9b5320400bea70b01876ba15e1103a80f |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/bdb3f96868d5edc5d26ea26d6ae58119ea74570e |     
   mipsel    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/1355df4473243bfce404f79934f9dee05d66d1b1 |     
   xtensa    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/bc5d2362a4ab7fb3dda57f19e37848bc16a2418b |     
  aarch64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/97a50da3c52888de8210f93a9a5e99cfe42d7ec2 |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/88bcfff51c9a60cc897f8cece327359a4b4afaf2 |     
  aarch64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/73ef36e75c9f2b481f89c2839160c308ec7cce07 |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/15513adbbb2ccc4434a6f622c798207e7ebb5dd2 |     
  sparc64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/0cf8607d42a59c7fbe3b5929f65bc47a28d79a5e |     
 powerpc64   | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/783381a58d214aae7b7301efdf0bb9bff58fdc5d |     
  sparc64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/dd40459f9627a79fe248de558e03064076d3d31a |     
   mipsel    |       gupnp-dlna-0.10.5        | NOK | http://autobuild.buildroot.net/results/829a84b37db7d9141785bfe2eec2dd0e6d3310f1 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/01f1ab0b47ba580eaad7d0ad5e8ba58b9b508654 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a2ec02ea88aa4864383c861bafc97deb1a1d995f |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1895d5eeb3d7e40145d37cd673b49d79f3dd2203 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/5ad725ea48df49c7e6c36767bba6a51921d66670 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/db98edeef66c60194a5b6d9f340b04983ad8e123 |     
  powerpc    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/b4a198920c3ced32b87bfc269a30f9e00919a0a4 | ORPH
 powerpc64   |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/f6b38ada75194b4b3394f2fb37b7c8301eeb1762 |     
powerpc64le  |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/2900b837ec5cbb6e2136a9a3d1e86149376713d7 |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/63d370f729796b690744fd135384394c0f0923ec |     
   mipsel    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/c1525b9972a2a54c52134a5d0de3291a9d3c3dc5 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/7ded76ac68509781f2610ea2e066370daf11deed |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/72967ab9746e6c0bebf4473f5d5e60ae7cc5de03 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/8339c29145e09c344ef5c866363e9c6447bdaa41 |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/fd7dc5eb19b3a3d7ccecbc5b20a8b9a93cbb5faa |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/d034f512a8e7a2392fc9ba0bae078aaeb81f7706 |     
    m68k     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/0e4d8523aa3313903abf9746ccf7e55092fc18e6 |     
   mipsel    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/977ade204922faeb7f4918d677f2a891842906fb |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/8489bdeb4b14894f6d6ce6e17f329067dc30057e |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/9d8b9d01d2ec274af86f85de9d9680abc9fe18bc |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/1c1f194d219f0eb9a995915d861b70ac72cb6cd4 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/c0b779a843f64acd6392af96911696d44f323707 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/e43892e96ef8b0cf38f21fd850c0c8f3a2e409c3 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/3b7440fd70ea7ffd80d18d6ab3434c1255d0f1cc |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/9ac7c259b907ccc368d619a5cf456bf7f59d748c |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/1dcad1380b87b61be2c2973f0e9641baa03f26c9 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/25e2c370291b264b58c11721f7dcf04d52a9f15c |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/30c9180206f714dcc151b575fe1a7ba25d5452d1 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/bff0fa29f79271dbcfc78261e809a061a6078011 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/45baee68e5339e788ae1040a5b21d53774ebf6fe |     
  powerpc    |         linphone-4.3.1         | NOK | http://autobuild.buildroot.net/results/d90bca02c2771df8dfbf39892d529fb5f9069656 | ORPH
powerpc64le  |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/d3066359a0652e5f997a0c07b895dd6c1b85fbe7 | ORPH
  aarch64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/085cfd53693bbd561e993c96857f0be569716a3a | ORPH
   mipsel    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/885c47a9d173f01443498c68a56ec40d5c581922 | ORPH
   mipsel    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/cc8dbb0bf1e48c37645c59ff0b895857c3f742ec | ORPH
  sparc64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/bf3b4aa6ac0da3f7e871f544d6a8e41de1c3418f | ORPH
  powerpc    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/9a72b9aa4126ebe5ae9e489ffe8d57ad629bc77f | ORPH
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/862bed12072abe73dd95419165334fe5f96bbcc0 | ORPH
  powerpc    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/76898fb8e1055f34fd56cc35f87fee080f321292 | ORPH
   mipsel    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/e500ff223126c21df59567ca2a9c7262c16d69e7 | ORPH
   x86_64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/409a9bd99a85a1959d2f31d437b7919678d2c78a | ORPH
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/0e220c6b57b619380ed790520b5ca1ffba3bcbb5 | ORPH
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/a01b58f638f3c7eb3e955372a408ccaeda334623 |     
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/38a3f6c09d3ad63326213a1f4963c5a5b26cf3d9 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/106d336a79a1acda1dd6f823ea906b6eaa98ada4 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/62d34f146183d85f93725689291a4cad34f775ba |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/620d75c91453840697d8197947fca1efc4139034 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5480a0aca9557461037855329c3843c6592a36dc | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/10ef2afe69152d033dae090c009092fe01b68ef7 | ORPH
 aarch64_be  |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/fa6e5ec040bd9dcb5db591553dbab4ed087175f7 | ORPH
    arm      |         opencv3-4.2.0          | NOK | http://autobuild.buildroot.net/results/10ee702557baffc70f65c9a9c5a377adae876eea |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/db29a86ce99bf454d040f31569374efdf1ac48a6 |     
    arc      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/5e9ee5b9ecb7a735966f8fd392f407ed4fa72ebb | ORPH
    mips     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d38f940a065b3245009b506a126f8181616933ba |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5c1c3b8c6df92ed0757cb8da60cb6e3bd89c3d9d |     
microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d03358534817a827b2db63266b708facde11245c |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/6d58ba80c981cc44883e16bc0e7cb9a5100cd655 |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c7194ff34889e71ec83c93120f10d20f6f20cd52 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d85abde36fcc02cd7683416f9a8ec9775cafa964 |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ab2b92e75e9a165194a2697b1e0d118ec30a4a0b |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2cf9850974cfd9c960a048e1c47c43888ed53c15 |     
  mips64el   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/816ba0932d2094c4661087c8953f1584431eede8 |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/db546b70a84503a5032b06fd41486f95e6e80987 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/599b49a4f511fde1989c199e4689e0fd2346c407 |     
  aarch64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/8a8fca85c759040cefdd8d4b00358d4a407bea87 |     
    i586     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/f09035d2bb762de67329513a02114ee857a86bf0 |     
  aarch64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/fea836a2f68963c9f8fb2d4e1ff0cd23353644be |     
   xtensa    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/7d80beddabcb7426832d36f664412a0463f5b1eb |     
  riscv32    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/9d1647ee0a8e5099815a7d1247ce0304a7108b77 |     
   x86_64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/6d5c35adfc3cf1e7bcc5438494c3fba73ec3d021 |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/8794bf0aa85105a8c9efd69c532bd7a44280a85b |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/28c5c402c85e0a1637bcd2787adca48824725322 |     
  aarch64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/6a4ae3ea78c84612c182b2618363cd19bff2442d |     
    arm      |     qt5xmlpatterns-5.12.7      | NOK | http://autobuild.buildroot.net/results/4f4a7ac8c05019d6cc47e567fe79902296019eff |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/2fa6bc052d03accd9cdcf7337078e91dbf0e804a |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/e59c44e69685f308f3d8ebfbbe21a33cfba878a3 |     
    arm      |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/afc8f4fa6dd73245c3d4cfbc3a75d436a57f0150 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/21b4a6e91421e98061b438da65d53c12727764e6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4ca66240e016d9c79d750176b97d16ebd7c276f5 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/eea5f9c763a41fd06bae8372d8225b9e46888952 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1c5998cda18f490420bfa836135dbc498e3fd532 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3789113f6f8f19601152dfd7b7d4323bd8244e12 |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/5cd2d8ecf0f4505a688e3c6514902afe7f60d2b2 | ORPH
    m68k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/83a6ef31086c088bbfe2b1c82bc086f37955439a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ee95862eff29d1155464f27c7244497e01188b67 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 1 
           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/bffa5d5cd6e931667d8c3e56204193fcbd1e4eaa | ORPH
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/31d27d2940c55c8a5bbfb1e12ec692c67d38e95a |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 2 
                oprofile-1.3.0 | 2 
                  gmpc-11.8.16 | 1 
google-breakpad-7515ab13768... | 1 
            host-thrift-0.12.0 | 1 
                nodejs-12.16.1 | 1 
                        samba4 | 1 
             util-linux-2.35.1 | 1 
               wireshark-3.0.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/997ae6fee07cbada5fd083965e47d11848ccd457 | ORPH
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/01204049c9a07ca3d05c9e340b8e62e9199355c3 | ORPH
   x86_64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/1203c21e11e8ea879c32ee6e76fdb9a7e4f4e405 | ORPH
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/be1d7670988e92d15c427eb5e37a6cbbea77a0d4 |     
  riscv64    |       host-thrift-0.12.0       | NOK | http://autobuild.buildroot.net/results/2ec50d85184807e8b3aa66cd7ebe75961e7141bd | ORPH
    arm      |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/5d91edbbc9a8f60a8f71e0029582ef7e4c1a31b9 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/a88779e4b530499692f78f7defdb1e59d7b9629d |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/e4681122e2450c41817b9ccbad4eb44f82f6e467 |     
  powerpc    |             samba4             | TIM | http://autobuild.buildroot.net/results/42d08434d331cc9910e42ffa41bfdd6f36ddc868 |     
  riscv64    |       util-linux-2.35.1        | NOK | http://autobuild.buildroot.net/results/01b129b66c1f2a0ce3bc14cf71500dfae0dd2c14 |     
  powerpc    |        wireshark-3.0.9         | NOK | http://autobuild.buildroot.net/results/4aab1bb35f5c5bcda546d5cafdaaf8b5d6388000 | ORPH


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 2 
gr-osmosdr-46698a67e7e06419... | 1 
           host-nodejs-12.16.1 | 1 
                 opencv3-3.4.9 | 1 
                qt5base-5.12.7 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/a20855704db6020d398b316ad9e0cc368158d43d |     
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/ccaaca335829857b57c1d299e949c9eb1af48860 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/77955f14b61bd33e83b8ea7aeaa82946c0c77b41 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/28459299bfd1266151e82838dab2c879c08d8273 |     
   x86_64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/787561b66049058a361f08f0bdd9c89b8edf441e |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/7977f759c838c6b816cffcf240ea78a43d9965d4 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/9854f43701239c40f943aea8f099d9917091309d |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8..7_SP3.... |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20191018     | 20200214     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.36.0       |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.1.2        | 4.2.0        |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.1.2      | 1.2.2        |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/00037 | 1.2.1        | 1.2.2        |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r32   |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.850.1      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.6.2       | 17.3.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.2       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.36.0       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.9.1        | 1.9.2        |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2020-01-22   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2020.0       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.0       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.60         | 1.63         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 4.4.0-alpha  | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.13      | 9.16.0       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.2        | 3.5.3        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.19.1       |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.3       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 4.4.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.11.0       | 2.13.0       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.4.1        | ORPH
                        c-ares |  DISTRO  | https://release-monitoring.org/project/05840 | 1.15.0       | 1.16.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.5        | 0.5.6        |     
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.3        | 0.5.4        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     can-utils |  DISTRO  | https://release-monitoring.org/project/10554 | 2020.02.0    | 2020.02.04   |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/21403 | 20160414     | 20170601     |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.43.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.43.0       |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.13.0       | 0.14.0       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20191204     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.9          | 6.10         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.15.0       | 0.16.1       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.16.5       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.4.0        | 0.5.1        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                       connman |  DISTRO  | https://release-monitoring.org/project/00337 | 1.37         | 1.38         |     
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 8.31         | 8.32         | ORPH
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.2.2        | 2.3.1        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.26.0       | 1.27.2       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.9.0        | 2.10.0       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                         dav1d |  DISTRO  | https://release-monitoring.org/project/18920 | 0.5.2        | 0.6.0        |     
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/07487 | 1.5.5        | 1.5.6        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.12       | 1.2.16       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                      ddrescue |  DISTRO  | https://release-monitoring.org/project/00410 | 1.24         | 1.25         |     
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9.1        | ORPH
                          dhcp |  DISTRO  | https://release-monitoring.org/project/05584 | 4.4.1        | 4.4.2b1      | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.1.6        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20191210 | 1.3-20200228 | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.5      | 19.03.8      |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.12       | 1.3.3        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.5      | 19.03.8      |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.9.3      | 2.3.10       |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.9        | 0.5.10       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.11.0       | 9.12.0       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/21344 | 1.5.1        | 1.5.2        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/16911 | 1.5.1        | 1.6.0        |     
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.15         | 1.16         | ORPH
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.3       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.02        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.178        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.10.2       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.24         | 0.28         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.8        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.0-rc1     |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.14       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.4        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.4        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.22       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.7        |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.5        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.32       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.19       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.31       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.4        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.18       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.39       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.5        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.23       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.3        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.7        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.3.0      | 2.6.0.0      |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.2.1        | 3.3          |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.1        | 6.4.2        |     
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.17         | 3.19         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.5.5        | 0.12.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 1.11.0       | 1.12.0       |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.0        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/10437 | 2.1.0        | 2.1.1        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.12.1       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.02.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.5.1        |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.8        | 0.9.9        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.36.0       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 1.5.2        | 2.0.1        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.3.4        | 1.4.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.50         | 9.51         |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.24.1       | 2.26.0-rc1   |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.64.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.7      | ORPH
                      glorytun |  DISTRO  | https://release-monitoring.org/project/21354 | 0.2.2        | 0.3.3        |     
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.11       |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.8        |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.6.10       | 3.6.12       |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.8       | 1.14         |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.62.0       | 1.64.0       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.19         | 3.20         |     
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.4        | 1.0.5        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.1.0        | 5.2.0        |     
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grep |  DISTRO  | https://release-monitoring.org/project/01251 | 3.3          | 3.4          | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.25.0       | 1.28.0-pre3  |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.36.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.2        |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.6.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 3.0.1        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.2        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.44.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.1.2        | 2.1.3        |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                       hiredis |  DISTRO  | https://release-monitoring.org/project/01318 | 0.14.0       | 0.14.1       |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.3       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.333        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.1.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.29.0       | 2.30.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 65-1         | 66-1         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.10-0     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.6.1        |     
                        inadyn |  DISTRO  | https://release-monitoring.org/project/21677 | 2.5          | 2.6          |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.1       | 3.20.2.2     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.2.3       | 19.4.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.2.1       | 19.4.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.2.1       | 20.1.pre2    |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20191112     | 20191115     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.489        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.5        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.5          | 7.6          |     
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.3        | 1.8.4        | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.3          | 5.4          |     
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.22         | 1.5          |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.11         | 0.12         |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.8.1        | 0.9.1        |     
                         jhead |  DISTRO  | https://release-monitoring.org/project/10546 | 3.03         | 3.04         | ORPH
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.20       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.68         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.68         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.68         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.68         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.68         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2020-03-R1   | ORPH
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 26           | 27           |     
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 18.5-Leia    | 18.6-Leia    |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.2-Leia   | 2.1.2-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.1-Leia   | 2.2.1-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.1-Leia   | 2.1.2-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.1-Leia   | 2.1.2-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.1-Leia   | 2.1.2-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.3-Leia   | 2.2.1-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.4-Leia   | 2.1.1-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.5-Leia   | 2.1.0-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.3-Leia   | 2.1.0-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.3-Leia   | 2.1.0-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.2-Leia   | 2.1.0-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.2-Leia   | 2.5.4-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.8-Leia   | 3.0.1-Matrix |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 18.5-Leia    | 18.6-Leia    |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.4-Leia   | 4.1.1-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 4.1.2-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.4-Leia   | 3.1.3-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 4.1.1-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.20-Leia  | 5.4.1-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.8.8-Leia   | 4.11.1-Ma... |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 4.2.1-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.15-Leia | 6.2.6-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.18-Leia  | 4.3.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.5-Leia   | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 4.1.2-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 5.5.1-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.3-Leia   | 4.2.4-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 4.9.7-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.5-Leia   | 3.2.2-Matrix |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.2-Leia   | 2.4.1-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.3-Leia   | 3.1.1-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.2-Leia   | 2.3.1-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.1-Leia   | 2.3.0-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.1-Leia   | 2.4.1-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.1-Leia   | 2.2.1-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.0-Leia   | 3.1.1-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.3-Leia   | 2.2.1-Matrix |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 18.5-Leia    | 18.6-Leia    |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.5-Leia   | 1.1.2-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.0.1-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.1.0-Leia   | 3.1.1-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.0.2-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.1.3-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.1.1-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0_RC     |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                    libarchive |  DISTRO  | https://release-monitoring.org/project/01558 | 3.4.1        | 3.4.2        |     
                     libargon2 |  DISTRO  | https://release-monitoring.org/project/15244 | 20171227     | 20190702     |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.33         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/15531 | 2.10.14      | 2.10.15      |     
                       libcurl |  DISTRO  | https://release-monitoring.org/project/00381 | 7.68.0       | 7.69.1       |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.0        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.31         | ORPH
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.8.0        | 1.9.0        |     
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.7        | 1.0.9        |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                        libgee |  DISTRO  | https://release-monitoring.org/project/01625 | 0.20.2       | 0.20.3       |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 0.28.4       | 0.99.0       |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3          | 3.3.2        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.62.4       | 2.64.1       |     
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.24       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5          |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.8.0        | 1.8.1        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/18397 | 20190621     | 20200225     |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.15.1       | 1.15.3       |     
                        libite |  DISTRO  | https://release-monitoring.org/project/17367 | 2.1.0        | 2.1.2        |     
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.17         | 1.18         |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.40         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.20.4       | 1.22.0       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 1.1.3        | 1.1.7        |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.50         | 3.51         |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2019.6       | 2020.3       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200311  |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.0.5        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                  libpwquality |  DISTRO  | https://release-monitoring.org/project/15580 | 1.4.1        | 1.4.2        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.4       | 1.24.6       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.48.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.3        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.20.2       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20191204     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20191204     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.2        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.70.0       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.0        | 1.9.3        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.14         | 4.16.0       | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                    libtommath |  DISTRO  | https://release-monitoring.org/project/15565 | 1.1.0        | 1.2.0        |     
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.4        | 1.2.5        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.12.0       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.6        | 1.12.0       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.17.2       | 0.18.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.34.1       | 1.35.0       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.9.1        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 3.2.2        | 4.0.1        |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.4.0.1      | 1.6.0        |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/01767 | 1.13.1       | 1.14         |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.4        | 0.10.0       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.05      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.109      | 1.0.130      |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.5.2        | 1.6.1        |     
                        linknx |  DISTRO  | https://release-monitoring.org/project/21373 | 0.0.1.37     | 0.0.1.38     | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 4.4.0-alpha  | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2020.03.06   | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.4        | 1.0.5        | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.15.1       | 3.16.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.31         |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 2.0.0        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.11.0       | 2.11.1       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.11.2       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.11.0       | 2.11.2       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.34.1-1     | 1.34.2-2     |     
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.9.3        | 2.11.0       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.22      | 10.5.1       |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.23       | 4.8.24       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 165          | 168          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.1.1      | 0.1.1.2      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 2.14.0       | 4.4.0-alpha  | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.6.0        | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 20.0.0       | 20.0.1       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 20.0.0       | 20.0.1       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.53.1       | 0.53.2       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.36.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.1.0        | 5.1.1        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.1.0        | 5.1.1        |     
                    mini-snmpd |  DISTRO  | https://release-monitoring.org/project/21523 | 1.4          | 1.6          |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.9.1        | 2.9.2        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2020.01.1    | 2020.02.1    |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.12.6       | 1.12.8       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.5.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.8.0.105    |     
                     mosquitto |  DISTRO  | https://release-monitoring.org/project/06078 | 1.6.8        | 1.6.9        |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.0        |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.1.0        |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0-rc1      |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.0        | 3.2.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.6        | 1.8.7        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.5        | 1.1.6        |     
                          musl |  DISTRO  | https://release-monitoring.org/project/11688 | 1.1.24       | 1.2.0        |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.13.3       | 1.13.4       |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.7          | 4.8          | ORPH
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200314 | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.206        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre2   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.4       | 1.23.2-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.39.2       | 1.40.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.7       | 1.17.9       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.16.0      | 13.11.0      |     
                           ntp |  DISTRO  | https://release-monitoring.org/project/09025 | 4.2.8p13     | 4.2.8p14     | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.132      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.10.1       |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.5       |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.7        | 0.3.9        | ORPH
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.27       | 2.0.28       |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.1.1        | 6.2.1        |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.48       | 2.4.49       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.3        | ORPH
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.9.2        | 3.10.0       |     
                       opensbi |  DISTRO  | https://release-monitoring.org/project/21804 | 0.5          | 0.6          |     
                       openssh |  DISTRO  | https://release-monitoring.org/project/02565 | 8.1p1        | 8.2p1        | ORPH
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.5       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.7.0        | 3.8.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.7.0        | 3.8.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.7.0        | 3.8.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.7.0        | 3.8.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.19       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 0.27.0       | 4.4.0-alpha  | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.20      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.44.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.5        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.4        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          pcre |  DISTRO  | https://release-monitoring.org/project/02610 | 8.43         | 8.44         | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.33        | 10.34        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.1       | 5.31.9       |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.79         | 6.80         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/02811 | 1.642        | 1.643        |     
               perl-file-slurp |  DISTRO  | https://release-monitoring.org/project/11852 | 9999.29      | 9999.30      |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.18         | 6.22         |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.066        | 2.067        |     
             perl-module-build |  DISTRO  | https://release-monitoring.org/project/03077 | 0.4229       | 0.4231       |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.32         | 8.33         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.21         | 1.22         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.110        | 0.112        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                 perl-sys-mmap |  DISTRO  | https://release-monitoring.org/project/05675 | 0.19         | 0.20         |     
                 perl-timedate |  DISTRO  | https://release-monitoring.org/project/03463 | 2.31         | 2.32         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.008003     | 1.010000     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0203       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 7.4.2        | 7.4.3        |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.1        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.9.4        | 1.10.1       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20191204     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 0.86.1       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6b       | 1.3.7rc3     |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 6.3.0        | 7.0.0        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.0       | 3.11.4       |     
                    protobuf-c |  DISTRO  | https://release-monitoring.org/project/03716 | 1.3.2        | 1.3.3        |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.1      |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b2        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.5       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.2.5        |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.2.0        | 1.3.0        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 19.11.1      | 20.3.1       |     
                python-automat |  DISTRO  | https://release-monitoring.org/project/15101 | 0.8.0        | 20.2.0       |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.9.1        | 1.9.2        |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.8.2        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2019.9.11    | 2019.11.28   |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.13.1       | 1.14.0       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 2.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.3.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.5.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 7.1.1        |     
               python-colorama |  DISTRO  | https://release-monitoring.org/project/03807 | 0.4.1        | 0.4.3        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 20.2.1       |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.43.1       | 0.46.4       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.3        | 3.0.4        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.2.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.5.1        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.13.3       | 0.15         |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.10.0       | 3.12.0       |     
                 python-enum34 |  DISTRO  | https://release-monitoring.org/project/08176 | 1.1.6        | 1.1.10       |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 0.12.2       | 1.0.0        |     
            python-flask-login |  DISTRO  | https://release-monitoring.org/project/03868 | 0.4.1        | 0.5.0        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.2        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.36.0       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.1.1        | 3.2.0        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.14.0       | 0.17.0       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 2.0.0        |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 2.8          | 2.9          |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.13.0       |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.15.1       | 0.16.0       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.10.3       | 3.0.0a1      |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 21.2.0       |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.97         | 0.98         |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.4.1        | 4.5.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.0        | 1.1.2        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.1.1        | 3.2.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.0        |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 0.8.1        | 0.8.4        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a2      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 7.2.0        | 8.2.0        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 0.6.2        | 1.0.0        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/11132 | 4.7.4        | 4.7.5        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.44.0       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.18.1       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.6.0        | 2.7.1        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.5.1        | 0.6.2        |     
                python-passlib |  DISTRO  | https://release-monitoring.org/project/13203 | 1.7.1        | 1.7.2        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.4.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.2.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.4        |     
                python-pexpect |  DISTRO  | https://release-monitoring.org/project/07654 | 4.7.0        | 4.8.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 19.3.1       | 20.0.2       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.4        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.0       | 3.11.4       |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.6.7        | 5.7.0        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.8.0        | 1.8.1        |     
                 python-pyasn1 |  DISTRO  | https://release-monitoring.org/project/06996 | 0.4.7        | 0.4.8        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.2.7        | 0.2.8        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.18.2       | 1.19.1       |     
              python-pycparser |  DISTRO  | https://release-monitoring.org/project/08175 | 2.19         | 2.20         |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.4          |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev6   |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.6.1        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.4.2        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.6        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.6       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.14.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.79         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.10       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.28       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.28.0       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.50.0       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 18.1.1       | 19.0.0       |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.3.10    |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.22.0       | 2.23.0       |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.1        | 3.1.2        |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.9.0        | 2.9.1        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.13.1       | 0.14.2       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 46.0.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.3.3        | 3.5.0        |     
            python-simpleaudio |  DISTRO  | https://release-monitoring.org/project/21607 | 1.0.2        | 1.0.4        |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.0.1        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.5.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.15       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 0.17.4       |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.3.1        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 0.9.1        | 0.10.3       |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 2.1.1        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.3        | 6.0.4        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.43.0       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 18.6.0       | 20.3.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 18.8.1       | 20.1.1       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.6        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 2.0.2        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.8       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.2       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.7        | 0.1.8        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.5        | 1.8.6        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.0        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.25         | 0.26         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.8        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.24.5       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.0.0.dev0   |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.1        | 3.9.0        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.0        | 1.1.2        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 46.0.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.30.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.14.1       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.14.1       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.3        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0        | ORPH
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 5.0.7        | 5.0.8        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190609   | 2.20200229   |     
                restclient-cpp |  DISTRO  | https://release-monitoring.org/project/21388 | 0.5.1        | 0.5.2        |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20191204     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.9        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.0.0       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.1911.0     | 8.2002.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 1.6          | 1.8          |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.7.0        | ORPH
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.42.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.42.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.3       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.1.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.2.0      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.4.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.1.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.2.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.1.2      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.6       | 4.12.0       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.29       |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.10       | 2.0.12       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                           sed |  DISTRO  | https://release-monitoring.org/project/04789 | 4.7          | 4.8          | ORPH
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.1.1        | 4.1.6        |     
                     sg3_utils |  DISTRO  | https://release-monitoring.org/project/04801 | 1.44         | 1.45         |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.5        | 3.3.6        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.15         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.2          | 4.5          |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.9.1.0      | 2.9.2.0      |     
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.7        | 1.1.8        |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.3.11a      | 3.3.12a      |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.32-9731... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.2       | 0.14.3       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.0       | 0.14.1       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.8          | 5.0.1        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.0       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.0.2        | 6.1.0-rc1    |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.4          | 5.5          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.11.02      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.2        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.12.2       | 1.13.0       | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.1.1      |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.5       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.1        | ORPH
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.24.1       | 3.26.1       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.3.21       | 1.4.2        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.3.1       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 244.1        | 245          |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.12.0       | 0.13.0       | ORPH
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                      tinyxml2 |  DISTRO  | https://release-monitoring.org/project/04976 | 7.1.0        | 8.0.0        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.1          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.0        | 2.3.1        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.1        | 4.2-RC0      |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.2        | 2.4.0-rc1    |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                         uacme |  DISTRO  | https://release-monitoring.org/project/22795 | 1.0.22       | 1.1.2        |     
                        uclibc |  DISTRO  | https://release-monitoring.org/project/13815 | 1.0.32       | 1.0.33       |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 4.10         | 4.10.1       |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.8.3        | 5.9.1        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.4.5        | 1.4.7        |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.96         |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.48.1       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.1929     | 8.2.0388     | ORPH
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.4          | 2.6          |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.60.0       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.20         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.18         | 1.20         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.26.4       | 2.28.0       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.5        | 5.5.6        |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.3         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.3        | 5.0          |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.2.1        | 3.2.2        | ORPH
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/17547 | 1.4.1        | 1.6.0        |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.26.4       | 2.28.0       |     
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20191217-... |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.2.1        | 3.3          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.14       | 1.4.15       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/15018 | 1.4.2        | 1.4.3        |     
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/13646 | 1.13         | 1.14         |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
                       xenomai |  DISTRO  | https://release-monitoring.org/project/18451 | 3.0.10       | 3.1          |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.5.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.28         | 2.29         |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.7          | 3.9          | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 353          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.11       | 0.3.0        |     
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.2        | 0.7.3        | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 2.00         | 2.02         |     
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                           zsh |  DISTRO  | https://release-monitoring.org/project/05307 | 5.7.1        | 5.8          |     
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.4        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.2       |     

-- 
http://autobuild.buildroot.net
