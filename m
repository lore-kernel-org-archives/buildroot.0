From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-07
Message-ID: <20160308073022.EFA101019EE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-07
===============================

        success : 176
       failures : 87 
       timeouts : 1  
          TOTAL : 264

Classification of failures by reason
====================================

              host-libcap-2.24 | 14
                libpjsip-2.4.5 | 6 
                  cairo-1.14.4 | 5 
                  multicat-2.1 | 4 
                   fio-fio-2.6 | 3 
           libimxvpuapi-0.10.1 | 3 
    erlang-p1-stringprep-1.0.0 | 2 
                  connman-1.31 | 2 
                     gdb-7.9.1 | 2 
                    owfs-3.1p1 | 2 
       openpgm-release-5-2-122 | 2 
                     dt-v18.32 | 2 
                   hostapd-2.5 | 2 
                 libraw-0.17.1 | 2 
                 rtptools-1.20 | 2 
                    ruby-2.3.0 | 2 
                   lzlib-0.4.3 | 2 
                   mplayer-1.2 | 1 
                 opencv-2.4.10 | 1 
                 igmpproxy-0.1 | 1 
              gst1-libav-1.6.3 | 1 
               netplug-1.2.9.2 | 1 
                  gamin-0.1.10 | 1 
              rabbitmq-c-0.7.1 | 1 
                 erlang-18.2.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
           lksctp-tools-1.0.16 | 1 
                 mesa3d-11.1.2 | 1 
       gadgetfs-test-undefined | 1 
                blktrace-1.1.0 | 1 
           linux-zigbee-v0.3.1 | 1 
                    cups-2.1.2 | 1 
               ipmitool-1.8.15 | 1 
               wireshark-2.0.2 | 1 
                  stunnel-5.31 | 1 
gmrender-resurrect-aa3d02cf... | 1 
               linknx-0.0.1.32 | 1 
                sg3_utils-1.42 | 1 
                grantlee-0.5.1 | 1 
                libgpgme-1.5.5 | 1 
                  boost-1.60.0 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                    yajl-2.1.0 | 1 
               tcpreplay-4.1.1 | 1 
                 setools-3.3.8 | 1 
       host-erlang-rebar-2.6.1 | 1 
