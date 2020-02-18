From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 09:06:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-17
Message-ID: <20200218090629.279AF8598A@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-17
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  3  |  0  | 21  |
  2019.11.x  | 17  |  3  |  1  | 21  |
    master   | 132 | 84  | 12  | 228 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   erlang-22.2 | 10
host-sdbusplus-4212292bcf13... | 9 
                    brltty-6.0 | 7 
                  host-ncurses | 5 
               libglib2-2.62.4 | 5 
                 mesa3d-19.3.4 | 4 
                apr-util-1.6.1 | 3 
                      bash-5.0 | 3 
              host-grpc-1.25.0 | 3 
                         libnl | 3 
               libupnpp-0.17.2 | 3 
              bitcoin-0.19.0.1 | 2 
          gstreamer1-mm-1.10.0 | 2 
        host-gutenprint-5.2.14 | 2 
                   libnss-3.50 | 2 
                    lshw-02.18 | 2 
                    mpv-0.29.1 | 2 
                oprofile-1.3.0 | 2 
                    qpdf-9.1.1 | 2 
                qt5base-5.12.7 | 2 
                  zeromq-4.3.2 | 2 
               acpica-20191018 | 1 
               fail2ban-0.11.1 | 1 
                   flatbuffers | 1 
                        gflags | 1 
           host-doxygen-1.8.17 | 1 
           host-nodejs-12.14.1 | 1 
                libcurl-7.68.0 | 1 
                 midori-0.5.11 | 1 
                   ogre-1.12.0 | 1 
                 opencv3-3.4.9 | 1 
           oracle-mysql-5.1.73 | 1 
                       proftpd | 1 
               protobuf-3.11.0 | 1 
                   sdl2-2.0.10 | 1 
                 ser2net-4.1.1 | 1 
                suricata-4.1.5 | 1 
toolchain-external-codesour... | 1 
                     vlc-3.0.8 | 1 
                          vpnc | 1 
                    wampcc-1.6 | 1 
                    xen-4.13.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/917f6661ba83fe2df5d32a04230c7413f18a65b2 |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/7283d12f22489652658f1d46cd53fdf05f84751f |     
   x86_64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/2a67b5d58f79348e20a972125e4797eff5585716 |     
    or1k     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/6487a61ebdd244eb4413ed44c9c77b9f23a7b105 |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/2b8c5943555a611830c68eba504415b4b7006451 | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/3d7dd2ad57cd14dd1c5f99e7aad6efc4a74473e1 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/47e35f92b369a792500f8877a154d0c779b45ef1 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/396f17db1aa24afe585fdff5e23021e89f2b592e |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/0957b2f4f0b849f041637db18ff30b1f3dedfcde |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6a28b306d3f4c9928ec9e0e728b7afd6cc2213b3 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8b63d6f076927ad8f7f2168da848b6d7be072d23 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8d87e21e1d5827ca191105b492809f9f48d6d3d3 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1c4d132dcc46d5f0e9944ef249085279eff57845 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a3994d6d1e22cd46869bcb197aa5a036c1e9105b |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/42338011be4f595e2d27b04d95dcdea69751e58e |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c46cab536530218bb7be36a5e6ba71a4ac777071 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/6ed02bf16b2b7ce7eff1dfd32d788b47af9ba7eb |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/b80d45d04d917b05e9fc55738d1c96ec8c09278e |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/8550cf439e627b33d1f53df40efafde7c857e51c |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/ff6d51ab4170d00775c390896471abe2995ee452 |     
  sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/6060eb1809abdef7108219e1499eebd29b0a9845 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/6a0a611c2ae19c3bbb3b99587db35badd420c494 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/e50d46b97243de26df2b454ce2ac36437f852365 |     
  sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/2c226e89f44fb131218107f7f10b7b1cfb306b7e |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/96f594231ddda2fcde6e9c486b2fb39a55ee6e95 |     
   mipsel    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/a0f6d377d87c5c0ebb1445ab47b40e53468893bf |     
    arc      |        fail2ban-0.11.1         | NOK | http://autobuild.buildroot.net/results/dd8e225e2a49cfa6735bed11459007003a37c137 |     
 aarch64_be  |          flatbuffers           | TIM | http://autobuild.buildroot.net/results/befc1c94adbb1da98859a32358b78ff0c7d9de56 |     
    arm      |             gflags             | TIM | http://autobuild.buildroot.net/results/1b88c54da80303207c00035c14cf84d853caaf1e |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/62500b581f9f27ddc929e68dadc2fadc597e6828 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f1dcce83ab9d76663917ba53bc2012201e4fa954 |     
   x86_64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/a1b432cc4da6b7ee18503ff7f54c392c0583dd61 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f709ed778e2e16d62f37871a122054749d2dd39e |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/532e844d5ff30e50ce36d73b0bec73d2821f2ee4 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d1e70b1c002479782bc41ccf644bab010af82870 |     
    arm      |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/876ff6f212ced2fac6dd7a036cdc9463c498ba0a | ORPH
    arc      |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/e40313c6ec193d6156e26eff62303545fba09413 | ORPH
   x86_64    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/7bedf0ccab56166501edb06ac1b933c5f2332b44 |     
