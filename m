From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-24
Message-ID: <20160425063023.CA62910240A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-24
===============================

        success : 187
       failures : 76 
       timeouts : 0  
          TOTAL : 263

Classification of failures by reason
====================================

                    yajl-2.1.0 | 16
                     vlc-2.2.2 | 5 
                blktrace-1.1.0 | 4 
                 mesa3d-11.2.1 | 3 
      ca-certificates-20160104 | 3 
           host-cryptopp-5.6.3 | 3 
                 host-go-1.5.3 | 3 
                 jsoncpp-1.7.2 | 2 
               valgrind-3.11.0 | 2 
                 mono-4.2.2.30 | 2 
                   erlang-18.3 | 2 
                    mosh-1.2.5 | 2 
                    libiio-0.5 | 1 
                  cairo-1.14.6 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    putty-0.67 | 1 
                 rpcbind-0.2.3 | 1 
                flannel-v0.5.5 | 1 
tstools-08f6be304040e7b8476... | 1 
                  squid-3.5.17 | 1 
                libinput-1.2.4 | 1 
                     lxc-1.1.5 | 1 
                  ffmpeg-2.8.6 | 1 
               ipmitool-1.8.16 | 1 
                grantlee-0.5.1 | 1 
                   taskd-1.1.0 | 1 
                 jack2-v1.9.10 | 1 
