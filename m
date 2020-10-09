From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 09 Oct 2020 07:08:25 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-08
Message-ID: <20201009070833.C7D1586FAF@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 25  |  3  |  0  | 28  |
  2020.05.x  | 20  |  3  |  0  | 23  |
  2020.08.x  |  9  |  6  |  0  | 15  |
    master   | 118 | 48  |  0  | 166 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.13.0 | 7 
        host-sentry-cli-1.57.0 | 4 
                clamav-0.103.0 | 3 
  gobject-introspection-1.64.1 | 2 
package/qt5/qt5remoteobject... | 2 
        python-m2crypto-0.36.0 | 2 
                rocksdb-6.10.1 | 2 
                       unknown | 2 
                  boost-1.74.0 | 1 
               capnproto-0.8.0 | 1 
              cryptsetup-2.3.3 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                    gawk-5.1.0 | 1 
glmark2-c493520253fbfe3676c... | 1 
       gst1-plugins-bad-1.18.0 | 1 
                   guile-3.0.4 | 1 
                harfbuzz-2.7.2 | 1 
              host-guile-3.0.4 | 1 
             kismet-2016-07-R1 | 1 
                   libcap-2.43 | 1 
                libkrb5-1.18.1 | 1 
                  monkey-1.6.9 | 1 
                    mpv-0.32.0 | 1 
                openntpd-6.2p3 | 1 
                  pango-1.46.2 | 1 
   qt5remoteobjects-legal-info | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               target-finalize | 1 
               util-linux-2.36 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.6 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/74ab8797671a20a06dff151246a6e4adf24dd766 |     
    mips     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/4e6af499ba30f5172658502bd183ca72703983da |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/be9ade92add1b6c211d0be901ab68aee949cdd74 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f7ce0d24353cd2f5410cbc1c259d7ba6644372a9 |     
    mips     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/afa2f66bf6d86d5431cdf3bbee0d7168a7935c12 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/341f3c5c281d4eb51198f4c2c3055bc5f27c4756 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/b1a516f2e6853820c5bc531aebcf01090493b2b1 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/4d442339cacce20dc422c6cdd6df802eb77d6049 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c8b9fbdcec5f5d736d1537d46e7c040d98ea0d3e |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/e3b2d1a9eb9c6777fcc7b7cd901266ebf06bd9c1 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/22ec251fbb8b21d6e26f1c2405c692a3bfc888af |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/e10f3376f8fb677ffe9cd79bb56de587ce6bf100 |     
   nios2     |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/8839bebc83e70f0150e7b0e457ad359d7d5866e1 |     
    arc      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/6d3a3c84d3bf4868e94b5795520f153dbb67eb7a |     
    arm      |           gawk-5.1.0           | NOK | http://autobuild.buildroot.net/results/66dacfe7b0783c7df29052fff20f3e79ecbcf054 | ORPH
    arm      | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/89ee276b6b8b6f4b3982ba3f64e2db19a8884d92 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ee504c5c101eac70d4860cabc70865642a03600f |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a9e3dcdf5a44eb8be0412e6b65aa09c0f0cda5f5 |     
    arm      |    gst1-plugins-bad-1.18.0     | NOK | http://autobuild.buildroot.net/results/8a7ac3c3a92ed31cd08bb539e1c9dbf7759c37b9 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/5ee6d396ac93e1d5645e782d0ee921d63b658ecb | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/c6a1ed6aa98c67dc07abf72c1fc9db228e87a1e8 | ORPH
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/89ca28a16729c94d1569cd2b7920f6cc7af11c23 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/33b12ed653a25d063001b660a99203d976de509f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a98a9bca6593d597363e7868f8dd3c0b1621e99c |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c0f7387ad32683e37cc7d140a971049d221c7809 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a61defdb500c03bab3d46bcb854c2f55427bcc84 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/71955acb6bca56dc0dfa388fd5fc2268bda61430 | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/1fe62dce91f58c0aa219a369b1aa52df76f61dd7 |     
  riscv64    |         libkrb5-1.18.1         | NOK | http://autobuild.buildroot.net/results/764a7f2a02cc2171b64d2771ec428b242cf1c03f |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/129fa4c585dcbd24d5cde128c4b8ff2011d7d0c2 | ORPH
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/f0a720c14254b9b5356b2c562d62272e0ac6561e |     
    arm      |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/0c8ce17a1b2cc5cf069c42503baf500a08aec3ce | ORPH
    sh4      | package/qt5/qt5remoteobject... | NOK | http://autobuild.buildroot.net/results/c6a961fc55e17bd3f8187a3ab2de3755384793db |     
  mips64el   | package/qt5/qt5remoteobject... | NOK | http://autobuild.buildroot.net/results/486563913e0fd4add2350f3c352db94ed86bce55 |     
  riscv64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/db7986836b460a73933483d0c65343a655e7f54a | ORPH
  riscv64    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/3c1cf3d155e532dcbda283438e349e1bad3d2e41 |     
  riscv64    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/13b88d11be09fe20462ba21f53ed75c8bcfe6434 |     
    arm      |  qt5remoteobjects-legal-info   | NOK | http://autobuild.buildroot.net/results/e950b618fa156fcfc13a40af6053de26a648c295 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/d95cdd5b4bca9530106250e580c9d61e2987bda4 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/c1bb8b6940e7ac9727a9ef8153949eb0555777b0 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/c9275dddd22c9b6e973bcc9425937deaedf4b86b |     
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/7ebe95f4e2c3c7e2b6b134eaddee8ba26502fa18 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2f0f5b4ea9b1e9fdaf9c0d63b3aaf4bc085c3ee0 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ba7697212a79aacbe64e55e0863840bc9987bd6e |     
  mips64el   |        util-linux-2.36         | NOK | http://autobuild.buildroot.net/results/5891f4ded0c475bd449837b8be476290e84c751a | ORPH
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/1178d3ab1136fcc5f87bb0cfce0b9c71625c0217 | ORPH
  powerpc    |        wireshark-3.2.6         | NOK | http://autobuild.buildroot.net/results/01c3d3fb2dd331267c06d22726b7a0def777bdb4 | ORPH
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/af1bef50cace3c1da2befd2595d234a6ce7c5bd0 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 opencv3-3.4.9 | 1 
               target-finalize | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/007e75e59b45c36c5879e631ad67c905f03d444f |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/54773c389995fb418f024d993a58dfe0c729f28e |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/58b81702960cb61ca8668b60f5b29675d2475762 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 2 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/dbca8519462406ebf87276d3c866820d35434cbb |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ba79a05514e451f1767975e2cf9d7b3d7fb7da93 |     
powerpc64le  |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/98f14b010e9632d76e6e8b9e467a380148a9e537 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                 openal-1.20.1 | 2 
                  ndisc6-1.0.4 | 1 
               target-finalize | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/0ac070d779b1bb23327e0b19b078c42e7abadead | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/385e81c261aebcf6f0b671eb914c7dd593cd7dc5 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/b83354516dda07f659fdc11f0e6cda8a9b2aea38 |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/63b0f161124ce2ab6fd9325625350cef76262e33 |     
    arm      | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/ab7781432b50fd01cf6e7de912e26d617116b51b |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/4b75b48214b7166a13f2d210101d8050394bb724 |     


Gitlab CI results for 2020-10-08
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/779210821  |      
               freescale_p1025twr |  https://gitlab.com/buildroot.org/buildroot/-/jobs/779210891  |      
                         odroidc2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/779210973  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/779211016  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/779211056  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/779211057  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/779211096  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/779211098  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/779211123  |      
                       rock_pi_n8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/779211127  |      



-- 
http://autobuild.buildroot.net
