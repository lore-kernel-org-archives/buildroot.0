From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-15
Message-ID: <20150716063019.19493101C3B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-15
===============================

        success : 228
       failures : 88 
       timeouts : 5  
          TOTAL : 321

Classification of failures by reason
====================================

             qpid-proton-0.9.1 | 7 
                  zeromq-4.0.5 | 6 
          c-icap-modules-0.3.2 | 5 
               libglib2-2.44.1 | 5 
       host-erlang-rebar-2.5.1 | 5 
               libsigsegv-2.10 | 4 
                  boost-1.58.0 | 4 
                libtirpc-0.3.1 | 3 
             util-linux-2.26.2 | 3 
libsigrok-fe473123ba836445d... | 3 
                  ffmpeg-2.6.3 | 3 
                iproute2-4.1.1 | 3 
                    mono-4.0.0 | 3 
                  c-icap-0.3.5 | 2 
                  opencv-3.0.0 | 2 
               upmpdcli-0.11.0 | 2 
             btrfs-progs-4.1.2 | 2 
                   audit-2.4.1 | 2 
                  cc-tool-0.26 | 1 
                 webkit-1.11.5 | 1 
                      qt-4.8.7 | 1 
                   bdwgc-7.4.2 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                  guile-2.0.11 | 1 
                    libev-4.19 | 1 
                  acpid-2.0.22 | 1 
             expect-2014-05-02 | 1 
               alsa-lib-1.0.29 | 1 
                 mpg123-1.22.2 | 1 
                 mesa3d-10.6.1 | 1 
                    bwm-ng-0.6 | 1 
               libcap-ng-0.7.4 | 1 
                beecrypt-4.2.1 | 1 
                  bcusdk-0.0.5 | 1 
           aircrack-ng-1.2-rc1 | 1 
