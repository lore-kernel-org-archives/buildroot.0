From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jan 2020 07:17:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-14
Message-ID: <20200115071727.C379D86018@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  1  |  0  | 16  |
  2019.11.x  | 10  |  4  |  0  | 14  |
    master   | 70  | 73  |  3  | 146 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 17
             freeswitch-1.10.2 | 8 
                  spdlog-1.4.2 | 6 
                apr-util-1.6.1 | 4 
                    parted-3.3 | 4 
                      bash-5.0 | 2 
                    brltty-6.0 | 2 
           host-doxygen-1.8.17 | 2 
                host-go-1.13.6 | 2 
                     host-llvm | 2 
                 libnss-3.49.1 | 2 
               libupnpp-0.17.2 | 2 
                 ripgrep-0.8.1 | 2 
           uboot-tools-2019.10 | 2 
                  zeromq-4.3.2 | 2 
                bitcoin-0.16.3 | 1 
                        bullet | 1 
                  cjson-1.7.12 | 1 
                   dav1d-0.5.2 | 1 
                 exim-4.93.0.4 | 1 
              fluidsynth-2.1.0 | 1 
gli-559cbe1ec38878e182507d3... | 1 
                  gmpc-11.8.16 | 1 
              host-grpc-1.25.0 | 1 
                libgdiplus-5.6 | 1 
               libtheora-1.1.1 | 1 
                libxml2-2.9.10 | 1 
                 mesa3d-19.3.2 | 1 
                   ogre-1.12.0 | 1 
                oprofile-1.3.0 | 1 
               protobuf-3.11.0 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/94451b5911dd25fc5cfd24925a98ceb321b83fc8 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/fbe14807ac2a4ddf060e994af5bd31d5a4eaba03 |     
 powerpc64   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/5a49fc51790faa4ba4dc76763e475595907d898f |     
  sparc64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/77e461e08fdb4b777b0d9293bf42a17ff6614ff0 |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/9616c048ed24bf83c4e225f68b7370ecc64c802c | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/9cb2bda39d63ab30f4d6aa7a89875f9ba7a0ec7d | ORPH
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/c3c04aabc918ad298ea7af74feb80bc012b03cc6 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5456258ffc9428aee7f000b27d5c9ca42a6827dd |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/dfc5b0298c3233287fec524e15499d144a436387 |     
  riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/9a405ec6fabfa306c14a671a5e09359ac623c25b |     
    arm      |          cjson-1.7.12          | NOK | http://autobuild.buildroot.net/results/27ae2cfd44952bd19c4331c839972b2fee86d277 |     
    m68k     |          dav1d-0.5.2           | NOK | http://autobuild.buildroot.net/results/805ccabaa9f4449c123fc526bb221f774c7ddef1 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/8d760582fab34a7b07819b8ef1d5a911764af988 |     
    arm      |        fluidsynth-2.1.0        | NOK | http://autobuild.buildroot.net/results/9d7a8b6395d9edbcabe1218728621ddba1a40969 |     
   mipsel    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/f8c45404fbbfeed4b508d6c9573f4f8e67c42da0 |     
   xtensa    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/51ae74cc74edd5ed478fc9812ffcea68b88591a1 |     
    i686     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/9038174a2b10eda5c5e53d4f6e487f4203971efd |     
    arc      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/f04f54c878ea1691b27714587df562cd057ff11a |     
  riscv64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/98f23b5b9fc7e5d50a018725e6e8b1ccc16bf108 |     
  aarch64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/af39bfba5ec94cece52c00fa2efbcdbe8732faf7 |     
 powerpc64   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/44c72f8d33404e487953455b219e34c49cc5d571 |     
 powerpc64   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/38ea2e6e7aa8f813ec3644fdd6306fc6b444a574 |     
    arm      | gli-559cbe1ec38878e182507d3... | NOK | http://autobuild.buildroot.net/results/c714376bfef5cbd083e1480a4e19be496145b4f2 |     
    m68k     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/1b6622bfdb324c60d7e494723f1b02c6753df288 | ORPH
  aarch64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/035fe737cc1b9a23001e3c7bdc4c0a70fb38cdaf |     
  sparc64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/7f6791ce9cb03a3d92c54161cf5b986fd75e4c3e |     
  mips64el   |         host-go-1.13.6         | NOK | http://autobuild.buildroot.net/results/1cf2563fef00e070aaa9fb4d6c70f9d8603d4be7 |     
  mips64el   |         host-go-1.13.6         | NOK | http://autobuild.buildroot.net/results/2cf84c350215c8b37524bb37f778d0f6d6d8729c |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8a9f15710ca816998566f6a56ce368b7086df1e8 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/d5d416f6a2fdc7c725a10ca3988ffa90964b66d9 |     
   x86_64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/40c843afc5ea9ddaf671cdcdcb46b87bf765739e |     
    mips     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/b32e8a268f3b93dde551c118b227c89d089596b9 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/56f43ecf8b6550ff80539efa82b5ea4dbd1e44f1 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/3c8914c4c4b28fd914077e870f63c110f3a94c52 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/c7cf91d8d9beb1243ce5a5d53182a6dd50bc1ad2 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/5326fdffc2efa78f16fce93c27aadb886d395c5d |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/e159a166059f79d1c7d03467c8186d061ab78765 |     
    arm      |         libxml2-2.9.10         | NOK | http://autobuild.buildroot.net/results/ed79572bee4aa4a2884452f9fad09969844cb147 |     
  mips64el   |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/a3606dbf88412da11ee440318e7857cd0109898b |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/34cc648aaab2ab54c778d5cab84e9200fa0f9284 |     
   sparc     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/87e99fd11c77e24b31f27241bb89a7fe194d56a1 |     
    sh4      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/a26a26db614607bcce71f8693d300bd4975c7684 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/b68f419c9f1c5ef6c47844dc26d0af147c26cd59 |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/b851109505b63b72e01d304988e28bed9eef5c22 |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/2668910dd618f16be9de12e07e7457d127b85dd8 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/0e59c6bdf73fb4a5fd1f652f1b8f7961421a6f00 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/2b01b7e65c0dc0e1191ba48e02e31503958d82fe |     
