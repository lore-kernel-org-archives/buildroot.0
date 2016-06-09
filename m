From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Jun 2016 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-08
Message-ID: <20160609063019.5F2CE101F66@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-08
===============================

        success : 185
       failures : 49 
       timeouts : 0  
          TOTAL : 234

Classification of failures by reason
====================================

                flannel-v0.5.5 | 7 
               target-finalize | 4 
                e2fsprogs-1.43 | 3 
                    libiio-0.6 | 3 
               linux-pam-1.2.1 | 2 
          openpowerlink-V2.4.0 | 2 
                   systemd-230 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                     php-7.0.7 | 2 
                  connman-1.32 | 1 
               wireshark-2.0.3 | 1 
                 rpcbind-0.2.3 | 1 
            lttng-libust-2.7.1 | 1 
               linknx-0.0.1.32 | 1 
                  qemu-2.5.1.1 | 1 
           linux-headers-4.6.2 | 1 
             ntfs-3g-2016.2.22 | 1 
                    owfs-3.1p1 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                blktrace-1.1.0 | 1 
                pinentry-0.9.4 | 1 
              gnuradio-3.7.9.1 | 1 
                mongrel2-1.9.2 | 1 
                nodejs-0.10.45 | 1 
                  mono-4.2.3.4 | 1 
             bluez_utils-4.101 | 1 
iputils-55828d1fef3fed7f07a... | 1 
android-tools-4.2.2+git2013... | 1 
             qt5location-5.6.0 | 1 
                    quota-4.01 | 1 
                    lftp-4.7.2 | 1 

Detail of failures
===================

    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5ed9520ec70bd5e8e5c056769b0c79d9d87159f8/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/12c05a01a6d26e88cc34b2864ef6531770936bc7/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/f32f55181b460d2492b30af00478b34adb896c69/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/f02fc51721b6f66b0c0281d9928648c9e5eaf41f/
        i686 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/25c042d2862affebf552ed24bc2a58e0c484226f/
        i686 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/e347ecf96478d3204b4334f43ab66001e791e15b/
      x86_64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/e1ea138492a72ba8980eaba1cde9c440553cc495/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/11bb6e5ebfef69aa2ebc88825943397419d1d362/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/7bae8d5bc948171f869fca923875a2b156ca6f39/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/08bc8da37cd5dc7bda7cdf27e700379f1ec8d558/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d0b39cc27889471e84c147f7315397023280f9f9/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/399f33e4b3ab239cc03a33faceeee923a6347f59/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/193f9ff6db8ad81e5841ea377af2145479e73821/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d67d74f4bd75a93e3f610390fa7bf3b133be9212/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/3651239064b55232ea140550487dfd8e89a8e6ec/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/84f2c7ab9f4024a1686be9cc63faf22fabb56e5e/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/3f9d1afa69c9c8c93adf9caee93aa3a550a82d1e/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/9783f7ca190cda662a35ed541b62f0c211fd5b1b/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/f1413c36850bac6ce629247b9c6d16070da4f2d1/
         arc |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/98a234d7f844ac9e326cf4b4e2d1975ee4a56cfc/
         arm |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/49f249632ed021ebe73ee7fab1b55fb3bb4c08f8/
      x86_64 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/ffec14aa79833a6f0889a87b31dae464d083e6a8/
         arm |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/21f7c8b58f77060442f969544ce989600eb6770b/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/0f111981b4524bd5288330aa989bf8464474484b/
      xtensa |            linux-headers-4.6.2 | NOK | http://autobuild.buildroot.net/results/d64a25efcad5b6b0e5627b85fe6c32e155f0ed50/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/52c07ced5f901605510e3167e4853c16c99fa1de/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/84a8ee29c520cbc37856d4b0c4ec88aca7ca9581/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/a6ad103597a7098cf20866f0c7ec739b93813993/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/8a06d40b2526de6ad41199b6f179a6e9918cb21a/
      x86_64 |                   mono-4.2.3.4 | NOK | http://autobuild.buildroot.net/results/4bb4fab881c151dc870e8b68dfb26aabd78fe91b/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/932e4ec24623592255f234a098f7a90ef2ad8063/
      x86_64 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/1f4edef59136344c3aa01daea571d07297238fb8/
        i686 |           openpowerlink-V2.4.0 | NOK | http://autobuild.buildroot.net/results/a9e7615a19922706039bf97ccb94bcf5b99330b2/
        i686 |           openpowerlink-V2.4.0 | NOK | http://autobuild.buildroot.net/results/560149543b3face7d60fe73a9879b51254612e77/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/449aa4ffbc20ecea390d83480c544e4eb010518d/
     powerpc |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/bfcd11b0a94fe73b34a898c4b402702156fc539d/
        i686 |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/4bad7fac39788d7c6f53624e5192bd8112f28060/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/7f6dc49bf56d88e2a4116d16eeb4c86e066095fe/
         arm |                   qemu-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/e5394141da06a909c51bbb30384107ceb8729619/
     powerpc |              qt5location-5.6.0 | NOK | http://autobuild.buildroot.net/results/60abf157a5b04ad6a0a6a5a7a5757a4649bdfc31/
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/09754f9c60d4e08195c8b64c8747295998faadf4/
         arm |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/32687b8aa4b842682a6e71255c02b7198bd8e88a/
         arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/bb26f8d7cdd5feaa2547ad4edb826fe769f8eeb8/
         arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/346004759f87e74a71226039857deef73c08e7a6/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/57f5be2167137214424f83bc7e8e0c0b0d5da46b/
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/edc2b6b7cca94395759c61d1cf4b043bdb7892cc/
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/b7c3d59b364b89d013f7d70f4617016915833615/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2bf50d7c43ad08dbc12826bcf41390d1602a8a18/
         arc |                wireshark-2.0.3 | NOK | http://autobuild.buildroot.net/results/1c14a7cbda1dce8867275ba2f2c70054fdbfbbbc/


-- 
http://autobuild.buildroot.net
