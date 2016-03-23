From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-22
Message-ID: <20160323073023.49CC11025E2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-22
===============================

        success : 193
       failures : 191
       timeouts : 1  
          TOTAL : 385

Classification of failures by reason
====================================

              gnuradio-3.7.9.1 | 32
                     tcl-8.6.5 | 21
                moarvm-2016.01 | 10
                blktrace-1.1.0 | 7 
                  boost-1.60.0 | 7 
           libimxvpuapi-0.10.1 | 6 
             coxpcall-1.15.0-1 | 6 
                    cups-2.1.2 | 6 
                cgilua-5.1.4-2 | 5 
                  connman-1.31 | 5 
                    norm-1.5r6 | 4 
                      qt-4.8.7 | 4 
                 qt5base-5.6.0 | 4 
                  ffmpeg-2.8.6 | 4 
               linknx-0.0.1.32 | 4 
                 erlang-18.2.1 | 4 
                 jack2-v1.9.10 | 4 
              gst1-libav-1.6.3 | 3 
  getent-buildroot-2016.05-git | 3 
             lirc-tools-0.9.3a | 3 
        lttng-babeltrace-1.2.4 | 3 
               valgrind-3.11.0 | 3 
                   systemd-229 | 2 
                     dt-v18.32 | 2 
                 copas-2.0.1-1 | 2 
                collectd-5.5.1 | 2 
                    ruby-2.3.0 | 2 
       gadgetfs-test-undefined | 2 
    erlang-p1-stringprep-1.0.0 | 2 
                  prboom-2.5.0 | 1 
             bluez5_utils-5.37 | 1 
                    owfs-3.1p1 | 1 
                    dash-0.5.8 | 1 
            host-python3-3.4.3 | 1 
                sg3_utils-1.42 | 1 
                 gtkmm3-3.18.0 | 1 
                 setools-3.3.8 | 1 
                    pppd-2.4.7 | 1 
             stress-ng-0.04.16 | 1 
             ipsec-tools-0.8.2 | 1 
                 lvm2-2.02.147 | 1 
                       unknown | 1 
           ljlinenoise-0.1.2-1 | 1 
                     nut-2.7.2 | 1 
          host-libglib2-2.48.0 | 1 
                 opencv-2.4.10 | 1 
                libpjsip-2.4.5 | 1 
               ipmitool-1.8.15 | 1 
          sane-backends-1.0.25 | 1 
 make[1]: *** [all] Terminated | 1 
                pinentry-0.9.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                grantlee-0.5.1 | 1 
          libwebsockets-v1.7.3 | 1 
              ptpd2-ptpd-2.3.1 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                qt5tools-5.6.0 | 1 
            webkitgtk24-2.4.10 | 1 
                wayland-1.10.0 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f75320707bcbcd09ba6de1653db5342c20903226/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/841b6f9ce22988cf42be1dde728a6d9acdd90480/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/5be9b6ab1caa68c82dccc7d29005b16515617f87/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/50069365c9249acfa588dcea84deaa6cf06d3143/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/6a06abd68eb7317e2924e08f7af0b79dc3101f2b/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9a8aedf241ecaab8508e75ab94a7d27d4d7a2dd7/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/0237ad8383b4c5d01157bdea7ed06febe60c603e/
      x86_64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/fef97b84d856116bc72d8461e3352bc7b25ee372/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d93ca4aba1e8afce9aeba1a82da54228dd04fccd/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d1c1fcc32c740889da99669840dc2c31b89d4c09/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1993a8213e315c4651714573f8caa0a702fcedec/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/786490cc21ce55e1c1293d4fe49c43e592b0e3b4/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c28837c558367e6d44c683e54e4a55dc0c45397c/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9fcaf484e3c0e4e745763750da71e8f5715a3c6a/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/826e4ea72fbf05a2963497dd1292c33488f5a034/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/336a5f41fb899f6e38cc7919cd4f0e5156197eae/
        i686 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/82de8106cbd17b1dd9ee92b47f87436842fef72f/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/9aa0b26c2c6cd35755af634a33aa871c52ac7c61/
        i686 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/e71e75b7b16c3fdb00982c82a30e316adb521c4b/
      x86_64 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/772262b5dce35e2a64215746da15136224b10d6d/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/f6b1385bf7a945c6722afa35d90b8dd3b2cce57c/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/20cd42fe7d0c74adad9fe495556e8b9806f94743/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/df237027f2a84bbeb83d82268551feab174e6da7/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/38ee6c41269e2e2502063a12c934e9c306d3e6c3/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/1e14d911150cb7cf6e37f3bfcc56f1190b62797a/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f8930811380c3c8b412aabde6d33f70c1f79c78f/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/cf58ab427af0d39924049b28edb6ef82a1ad30e7/
     powerpc |                  copas-2.0.1-1 | NOK | http://autobuild.buildroot.net/results/625c74f5b87293d287305f4d192961addd5d5c4e/
      x86_64 |                  copas-2.0.1-1 | NOK | http://autobuild.buildroot.net/results/6b7cd6bae4787e9ff0030d03ccccce27b189c03c/
      mipsel |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/72ad4980e1483c0afececd96dce968f13db726fb/
         arm |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/ba54a4d9210e7cbbbafd9dbef1baa75c94011b09/
      x86_64 |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/b09a8b7152f24d7a331b211a72ca981b1f0c9fc0/
     powerpc |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/089371eacaa069e8aa3c065f0cf3ea79c039d5c9/
         arm |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/30c3d3f5becce8ce06169a8155355b479c250e9a/
      x86_64 |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/95bdfc84957b63c2f6e2b327b396f17e36b06ea3/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/de8478c3680ea121bb2a922fc4747f74b77b3c15/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/c1f66d5c9525ee84b68852835484ddb18fa65c28/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/c2a9f14a83edbf7314ecc067c0376f61e814fc68/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/e7ab77204ac2a24206e578ab7679cf18482c8b1f/
      x86_64 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/3c1b29816d319be419cd2dc9240b7e18a8cbbf54/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/b73549962aa19554eb2a68e2a8f6e72a739ac5ba/
     powerpc |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/052bcdf778641e09e67b924ad4a7babb01032f9b/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/743641f42b545c2822fb22e708ff07ec6ad90020/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/503b5f40582ab3c22e37d1d6576741a0d25f1394/
     aarch64 |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/411a4f3a280f0316475747967abfe361dcc60907/
     aarch64 |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/53d7da96f19842e2b17a50e336a32c38395a6bee/
     aarch64 |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/fe3416fc298681bd3db8866570cde1ea03c267e8/
     aarch64 |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/4135f8cb87b74886d5796517e5fd7eaf6b8c1954/
      x86_64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/a817346bdf7cdabfa7f19f9c2f3946b53ce1b8c4/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/2c84141148a165dafda1e866b51290f06cc2c2c5/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/39480093793c346f6533519865b245e515a4f7de/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/c33d612c7064532bea930404a9715ba45c89564c/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/2c3de6c0dd76c8e0eaf8dfd25cf62117576666c2/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/c7198cd761493a46290630235c4c059dd16cc968/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/f908b60d47f0d120baef6b65ff4506ab398c6e2f/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/5a4bf6095d537ed3dbb6c353a92044ace4ff3232/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/8e801da1e29db63150bb4715252e4175b32a044a/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/617fd5f9287c03d153693434d7a480f40fae6f0d/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/9da3184e77b982235f6ab6aa4b32da342f960213/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/2557d7efa82fd502b053ad7f1e7db50be2770819/
        mips |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/69e18fb83407dad92c15c7e3bb0e3545e8e27698/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/23ffff160009b3f444c355e28042dd480303d38b/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c1ebde08991c67ee6154d28eb477e42dc55fed88/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d020e6d83c2b1b6d1e0d9424484c22957f33cb2b/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/e77f9fbcbf33d5bd7a03caf541c3d32daaecd3d4/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/afedc6bbb41072eefc71eee9adc3f0fc95f596bb/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/0c10e6ec3135090ecfee4ec002d671645e23bce5/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/203d9b1469e4764a5a3d54a70b4dd65ff5e98064/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/2136ca694714663fb70452b63b19c3ee2c175a55/
       sparc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/96c84f58dd7f84d56d0ffcdd91c6333790d42239/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/bbe2f64687eca208f1e9eb7cc7faaf1c0e12c6a5/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/518316ee1b43b871fb66bef3b2aa38243cf7e186/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c15943848316c95932c1a5bc1b33865649bf4a3b/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ed1a8bffcbc9446e1c32fcae2df25b071acd5326/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/aec031ba0ff82f37f8d07e403c2f4c435fe41fd7/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/bd188c0b8e9bcd558ced74c4431cef416a675a70/
         sh4 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/0629aba78ed5fd9b61c2feabf6f99d4e9e9b9a01/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/4b46582eb31bafc1a1bef566e6f8e73883e03a42/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d3256ed652b7260a004c930af773a8447297f050/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/fb059b038b2a504fd087f3de45651bbf30e251ee/
       nios2 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/b875421e5d62f13683075b81ef116b2cfca1b64b/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/751adfbc816ab963b139ea3ea229bf3718bfacaf/
         arc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/3ea37646fed0691980a21cda5f281ce42effb5e2/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/a3e1323e5873ab039e5a92adb71c20a3eaf9888b/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/8e5a6a19a7872ba4e3367941dadb62bbcad3547a/
       nios2 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/1b8de078754f49fa8a05f7f1c6e52455c0c7c672/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9add2823a32916c9cc7da0eacfc4a770f553ef4d/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f890dbe06f42d00d6883f57731c6d377247165ee/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/25fb69317231d207876d66dc30514ee413a2f079/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ddb5d447ba5e9606676838a22ed8a24f369207c7/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/e174473920e58f2626962ea171223c08c4060736/
         sh4 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/4754a3f0fe12b16718fa02ad835bfaa8862bfc5e/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/0397165bfce34b791ee34fa00b8445dbe338c18b/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/1d20acddd61bc6f7bd725846b9eb5408d6f4e085/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/ddc4b99739f60246c8f35edfc342e739288157ed/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/2e49b5d3a7c4feb7e86a990b25fa0d1b377fb0aa/
     powerpc |                  gtkmm3-3.18.0 | NOK | http://autobuild.buildroot.net/results/cdc58f0459077721c1279e3e492b898f212be971/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/cba188d5407ee7e824e581008f30b92062f472fc/
    mips64el |           host-libglib2-2.48.0 | NOK | http://autobuild.buildroot.net/results/bc2a86d8a7fe6b7bb4efe6f19a7fb54d3f1cad89/
         arc |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/42fa44d763e0d5f9d83628615f3d7b7f89f58f6a/