powerpc64le  |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/94d4c9c774469c5402e819556b80e93768365a27 |     
    arm      |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/30a3c577d81aa2158abec741761672848ad9a929 |     
   xtensa    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/a86a64577ede5754f1dea0e1bf25795f706106db |     
    arc      |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/43f4dbfdca98ac429ddb7704b34b0d075b866e67 |     
   x86_64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/497275b0e4eba8bfadab9d781f7dcea6adf12029 |     
   mipsel    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/7758eb8785c584c70110b06dd729fe4427421ca1 |     
  riscv64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/65267b28370fb22514030f808f88308e29f3dd92 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/8290a63abb26dd50f3ac8c78439b482b72d79d0f |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/68d46b524678a9eab803af3c2453eb986cf73b53 |     
microblazeel | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/8c4dce3cba869c6d4fe81489d79229d2d4dbbb86 |     
    sh4      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/d204453f0fd5d027b391ce8812d2e3c250704e98 |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/76bc4cf12df9928a97ee4dcb3b82988db5606687 |     
  riscv32    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/ab5b390efb1ac5b31317220dabdb02ed0792d6ab |     
    sh4      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/32cd1f726e8d9e6134b939d13f3e15cd5223c74d |     
    m68k     |         libcurl-7.68.0         | NOK | http://autobuild.buildroot.net/results/5434fd6587526a8596df644ad2a0fdc91c923743 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/550dd24ebc0d7267a28e4065a03f5cb619cd4e9c |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/3ffadf656090db692ae839d3c9db0cfe7af575d7 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/8cec94f92867aa6b639c3207d8a966e1461a5de1 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/c3038c088535ec86c5c1c38950768a8293f38fba |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/61de9c07080199dbf5bc6e56900504e379a4d317 |     
    i686     |             libnl              | TIM | http://autobuild.buildroot.net/results/4062a75f2ac2dc3ecf82178ecfd1faa48715c956 |     
   x86_64    |             libnl              | TIM | http://autobuild.buildroot.net/results/d7e08bad9b9b14d6878f5593e482edddedaa53ac |     
   xtensa    |             libnl              | TIM | http://autobuild.buildroot.net/results/0b6b2592ac26ad345065bc1030934e36eb416a17 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/2caa047ead7fbbd4d2a14c9dff2b30ccfd09b807 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/26f62e93235ad9b85cea3e13262ca62019af76e8 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/1a25df5f3f8fe48ad85ca3d0cf86e7abcba5016f |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/73441b303b13a63d4e3576b35db3d3aaa6ea7027 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/2813cdad704e85211a7330e6486f4608d358b911 |     
    m68k     |           lshw-02.18           | NOK | http://autobuild.buildroot.net/results/03f665456be0e0fb648fe1f8e4081f43b3ac42cc | ORPH
    m68k     |           lshw-02.18           | NOK | http://autobuild.buildroot.net/results/e4d7a44581b884f96ac8db9dff181a0f7f38a5f4 | ORPH
 aarch64_be  |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/b9b6281983388dc22d929887d653da3db60f1f2c |     
  aarch64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/f552acdea51614fadd5c11a05387133b7af1531c |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/4cb5b42f355be081e92619172420a7d18975d2f3 |     
  powerpc    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/116899080e6a88bb8818dfc368444cea26ece34c |     
   mipsel    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/c97d187fe6573f1fd81ab71127dcf733cf2485a7 | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/50d3587763187ce4b9cb614ebcf1017642200e8c |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/35a784365b22cf8fc771a78072c2a81eb35e5af1 |     
  riscv32    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/a068320f0a1c5909c4e637c33496b6d947df5e73 |     
