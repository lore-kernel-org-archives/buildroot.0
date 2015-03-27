From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-26
Message-ID: <20150327073020.7E0F4101725@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-26
===============================

        success : 202
       failures : 85 
       timeouts : 4  
          TOTAL : 291

Classification of failures by reason
====================================

                  powertop-2.7 | 24
                  boost-1.57.0 | 9 
                host-gdb-7.7.1 | 4 
                libtirpc-0.2.4 | 4 
                 jsoncpp-1.6.0 | 4 
             host-thrift-0.9.2 | 2 
              libarchive-3.1.2 | 2 
                numactl-2.0.10 | 2 
freerdp-b21ff842ef3de583751... | 2 
                      qt-4.8.6 | 2 
         lua-periphery-1.0.4-1 | 2 
                   libiio-v0.3 | 2 
               ipmitool-1.8.14 | 2 
                collectd-5.4.2 | 2 
                   strace-4.10 | 1 
              postgresql-9.4.1 | 1 
              xmlstarlet-1.5.0 | 1 
                 empty-0.6.19b | 1 
         network-manager-1.0.0 | 1 
                     vlc-2.1.6 | 1 
               alsa-lib-1.0.29 | 1 
                  snmppp-3.3.4 | 1 
                     rpm-5.2.0 | 1 
               libecore-1.7.10 | 1 
               batctl-2014.4.0 | 1 
             sofia-sip-1.12.11 | 1 
               harfbuzz-0.9.22 | 1 
               host-ruby-2.2.1 | 1 
           aircrack-ng-1.2-rc1 | 1 
                    fftw-3.3.4 | 1 
                 gnuplot-4.6.6 | 1 
                 clapack-3.2.1 | 1 
             armadillo-4.000.4 | 1 
                  python-2.7.9 | 1 
                    ruby-2.2.1 | 1 
                elfutils-0.161 | 1 
             bluez_utils-4.101 | 1 
            xlib_libXpm-3.5.11 | 1 
                smcroute-2.0.0 | 1 
znc-b396cafdb249544164ed029... | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/fb5499553a87b026857eae4b066907f192854b4c/
         sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/8bbd9b84c0d3fac6b110a1ddcb2c4c8322ef9304/
         arc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/a5482efb30c3c3a643ec7245399cfc0b53fe202a/
         arm |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/0701b880d0f82ef92d742346bfa97bb2af216ed3/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0f2be9ab9d72a2a53b993f32cb7f27cb8a8bc757/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/5191d68351fcb2d1e9a9b79974848f823af43539/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/11c87049ac2a8c555c88e05d3cf3d4cb28b586cb/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/91797979b82936e302f53d463f92492d2b94c31d/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/7d77943aed71d6383777d5f73c5e9964dfc4093b/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/5476422cf5436340ff2ef5565ee5aebd00f9a527/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/66ad8f100b69d4d9eee035f11432b8ecfc3612fd/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/b1294892e164f8a9ec724589831ecbeb79fc7e54/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/8b30244cced53fe04a9e202a743e552225f549c2/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/84974f9794126a07e387d7bcd7ec8dfec885929b/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/90358728845677acd1218f9feabc79cbce2f3299/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/bb41a6d01e8cd57c99eda026baebd854439742a8/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/8d6190e33dba27bcc1f3ea6ef3fa0d56b0f46367/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/f01f6f67c1500ec0afddabce770d4f9ab97cd0e1/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/7060ca1eda465b41fcd70103684eeb8e72443ecb/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/e5760505d08f6816df76c5e4ed253fc5cb44f45a/
     powerpc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/03c21a40b81b2659ce7d76b3ef59c357f64ab595/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/578e82c4866935b41bf840982cd44e89d48f3104/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/3c95b5683ffac050a6594cc783029664ad4717ae/
         arm |                harfbuzz-0.9.22 | NOK | http://autobuild.buildroot.net/results/d5c8a28bea6e98cf1bfea448990e7d611635bb76/
      xtensa |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/19cb8fdd6789c61908307bb325a8525588660873/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/46e9b49fdc3921ab3aa4cc0da4561e6ef33fae73/
      xtensa |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/c3d718698bd8ca6a8fe5b66c38df3690c4d72284/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/933c752e42575f4c1fc492655a88409270e0ac53/
        bfin |                host-ruby-2.2.1 | NOK | http://autobuild.buildroot.net/results/f90056473b89fe689d3b6c9b653a13fd98133ad0/
        sh4a |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/1bcd803014d68265f2a4406b79d04468b5dcfde2/
        i686 |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/7efe6a79b9d945cb3def836a8ac78b52373bea05/
         arc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/b936b379557c208a1a882538770cdf347d6a9626/
         arc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/a40c361d277bd1404782d6eec99ab2779540e2e4/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/f80f0ad1a903b4889c1a1be2a649bbed91027e35/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/6bb06239a0d43edc4dee6c18a69e5866025b14bb/
         arc |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/ccc7e203c322564461e158a92cd0953e419bc3c3/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/bf08e7394084a81db987467030d674c3366169dc/
      mipsel |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/a4d494c9d6d80c1f793690fdd1ecb1e3c0479074/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/85a8db3988d02a70a8f9d2beb07378466877941a/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/4f7856938450c1218517d9fef675852206f24e94/
         arc |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/2a836f31f0c89abf23e4bfa035759b508032afc7/
         arc |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/cde7892fdd92a58d159942b59170cd338ce75268/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/40863ffc334cf363053c67cdd2d596e48a8b3f01/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/a4121a588478a4ff54dab29a53ed0d8e161d1547/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/b22a834dae61068d10c61db535c3e7e386928325/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/9a07d90ea81c821057edd338fc80e4ccdc9579cf/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/33c3f392e063eb930890ffa95bbcfd5b715aefe8/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/f3f58dd956ea21bdf09e819943d21ef6b10d86f7/
     powerpc |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/4b230447ba9d2c56ccc51be97bf4e86ea9e46c66/
     powerpc |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/81effc468229323565c66c4af4f9f35a54109ea9/
      x86_64 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/2cbc93c8382b20750e636c18ffff0479b76a33f3/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/0af5210a350715cee0ecbbb7ed82ecdb37bb5d06/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/ddaaf068307f85136277451a921f18b09f4382ea/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/345f7132b0050cb1906e943584fbc7b146ceae84/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1d3323b2afaefa7989854dbccf92015731199e66/
        mips |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1422d4eb7a8b9114446229eaf3fbb697da034d77/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6db0f429d842bdf9a6635ec213036f68a686abcd/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/0fed81120cda57183810a0b514017c6910215b3f/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5dc9790a4553d7745994871f6620cec99a9d9463/
