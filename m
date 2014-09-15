From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-14
Message-ID: <20140915063012.0FAC010166C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-14
===============================

        success : 183
       failures : 32 
       timeouts : 7  
          TOTAL : 222

Classification of failures by reason
====================================

        host-util-linux-2.25.1 | 6 
                 gnupg2-2.0.26 | 4 
                    strace-4.9 | 3 
                     qwt-6.1.0 | 3 
             host-dos2unix-7.0 | 2 
                  thrift-0.9.1 | 2 
               iptables-1.4.21 | 1 
tvheadend-ca742e00a77177873... | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
       directfb-examples-1.6.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
             e2fsprogs-1.42.12 | 1 
                xapp_xfs-1.1.4 | 1 
     openvmtools-9.4.6-1770165 | 1 
           host-openssl-1.0.1i | 1 
                     rpm-5.2.0 | 1 
                 wayland-1.5.0 | 1 
                 webkit-1.11.5 | 1 
                 mesa3d-10.2.7 | 1 
                    ola-0.8.33 | 1 
             lttng-tools-2.4.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  sispmctl-3.1 | 1 
Building Boost.Build engine... | 1 
       gst1-plugins-good-1.4.1 | 1 

Detail of failures
===================

     powerpc | Building Boost.Build engine... | TIM | http://autobuild.buildroot.net/results/1232eb8ca3458d37a1793b37f0feffdb94bf04b9/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/5ec2b03f9f08d4fb33e75ab5ba0a4dfa202b715a/
      x86_64 |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/2edae98da65d3fada7eed5175046aaac500415ad/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/a2e1747653b1ad51a9e42231cf612c73f72ae326/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/8d99ea270b26369ea0f1f39c117960376cb6faa9/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/be2b83bba015f88b230927064fedc8907688319a/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/01b198217ae8d891cc04423ee2ca594a6cdbb776/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/30b52b01bf3e9999fc03bb3629804baa803fe2e8/
        i686 |        gst1-plugins-good-1.4.1 | NOK | http://autobuild.buildroot.net/results/ce7370a27017a7714f31527495868282e44b7219/
         arm |              host-dos2unix-7.0 | NOK | http://autobuild.buildroot.net/results/86a104b4bfffa7426de93d63278b998d6dcce154/
       nios2 |              host-dos2unix-7.0 | NOK | http://autobuild.buildroot.net/results/c55fe1a1500baf9bd24f3880f79ebec97e88a890/
      xtensa |            host-openssl-1.0.1i | TIM | http://autobuild.buildroot.net/results/e3803028dbd29b6d2b1a6133884151651116784f/
         arm |         host-util-linux-2.25.1 | NOK | http://autobuild.buildroot.net/results/bbe73b72b8780c032ae146d935e79b20da24287a/
        i686 |         host-util-linux-2.25.1 | NOK | http://autobuild.buildroot.net/results/d2871f5dfe6771e704f5eae513a936a4ec8a3fa8/
     powerpc |         host-util-linux-2.25.1 | NOK | http://autobuild.buildroot.net/results/6c45a2fb8bb5ddc86703c0d776420d2fbf7d9d39/
      mipsel |         host-util-linux-2.25.1 | NOK | http://autobuild.buildroot.net/results/4910076a0301c04ff8bba862dbbdcc6d99fea284/
     powerpc |         host-util-linux-2.25.1 | NOK | http://autobuild.buildroot.net/results/ed6eff9c4a9d6eb10ea142d45c93bc1f3d16a5eb/
        i686 |         host-util-linux-2.25.1 | NOK | http://autobuild.buildroot.net/results/f3dfe6bd9031645fb068385af4054c0cc7522b2b/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/6d81e0e840ade5e07f5c8e804350e036c6e40691/
         arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/43e781500aec58070c34f88fa7709a056b5b0712/
         arm |                  mesa3d-10.2.7 | NOK | http://autobuild.buildroot.net/results/316a5497e07dfbedf65590a931f1a5a4e75a2cef/
        i686 |                     ola-0.8.33 | TIM | http://autobuild.buildroot.net/results/bc03910eb03cc41c0b19584ffb4a5cd0157ea0aa/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/f222775890fa8e297c3387b40fdeb03fe9d0f275/
      x86_64 |                      qwt-6.1.0 | NOK | http://autobuild.buildroot.net/results/5977bd77342e28ae9783f9f9edfcf84eefd081b6/
      x86_64 |                      qwt-6.1.0 | NOK | http://autobuild.buildroot.net/results/ab71ba9011cd52ffb4bcc3bd81a8d75e53664d7b/
         arm |                      qwt-6.1.0 | NOK | http://autobuild.buildroot.net/results/55740d9ee5dc9320a25527e273996a55b609dd23/
        i686 |                      rpm-5.2.0 | TIM | http://autobuild.buildroot.net/results/99b94445953e899d462848c41254d344a71f89b1/
        i686 |                   sispmctl-3.1 | TIM | http://autobuild.buildroot.net/results/a14c967576f9ec3df92ad889010737bd3d14f631/
        mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/fa4d0bbf7729e8ae7fd043f123816bc9d0c49bfc/
        mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/082e1b3c99ad57b982aa796de2eae64bb1c67b79/
        mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/ee2e322d4fda1d1150027ec45d7f31e51659c5d4/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/0e6a179494c264d07092e83f3e9e80b944293891/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/90347183075ca57b9227075155f5fbfe9b55d7be/
        bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/e83b2c6798f4caa58d9d339799bbd0472128108d/
        i686 | tvheadend-ca742e00a77177873... | TIM | http://autobuild.buildroot.net/results/21f00bdff64575255135b36c19c0015621c8f571/
        bfin |                  wayland-1.5.0 | NOK | http://autobuild.buildroot.net/results/f02ec26e4d597b994667f142417c6a47fc0b6f1e/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/78eb9961778e2662ebb0c2645c046fa70e1180ad/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/1666fb27c1e642188da7b58587a3a86c21369425/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/744269a05ec246bab9c9f81016010783b7187239/


-- 
http://autobuild.buildroot.net
