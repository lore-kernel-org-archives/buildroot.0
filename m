From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Jul 2016 08:30:33 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-28
Message-ID: <20160729063033.26B40102622@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-28
===============================

        success : 161
       failures : 156
       timeouts : 0  
          TOTAL : 317

Classification of failures by reason
====================================

 host-python-setuptools-18.7.1 | 53
               target-finalize | 14
                mongodb-r3.3.4 | 6 
               host-gdb-7.10.1 | 5 
                blktrace-1.1.0 | 4 
openblas-f04af36ad0e85b64f1... | 3 
              lirc-tools-0.9.4 | 3 
                   fwup-v0.8.0 | 2 
            lttng-libust-2.7.1 | 2 
      kismet-Kismet-2014-02-R1 | 2 
tvheadend-8e637f9f903f6d820... | 2 
                  cairo-1.14.6 | 2 
                    mpv-0.18.1 | 2 
                  babeld-1.7.1 | 2 
               libepoxy-v1.3.1 | 2 
                   assimp-v3.2 | 2 
                 libunwind-1.1 | 2 
                  libsepol-2.5 | 2 
                   ncurses-5.9 | 2 
                    owfs-3.1p1 | 2 
    xserver_xorg-server-1.18.4 | 2 
               linux-pam-1.2.1 | 2 
                harfbuzz-1.3.0 | 1 
                 gadgetfs-test | 1 
           quagga-1.0.20160315 | 1 
               gst1-imx-0.12.1 | 1 
                   taskd-1.1.0 | 1 
               libdvdnav-5.0.3 | 1 
              squeezelite-v1.8 | 1 
                acpitool-0.5.1 | 1 
               binutils-2.25.1 | 1 
                   strace-4.12 | 1 
               qt5base-5.6.1-1 | 1 
                    norm-1.5r6 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                alsa-lib-1.1.1 | 1 
               libcap-ng-0.7.7 | 1 
                openssl-1.0.2h | 1 
             bluez_utils-4.101 | 1 
                  openjpeg-2.1 | 1 
           linux-zigbee-v0.3.1 | 1 