microblazeel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6e11fa2a7405a69c59ced046b92ff08660c4aab7/
       nios2 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1cb3be486361f810846f49e84ea1d7c9f957a463/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/f953a777ed728827d1fdb74d5b9f01c559722164/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1967121691a3f48a2cf498681308714f7eee3c6a/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/b980bfc33f29b1e5ef4695043e6c359202d3470a/
         sh4 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/c93715012c72234d3e35d2ae63ee8673281d5a73/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/2762d3591b5507dc3de6f2c812ff323c580e24d3/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4f1065295a0e0eccb70c2a1afbc97c840df28d84/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/913cea22f8a8f5902d8da5f64c3fce056d66790f/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/bf8f02d2ac1c705668c91fe493ab682b28b9e2dc/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/2b7a86f708759c788ede3a978868671e53960e31/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/83d1fcb36c4f818df6bcd282131737e1c1006e8d/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/60c63de9725074abb76da17f987028de11602ec6/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/d9394f98af3283cafcdc19fe70d3ffbb50a73bef/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5f618d8c2e51b794ef184b76c271796793c82d53/
         sh4 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/409505f2985252c03babf625d5dfbc86849d4a41/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/dc09d828e84da1ff4e18c8d08399b75238ff36e5/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/cd49b98bc30c55a14fb41075c39134d0019dd422/
        i686 |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/8066a339f99f620d6ebe1defbff8dd4e3e98050e/
      x86_64 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/90934d0ef5adaef2d3c1f22e2c8315f74247dc4d/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/e54d2d6e416ea5c13bdae57ff980dfc033ee687b/
    mips64el |                     ruby-2.2.1 | TIM | http://autobuild.buildroot.net/results/eeb2b255d3b8d8562c46bf6100d94d013162a44e/
         arm |                 smcroute-2.0.0 | NOK | http://autobuild.buildroot.net/results/4a60778aea2bd10d0479f55de92d782c400fe9a3/
      x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/91ca4b678c0cf4b4380b279a377d1d02c689ae2f/
         arm |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/8ae4bb94d497af67e1f0895382fbc1e958b0be96/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/3916d359601f6f53b91f7050c15d720109d6a13d/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/4cd7a0d6e32b9b702d64d3bc4a1bbb6d44e3cff6/
      x86_64 |             xlib_libXpm-3.5.11 | TIM | http://autobuild.buildroot.net/results/ec5215e07a244bebfc9e313fe4cfe1b2fb1081e0/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/353e6ff0765849878fbb123b38fd68498a3b6090/
      xtensa | znc-b396cafdb249544164ed029... | TIM | http://autobuild.buildroot.net/results/78f7726c67a9831db9fa0ddd74ecaa875b18a5ce/


-- 
http://autobuild.buildroot.net
