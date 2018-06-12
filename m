From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Jun 2018 08:00:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-11
Message-ID: <20180612060013.BF95D20A20@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  32 |   5 |   0 |  37 |
   2018.05.x |  35 |   0 |   0 |  35 |
      master | 199 | 106 |   1 | 306 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   libnss-3.33 | 2 
                  cc-tool-0.26 | 1 
                 mesa3d-17.3.6 | 1 
                  samba4-4.7.6 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c6e5a624593ae98b7d2f29fdefe7036199643c0b |     
microblazeel |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/114e92fce8de4fc3377ff023a4f35f79b3d48f75 |     
         arm |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/929e33b09488ce869537afaa203424da217a92e9 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/b53ab7db6a2e2da3d2b8f1a7dd0caaefcde8b9a2 |     
         arc |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/3c9b5a789495b16aab8f3bc29f1a0707a6a216d5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             freeswitch-1.6.20 | 22
                linphone-3.6.1 | 19
                      x265-2.8 | 18
                libtirpc-1.0.3 | 11
               asterisk-14.7.6 | 10
                    host-rustc | 6 
          mediastreamer-2.14.0 | 4 
               aircrack-ng-1.2 | 2 
            host-flatcc-v0.5.1 | 2 
                  mender-1.4.0 | 2 
               mono-5.12.0.226 | 2 
       shadowsocks-libev-3.2.0 | 2 
                host-libsodium | 1 
                   libnss-3.37 | 1 
                 opencv3-3.3.0 | 1 
                      qt-4.8.7 | 1 
                 qt5base-5.6.3 | 1 
