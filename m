From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jul 2017 08:31:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-13
Message-ID: <20170714063119.9ABD821DD4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-13
================================

      successes : 158
       failures : 76 
       timeouts : 5  
          TOTAL : 239

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 23
                  lshw-B.02.18 | 8 
                host-pcre-8.41 | 4 
                     pcre-8.41 | 4 
             python-sh-1.12.14 | 4 
         python-twisted-17.1.0 | 4 
                 sngrep-v1.4.3 | 4 
                  nginx-1.12.0 | 3 
                   trinity-1.7 | 3 
    azure-iot-sdk-c-2017-06-30 | 2 
                  cc-tool-0.26 | 2 
          linux-headers-4.12.1 | 2 
             lttng-tools-2.9.5 | 2 
make: *** wait: No child pr... | 2 
make[1]: *** wait: No child... | 2 
                 mplayer-1.3.0 | 2 
                collectd-5.7.1 | 1 
                  cppcms-1.0.5 | 1 
                dbus-cpp-0.9.0 | 1 
                    gdb-7.11.1 | 1 
                     gpsd-3.16 | 1 
     host-erlang-p1-xml-1.1.22 | 1 
                kvazaar-v1.1.0 | 1 
                libressl-2.5.4 | 1 
              librtlsdr-v0.5.3 | 1 