powerpc64le  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/3a10376912a9e2a92b6252e6a46b60182a12f110 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/222273ffd3b88f9ee2cbd2459cae1f2c48684b0c |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/02fd73d19b71d2309c39b4594a282fedb6efd4db |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/37a8efa2198ec04dddac2edf9e7f13e4b998b726 | ORPH
  riscv32    |            proftpd             | TIM | http://autobuild.buildroot.net/results/32de46f2655007a1f7d18c10b38015dbe010b80c |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/be13460562a1a874ac75fb06c117f79a20cc8a54 |     
    arm      |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/78c721718f782de5539da5aec43c1d186dbdd84e |     
    arm      |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/ad7fb68ae87850a85509eed80fd0cae8721b10c5 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/062f9768cb046fc73c1bcb6ce2dcf85c4e20f1f0 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/61304b1e947f84d04e54911dbc25b046480925f0 |     
    arc      |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/60b08753eaae9f8388266601e979fda398578e30 |     
    arm      |         ser2net-4.1.1          | NOK | http://autobuild.buildroot.net/results/2ca29723a9d42c2c71e3ff37d4cc939dfd9c48f2 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/021b3bb0d1ad430850ac171a93bf21bfcad51a7f |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/6462e19327fe5f93da1f4553db0b8b73b1d133b7 | ORPH
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/23e74286305fe7b679503d0e7c673e18247a847a |     
    arm      |              vpnc              | TIM | http://autobuild.buildroot.net/results/fca7ab6262275a31b015feca2ab5f696217dc06c |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/53bde9484584f2ff09b6547eb6f6943e742ddf24 | ORPH
    arm      |           xen-4.13.0           | NOK | http://autobuild.buildroot.net/results/8018f23b114ee42b2889f4c8db6caaae90663d90 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/8bc3d6a40311d2510f7f621b5f35fb054be68e43 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/1b411da3eb64b26f58f39337b1e556e7c7ca3d97 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
           host-libselinux-2.8 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/d557b9abac741b4405fecaf434c0641b212a4d27 |     
    arc      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/95823f416e16a22b94eb2d2767b96873f171f2a4 |     
    or1k     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/de3d582e71d14a949929857cc1ed83b3283235a0 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                host-go-1.13.5 | 1 
                         libnl | 1 
                   perl-5.28.2 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/7e7ad57b6cf71333d76d58336a3344391dc65187 |     
  mips64el   |             libnl              | TIM | http://autobuild.buildroot.net/results/5ef5596e392dec84cfbf3b04e973511a0f94a056 |     
    arm      |          perl-5.28.2           | NOK | http://autobuild.buildroot.net/results/8bed7ac78dcb52b7d17416ba207b3811139c40cf |     
  riscv64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/6d706593a6b67f0e43d9836e439dcced5c068e91 |     



-- 
http://autobuild.buildroot.net