microblazeel |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/b767af3c2bb87348a6ad25acb92256f517df58fa/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d68d8f799f71a47410cd97e50030fbb24bd6aaaf/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f0754759d56778ad89a21b59e03412c65c15bbc4/
         sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/553d8cdf72052a087440091408ad1843ed9270e1/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/71f1bf70c800cdfa2cd7949ae066f2fb9d2ee315/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/009cdd2d444116ba4b54427519c31e83457f2c51/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/345250617f2ba7df61be6f720d9195ab62cebe44/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/dae5517f8a48d4f497ebce2759292e0286df0981/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e8d7feaa52290af1ee7e081c1080307d46e3b73f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ccdd798a33ae694e967044fd41ce19782ce5b67e/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/c0ae7aaf07df2b0dce7ee613f18731cb63f2ff1f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e957ec68e5700ab2eebcbfc8961902ac38fa5ac7/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/b1a26e11f553302cb88601c7d2bee4aa4ab7a34d/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/ab347797fd29147ed68bb4717f99c4dbfa6cc042/
      xtensa |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/85ae0aaac18d4ed37db7f4707f7dd21bc6e62470/
        i686 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/3cdaeed2486792207945d284ae7d3b56dba8e74d/
     aarch64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f015bf3b498e93cb38063da9def311977c5736ef/
       nios2 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/3c0be1fe8c0fb4ec4f2346fd35e6153928b18e23/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/d8634e463d1458579c14005832428ba24a599e72/
        i686 |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/e2e047199d2559007a5a5ff61e650c67922a8c6e/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/6073d245f762f39c4dc7d0dec41e898ea0244583/
        i686 |            ljlinenoise-0.1.2-1 | NOK | http://autobuild.buildroot.net/results/535d0c15b5b7fb651455f92d10bd92222b420c5f/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/fc3f4d88bd132ff797def1a8dd43873d02e2790c/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/f0efc0a5c4a472248ca390cf5e5f61bb342af7a5/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/9b3ac729efffd07041a85b55160f8054b7dbbc1b/
      x86_64 |                  lvm2-2.02.147 | NOK | http://autobuild.buildroot.net/results/3d14db696a895bca752fc215841c88af32cb1200/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/1e14eaad7d2ca3f20cb4582e4109748da854e05f/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/77e92c1954ce2a29d965d9b09a933a4bd14e05c1/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/713204d561c5e1fe039fd5ad246c3ba959a90ff9/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/11d4b33edeeadf81f8169b5f48d0a55408ecbb01/
     aarch64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/1ed7b04283ef31b8324182ada5729ea1ec429235/
        i686 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/4dcbcde0046e265317e170a977e699e5c3a06b87/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/0ba74cb594ed0119b178336293880b759be1aea6/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/c689fbcc9e9b8fd042066e47d52dbc1b19d9f4eb/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/8266eec9ee20ff1ebe7f0dc9e041f9429130e6d7/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/47b8ce1c70345d6991e3c53e97bda6b8d9a4455b/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/fbbb704c7737690702bce364daf1971a201cdd15/
      x86_64 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/5eb068e4804e660c81c357037adcd3d8f1049b6b/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/13848ca1a965a6ed7af23fda6422d831e9ad33c0/
     powerpc |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/3cb36657ed7947520f3736c7d9dc1e54dc782990/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/159884c3c47cfc5fe0a79563830ebc0614143719/
      x86_64 |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/e75548258c31575fb6cc30c3b2d6d1c429acde64/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/bbe967469cf281ab40e6477b7262e767012fc380/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/fdb98afe38d53226a525457a8ff79bf4b1376326/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/25ddbb5812bc2b33a16ca032c9541d23fa1eeae3/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/19d61f0a10d8ff22ab02169bdbe652f19afd28af/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/415becfe7657cf4d8777814db4e06eb6961ed347/
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4215ea91bd288bedc3a26e0165bc816793dbce14/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/28e5a9ef1110c6f8e0f8f2b43bd315d46c5bf9a6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5f1c1859f6ced4c76c2706fd5c3c7b48c836ad14/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b9a58a493cc037196ad99fa281bbe5f01897ef47/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/090d4ba9b784bad791c2e92d669ba873b3766626/
      xtensa |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/3e96a9cf50671d845a664ca711c18f2a883a4737/
     aarch64 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/c16066a111c475667eaa01c080e7207dc9cc4cf2/
        i686 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/af95d158f38becc1004f5b59777afee740c0deae/
       nios2 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/b5e7ba0c36fb8bff4037fcba89217bdcd840c9a0/
        i686 |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/6c22f45da468419c203ae61247d60ff15e97df24/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/92251e1c73b9b652fec43869aceda0a2fe2e374f/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/06542cd9585f34ac3f6ed884169189b56708d637/
         sh4 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/5fb5fe57022ee0650f4b74e5846ea23e0338bffe/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/8caa6f0e02f2c5814158ac7112e53ffe478e1b5e/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/b4791b580ae7876b45c5d90cb1cdf01502eefc91/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/ba660ef24f48429e940f399db78fb7bfb9cbed1d/
     powerpc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/dd173ecf385fed83b785e07de9c009b885036060/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/51574ac75db23178f42a9eea3dcebe93d99fc1b5/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/317f163c3ca714f4cda048fdefae4ce8b8c619ea/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/cf63d031e7f5581430aaa26804fa5e9c1db1f981/
     sparc64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/3238adebd9aaeb64d512defb504935e8c19a94f4/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/6bca4a03dc448bfe26bc3b5daff0359bb9d0fd41/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/dabce0cbd37e47b8aa323860664868434c7f9ea1/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a4c19ddd6ac9cf76caf68927c020a6e5deb8aa45/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a62a2e6f21b97644cd7dd9ebd67812c8e348d944/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d1968ef8b78f7331c387c9c5d8cdc5e96a982b25/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/0012a662615ffc98c51f0327704a69d5ac0d7b09/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/e9208a0ed4dddcdb9741a3e45ad4f3ade9662f3f/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/4bc3078852454ea0d7bf9b85d212f6aef3370094/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/db97fd437bea4c7b7fc82205825383fbc80e487a/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/cb00e3493fb1f7b5cf351c7faab6384e04129351/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/4ed1b94ada3d2be994257994b7026e4b42e9148f/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/52d7528c6561ff81fdf4067d2b0b8a41ee040d22/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/08d26adf78d6113a72cb107ffcc6d73774fe78f1/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/57b12ccca57d3e1d7066c5d96b28d48734fcf993/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/5ceaf355bfd8643664cd1cbad4885492abdeca5e/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/249b1af69a651cf85be6bdb927cca2bb777c0b8a/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/1afb744d67dc860a0d714a0d5f4b2d8d88a71ca5/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/28e0d4dc44518ad60037efdf11f6a852bfd665b1/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/794c7ed221432e46a810fc281732ba417cd4cda3/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/edd0e2a01250a9b8b690cef985f87484fbda131a/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/2b86b72d126295bd3292f647c8bfdef3f7b7880b/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/d309e6ff97f2ca2191235d93cc128bd303c4ec0e/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/e9b0a31126f0d4f07e5fffd4fad3559b0a3385e9/
        i686 |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/1049d1ab4feee250cf225e7d3b4905e391851385/


-- 
http://autobuild.buildroot.net