qjson-ba273682a9d33a7b3090e... | 1 
        lttng-babeltrace-1.2.4 | 1 
                 rsyslog-8.9.0 | 1 
            webkitgtk24-2.4.10 | 1 
                    ustr-1.0.4 | 1 
                     fbset-2.1 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                 libdrm-2.4.67 | 1 
                  connman-1.32 | 1 
                   assimp-v3.2 | 1 
            qt5serialbus-5.6.0 | 1 
                 raptor-2.0.15 | 1 
                  c-icap-0.3.5 | 1 

Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c433512e7e3476343ddca83f11d6eccdb0af53c8/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/1ba623faca438ca5ef9c148d41717c32e7e61c56/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/55ce792eff62a3e57467fa8ed871135304fe1071/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7da5e5951e2b894b20f364c8f1f85acf48aa6ca3/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d6a25db7c67381daf488157d2bab630a32553ec8/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/aacba89128de93e7d6735354a10b6e4811cb9108/
       sparc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/20f15a6cb010335794c79ed206c483fe2e3b1091/
        i686 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/0f0dbc8619d7b35162f8d8381faabb8d1967f1c0/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/e6de49e409681e42d47684d08174fa649480a587/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/f8c0652bf27ce2fcf2a7d44e02e303dbf5fb2266/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/cf066027aa6a0f18585ac58abd61215dc15185ec/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/b7321323441f4e25b61c3b1c8b9af579317653d0/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/2737c7cef6dcb595dffebc506430bf932bdd84ec/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/28d070b7ad6d1f4b2633b853eb079c929791770b/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/c9f1f8e1aa06544defbb853a80c5ae57cfecff1e/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/eb5fc4a467981a4475b7e995d9123a89222fedbd/
     powerpc | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/c91f6bce6f8a0691467a5ca16d5fe15687ee945c/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/9bf207efce519220f5a3595637042c959e3f5fdd/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/fb8d6e20848e5590408fa4ddf69fc462de50a9c0/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/36b388799e5e9dc1e99fcbe39481272265ac6d09/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/8dd6c33433ee401266156839343cbe3deafad602/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/e3d225d72070c8acfa17f1cff78aaf542ac2a8fc/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/fa58be0d7fa17ba278a0977aae90fa2c6c93b521/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/337a767b041c4d07a8f38cbdb480fd68d1db15a0/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/8cb68dda4fa418583cc587ffe5ccaa783a327c35/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/0bb238eb9ed6dc6cf5256b6ef17d8baec9912185/
    mips64el |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/a62e95619acb3d4d6be4425cf44a4628ac227494/
      mipsel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/6407c5bc03a28f87f1bd29e8df926753824e87df/
      x86_64 |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/b1e3fc27f3d0cdd6ca8f7aff06f7d5e4108817ec/
        i686 |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/ffb40572269c63438228000495e1dc78c778788e/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/08889ad91f8099ffcc49127e9f20903a107c9ef3/
     aarch64 |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/1dacd53a25796c2dd865f497ad1a60be8e52c0a4/
      xtensa |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/546f2227940e0f345ef89c901bae80c7b40267e3/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/0cd1d0a9546f28e0a863f43107ed63460dbc6519/
         arm |                      lxc-1.1.5 | NOK | http://autobuild.buildroot.net/results/e27d637b1bb7278ae30d86a72a2d88432d805d2c/
         arc |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/775d06c1eb07c38a604867754eb9a662bc124b23/
        mips |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/15c3570a70da384cf0763f3389f828fbec8f1446/
        mips |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/4fe8959bb91b294e652d3e7e2df37bd6ba9a5ffc/
      x86_64 |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/77449e24c0d83a86616e1e00eb66fdabe8b43eb7/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/7e3c2e47305de3db5d7973f7286a8d3f384f87c5/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/02139a531ccaed1a2947981cea24dc568bbc1e53/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/1a69da3cd7df29e74d75a28173c4a32b9e88bc1a/
      x86_64 |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/f2836f3a7e27f74f5adf38d1769b9b047d59c385/
         arm | qjson-ba273682a9d33a7b3090e... | NOK | http://autobuild.buildroot.net/results/a4f3f9c79731c69082f70c3841c012c576517921/
     powerpc |             qt5serialbus-5.6.0 | NOK | http://autobuild.buildroot.net/results/35d01e9ba9253d92ba7c6ed323948111508f3c39/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/254227d8b7a17f2074fcfbf4b973f0b6c839763e/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/95a95bc6391afeec18906a72071c7008862e3b04/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/134662d1d2066cba9df9874b62dccf565fc46623/
         arm |                   squid-3.5.17 | NOK | http://autobuild.buildroot.net/results/ac6e1e105af3d6f682c743051e5bb44d295793f4/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/63c0ac4116ac2380797da76066aab8bdee1f3436/
     powerpc | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/40e548bb04302ec3d3f2b4db8d7fcc9d8065e99e/
     aarch64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/63eddc4ef94e483386081faedf2716661b80d57e/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/c0ec9587fda03edd9756fff1070fe898922c85f7/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/da682b2d52467b2e4eac863783f617238ac7d1c4/
    mips64el |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/01353f8d2a5f9fff01c60f3a3fc7a4f72f58c5b7/
      xtensa |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/f8964071f2963c6cc090e7f4b9c1a90a4107afd5/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/101663bf2b3744c69c1cbeb801763b712f35f78f/
         arm |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/ea338edd8d6a615688d3958e60781a1b860c34f8/
      x86_64 |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/fa717e5f3bf694db69a843c7329533a17b59bff2/
      mipsel |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/e3a8b3835cfb9ef4097b3f2e58e68404b2ed614c/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/9b7ab39df86f1513bcda7f15de57e727f7762487/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/31268e4d20aa34bb90c09aa771b1923f979578ab/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/614c0cbb4441751cd8c0277bc9d24479bc655322/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/16328048a13952be8be736465377a1eb1d1a67a5/
      mipsel |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/acc4bfb9f38e9d7592264540985bef9c92b3f8ff/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6c9ce90eeef9d2c7f86f28ab671aa818f6dbf25a/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/46c9f6e8321978ad6f4d75c28c87fb29ed9d7ff8/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/5107113b2878e7ebb41cb2612899e74fb6db5042/
    mips64el |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/90bdb9ba120c139925321c758b885dd15ce8aed5/
      x86_64 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/10d7464b916b76f0e2e34d0ac862a906e410122a/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/e8a2ed9743233d3bb6dafd811ad709d7820bc992/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/f10f519300b5588994fedcc79a8b673f16b40b28/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/fde83d64081dfd3c00f92e1753a390b3c0311625/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/b4fe0157734baaac2674702771dbb9bbfe3add36/
         sh4 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/7fcb0c8f1b23bdf9a6220e8cac1a25ae60e3a3a3/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/37b44a232780d2681ef573ed29f0a260acf4d3ab/


-- 
http://autobuild.buildroot.net