triggerhappy-b8228880661293... | 1 
           uboot-tools-2018.05 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/33cb820caea947bdf534f95a5ffcfa19d082b67f |     
     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/10f5df71f7e1a4863466cd61b91163e661f13376 |     
         arm |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/405ed3185655c7a232ec2a8c2d005356cf0868ca |     
 powerpc64le |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/f65adc701d4533b0355d3102c8deea850f98c31f |     
   powerpc64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/c8e3db272becae22ff5ca368e7ba9f2e1598b987 |     
      x86_64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/3b60d6804b27ed7cc34dbc1679eab37f9942591f |     
    mips64el |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/4228bba3fa13fc29501f26538a0419d2a323162b |     
    mips64el |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/8ffaaa7d62f61cf58d9732b73f50ec28b2e9634c |     
     aarch64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/fac5d8096e509a65163d368b6ddc491155d1d44b |     
       nios2 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/30da5f0d69015d28a71f46f05a86c018929b0943 |     
       nios2 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/afbd9c924977c69f65aaa83e03ed9e6e66ee2ebd |     
      x86_64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/01335d133bb15268f316de8b8ca0d67c84aa05d1 |     
         sh4 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/51ec72b2beef7c8f114de459d9ab64b511d6e81a |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/d123fa93cb00f3d17910e4b7909076425542a931 |     
        i686 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/8e147cf8d111c10a86919752e8bc70ec145b7eec |     
        mips |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/c5c8ede04fd6e32a0de13f06f3de031c240a5bf3 |     
        i586 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/82058c7f75814b2acf79b584cb7e1ff2671549fb |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/db9184267648a65db810bdb139d53310e7db2fce |     
       nios2 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/48adad73a94c7f65efabd5946396e00520e39a62 |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/f65e13fd8c219799be20a5be866c7a14a78c4fd0 |     
         sh4 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/90b42c0ca459b940e8365f657ef5eefed5528ea9 |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/239b8088995be83ba445bebd4caf73ece16e69ab |     
     sparc64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/2a4b9dcf92d84f4adb2b476053866f80be321f62 |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/3b6c96564cd5a6d08aa4a2eca9e74fa43e76f384 |     
       nios2 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/6fd7c70c0ed835272b811a467ac817a1847d503e |     
        m68k |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/212538605fe3cbe06f991b9edf692f9969707020 |     
     aarch64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/edc2bd4579e7ba2ce6862c531fbfabbf87d81f2d |     
      xtensa |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/19770c24808a94d291420700f83218546dfd7c0f |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/44521cf0030e6b4a2f800a03386973b01e1a5e02 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/0e0acce08e314c7fa536725ad3c62139cb0ed73d |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/291235082fbb0def1c354eddd47099cdbdbcc61e |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/6cf3103838ff7aacd19b472249036c79c72307f9 |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/badacc865299063aff93ccd86e2bf04629c8b0b0 |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/cc4f9043c2d7ac8774b7974a564d740212ed0582 |     
      x86_64 |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/974576259bc5ced32d6e3c3d60cc94126614eef3 |     
        i686 |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/0c768923ee21bd99eb994ad6691d1746504ab8e9 |     
      mipsel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/1b85edab65cfe6ac46f7a7ea705dfd50b8549649 |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/27b22383dd0adf6718fa5aa3c8ea8cf0286135c7 |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/305066f50b2b56fd815652a0836c89eccefcac27 |     
        or1k |                     host-rustc | NOK | http://autobuild.buildroot.net/results/7bc2ef7fdcf1412d4d6c992a4382ed5c82a1e53b |     
        m68k |                     host-rustc | NOK | http://autobuild.buildroot.net/results/a1e199cc13ecdfc67fdcb10784013dad406c0ec9 |     
        i686 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/2fefb4c0ed1e1e4a97ead602c48ee927b4f162cf |     
        or1k |                     host-rustc | NOK | http://autobuild.buildroot.net/results/217507c7427d7ceeff037c2b20d7d6d1a174971f |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/742cc7524c55ee84211571a4968b7ac5337865ed |     
        i586 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/020ffcd90c7eebeca1f31d7209eb72b76acf18fa |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/6c17a3f4f0e8051c39f1602247c77d522b24538c |     
        i586 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/cd37e4c6028eb1bee652e84f867656ab7e46f368 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/30f5f61531b04e98215d04a9cebebf5c2219d028 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/fa32e58d2ea3fca9db20037c99a153881b2033e5 |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/57000f6a15a22d24ae21daa530862d2218b54318 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/ab37c3eed26bae11d23f1dec62558f64289717c6 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/7801f120c9e19827ba72c34353fc7f88db908a99 |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/33ef680f150e51eebba603d7952b6c4643c28485 |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/ef778036b7148343c3b667e4b02c9c04c45fb9b5 |     
        i586 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/b981d4a7593c064e75bbcb6d1c944cda23b110f6 |     
      xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/7e16559c0eb7c7d1732817892a267615e8b9e38a | ORPH
        or1k |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/71e366c8f6dce71d7b57bf3d7508548d610f4799 | ORPH
         sh4 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/384bc421e66b5c714136e37f32c8c1697912c1fe | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/77153fe091b8d6fe86edb783b7aabc00439f27ab | ORPH
        or1k |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/32237cce942951ed529d2bc534c0bb1114fdfae5 | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/26fff1593ac401d098e57971cb2154e28af673ae | ORPH
        or1k |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/d9f4d8007d3c2009a9d36b2efea033a22d6e9dac | ORPH
     sparc64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/0e1b947e577862ebbbdd52408c9e5fcc8d5f2349 | ORPH
        or1k |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/e8be99f334a22698bd3392ad29c5ff1e9943073e | ORPH
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/11451209489c0ef0f375218919b3c5610574d6f1 | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/afb581e20ed9121117b51672885c12cab9e426cf | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/4c04cb72147c0411f97005c8c5396a25e6cff40b | ORPH
      x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/217c5a9aa418a7af3aaff2ceeed252058543a0be | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/25e0c64471d992d9b27a5c98024ba793f23b8e7d | ORPH
       sparc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/4720d07f79686d00a1cd166eb412cdc8fd3397ea | ORPH
        m68k |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/7ad973f17c170c95acb530d51437a08faf78c258 | ORPH
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/4b907edf0c88b86e14c8a93395ea2d7e163d59e0 | ORPH
        mips |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/d0a403468738576bf5d6f28bba8588bffff1a540 | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/ac2338d503bd32570448f92a17caf146d4c7a97e | ORPH
      xtensa |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/7ec1e15f3741770789fb7fd7f9265d547a276a02 | ORPH
     powerpc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/a6d978273ac55fc5867cc28b8fe7b6ff407521bf | ORPH
    mips64el |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/23be6a3acbc1852c81eb6bbe4fdcf875010017f9 | ORPH
        m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/b95726b00aa70f87bdc8ea4ebf7ae8f0896782cd | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/d2e938d233781f01f60266323f22da0bf327246e |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/2466ed87f64c0bcf85cb3f83219bf8090afdefa2 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/f040a5a6a1b73f36f298f181c77aae25068ef16c |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/23b1ade1dd2a3356295803ae5f674202c9c7a30a |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/423d30b72ab2f341da92264958d1b9a42bc6a638 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a1e82bf62fa1abf1e578e01cca95c379d1efa9df | ORPH
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/2ee947f7eb5dcabc9730efcdf7204d8c7a3d8790 |     
         arm |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/819acbcca4d11844ae388e91a056ffdb92aaad75 |     
         arm |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/0373fd62f67623c5ed5a91299cb00df408c0d93f |     
         arm | triggerhappy-b8228880661293... | NOK | http://autobuild.buildroot.net/results/13f541a0e6e09a3634000e128d272671a7e0fc8e |     
         arm |            uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/a1cdc25c9781ad8257887b13af42cea182c1e960 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/6325c67e9395383934aec2f24caf24553a02e16d |     
       nios2 |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/c24800ae4ff5110e6a9df1e3504745dd4ea8b891 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/a2cb3a93f0556a1d84399f59c461fe40acb1fa72 |     
        m68k |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/7153fde58db61b6443c27dceccd6f987280965c4 |     
   powerpc64 |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/a2d396b17fc52fdbfb4707dd461d02511cbb0d04 |     
         arc |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/835b19237f5814fdcd34a5ff0ce0208353af6c0c |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/5691c3419bb9a44573313dee6a8d4205f54d4ec8 |     
microblazeel |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/460a73dcaacd55e1146225525880db64e3172f12 |     
        m68k |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/dcc27428745cd750b193d6c737d7b05128178e7e |     
    mips64el |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/afda79aa9eb4631ee2a081fe43e08133e4a929eb |     
      xtensa |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/4ae5cec6d98caa821856362f36b881a85ddf5418 |     
         sh4 |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/de1d2a37637523a54a56e7b18fa7092fe8918cdd |     
    mips64el |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/7ff93afe5bf0231290241fc7a28cd136b44d2055 |     
         arc |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/596107f1221fbead06acc0903b5bb9514c9fa7ef |     
     powerpc |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/1850b7ad52a0ae3131fdd70a1538df8ac6b4e4dc |     
       nios2 |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/38c44abba5d288b3b05e31c78df3c7eddcd73a89 |     
    mips64el |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/6849126b00a23e62110355065bba14e2f9363aaa |     
         arc |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/6bf8802d2a2eb54d3ccf2f041b2daa4a7a09ddff |     


-- 
http://autobuild.buildroot.net