bullet-19f999ac087e68ffc255... | 1 
                  fio-fio-2.13 | 1 
         systemd-bootchart-230 | 1 
               openipmi-2.0.21 | 1 
                  ffmpeg-2.8.7 | 1 
               tinycbor-v0.3.1 | 1 
                    nano-2.6.2 | 1 
                     xen-4.6.0 | 1 
                libpjsip-2.4.5 | 1 
                    cups-2.1.4 | 1 
                    mosh-1.2.5 | 1 
                wayland-1.11.0 | 1 
                 clapack-3.2.1 | 1 
               mosquitto-1.4.9 | 1 
                  boost-1.61.0 | 1 
             transmission-2.92 | 1 
                     php-7.0.9 | 1 
                  multicat-2.1 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/b3027e6c7384e242361645cdfa96466238e457d8/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/8e6bf8924414d0d4a026c62c5561dbfc25bce1f0/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/05ae7eaa2293c28a44e5b745d279283cd8f55987/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/6097d0b368dd39f0a527d1eb89e8cc27d0d91fd5/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f6a36334dc3a6239f172d97806764b6e9426eb40/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/87492d081274037d2d8d830a0ab0f6347ff5e1df/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/5cd5fab0e17fa74c2cbf4daac538eaa264242663/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/0d3a70da42b8f3b868d2db050475d0447beb39d9/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/e29db52fb1113e6b35060f25004327fb9706b168/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f8281d33b5f6d344551ed164f185219d58686ab9/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b07d4d9a75609148f717d3325c46e5c6f3948cb6/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/5325b2ab96684da433df800c9898a7f05f15f061/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/514d53ebe216aeea387aed1c036d3310efb0ce4c/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/4b010b7c3e90d13ed82f73a9d5383c6bba4cdbbf/
        bfin | bullet-19f999ac087e68ffc255... | NOK | http://autobuild.buildroot.net/results/640c7c15a1b3839b9e7753d24dd5a1ff36cf358c/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/71e4d6c0ac0f37bd6a96904fcb8bebfc752ccd85/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/327175daf4c422440b207b939f5a1e89482402ee/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/fb248e4e712574ee9ffc9349bb628906f2977fc5/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/d1f67e9edde909ad765a96fb67142b8f9d870489/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/11ac4f1ed3c15f971a9b9f26042056f3cf1b36d9/
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/4f8e6208877c8a7a7fdc2e78edacac5cf591ec41/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/9a98819b7597765d370a36ffd920fcac8cac55ce/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/088c8dadac19eb060c101d149cf64e5e844564ea/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/703ce2a7388f685051500462e29a513834c1d2f5/
         arm |                gst1-imx-0.12.1 | NOK | http://autobuild.buildroot.net/results/df7b8b9bc5e2aed1acf58528e4db4d14ab9247c2/
        m68k |                 harfbuzz-1.3.0 | NOK | http://autobuild.buildroot.net/results/e99f08ad4fc4f45705d6b4bd5d89f8326f05f1b9/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/752e904fdcaae2cfe782d20db98d379cb55e8c04/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/83e39c89ebead8ef87d4bfecd0663f1b115deabb/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/2b0aea1972e458623efd3c2b62cca8e55745192c/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/a9c3b8cdb46496ca8f4469b739329c632e7001cb/
      mipsel |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/addabc6cf8329e787477696e99b2fb69cac54f8d/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/d5353f338d89db7d635453217f6c3d5b98acb104/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/d7427b1e35f7a2a5ff74ed393ad373e90fdf8c42/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/b9ebd78dfcc454c03a4fb68eb1758b8ab362e926/
         sh4 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/8294fa9316c5d2ffa35d4ec92204e5828a7e584c/
      x86_64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/dc6150209a1bc158a93be08d5ddc0b44c8315299/
        i686 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/3e3f74d92be540e14b1c85aa248b7fdd64f9c6eb/
        mips |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/5ec076f20056c65f01cd766e3f2fb37122f1fea3/
        mips |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/71a393f16d7e0100050ecbce25a336ad070e9433/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/5576440baee0435c6ce9f3f0440d35a90c0e944d/
      x86_64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/878268a2fd1e0086f5d6b9ce0d0de283eb584a34/
      mipsel |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/555eb46da8f223b609f4a3106fb9a8c7acaef60c/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/d7620359ea92805333118e4e85488408dbffb048/
     powerpc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/b905566cd7f566dccfc13a94724b89abdad21b49/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/61cfa40799a903cd62b13cce18f8f4c638852e47/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/8df181ece8d376ad75c89cebb5a29b240b1fd7ff/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/87bf3129b59b9cb4469a12b531a943d63b9ed40e/
        sh4a |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/badde960fa2f354c06d1f0ca91ce97fa1bf40dac/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/ba204ba37db550091c7f9e2b92b795b1d72a1a6d/
     aarch64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/13107e160a85a79268a932a5c3d282dfeb8b5404/
     aarch64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/fd421c54cd902304ecbbb73f5ac6dac8dca9297e/
        i686 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/2af4e54aa1adee73d89fcf9b3e96e897f26c9fc7/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/0cf53c84fcd61a4c5c6ea510dc6b071e3ff5975d/
        sh4a |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/fe489ec6584f9c4526ba3292081baa45bcf31a75/
        i686 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/9e88eb5ddb9f78a516dddb534b32b7a697c66fb8/
        sh4a |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/38d38139f3b17e273cca12a8cebaa43f655db691/
      x86_64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/d6f5c96e3019e6127cd5b34e38ebb041ceed2210/
        bfin |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/36746747b285e0da3a3cb5a4ce060a0aa435c510/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/5c5c1e96756f7dc744dfb6657e3e6d53866be158/
     sparc64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/90508e0c79ae241420b645c106b298d227fb430e/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/e3167850a36a499c63daa0e002a747876c48725a/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/c52dab980851b550f29092ed9e515ed687f9aaf5/
     aarch64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/5600ac784e763d03bb92f6089457ceba07b09f52/
      mipsel |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/d024efe8c82c4e8422ad6f10f60bf4422cf0aef1/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/c81e8be81dfd215ea5dfc0a7a3da4737a2afbce0/
        i686 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/8991c65c765f7514e158a4f4657ef6e4d8f623f0/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/5ed853b66d22a8ccf90ac2ae105a87b6b3475c74/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/cafe38622a592ac2df96306dfd9b2c9c0450e4f0/
       nios2 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/4d2c8397144e9093c993d0de60f40607ea2dc4af/
         arc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/58d21eed05c44811e4e73bec4b7772cb5bf02769/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/8b322ab09094fc3b9986ee3217ba5454f8677cb4/
      xtensa |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/a66125f9d59bf6ed36999492a2cd0492fcfec038/
       nios2 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/1070c3aae6f6a1f08380a7303e52bf906542a8f6/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/77431435f21660825f668c0097fe9ddc949fbacf/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/401205f9cfc23be8f655429469c66c72540fa27b/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/526461dee2ada53bf9d8db61121d0dc5a40c6a8e/
     powerpc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/c12169719a79941f7564027b10ecb2a78ad2f284/
     sparc64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/54c53a247f76ffcd0bae486a6aee5e6e10eb60a3/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/cdf5405486cb19f2bd81d9f16496085f609508ea/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/fcb48b4f63175c2de3bedea31843372944ccb364/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/5ff5acfe85eae6458a36e50a1a9dbec12508fd0e/
      x86_64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/288bc423a031e907a4c34efe0bb3af2b3a157d47/
     powerpc |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/0aad51bdb05c834bf481fb649e953676bfdee499/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/01013c67458fc012fc78fa2dad1f168cf24222f4/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/8acbebdfe416ae28b17a769f2ebb0912652f0f9f/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/f2e765c10355965131a16696903cd3c9c065d252/
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/63155ba60b32d8948152d308c244fc5bb185a458/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/0c02e3b053660c9ece3b3e68f308022256044bec/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/e59ce84d9bde89c144f004e9e90de2f28a271406/
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/ed8d562ae5fdb472a83f9a07b2f755c80c972c34/
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/4d5c231e511bf673b4e5caea338c1bc7d8073944/
        m68k |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/e8cdfaf8e2da29a855b5bc09774f3aadee087737/
        i586 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/6180e39377cdf06d7dcae2daffe54991943d1990/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/32d54ff1639425255ed467b77764b552e2082d57/
         sh4 |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/27d2807f1fe3cc4ea5f6ccbf600f0fd5d5930f4c/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/bdc8fb933b4a6ca809eb7a4f4b34afa408b63988/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/69106137e3fc14c085aac53d399413bd427d4de7/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/2aefa62a9595e2ba62decf37871e2cbfc6abd506/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/6a50d78f4ad0817d8e155dd7832c50eddb63c12e/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/137421e0c0e28ecf70c43ff770f400530000544d/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/e9d631ba1531459f8409817d0b86c367b7f34b8e/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/714cd37de23a83927460f578ee4cb6d8ccad48da/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/0487442dba78015a3ae3f44109ecdbecf274981c/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/da1259f554c61bffc691fa08a82b8aa9887f89dc/
     aarch64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/904a6f995b28fd67a2e0690dded861a9016d3d61/
     aarch64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/9117ffe0afaafb14a611c7d2f1b9db2374012c26/
     aarch64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/05b174dd9a3a4614876832fbc37699aefe6290d7/
        i686 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/74a41d2c5eaa84cd2a4e997e9a7b5200b20994e3/
        i686 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/447ad3a3da1ecaf7b95b0d39caf429c4c28fc428/
         arm |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/dfc67bf1d486e2578194a51779315d03ceb3248e/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/a456870b5d31d7e404cb3b857643785877cc966a/
       sparc |                mosquitto-1.4.9 | NOK | http://autobuild.buildroot.net/results/9a50f3fb97bac110019dac1936f73087a6d0fc11/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/8cf6f3a9a43206d592e02b75c2b5917f8dc90512/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/f08aa3672c1856605c16603349c442da2e0f4998/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/a2b2dd27c052f048fed2c569268916017e552176/
      xtensa |                     nano-2.6.2 | NOK | http://autobuild.buildroot.net/results/597771ab4ca7bcb43ea9dd69d2f70406ad9efb73/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/aed110332eaa333f3b5ae2fac9f01c0ca980ecd6/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/e08824d8487dd4705a3d025e20236b98ad86229b/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/009a3701b6e0a358d6ad9795a10968241a8cfaa5/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/5940f12b8a89e6fd2977d03001121c0b33264058/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/8e49c7f9868aa5c59a2e8286ad58b2f143c04953/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/91f72cda3c25d5dc2f8414745b2d4ccfbb82b774/
microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/07cc39ae5f93057effdf8a5dc46e1d55a988ba15/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/e1db74980100e7abb879f9b87f5f098f77cf4498/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/1dc317cb7d190f2865e5126c741163b0ffed3632/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/a1d634da0648e321989af2f8bdfb3c66bbdd22e7/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/182b539bee660e6617e049296f9a078a8d9e03e6/
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/b84fdc4904b0b86414192303fc068a7851b0cc94/
    mips64el |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/c5e65a3ddec80051e76afefc8dec7bc1f8baaa9d/
         arm |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/c1cd50689a5ecbc194c6f167ad83d0fd5d219c2e/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/fb5501b4a33a8aef787cb91a54e1f74244e710f2/
microblazeel |                    strace-4.12 | NOK | http://autobuild.buildroot.net/results/b05e4267329be5c24ec5529d92ec919f83bfa7e2/
         arm |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/7a94e1551cc4ae5f3f79bbc8a6b99ea171d480fe/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/62f4e04da3aeaa8140363dbb01649a29a002326b/
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/cb27a95bff2b9bea9994374d4e7e44da099145c5/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2ec8d8c1c10ffb9b7e642c8bd27ef06ce8e415f5/
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/509164030e3b6f5d5c3130f44dc1f33439de7b70/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/04f9f7fb5b4f6c2b46166ce635a2cc9145342aae/
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/46709033a2624d275e1e69bfe32ce6d999e204f2/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/16d51733442745a67ca228abe2497236bc117024/
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/1602479c8ab5aa67accae4a038fa95f1e172146d/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/1070ade0eaa4087db396926464389bb5f116b76b/
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/1470813915d73a8306317aa26f8b4217f422122f/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/fb7ad6dd087168970048bad2a73bb6deb002433f/
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/b72b27fc6cb58f11d82513dbe801211ee2463219/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/e2d7b347b00c61d57b50e5187706dcfec1b68de1/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/0cda723528f370328f38e16fb9a6517783521405/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/820e56d4f149266899f2210f23fb580dce9a29a3/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/8b9d648752d4dac4dbf53193765d110f8c0dbba5/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/b8d7cc1b1eb16f7f73d2e0ce7788e052e0e26f73/
         arm | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/55503070e1d99a849efa0ead9008c5afb942027b/
         arm | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/5cfcd1a6ab3c798227ab0649d7d229609b31c4d0/
         arm |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/6931608ad60419b2c382682e70ede605b17b1fd9/
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/2b2015ca1a8cfcc5501f4a18e62dd1e5563abe2e/
      x86_64 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/495d391a5adfbcd5d6f2788aab55377f38199774/
     sparc64 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/f96e76e609fdfdbe1b6cd1cca09f697db88d2fa8/


-- 
http://autobuild.buildroot.net
