From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 May 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-06
Message-ID: <20160507063023.23D52101F8E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-06
===============================

        success : 148
       failures : 72 
       timeouts : 1  
          TOTAL : 221

Classification of failures by reason
====================================

                    mpv-0.17.0 | 8 
android-tools-4.2.2+git2013... | 4 
      python-coherence-0.6.6.2 | 4 
                 mesa3d-11.2.1 | 4 
liquid-dsp-df5a459fa05dba41... | 3 
                 host-go-1.5.3 | 3 
               valgrind-3.11.0 | 3 
               iptraf-ng-1.1.4 | 3 
          php-geoip-legal-info | 3 
host-gdb-6be65fb56ea6694a92... | 2 
                    cups-2.1.2 | 2 
                    ruby-2.3.1 | 2 
                  ffmpeg-2.8.6 | 2 
          sane-backends-1.0.25 | 2 
        lttng-babeltrace-1.2.4 | 2 
                     mtr-v0.86 | 1 
                flannel-v0.5.5 | 1 
                   mplayer-1.2 | 1 
                  connman-1.32 | 1 
make[2]: *** [code/CMakeFil... | 1 
 xdriver_xf86-video-tdfx-1.4.6 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                 jack2-v1.9.10 | 1 
                 libdrm-2.4.68 | 1 
                  apitrace-7.0 | 1 
                wayland-1.10.0 | 1 
            host-python3-3.4.3 | 1 
                   erlang-18.3 | 1 
                     vlc-2.2.3 | 1 
                    ustr-1.0.4 | 1 
                  nginx-1.10.0 | 1 
               libupnpp-0.14.1 | 1 
       openpgm-release-5-2-122 | 1 
                sg3_utils-1.42 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                      qt-4.8.7 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
                  boost-1.60.0 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                grantlee-0.5.1 | 1 
                       unknown | 1 

Detail of failures
===================

        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/143227248e5e81e3648b0184249b18ee52942af0/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/57803418f157f0fb604d64c0f8edaa2f8b62f279/
      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d328ae80335544114d2d22a36ab3876f2d877d22/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0ad249018464190fe92774161e2a5c02e7a87d50/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/fbab3e4932f374754e3e26bf776709def4f2335d/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1ddfca6ce4f637af976edd17bc416b486a906574/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/442b7bfff79e26d067f1de20702e5532486c1644/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/2e3c10d268b713da7a576250efd3997a89d52835/
         sh4 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/cbeef10c5533167e09276f005a252591db4de706/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/c2371f499f60e5c484d250c069543557977a575a/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/51165641195b7ae90950e3cf163dec34c0247327/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/9ee03c1ffeebf460191dd730ae0f2595c57121fc/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/c68fc6757f300f41f2cd5e1565f4d29bba7fc40d/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/993256a242953bf117ae1e8c7f97001e580daaa0/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/8d14ae35edcad4d6cb07389a2c57a19f2397fa75/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/58ca71011231d5656c4f45b3b3da6faf18557b35/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/7b23f3c6a45cb278eff5b9b185ac77f3ff807027/
      mipsel | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/f6cdb410ee3be5c3c4d150ae204378335620a98c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1d32e7679e9c57f793fc7a7f3b20d9054e1551ba/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/0aea9c1f4c0a0a5a9fc2deef03e66e524fac70eb/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/092cce8022393deba77807ebb2447bd0b92df732/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/57cf8f9af47e4efabcdce60fa28f034c41c556d0/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/a07488e91580f6e93651d6e189e4be3dcc9ad6ad/
    mips64el |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/39b8bbb0add467b8f4f16dfc798c3e972a20075c/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/87a549b58f1636863bf434c0a3bbcf02b2f3b242/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/c080c4222d11e8da9f4fbfbd18c92dd28e404afe/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/88fe38e63691a20fa08417daeef83e00c7640ccf/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0cb46b1a605458d57eeb5847f35fc4bd49764ba0/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/8794b6661101a36f8d61da53c856cbc407a76ebc/
         arm |                libupnpp-0.14.1 | NOK | http://autobuild.buildroot.net/results/1899e358cdbfd45955c646050ff342b399f00e24/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/d1a6f7df48a5a6138e960b70af0ad827b6c9c7e7/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/6840c9d856ee400b2a78660704eef83c74184852/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/9ce0e1f0c46d750703dfc5ef47b56a9e59a12815/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/34841ac2bdcfe0e8c333831e3e9f5ba70aa169f9/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/4abea10a838c611c43f1fbafd533acf75f99bc1c/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/e4ed40849aac1501d109408e18ca393be536979f/
         arc |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/a8961810dda5254212ac9f70977d94b08b75928d/
        mips |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/44ddb1a6ae31ce4603ceeba36fa42cb71cdd8c92/
         arc |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/38e9a544b74717fdb7084741dd86b123c6bfb0ab/
         arc |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/f4d5da9b7e6152e1f22ac6d147b59ba5cf806863/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c3f5a65fa5d6383d43025feb23525b2db18e6942/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/1d535e4a521e7c1228d9891da3d1d842a50cd34f/
    mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/27b00d188e0f5c7328839b21b714b57a4efe3306/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/e4597b57c5ee5e8869c057c0f9f40f8d0bb0444b/
      x86_64 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/5e0740fb72d61d163b1f22120e1e8ffdcd8ac610/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/ce04d4d35296efbea7d5130cf8329c145128f77d/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/9700f4f2e041bdb19bb621e0f5c18224c6a61773/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/c8694c0d95e54ae1339e293971688897169060dd/
      x86_64 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/d358c90816640fef871cbaffaefc7f3a088bd600/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/db61b71e6814599bc5185764104a14a9ae1364ab/
         arm |                   nginx-1.10.0 | NOK | http://autobuild.buildroot.net/results/f72a9a81e21166af20332d835d71651be7c016c3/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/5139335c868a95ec05fbdd8bca7e1fbd912dc686/
         arc |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/743941754a70617d3faafc56682cd568e951eb69/
      xtensa |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/fa0f248a699ddecc76680273c3b31add149cd4db/
    mips64el |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/5e67b728853af624e9136667a708d4cf9282e0df/
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/9f64b1deaefc046c87b07c49300948f10085e3fb/
        sh4a |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/986f05893aef417a1a2a2ce641a252ad11c7466c/
      mipsel |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/2cf2f52784be03c56e5e093b4519cb2ef0b0f30e/
       nios2 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/6069113b3b7148d1138d1b2648e2d8c9be5868a2/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/87720e2127a6ed7c5a034adb5ed1e28a30e07579/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/98131d626924336f4d976d6cbd91607e05566161/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/13603729fae2cf5a3029086485784e29cd123e2a/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/1ad0f3fd86321f6869591a5139a1d2a9edab9b6e/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/a8032d255a1769be6b1979d31b4851e598150a62/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/f92384bf0bcacd4cf97c69da68aa36deeb391c1a/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/464a4be098c9f30367952c88bc830e02ac164a58/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/1a0bd64ff1996d0e55ae76706068ec4dfb9aabca/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/ef7f1af0fbea6aaf378516e95cbcb5193a1c1cde/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/2184b15258b069ad23e0410d4f2ecf53b61d16c3/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/8d2bb50607383f3135ac5d3806375591de26db90/
      x86_64 |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/d0b16eb9d4cad821076a4441a77578f76c43839b/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/2824fe67c522d5aa77b5b9eab100cd87d902106f/
     sparc64 |  xdriver_xf86-video-tdfx-1.4.6 | NOK | http://autobuild.buildroot.net/results/2b2558661850db295e670edfb5943973e93e01e4/


-- 
http://autobuild.buildroot.net