make[3]: *** [all-recursive... | 1 


Detail of failures
===================

     powerpc |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/30757d40fa350271af2a3be10443cdb0a50b0246 |     
         arm |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/8df40748800040e029749e015d8f5c9c0d3ece64 |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e448acd595d026de6d14a1222c969927a0c08df5 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/0e641b9b57ac84e7b26c847a3e5663da271b97fb |     
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/0a75aba52d089143f7d1c287d36a7ed9b828e0f4 |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/532ca7249bd89705a9f37aeb4c793c53da3e36e6 | ORPH
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/b33376d4455e5827bc59633d3df36d011d5b0d99 |     
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/76c996a24ed6890e8f45a0d8e43d4081b38d3931 | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/cb14d761fd7060f1e2880d5b6fda6265694d4e8b |     
     aarch64 |      host-erlang-p1-xml-1.1.22 | NOK | http://autobuild.buildroot.net/results/63c63b2578e9f6ad71cbea82b987c128305cdab4 |     
    mips64el |                 host-pcre-8.41 | NOK | http://autobuild.buildroot.net/results/c9a4ddffe552af9a59e3bfed0bb0666af225ae68 | ORPH
microblazeel |                 host-pcre-8.41 | NOK | http://autobuild.buildroot.net/results/88c8a8f07a234b890b9261e5ce2517f8d0d63eff | ORPH
         arm |                 host-pcre-8.41 | NOK | http://autobuild.buildroot.net/results/6b511b73c10b171c6826ab1d9e29f09faa8eb28f | ORPH
         arm |                 host-pcre-8.41 | NOK | http://autobuild.buildroot.net/results/770616859c2e02b7ae75c40f5dfdc8dde6a4e885 | ORPH
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/ea1495696a0e810adb6695dad6b9f3d3363e81d5 |     
         arm |                 libressl-2.5.4 | NOK | http://autobuild.buildroot.net/results/bb41edb18c4a615ff6f1d197e694de11e7590b4e |     
         arm |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/ece557db739aaad9b53130a8ecb4d98f6f67aedf |     
      xtensa |           linux-headers-4.12.1 | NOK | http://autobuild.buildroot.net/results/741343276b28581d25be2db54766f54aeed66796 | ORPH
         arc |           linux-headers-4.12.1 | NOK | http://autobuild.buildroot.net/results/493ac32ab9cfc8614e7d5542509c47c8f44f072c | ORPH
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/9bf5437b4348ea8077013b80a51ce05fa328247d |     
    mips64el |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/19187e12f1ea1514dd908c558f4c8d70b7186253 |     
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/3e95f01bd314d5753bbdfb723aee068ebad7899c |     
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/feb3034267dda838bec87236ee538b35841cbcef |     
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/29ca3f45d0f3327082cc9dd08558e654bb3c9b4c |     
   powerpc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/cc16dbedee72a9270d128aedfeb291d0d7fddee3 |     
      mipsel |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/965f21fe67663fc04b22af8e70a93caa5a0294d9 |     
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/5129fa41d5437aa93ecc26910ced34ac28bc0bc6 |     
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/081958d493c62778810331bedf4a71c0215b2b59 |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/511863e8b475c1e46735d58ea4e44a25266592ac |     
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/879ce5fc0b187a69aec38b669e9cb66009d2319e |     
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/e8fd46f6c63268944d12889819dfda24e2d53818 |     
      mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/bce8d3e81a484058fb202cd67d1daf4adb33fb83 |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/335e1174a7821d852f9077640aa3957d1c86a659 |     
microblazeel | make[3]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/493ad1abf74a329d5ac4a1b3bd761662d3f7f4bc |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0e3d5b5df1dda9a4b64baa272b61d0057698926d |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1a6e88643905869a019765b1bf3b371c4bff2dd7 |     
         arm |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/9ecf714667736bf61f643ad55588d3d6ebdde603 |     
         arm |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/bc7458b97a88785653845afd30fe9d5f3a69905b |     
       sparc |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/3803ff5060fafbbeab29870a51dfe99ed6406105 |     
    mips64el |                      pcre-8.41 | NOK | http://autobuild.buildroot.net/results/3b8d0dd2d125fbc4e61e834389dae66bf647502d | ORPH
     powerpc |                      pcre-8.41 | NOK | http://autobuild.buildroot.net/results/3fff125c54630a24581f86356abc05906bbd9944 | ORPH
    mips64el |                      pcre-8.41 | NOK | http://autobuild.buildroot.net/results/821068975263b95d1fbca1ec5ddb84531946d669 | ORPH
         arm |                      pcre-8.41 | NOK | http://autobuild.buildroot.net/results/92114c8a2a9bc3ba55c895f3a6ce3c849edc6682 | ORPH
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/55a19b05de217b7e22f8cf641fe8065f53b1a756 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/af1142f2910b1e6e2ebf4225ae6c51f395d6038c |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4bf774eeb559d682537b6fe1ca4da103476bc487 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f1adee412b4e07a11a01087f288ef4b70c10ab51 |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/fbe039623437ce6e29d1a15d90cae28330c6ad94 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0bc0430d203b6f29801fec611583696de3ce8c60 |     
       sparc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ee03c48338f8a3cea595f558383a52064b9bd743 |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/76b7b808481310ed4d0626140c641782a9c8fddf |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3d7e9c24821b02c77e9caa9e2bdcd4086ab9acbe |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/331c6d7824021829879ed6e15e11dc62dd53ba53 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c4a8f34a560e3add068b524a136c5eee0d4d1384 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/42105cdaa18807cee349787409922420827bc483 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/87426ffe197b560a439ad00fd5dd494d2a5426c8 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4ae2155bd166ac7bb1b9dc59eec67e9b9d45135f |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5fc644e1f5e91066a8f27162119d6ccf07f760fe |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d30d845bde3fce63b6c00852942fc85f06621ea0 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cc4fa4d2cc450a4e877b05658b979c6a51191e29 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6a11e4416758ce8d5eedf7adaebfb1b432b829e3 |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e46d424f70af359f1bc0677eef6c9f3b5b6207a1 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/993fe1285690cbf398bec8e32f99faeca881659f |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/581170ed9e2b8a8ec24ecf0354aa383eb26e8ade |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d7cab324f09e49d4723e325dd5384f6e6e69bee9 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a04e313cf35b2cf595568ba4ce793015b4819889 |     
     aarch64 |              python-sh-1.12.14 | NOK | http://autobuild.buildroot.net/results/d87ad5d7831213cff8ab9470a781d258c6403c46 |     
       nios2 |              python-sh-1.12.14 | NOK | http://autobuild.buildroot.net/results/4a25ae233adb5f5f4d8dcdee59cdd16f23200643 |     
microblazeel |              python-sh-1.12.14 | NOK | http://autobuild.buildroot.net/results/e15f671a257432781257e40be722aed80ab571d0 |     
         arm |              python-sh-1.12.14 | NOK | http://autobuild.buildroot.net/results/90f1fb144aeaa83fc3a3b232f2f8b296a0dda8a7 |     
         sh4 |          python-twisted-17.1.0 | NOK | http://autobuild.buildroot.net/results/fc51f9c77a5ba7c367179e67358fd45d4d4cab6f |     
         arm |          python-twisted-17.1.0 | NOK | http://autobuild.buildroot.net/results/386bf87abba550b5477d5e15e57981b8c3cef8d6 |     
         arm |          python-twisted-17.1.0 | NOK | http://autobuild.buildroot.net/results/3bc8a5ef30781cda55605c74c8147d2038432a84 |     
         arm |          python-twisted-17.1.0 | NOK | http://autobuild.buildroot.net/results/9b280137ee45c24b2bbe0512ddcc03bdc2c2329a |     
microblazeel |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/095e9f2ceb677eb2f8c9b9ac22c695706a96b050 |     
         arc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/c72dfe729db499285aaaa44baf8b0c0398321e71 |     
     powerpc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/d5bcb2ea787cecab27ead766deff7d405ec27836 |     
        bfin |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/51386d01c4f8cab75e191c8a1b19547fb0bee337 |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/c794dce362b86e9978260b8eac58d947ef0c3892 |     
      mipsel |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/0c6003869eb0cccb1a86205b4509148293971a81 |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/518471bdf5a87d16152f947653bd49c439238dfd |     

-- 
http://autobuild.buildroot.net
