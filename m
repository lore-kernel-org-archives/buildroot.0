From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  3 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-02
Message-ID: <20160303073022.4E290101B33@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-02
===============================

        success : 188
       failures : 65 
       timeouts : 0  
          TOTAL : 253

Classification of failures by reason
====================================

                      qt-4.8.7 | 6 
                 mesa3d-11.1.1 | 3 
                   tor-0.2.7.6 | 3 
                    ruby-2.3.0 | 2 
                    vpnc-0.5.3 | 2 
                   systemd-228 | 2 
                    cups-2.1.2 | 2 
                  gamin-0.1.10 | 2 
                 libdrm-2.4.66 | 2 
                 rtptools-1.20 | 2 
                 libraw-0.17.1 | 2 
iputils-3a86a2542c6fe29413c... | 2 
                  prboom-2.5.0 | 2 
                   mplayer-1.2 | 2 
              gst1-libav-1.6.3 | 2 
                 omniorb-4.2.0 | 1 
                     fbset-2.1 | 1 
                  connman-1.31 | 1 
               tcpreplay-4.1.1 | 1 
                 lvm2-2.02.138 | 1 
    xserver_xorg-server-1.18.0 | 1 
               valgrind-3.11.0 | 1 
              macchanger-1.6.0 | 1 
                 igmpproxy-0.1 | 1 
                     lxc-1.1.5 | 1 
                grantlee-0.5.1 | 1 
                  c-icap-0.3.5 | 1 
                  psmisc-22.21 | 1 
                       unknown | 1 
          usb_modeswitch-2.3.0 | 1 
        lttng-babeltrace-1.2.4 | 1 
           host-lz4-legal-info | 1 
               libcap-ng-0.7.4 | 1 
                mono-4.2.1.102 | 1 
                  boost-1.60.0 | 1 
                 opencv-2.4.10 | 1 
               nvme-legal-info | 1 
flann-04b4a56533faf8c8228d0... | 1 
              host-libcap-2.24 | 1 
          chocolate-doom-2.2.1 | 1 
                    ustr-1.0.4 | 1 
                  trinity-v1.6 | 1 
           linux-zigbee-v0.3.1 | 1 
 toolchain-external-legal-info | 1 

Detail of failures
===================

     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/33cd74ef367e97fc2fbe9049e4d4b37154d8ce08/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/6964b2611300a2b9a233c88d40571b0af9df4139/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/3708753a72fae7df7d090eb1c50f1219a9567989/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/9aff13372f314a22f89997aad4de9316fc6b54d4/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/d9f958f0091a8843883e64678406ec05d0868142/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/526eea0912fa1ae42beba7415d1a31ceb0322fb1/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/ed265742ad75ec54e4656415b6aa460f16a497d1/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/a7b342b5a5fbf6a4bb7817e32a2c5c9ca309fd26/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/c6f8e8cb49fa3bd6687c765030dd9faa384fe2a2/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/f87e4294ec841c151939aff76381add54bfe43e5/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/a5b9c5a2aa3d34d06fd212cb9d2a9ff2ddf46a8d/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/68175c278cf0131bc4f37daf1658beb9558b5352/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/781dc1330dc0a9c7697550fac82ade9a16189ba5/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f529981e7b3e6f8f0fe90f77b02e6b2852a9b5e7/
        bfin |            host-lz4-legal-info | NOK | http://autobuild.buildroot.net/results/70a526b265bb16a6be9f25c5044c65070706171c/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/162b86cae2c39987dc17fa3b4114ab7a288ac720/
      x86_64 | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/1b1f63e8c7ba10d4055fb422af6a15c044efc9a6/
     powerpc | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/e9093fe553f7d6232204c086322fad9e9900af01/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/4c85641359d835185aa628d860b5384151169709/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/1bf8228da40f238bef023f60899b8a7fbac51ef8/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/4927fa96a2cdcc7e2d6f7e57b4ef3124d84e0d28/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/e2bf24975f0f15ffc4dd0328e22d84aeb424c009/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/9131884481cc087209b604896d42df3b01edd8aa/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/61066aec7e11d7950c6dee544f79c2bf9f62c07f/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/81f85f5daf056007c57ae92e41316b3f5af44ac0/
         arm |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/c251201d0d072cbd480a064feb07d1bd352162e7/
         arm |                      lxc-1.1.5 | NOK | http://autobuild.buildroot.net/results/b7396b411afa3c6df559c222ee3f100dc2570125/
      x86_64 |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/ac1544ad830117300065a7aac6d03c21afb62a97/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/b44d94627f04b09288bb5cc9f7c82265e54c4b5a/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/6c5e5f31c27fefd9216ce61f6bb447172ec4a38a/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/6d929dc2389b96c5a9c3fb2e98479e4d1412fb7f/
       sparc |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/1c8a535d6b423b9d4ce98c264c9b9200041912d8/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ad774879c24bbc136c7805900b040b0ea62fee5b/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/daf09b06aa8a7a2af16dfc88b58a7ae8c74abde9/
         arm |                nvme-legal-info | NOK | http://autobuild.buildroot.net/results/441afa17dfd6f259642526850d92f1c9965d8353/
         arm |                  omniorb-4.2.0 | NOK | http://autobuild.buildroot.net/results/a5e88d1335a53cce685e272d090c3ae7aeccfad8/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/f5e6f31b3b2691590de6670e64660d292e8d3256/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/8290d8924c30c63c1e5a4227be535267dfd231a0/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/8fc455bd5b498a0a941b2af34af63c22a78110a5/
    mips64el |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/d361c8b3f6e9c89cb75a224a76834e9fe84f84ee/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/07316aa3f02cde862b1808af65d727fe813b9ea8/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a81d21f5cbe7dfd5627f89d10178e3a46d76c708/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e8f4ce696f5a6a6bfcbadf46ae9680583a672153/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c951fcbe7757991bc0c1c41cbe2d31448acd4ade/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a1211c8b676f01888446cd0bf884cbf700e8082f/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6c1bf4360f1e44b42ff803676f848917af552d51/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/c194f30c894ffdd9192aefbb240a5987f5558d55/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/aa6789c8fbe1390399766c46013f69fd8ddcc8af/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d796660bc1a6899433adbf3ab23e72b34b89945c/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/1f62d3f053aedf8ec2b816560a364d9cb116cf7e/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/28bc1feef8645998aec0e1efcb53d89fa9748245/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/efee03ff3726a21ed29813c6cdf8d04cc34df6c1/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/e5f948eab346832b92ff2154ca60dd0018b3ebf3/
    mips64el |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/4004f4d0df0ff253807ea1664962742921e9a475/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/bff45d6bf1a8ed967b7fcaac966e0236a1fb42fb/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/cad05bc0b13fc314f353c317b668ba476245fcc4/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/86b4937befc75caeb1fe0572f026443a38a14038/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/3102fcb7993b08fe0db8f904539a740a39da3266/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/a280f23cc29f77ab440edbda05b4e58d6f4856e7/
        bfin |           usb_modeswitch-2.3.0 | NOK | http://autobuild.buildroot.net/results/f2c4cd552d2bc1b8042db0380ea23912403c45a7/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/0f47cfd97f584d8998d45909cc05bddf82d108e1/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/7ac6333a19ca7cdefd19dbd7fb0ced50f525bbd7/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/cbd3197f2e104f7b8441f2f1c07e6f156858d525/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/9d60d9d01633aa496d304429382d912c698188de/
        i686 |     xserver_xorg-server-1.18.0 | NOK | http://autobuild.buildroot.net/results/f042663f2b12e73f646002654426c9afbf905776/


-- 
http://autobuild.buildroot.net