libatomic_ops-libatomic_ops... | 1 
            c-periphery-v1.0.3 | 1 
     openvmtools-stable-9.10.2 | 1 
               curlftpfs-0.9.2 | 1 
               valgrind-3.10.1 | 1 
                  midori-0.4.6 | 1 
                   systemd-221 | 1 
                 lrzsz-0.12.20 | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
              lirc-tools-0.9.2 | 1 
                   sudo-1.8.13 | 1 
                 setools-3.3.8 | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/63382b35b24c59972ae9fcbc1d2cf153f7985895/
         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/7c5df65ccb8cf2da528ef2d89bd4ee2d197cd11d/
         arc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/c571fd5f4bb6fb188e2bf360d7d0c6b87325629f/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/b82eaf648cc4ba569f6be9efcdaeb52e0c65e416/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/5bf320ea5a1f272a0e39bf9a7962969862ddbcca/
      x86_64 |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/de8fce8737ea3cb88ad160b0b305ec1bd9f8de9c/
      x86_64 |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/e9a5f76cd0687b38312f6f7d9ec42e6d25622485/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/40bec498f57ea0ef71c98f77524f8d8fceb0df9f/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/8cd51bfaa72dbb198f77f2a8d9a2435d89c09d72/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/4c9f1cec88bd77e2e5d43977eb944d67038ee74d/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/281c25686e53d541d073bc2961ac9579a4d0b72e/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/a481905bb1e37974824678083a1bb204aa26695d/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/1e0b70db692f9ce47fc7db4ec33de451cb8db7b9/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/651c64c77951fbf93e001602092a549c386d4c16/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/071a87361f2a00a2c59bf2bdb6067c075936ec68/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/0162ef26754a6d08f4ca3ff7b1c1502c4fa3c2bd/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/601b06153ad416f02a1579e76197543e44dcaba8/
        i686 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/54c8b8f647e4c00dde0b02a28791509ecf406ccb/
        sh4a |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/d4e40c7db3f63a32607359d7c5241ed13b68cf6a/
     aarch64 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/3e671fa88736079975666dfad806f3affe2c7285/
         arm |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/a873d9d4402810d38b18ccb6589263a40799a793/
      xtensa |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/81928730766b27d52d1b14fed983b143b4427ced/
       sparc |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/2a8751b83afab8115fddfd27090591f7962b1e42/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a1def7af6213b8079ab82ab0df9ed1ac5abe0298/
         arm |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/a97ad0c7ad73246b073988a3f019e4b1b483d6dd/
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/51b1ff55a44602224c321b1bdbfb30aefced9da5/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/a0d0555c6ab455b398060b9caec93c6e416aaac1/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/ba79876f468abf17fdcfceeb78e75e3c9eb635b3/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/7e78e18614094f900f3ea13b35d7ed3c880897e3/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/ee021d0e8ab80f9fec64c45a2d56af7157e6a4c9/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7b3a8dfd73d90cdf1d354bdfeecde91673bbca90/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/0efcdc158653a3d044950e4dec61985bfedb285a/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/30e5176358c90c659ebd4979e703a81bc13aa626/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/626156f5f1d6edfb9d0cb0397ed1bbbd936443d3/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/7646daa237f10fa3bf8e8c4a679976db42d3be9d/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/fddaa4d935eefef5d8df753add84248959d3a0a6/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/062376b7798a990e50c0c074aa1d678683cde2ec/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/8781a2a6140bb63df24b16b8faff964803592fc7/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/b176a53dff069896e531a3f59720144b6c909510/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/49791d421ce646c197099626af81d4a1f72c318d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/e365e08fde30208d979d1a4e4be500f812f9f650/
       sparc |                     libev-4.19 | NOK | http://autobuild.buildroot.net/results/abc90b6c43fdba02ce7d72e5af80e5d92b8bd3c4/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/47494b965c2edfbbc9841932bd4c20abebbe9aa0/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/c94b405cb97b03818938c228d0691342309f55c7/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/4af56a512695a6c3dec59e46858411e7474ab9f5/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/c8dfd408c90fe9681649c0ff737aaceab928ad06/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/f7c25c20f925e625d0db8c203e8147ac3a34639e/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/59e5d99c37619bb0fb0465a80158dd26943bc628/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/d03012700ee5983c450cccdd8960f88b4fc73497/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/2a30c34afdaf3a02c2accd7e063cca5c2b4e0f0d/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/607bddcc28c5d686c60a29490545dfc1c779adc8/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/d1e204f58c5228ea939f7feacd3f61b723afc209/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/370b97174366d604e170e649553f99c1e5ff0bfa/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/e8261cf7a3776567f05e523880b69ef6e6a60781/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/d736945b5ed54f3c653683511ac385f70a4ee1dd/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/2f954a4ed8bd5977f1c669b9b7c06d729115472f/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/cbdb11eb85feef2bac3494aa1682b2d79531fc35/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/78eaf23c1c5230af9705373599b9ad3695b3feb7/
         arm |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/87f5ec10ae7f82d90f72e5e156d2c9f646845582/
        i686 |                  mesa3d-10.6.1 | NOK | http://autobuild.buildroot.net/results/c6967a0df43b6f84cdc77eed9fb624af0f73dce8/
        mips |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/72b1e881b6e323b0cb43acc393c479b8035c7833/
         arm |                     mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/ff888c196d90da1a59d63d36949d45801470102d/
         arm |                     mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/ed2d1b0177c50620ce1d559a10515a1166bcc54a/
         arm |                     mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/db7f2eb31e47d84e99fd84c25f40f1b057bd5cd7/
         arm |                  mpg123-1.22.2 | NOK | http://autobuild.buildroot.net/results/ac02eb5a039c6da3922681fd8186e490e215068f/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/dea80fc2189402584bf769ff39a78ca6dbc978a0/
         sh4 |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/20bdc36670f7615e1ab7e72bbbaf8b408072f364/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/28ca19b23e7167a7bd64152d50e9229792cb1046/
     powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/f728a91864a9cc410a9dacf1abd3d080f55001a2/
      xtensa |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/a67ce3b1929fffa2963db19b2287df8737cfc982/
         arm |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/e8756b97c2810f8b712ef7243e637a907e97511d/
        i686 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/8eb8d5f4d5bd840f21ac41a1fead0f500b194bdf/
         arm |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/fcae5bfc0606848fd05dbe75bc49932bccbee3a4/
        bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/c6fb5240596b2c351a30778ac55dad058015503f/
    mips64el |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/a9b1e46beb8836672fecdc5b8af65fe9002e3b41/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8d29a9008e1cbe1228645cb0cf04418853d04c62/
       nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/6e08cd05ef5accd4fd3aea402e4054ac460eed12/
         arm |                    sudo-1.8.13 | NOK | http://autobuild.buildroot.net/results/9931f0660fa42416ace4ba5b4ad85cb874285d1d/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/f4052c0166456e4c13ecd6f733c27e56c28f58f8/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/d975ce7a3a58fce65e93031eeb3c239cc185bfc3/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/faf1b071c0a5bd8395d79abf2e6a32169ad7f136/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/4b049371a8eac216ded75e14e962c994032ecb1d/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/4aed04b3d8c90539231f7afc0eb64a788991331b/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/e0478b8d717b858196cff3a2c0d86ec377f82106/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/8d2c31275f272c3d561bf5151f54f9ef5ea64962/
      mipsel |                valgrind-3.10.1 | NOK | http://autobuild.buildroot.net/results/5ccc2e48fa4deb90ab214c82e8921ec494555457/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/c86b5c90569baef7c42540fb8791e8d1297e954a/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/d5493fdea50320462dcb06c74b90c732b61dd18e/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/ddfdc4f523a817a1792ab5b6f8b3648e6c08e5a9/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/efa420dd01275a1288987c749df582673d789a76/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/67144741456945c09a878129fa3165c58a003fb6/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/2b5ede873c5a7e1f55e58aa6a02de3d8ada96a86/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/236e7c5eb6aa76aa62dfc109a168001b10fe78d6/


-- 
http://autobuild.buildroot.net
