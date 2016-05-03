From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 May 2016 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-02
Message-ID: <20160503063020.23B411017FF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-02
===============================

        success : 101
       failures : 40 
       timeouts : 1  
          TOTAL : 142

Classification of failures by reason
====================================

                    mpv-0.17.0 | 6 
                 host-go-1.5.3 | 5 
android-tools-4.2.2+git2013... | 4 
      ca-certificates-20160104 | 3 
                wayland-1.10.0 | 2 
                grantlee-0.5.1 | 2 
                  stunnel-5.31 | 1 
vpnc-70f1211f6f26e87e374d66... | 1 
       openpgm-release-5-2-122 | 1 
          php-geoip-legal-info | 1 
x264-3b70645597bea052d23980... | 1 
gmrender-resurrect-aa3d02cf... | 1 
 toolchain-external-legal-info | 1 
make[3]: *** [code/CMakeFil... | 1 
                sg3_utils-1.42 | 1 
                  boost-1.60.0 | 1 
                 jack2-v1.9.10 | 1 
                 rsyslog-8.9.0 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  ffmpeg-2.8.6 | 1 
               valgrind-3.11.0 | 1 
                   systemd-229 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    mosh-1.2.5 | 1 
                collectd-5.5.1 | 1 

Detail of failures
===================

        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/50643fc66af4732f3c560efa5c21e05474e9040f/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/59c9eb5527b23486d1cf03d3ebde886a7f1319cb/
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/08ca2ff5e6cdede59afed1da920b7e78dc228c6c/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/afd0b84fe3a1d06efba6c85a8133d2ddfeb8d5b4/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a550c48af0e3045a81b01c5bd60463a8deb5b7d1/
       nios2 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/a2a4fed293c836b9cf63ff2aaa463b0704dec07e/
      x86_64 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/bbed4afa8e30382b8892062f31ba64cbb0ea14e4/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/1af5562be3c0d233cea81834a898f7ac6ae48271/
         arc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/9719d3f38ae95c07af9de1256b416a5cca156ec0/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/bff54b95712675297a81643ec2842cfd0822d5ad/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/7204e38303ab2e2a3a181045fd6757ddb69fa848/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/b88bafde91a872f9ac07c9f9f2ee9f6d1cac5915/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/a2ed383bacd9958f46010b8a461d8c9d4702d87f/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/68ddc6a895a70addc3f084e62b68e995e118f4b9/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/baefd3ffcfafb9083874b29c2d2857d4818716d7/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/35843b4db86b27b0ae55a8668ca9ebaab34ba82b/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/d593eb2ecebbd25e07e439dac988ba1fae9cc6f7/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/875e9a22b4440aaab267aa6df2e2a6d85c6b607a/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/e9dc85037e2eae8c779b0ced4d114ea47973c89a/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/c0bfb305069a77101ffe774a0e35555843fbce5f/
         sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/64da842994e28567e77b6c038991cec22491894b/
microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/ead1a37ec9809a442b9c5055358527c5ac4b3427/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/83b08c7860cf632fda91de4a510a5cc3a70dde17/
    mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/917d91463bda24e44f9b38b53494488929bc8e80/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/b350012d45f30a3b36729c8c5aa0ae898c7f59c7/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/a86be4cc1265607d65100a4d2b6ec6bffe1bf29e/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/45239b0de4c4a6dcb789ee4dcb9b35cbb2a83aff/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/70a3201b528efd06cf863813675648f845ac5d0c/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/2ea1c8af6e41fdd9d274c358d2bfcce73862a3d6/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/ce254cc0517f56c7beba9bb332d6df8ecf8b5fc8/
     sparc64 |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/df025b0991772254f54fd12dd31fb51a44ca7e44/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/f0b691b5ee1c0b93dd94a784c9445b6b65cb32b9/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/4ce1a8fa38b6af44d107602131a297cd323abe21/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/a7ce85d5cf5307f80851ef891445745c1a3af9af/
       sparc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/37454dddbacfe67dc8a8e1b56ab5806866dcaff0/
    mips64el |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/6baa50e2a4c6b4a8806cec9642069167dba31894/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/5d580b33a160107c8729583ad94f8ecf68e9b2ac/
         arm | vpnc-70f1211f6f26e87e374d66... | NOK | http://autobuild.buildroot.net/results/5cf4bfce08a922e40d53529418c01389ced84239/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/c85329517976332759b8f71f377c95fe10e2898f/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/66b2530b77de6f4b5caf13f20a58b03c35b62f06/
        bfin | x264-3b70645597bea052d23980... | NOK | http://autobuild.buildroot.net/results/837fd5a63d59b5c65818ec005a565cb7741a1cdd/


-- 
http://autobuild.buildroot.net