xdriver_xf86-video-r128-6.1... | 1 
               libcap-ng-0.7.7 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/89fc19e6ab8a8c46c2d3f5f9817ce7b50908b022/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2c7286278f78c4f884e9c18a3c7c9bdac007b810/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/2b2c3895b4340078632f40c23ae77c254b8da4e6/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/8265694adfc4bf9a3a56d1bab10f8db2075312e7/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/5c05ec13e9b1e7b466870890c680fa0c0e8fcac5/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/c1de1f9db5de7034c02c76fe91ab1197d591e989/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/24fdfbb3b6fa5b081af10df3b2b7c2f5bc0c0a39/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/a13762bdea1ce4c612628ee38d2a371124227303/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/e0eebd980edfc47c637cff3af12a12e6d4a163dc/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/178a210054e94b8ffab38a2ff2acf1697dd17bf5/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/0adad402ceac105854f86fa436797180ec22120c/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/2c44c9e72b9cbf917535ce753af60bde790f3887/
       sparc |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/1d942a1f09836dc406d71af7836fb37462bdc006/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/c88112baffebdf624ab9b1b6f6c55a24907ecc5a/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/6a6fe920eb54d05ba7aff0da9c4dc5a799ae0e3b/
         sh4 |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/cde454cc7b8c0881044331e4d3cd043fd46bdaf3/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/e2c62e7f4cb35c6de15af88ca3e8b12719bfa88b/
         sh4 |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/1504e4c4ac456398e5537bbfca682c627521a9ca/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/a2a74f515b87778148f66b27a68bde99e92a4a42/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/6dd60ac2d3c3182948a0b58da91371a4d7e5f977/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/ce32ab937a0990f9b2ccc8992972d5e6800ce3c3/
         sh4 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/76dcaa4d385a7ce904a67f71fb6cd52f5a1076f4/
         sh4 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1efec98c12d2543350d8714a61faa44811d7292f/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/435cf41a256bc4f6368ad48736da720660699ade/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/c9e4890e3981d1a9e9bc658afb550e669d690bf8/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/3d01d60306d9857e2ae127502905de8a78762e70/
         arm |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/dfc25b78e17bd53d052261357220a240b4adacf4/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/4fcad074e1c9d66e19283bac9e15039990eb9430/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/83f3b205a8eee99c151e409b66ca9fddd711d0e3/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/36c230cbe75610ab33adb38f2a42d67d9a05c2ee/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fda22b44fcb3f33708c6302196bb13af877cbc43/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dc7b4d318e4f51e8d2295b7e0d033e6961bfac9b/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a37f483d2a9e05aaf27e5a229d3f9797efb5d218/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/82508736d42428fc489950fcc4c03926c84f1247/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2ed1809935035a8848ef4917ac5ae686fef28b5e/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/edf91c8f6ff5b6921d462b71a515f66c8e273c6c/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/97f6f7e6a87a108cfb205975e4e1068f23d652f8/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ab9f95c9c308a9d4d200f125d50b8c752a71ecad/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1260d8815b663a30a7c4a316f96119813024bca1/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/eb88223d569cffb4e431599e5d0c5103aac9863b/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/efa682f409c98f9beddd1a4d7e2e2e8a66924e4d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f710ba9160b7bbb11779d83e508ffe1566a8e10a/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/c265cfada20621a631e9d118b9633df80b0e4864/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/658c5e2fe6e3a4ad74ca47c926426e95eac0b9ec/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/1c19b90267ce0bf30f768cd8200533bf6c249f0a/
         sh4 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/16a8b36f9cb10a2c3f8237f2f2f249e9fbffa5d8/
       nios2 |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/d806c2db907bdc1d9fc322962a198892abdfd214/
         arm |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/66bbe8ec2d77f5e4a4e28df63400345851f0db4d/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/91e0bfb5235eef46f98f6c34155aa255382efefd/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/37f4e1495631b94893874fe2cf3003519ef6bc3c/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/0245e23db3d86eee88a02b1f4c13c0fba3a72a6c/
        i686 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/ac8bc108f88cfc3cb75e05316967f5fa74dd1a85/
     aarch64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/6914ddbbd0699f45c061e0208cec2a8cf8daeeb8/
     sparc64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/dab542e4ca2dacf25b2e7822e4ddb137ea7c1c17/
      mipsel |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/51bcbd1f9657dee56356444023021ef120a905e7/
      x86_64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/5069fdd4c4a09a6bae2dcbf1f631ece561fe2df0/
    mips64el |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/0e5bf7509a72bbef68b1f422de8ff93597d5af52/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/f07a91d2a31660e2a9345f4299f3ff2ecaa80c55/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/6ca6a212f9da1359b0f7b3dd94e399dd222bfedb/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/c37457296a319e0aeee1608e34e0e436f7cc3dd1/
         sh4 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/d3e6b80d836c6b220239822885d733c404c35d52/
      x86_64 |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/05d38049e4791f082f99b870e6bfe67393255ce9/
     powerpc |                    lzlib-0.4.3 | NOK | http://autobuild.buildroot.net/results/ef80136ec17ad9b0a5e3121c4b6091b15c3da0d4/
         arm |                    lzlib-0.4.3 | NOK | http://autobuild.buildroot.net/results/5e9d77e415e8cafb842b84d3d6d91280ae5491e3/
       sparc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/bb7bc6c534ff7514e437e25674d9878c2129e418/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3b1290b3d95ba58ea2861ffbcf8b50a087f378ea/
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/92a81f510cd9870f9df868984d8e896bcac72e86/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/a5aacc722ab0a3ffb3f1130e08eb9055909a3bb1/
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/72abac3d927197afba30832176c2c2bfd7926485/
         sh4 |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/cfd265288dcb8d26fed741e116cf3f8c30e2901d/
         sh4 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/b1da3e37e4e169a11e81f2b08f0fce1d8822a3f4/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/35603130a37125be6c9f85e5740b2c85bbcc4820/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/2bd5bd5cfa399f8b6c5370d8834a6b9182266222/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/4c349a9bb24de7850dc783d5c77324b7b81fa01b/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/b9f1a0a7ac54d0cf00f4880a36bd43ad988fcd30/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/2c741fef7ba203b156b674dddcbe1b8b8a32c048/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/31ffcdb2b855deb9fdee54dd09c5cb57ad01593a/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/5a8abdd4918a721c1bddbf68a16d99bea90a59a9/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/c125010c16887f197e1ea342fbe7bc3a890f41e5/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/3cad309afbcedb05e747a9a7afd21342f6f58e1b/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d3f09f503ee3757865c35ba04a787e4b083670db/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/5309ff058f0a995f93c4981d4f864a64ef8bfcb5/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/6829ec8edeb0a98080bd5aaf2fff8d86b3fdf1c5/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/44f59a9535cb10b215f9aa9c6c078dcd154f8c6a/
    mips64el |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/a695088bb8ba1ea1923da6eea988ef9ed1723297/
         arm |                wireshark-2.0.2 | NOK | http://autobuild.buildroot.net/results/714daf80b6dcb14499a99e4bfb5ec12784780be2/
     powerpc | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/2e58f95dcdfe7f139d39712ac3026be76a9f3296/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/258268c204c405332244ea2e07379f1d801732df/


-- 
http://autobuild.buildroot.net