microblazeel |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/b243b7bfa828e679764ef31a7a9f158dd8ba6c4a |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/9aa7e81a4f591c3b1efb509ee139be30fdd67046 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ed5ae1e6943b5b75ffc31a006c7de8807c6ea2c6 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/734717f8d6a9d81ce6aea72cecec39a1755c3055 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/dc038f706d849b7aad6dd0faed3a4a373b3e1234 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/690b4c3285c9cf7ebc6457bb22436907c30e6d4c |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8232a5d82d524d1d114f0e8485d7d230d6e3101f |     
    sh4      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/79b0cfd39341be3c7121c33397739abdd2072fa3 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/1f3fc71a97aa48d1fb586327555ad06723a29c8b |     
  powerpc    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/b64dfcd8e576666e8a4a52da81a2f5a92b779dc7 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/28db77eef1a01016a22ba31bbad1f9815fc3f62c |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/713016ec2516fcbdd53d2bb3f6f1f75ec1a5fccc |     
   mipsel    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/3b309f6598b0744e043db8e149346a1341f3de0d |     
microblazeel |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/992518d340a9f32a0721d6e66936850c4c3ef2e4 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/30da524b502507e244551b9a9fa34ae30346e9b7 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/63e36064b68147f07434b586c2883175c97ffb5a |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/05e2c1fde61cf9f35c4f315954dd6b721322304d |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/3c5e2fb8fbf4af68dc5ad79cbac4f16603b63d88 |     
   nios2     |          spdlog-1.4.2          | NOK | http://autobuild.buildroot.net/results/7e7f698b620c1726cbeb89cc8709b1b609ba0762 |     
    arm      |          spdlog-1.4.2          | NOK | http://autobuild.buildroot.net/results/0b19ab6ffb5ac9a8f3be17dc6a202e65c5b5e31b |     
    arm      |          spdlog-1.4.2          | NOK | http://autobuild.buildroot.net/results/074f09f0bfb89946515b200cc9a7568f21bd1f23 |     
    arm      |          spdlog-1.4.2          | NOK | http://autobuild.buildroot.net/results/1cada2db278ba787589d5b64f52aee165dafe8be |     
   x86_64    |          spdlog-1.4.2          | NOK | http://autobuild.buildroot.net/results/04820bc2d20a0ca5c9e8a007da66ebd633f4ae0e |     
    i686     |          spdlog-1.4.2          | NOK | http://autobuild.buildroot.net/results/1a219a3f07a87ae4ad2e2d2f817b3a17e73ea785 |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/c949e5a95b3ac845f22ae79087177788d6f1050e |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/4f609ba0cba4f567877e6299fb0902c01cf17f13 |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/ae7930a694343b3bda8ec41b05d572a3d32c6d1b |     
    m68k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/8916827d35b473fe7755f2aef4d5b4b7ab32014e |     
    m68k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/18b7d3ffe1a406c03cd161261e85b97c11b11763 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/a399a8b51765c48d34a8177007bca93ac0d26e15 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

        network-manager-1.20.4 | 1 
              python-pyqt5-5.7 | 1 
                 ripgrep-0.8.1 | 1 
              webkitgtk-2.26.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |     network-manager-1.20.4     | NOK | http://autobuild.buildroot.net/results/1ad02da2bd8a08b6c42e3b6557ef4a16ebf6b6fa | ORPH
   mipsel    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/302ae1fefaa41ab48ccc4cc5612ba437e27e2c56 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ba23bc61c9bc08faedf1a2e0da85293a48c7464b |     
    arm      |        webkitgtk-2.26.2        | NOK | http://autobuild.buildroot.net/results/1b4945da8af9bd64101067c2495b7b9be627f271 |     



-- 
http://autobuild.buildroot.net
