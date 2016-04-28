From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Apr 2016 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-27
Message-ID: <20160428063019.086A6102637@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-27
===============================

        success : 159
       failures : 52 
       timeouts : 0  
          TOTAL : 211

Classification of failures by reason
====================================

                blktrace-1.1.0 | 4 
                 host-go-1.5.3 | 3 
                 jsoncpp-1.7.2 | 3 
                     vlc-2.2.2 | 3 
                 mesa3d-11.2.1 | 2 
                    ruby-2.3.0 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                  boost-1.60.0 | 2 
                flannel-v0.5.5 | 2 
                libpjsip-2.4.5 | 1 
                 jack2-v1.9.10 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
xdriver_xf86-video-savage-2... | 1 
                     mtr-v0.86 | 1 
      ca-certificates-20160104 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
                  cairo-1.14.6 | 1 
                  thrift-0.9.2 | 1 
                  ffmpeg-2.8.6 | 1 
                   tinc-1.0.24 | 1 
                    cups-2.1.2 | 1 
                 libdrm-2.4.67 | 1 
                  stunnel-5.31 | 1 
                    ustr-1.0.4 | 1 
               valgrind-3.11.0 | 1 
              gnuradio-3.7.9.1 | 1 
               polarssl-1.2.19 | 1 
        lttng-babeltrace-1.2.4 | 1 
             fxload-2008_10_13 | 1 
               tcpreplay-4.1.1 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
                   assimp-v3.2 | 1 
       gadgetfs-test-undefined | 1 
                 mpg123-1.23.3 | 1 
          shairport-sync-2.8.2 | 1 
x264-a01e33913655f983df7a4d... | 1 
            webkitgtk24-2.4.10 | 1 
       openpgm-release-5-2-122 | 1 

Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3c18ef7c08d994d2ff83a695169c7531316f39c7/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/67ea3f766eed4f16d167a13842f6e52ea61037fd/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/001d5b2d4f1f8dd6471f10423f520bc97e3f5248/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/67bfb63895ff18159d1cdc8c4029d92f8dd599da/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b2bb076bf59c440e87f02fb2558a5599a1a2b385/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/82d98d01e521286f087d53ddc028194c9022690f/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e52ddf088d05f7ff0bc7f3c524513c43d12054ce/
         arc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/d2333aafe63a5039eec485985770f95fc1ec7ab8/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/fdbf5ca819315a46a07fe0e04bf286d40e757370/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/96ae82851fd7ff345d3573b332fea80796beb010/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/3dc4a9f0487bbac0408f56f04cb4730b75e1bc1c/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/305ffac834fff5ef1e35c1f889d15df7a6c3f7a8/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/956e8b0bff73fb01dda0c52c9af83613d0cda1d9/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/aa5aacbd7fbb9aac3ad0033d7584570252e9b10f/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/64a76514eb4e8858607574687e5fcb752287bf1e/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/cae720b5096be2672b4dc1311ae3fc4ed06a3b53/
    mips64el | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/4ac48fb976c0353fd5cb6464b7a3758ec53f5580/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/36b0a89fba59d813c5ad97f80072fdc48c20cbe3/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/e745ce7e798b99b265bed7442dff201262af9b2d/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/370627a01ea7c34fcfec2d64277d6f529c88091a/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/f1afc74177dfde6952504e4679f6baf9c50ea236/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/64f3093ec00267d58ec92d93bfa3e5f237530877/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/801cf6f7f5cb570cf99f690640d805d1fa91d395/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/cdfcaf7028fa8e86f076fa58166a43da2a996ce4/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/20faa8b217f31672c8b15f021288708691e83764/
        i686 |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/dbeec277a319ba1de7da2ad38ecb2084693a6cf7/
        sh4a |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/6ada6b4fdc562d2a8abe8a88a76fc0fef819c929/
     powerpc |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/40ef70a3079ec125fc12206ebedeebb0072dd8d7/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/6191421b9848d4c2d6d335bec67715912e79b9df/
       nios2 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/b2ffa10cb8606cf7636866589277a8d9c6ca5483/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/55a02a5ccc1ca40f0caf14377e7e0cbc501fe1e6/
         arc |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/04a6660a47de14e4387206029b1ae4a2b25b3781/
         arc |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/2754b959cefe7af2f003e2d7f0517a93359389dc/
         arm |                  mpg123-1.23.3 | NOK | http://autobuild.buildroot.net/results/6a8729ce69055821fdf0b91adcea2ea201d40189/
         arm |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/c20e21218d48a5b5fcb8e9ffd91a091b3ba77c4b/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/6ae742db10b542c6e4b6e4d826e753662df58602/
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/76d7032d8142ad62a0b3ff9d085e82a64b6b0d4e/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/e990391a26eab9e55376d618f33cfd0220e6effb/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/dc2ae646af3d3a67b0c709d8d47c392ac5c390de/
     powerpc |           shairport-sync-2.8.2 | NOK | http://autobuild.buildroot.net/results/f379cc349f3ed3b5d38db676a8f7ef1b78927aa9/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/ef315278598cd4f02c90d83d68218dc34d63d2bb/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/c2d588d0b74ea08f2ccc68594298f8195106f490/
      x86_64 |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/c1fb694b15e0e8b594659c6a9bacd3f408f0cd14/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/3f93df270dc556f755a7b7ee64b3655cb57a1a20/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/ff9d0f7cec5e03608e3631ff768c865fe5cf4eb4/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/793651ee64ecbbea2777ca2dda57e0e9bee6ec09/
         arm |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/f46970bbbc40e19c6f55557be16e9e43b8b08b49/
      x86_64 |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/4fd78ce6dcc1116fdd5971b6bba0ed5153583e10/
         arm |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/7a8e497648b199057fe31980a1c548c751ee2946/
      mipsel |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/e8216d9db7b3393743669ed453530042e79b23d6/
        bfin | x264-a01e33913655f983df7a4d... | NOK | http://autobuild.buildroot.net/results/94dfbdc43fe4db5d8067bf14a68a0079b1e6c49c/
     powerpc | xdriver_xf86-video-savage-2... | NOK | http://autobuild.buildroot.net/results/d50c18994f49cdc2f324f42c4408c4557e885c06/


-- 
http://autobuild.buildroot.net
