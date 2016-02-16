From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-15
Message-ID: <20160216073020.EA375101C1C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-15
===============================

        success : 199
       failures : 67 
       timeouts : 1  
          TOTAL : 267

Classification of failures by reason
====================================

iputils-c8ff6feaf0442f8efd9... | 7 
                numactl-2.0.11 | 4 
                  cairo-1.14.4 | 4 
               pax-utils-1.1.4 | 4 
canfestival-7740ac6fdedc23e... | 3 
               valgrind-3.11.0 | 3 
                 mesa3d-11.1.1 | 3 
                    cups-2.1.2 | 2 
               trousers-0.3.13 | 2 
          chocolate-doom-2.2.1 | 2 
                   fio-fio-2.6 | 2 
                 setools-3.3.8 | 2 
                  trinity-v1.6 | 2 
                   nginx-1.8.1 | 1 
                  lshw-B.02.17 | 1 
                  stunnel-5.29 | 1 
             host-nodejs-5.5.0 | 1 
             ipsec-tools-0.8.2 | 1 
               tcpreplay-4.1.1 | 1 
                minidlna-1.1.5 | 1 
            lttng-libust-2.7.1 | 1 
             util-linux-2.27.1 | 1 
                  boost-1.60.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
     host-google-breakpad-1373 | 1 
             ntfs-3g-2015.3.14 | 1 
                   qhull-7.2.0 | 1 
               libgtk2-2.24.29 | 1 
make[5]: *** wait: No child... | 1 
                       unknown | 1 
flann-04b4a56533faf8c8228d0... | 1 
               syslog-ng-3.7.2 | 1 
                    sox-14.4.2 | 1 
       openpgm-release-5-2-122 | 1 
        ltp-testsuite-20150903 | 1 
                   tor-0.2.7.6 | 1 
                    mosh-1.2.5 | 1 
                 igmpproxy-0.1 | 1 
               nfs-utils-1.3.3 | 1 
          sane-backends-1.0.25 | 1 
                  connman-1.31 | 1 

Detail of failures
===================

microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1d896a5bd5ec3bd8a0d5f2b7a5ee530c9736d9d2/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/f3dd758168d8a3d416195cc9cc38682dcbe76008/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/1108ab1204d08f7f84522263c94792285a1820d2/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/5e86c1786df3705e4e16e5da55882465aab6122b/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/dd223212ee7ac973b4a855fd0edcc186287bd818/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/ac5dea843930ebe583cd736df96cb5f2fc27b802/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2886601b8687392fb164dd0fc640b7acca2910f2/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2ad4a53baa6d605aaa9b6054cf352d41745acfc7/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/f03e66c0b94ca12d3554bb85f64437a667038a69/
         sh4 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/932fe01db5120e84f551eaf7b58d03c074b72934/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c5605c6b0aab27e49db983d2577f7add330b4151/
         sh4 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/d1e4ac3cc7d279776bb12d28b9f99b352f9dc9a7/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/80506992f700719b1b0b722dff2554d1e4d538df/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/b9001ba7c22aa531b69f4ea45d0ec16594ad54b4/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/21d1866e1f8bea3bf70c2fe5be9e35606965626e/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/a1a03b6881a236a3ade35c1a77d016d3562bbdbd/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/8e0c5f68336c64392e5bee28ac6a26318b8c7787/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/3fc2dc9fb4609789ff33e0f6bb25bd605f450b0a/
        i686 |              host-nodejs-5.5.0 | NOK | http://autobuild.buildroot.net/results/15c4519618434c069703912ea4d8a3bf2599695f/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/e7f4f17e16f19c2b19440c997c7440ee5c95892d/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d48e7d95f92d4a7aab7aaf74295acd8660ea1fca/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/ddb3b107780fe43885c616435ddbb55f253d8ff6/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/f99c8efadafcf9d2fb433e100ea214964b3dedbb/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/cf53770145fca1b6e5dec4c78f9a5437f39e27b6/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/a34ea60ce9b07d02f44e6274dca0e68990d45707/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/182492c2d17d1bbafd7bfa017fd8a45ea5b23fd5/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/831f1c7cfe1ce8cdd51a5f7c9c3f92d76baa8143/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/803a20b069e8b0a38c4027f6ddfd8451651760cc/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/07ada1d1e225d1782020761f3e4ba98935bb4b28/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/b360237efab2c31ae56f326d58fbf1e9de3b40bc/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/f2a0997e190a6dd2534eb45c09ae98362f74047a/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/46c36e37f462fa28154758da9c03b8881ac9294c/
         arc | make[5]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/b186b30c0b81f03010372e6e354aa1a32438f52a/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/df0173bacbac0e55bcb666f99608aabeb8dfda92/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/a24c321d5c31866bfc5309495587d0e62350f302/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/1c1719e1e169cb65add291bbf33248abdd950ee1/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/1e0a335a6e89b0c39f998f618ab9f7f43654c9e5/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/46471901d4a33eddbef12ab7457d52e8d1219da0/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/a2d05d74b17dffe158ee4d5fc23acf540e469c5b/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/dfdbdc6cc75c0436799f68d0ae7fe5cc68ad39db/
         arm |              ntfs-3g-2015.3.14 | NOK | http://autobuild.buildroot.net/results/5cdfb0e3437f4e54756417706e3e9bb1f3006de1/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/9cc677e3ae6f82485f2c9fd91d41449f68aa6657/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/4ffadad88ef17cde8cf23f866dba2a79abcf2170/
        i686 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/a271fe1856aa24d837ad17693ebf4b1776e43e57/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/d91d1a2ed896e37a8eb53fae34114dbe672de941/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/4d0518c32c5795aee33fd6484b4100500c2e55e2/
         arc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/cbb65829354db79f11a7d10ad17b488393621a4c/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/bb94e8dd0d09d0fcbc9f7f2f98f6c6b4d13e459e/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/6587f8fe7ca0e4e41026e509551cf3be1f999755/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/d267e865687a9e0363cca445da422bb251d1b0e4/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/825080900dc6e0858960ae82c15589f88b2953e6/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/e8f57caa558b55290a2392b27815d6278c1e1679/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/3dc2832040a4649ed2b084b6beec874a0c0996af/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f9d5697b1abbbc27195236c728e105f5f5dd1042/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/386ba6fa1d201d231b56dd239786a0f66d40e866/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/805fa9e38f58ee7110cb939f2d3e7b4d7f4c1b2e/
         arm |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/108ab08997235c0e19b35840645a1a6e22453418/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/a8e85461b996566b47556c783707510d79b2e674/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/d5bba378b05277dea9eedc728024f831ba589aee/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/eb30a0758813c9837664b0cff958e5112a05e0d8/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/83ef85c74da779648d9115985392911389cdfab6/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/3263ab9534d34439bdd303ff159fdc3e9fafb101/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/ec58dd58d4a4911b3f018f90f1a63503c3c490b4/
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/ca78c03f8506e2b4cafa9e332b2dcbd47185b0a7/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/9935cd0522d4f978ba2e788a690f66790686b76b/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/f002f813957f00eb14f0efb5eddc8b2e8c09f4f4/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/cfe594ca063861ee00676c9952507c15ac653eb1/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/227ccb5045056faf9ef6156d0c73841a96cbd71c/


-- 
http://autobuild.buildroot.net
