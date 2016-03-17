From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-16
Message-ID: <20160317073023.E2518102714@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-16
===============================

        success : 218
       failures : 281
       timeouts : 0  
          TOTAL : 499

Classification of failures by reason
====================================

              host-libcap-2.24 | 112
           quagga-1.0.20160309 | 21
tvheadend-3927788bb71ad0041... | 13
               linknx-0.0.1.32 | 10
                  ffmpeg-2.8.6 | 8 
     host-shared-mime-info-1.6 | 8 
                  multicat-2.1 | 7 
                     dt-v18.32 | 6 
                  cairo-1.14.4 | 5 
           libimxvpuapi-0.10.1 | 5 
                    ruby-2.3.0 | 5 
          shared-mime-info-1.6 | 5 
                  connman-1.31 | 5 
                blktrace-1.1.0 | 5 
              gst1-libav-1.6.3 | 4 
                    cups-2.1.2 | 4 
  getent-buildroot-2016.05-git | 4 
                  boost-1.60.0 | 3 
                   mplayer-1.2 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
                  zeromq-4.1.4 | 2 
           lksctp-tools-1.0.16 | 2 
             stress-ng-0.04.16 | 2 
                collectd-5.5.1 | 2 
            host-python3-3.4.3 | 2 
                    owfs-3.1p1 | 2 
                      qt-4.8.7 | 2 
                 mesa3d-11.1.2 | 2 
               tcpreplay-4.1.1 | 2 
                xfsprogs-4.3.0 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                 mbedtls-2.2.1 | 1 
                 omniorb-4.2.1 | 1 
                 openal-1.17.2 | 1 
       openpgm-release-5-2-122 | 1 
       gadgetfs-test-undefined | 1 
                pinentry-0.9.4 | 1 
      kismet-Kismet-2014-02-R1 | 1 
              xmlstarlet-1.5.0 | 1 
                   nginx-1.8.1 | 1 
          chocolate-doom-2.2.1 | 1 
                sg3_utils-1.42 | 1 
                 erlang-18.2.1 | 1 
               ipmitool-1.8.15 | 1 
                    vpnc-0.5.3 | 1 
                    yajl-2.1.0 | 1 
        lttng-babeltrace-1.2.4 | 1 
                 setools-3.3.8 | 1 
                   jamvm-2.0.0 | 1 
                   tinc-1.0.24 | 1 
                   systemd-229 | 1 
               valgrind-3.11.0 | 1 
               libgtk2-2.24.29 | 1 
          sane-backends-1.0.25 | 1 
                  apitrace-7.0 | 1 
      ca-certificates-20160104 | 1 
                  gamin-0.1.10 | 1 
                libpjsip-2.4.5 | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/ad56381e7e6df58c08f012e07df3e434b7086aae/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f72833f6fc75acf3001a8cd3eb79d739ffb21213/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/dcddfaced1f6564cb60d73b78de945d430c8f0ec/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/53e6b9fea587a61f05e00e45528e9736a8a78b8e/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/40c01586593d6f521916ae4c6255e4fbe1fb71d7/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ab007476680ef8afb9a9e196ef1facf8ad416186/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0e3d48b68b45e6bc5a6b15742da66be27e3c93b4/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3a1ef7866df11c2deaa6142e460148b029b363c9/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f1fcee77cb3f0c3a2f6996b3dcc195f058448c51/
      xtensa |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/9e735d15158d08f7d4c2593cfa9d1c8ce0d994ee/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/d773dcaaa9154575ab11f3c695d19704d0971eb3/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/147d5942cbcb886e0f4bd3338809583ee40be3d9/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/ce970360f46a27ac34ce817d7868ac40e81381d6/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/982f8cbfacec87e235cf7f656f8044d771b8d95d/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/6587079ea516fb8f7c2e2ed85a1989b75052cb83/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/3ca9cb02158a7645ca93dcadb244402c489416e2/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/9690fd7fcb5dee3346fcf5fcb76d99ca64a36092/
         arc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/e31b4f6e9dd034f90702baf4a1bc22d07c835cfc/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/3b7f0fe752115ac7982c838b6322d5d9fe473529/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/684a541925d7fcd6b1386a6acb330db11404e697/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/35cf318cdb1774a2012a5e73b7f03a08921e9173/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/dba280c9037c5dee60f977af1aec8907dd72942c/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f3643cf40440e5b5339f5c93e2153b9896520dee/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/edd70bdd42c72e73d3d4a766ead8719ddd4ef883/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/d514afed95a3d835af61df8bc664e3fe5e5f60a1/
     powerpc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/e13d667f97cf0ac25a13ded3f3707f6c87c267d9/
      x86_64 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/bb1c80a9fcd559b4b47994d092b4e7ff20d4ee5d/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/5979246acd6bc0a4e2493bfc824618b606847e9b/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/bbd8c91de3818935e937ac67b6809d284b4c2264/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/424a9984aeb90228887bcd7fd0ac3984495c14bd/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/d17c5f990b3d8f166478a4755e53c0eac97abff4/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/ab5c4f29ab70d0b2d8ccd83b3ad4f3df6d017614/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/898ae627903c2235915bb68ba628357edcbabe11/
       sparc |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/14546ac4cf76b2527f42becd30396384217b2d43/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/fce24fe062b1bf7f7e26b1c04afd2b04a72660ae/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/4fdfe73c4a5fd5bc3119b68048516992304e4019/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/108157efda719defe4d5b371e3176446615b08c9/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/59b746b318d10408e6fd668a6c6c1f0e8f0f2de3/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/a4abfc52a29c767b1c0b348e8161c6c7416486f1/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/6f44962897e6f4fae4c49b93adda35d9f906a403/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/18dcb3557a30b7ce4beed6e72cf8ee9bc39fc431/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/066e9e2be3843995f016aa7d318b3aeeafe888c6/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/fba5a9da10d4660ebf9f07c41fecc92c993768fc/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/b560e6f85f420c18721f79a065ab706aa4d31642/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/defb2576af6b4b036cd083e4e91e27a47d6a7f17/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/588e1c80829039cdf3895353ef4038abcfa5d99a/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/0f827c071e24a30075221d0f29281514461b27d5/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/6f567d6f35e83eb7b46f2ac9ee1258911f17b8e7/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/014a4ba18a6bc0c8745e28df65dbf0ff21417dad/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/dd5d4b200a16bbdedd68861331239cec94e8beb5/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/02893921989c93f3de4ec2d8a41ae4fa17d2bf2a/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/f7d955e39419a38b9c514e06cbe9a69354d34ea2/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/b2b2ddd784c6a4a49efcca5601625723f00b0a20/
      xtensa | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/1a7e09f119cf1fbde612938d259c08cc7ceb1fc7/
        sh4a | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/fae12e3f3237ca301f7fc3a3cc4e3910dd491b47/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ce40cf4d3c5d1112f52e88a1623f7e1f15b929da/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7c157069ab538845c4ce625a470c3726b13a0ad1/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6242081c4c3f198052ee950e892d9c77441852bd/
       sparc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/779fe34aac638d6f37a42b2b74870cec76178267/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/02e7b862774ab822ce5f041a9acfc36ac944e842/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/42f9d7cbe1e5c3b015bec7c5e40d4a647ff45c10/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/360023ba904220625cf9558fb3242e384cbab65a/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/389c632d98a34db72390d664d7d3da5d07ca9213/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a47e02343ee9b8078f1c0e4cc788ca19ae199ef3/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a341e42142180331bf3b9d9c76a9d9c3865e1608/
       sparc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8fd5dcb1e508aacc43d68e9b4d8f8ae20e68c0ab/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3129d715fd3de99c02ed9f405815c6a0d4c6ac52/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c166b66650b43fae0cffd835098ae08ecfce4ac7/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/350ec1352facd9744f8b34a4333241212421bbc4/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b3cfeaa91dc16cba4af17e21697f4ba502f3bb32/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1e04caec7fa606864b3d271f22948f93cb380513/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4799d962d80b98bf0b792c4a4b254ac5b7ec53dc/
       sparc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7c46fcef112df9da6f1613e052bd2517e7ea58e3/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/74a26c8b90c5563b288ba705ba0bde1c78f35922/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9ba593553ce1bb774ad610ff4de8e698c769c560/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c453f62910469db873f0ebc4ae26d748b2b8a8a2/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/57608960d263de0fdb7d52579e7ee426412036bc/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c72487549be64a06e4a8c72d547696bb540c8143/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/301284c6fc8b7ffc6798f76e01079727e152cdd9/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0936fc85409697b30da70b2b61aa8438f9a90eb0/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ebe396dd213c1e946a8c182d5946e290f592e938/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3fb9c6c493e03ac1b8f5c77d09a8b889805993da/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2b72e76a2f97cfee7ccde6f612717e28ce3bd781/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e936c9f1752850010a6913e66435775d88cdc6cd/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fcdd8f01d5def3de22cb308f5c710e31ef36a6e1/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/492454e81422e29621dafe56c9eb773cdf74f0c6/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/13c3e6f5ad5a782eaf41d0f5ecc8c13846d26e4e/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/70718a199b9ef23e20380aa716e5bc0eddafebc0/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dafa9c8c5581772775d96c54d18b88d7f586cdf1/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fbbe9d4b3f396711b7f66e61dee0ef805d886a09/
       sparc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/16579a9c63ec45df8d3bb67a5600534ea0e700dc/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0b7510e7449a4dce9fbe1e4d18c013d260de805c/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0ed23aa63f417f98f17dabb354a6983ec5a4fa7d/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/37cc86cb7d52842ef1a924544447772bca5bb7a7/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/108afc6836264376fb06231aab2971c52cfea9a6/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/48aa3078a9b3444ecf1105b42594a8188e052f9f/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cc105f8c8baccd4e309bff5efb47d1a8472af0c9/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/03a63cf9049c5de40ebda768e70112fd53dfc7b1/
        bfin |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/13a61e7a06940de411a4e9838459d7a0ac296039/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ee87263798023597210248cd7ce0d045bf288882/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/639eeda89f0adaf6f0d1f53ade894e34de188496/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/19f61ff515c682686fdbd9db12839bf29c3805f3/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ba057763ea5910bd471e2963796c9cf44727ce8d/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/de3fdf569d9611075edbb4fac7b6d830bb464e15/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6478d5ac97ce95b7d6825f039c0f93580d6438a1/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c2be31457b231e8ac721e8d27f6968c7d0dc1b94/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5e9d19b85c9a30ab30fb4e5079103cf495d7d1bb/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bafb9f69b03062de8ac7170bf9776fcdbedf670e/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c83e810129ae040f18840e6905b0ce730cd1b96f/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/244bcbdb2edb6a4b5159e4ca9a732ab24003a476/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/788cb9ae19ae40a585ae249019f635da363da4b2/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/669a5877746a07dcd3b19b0e7b097e04e4c673bc/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1d1f1aed4016a0617f5983fadc707c596d6deb03/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0059ab775e3380754eae77d663ccb222ce890366/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3a4acb7744859ecc8d42ad61695f995eed966a86/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/36751308999532f4dd76b8f06b5c3be755942110/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fc855c6ef7e1fad32c22ecbf9f1795acc37107fc/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/541b528ffcff9632001c0a50b3734462133e70d4/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4b3fed643c88528a066fcb2625070e1ce60a0469/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cdb28277bfa0a708014c2f09798a53fc18777ca0/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/76023f583ae19a4544f7987b5d3ed2587ebec6c8/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6299d3dee698290b89ea61d91a7e93006865a5b4/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/848acd20165e6cbece6f324916d4edff08dd700a/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a80d15e9d72e0e3526ef5cb896ced4b5f067a8e7/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/eb02b8c1abbcc194b88702cbcae2eed88cca14a5/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8b3560133ca2ef06ba59a0d95987108f9c2670de/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6c68eb7fd88f79b9fcfb8f7818f78bb5f5d12eb8/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ea20696dc791fd64056b2b0080de7d05d6f56260/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5ad447719866a37fb95f38827aad09090b2b084e/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e0e3a7694599982cf68552bf731f5d6e1f28ade5/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6ff45b35455203e0e5ba5508d2329cdf24db8e85/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/93652cecb65ab0d2bcc0f8499eb9a2a9ae1ac1c5/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/34da69bbdb0edd806b5e0e776ae5db382c811ba9/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0239fcd2b4db826a0a2d5da44c4bd22d16b2af03/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c2f6f1c8fe17095bd631564ade834eaa9f22f68c/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e4ca29ef7e34278e374569adf96a75e043e312e1/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/72e3ee6d8a7b1e05a6aa36bfd262b1f7848891a4/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/22542aeb55a5ac4ae36cd27b22b8cf8cc749a1ef/
       sparc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f23111c85ad8ca059b8e364968139eaebc863d6a/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/92008c50ea02eff5aa1f8c755e5a548a1faa9005/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/36a3bfbdeedfe16c6550aabb50d649e50d3e3751/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e8720d151cbed6a06a038b29c35f31ffa21af843/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/856b71bccf14c3334a8c0fc66c1d985b09734313/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f7cec21cbf81d699ce0d066b251d5798c1542d49/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c69973589d20bfaed1bb056f212f304c9c59237d/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cba240c8c335f8f8d32e32b0ab4423e210a841cf/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bcb2d6535e10e2260c19694b4e6ea015513cf23b/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/77f7353426e4cd19ada2ff14566460e24b464526/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7e8ab841bd8ea6f0cb8a2ffdc436bd20b86fe90f/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/eb2d6325d11830358e0043ff8f53211ff77b25f9/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a99cdabbcc8935a2c0767939e67962993b06f3e3/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f38ec87f4abb209d3f556f94e49fef43b69abcd1/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3631cb301c2e70a4723f149717cccb69aff892f5/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dc8ede9f11eb431de2b10d4dcd1c731e7a8641de/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/90315a53f9146e03d9a5357b1f49607aadce5184/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8a327884216dbbe5e347ac4494cf75c8838f3d28/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8bab7d00f7a9de2e24a2e3815cb06b55f2a0c135/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7110b326ec6925957c4c623d756777245d3da0b1/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bb59d1de5ef2963cc1839fa02b0af6c026ab548e/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/306077835872146f317545619517399d8e43d5d7/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cf875c6a028657529144272868807799a536e311/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/15905cd55cd7f000d96e78730874254e2d9bccf6/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/045192412f491a57929b7f3060930ed4fe8d3dea/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/af4b456a7d3a5c762fa95520e5dab1ba83bd2200/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a436f5155810ab49ae90f9a2082a5adc364adde9/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dc7ec15fe7101b34c802a031813cd9f4abece790/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b9e3ac37da1d73b42d871d82deb697aeed6252ae/
    mips64el |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/1d2852508195278e50b48127c3b37630421a5784/
microblazeel |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/a782a0df8d8a2f557890652432e051190b45b161/
      xtensa |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/af3ae85d3b073c2cf6b8b17a44448cafd4bed249/
      mipsel |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/4f5c7ab544023bd082e1e47f5e15fd85e15ad917/
     sparc64 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/db63513d8eafe3abf518a9c72cdacbf23d4b3d8c/
       nios2 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/86a3dadf09dfa61c0e774b32ae4416fc4dac4b70/
     aarch64 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/e56dbb44c2a3b003d2712b091baf43735086059b/
microblazeel |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/abcc726a608c73c8f2aa1ef2e4788945950a879a/
    mips64el |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/bbe07221ffdf27eae59b852e8ca37c1e3aac5e29/
         arm |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/34dbf4f8970ca561ba9d1f2b57456f3e4fe22a09/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/3754b7fad2af4ae0c93f42958793a71b6ed62603/
         arm |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/fa34334acd8d682e76444d9208463f364de96291/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/59ed8de1382ffac7a46f43cc08c1e10cc8c0de55/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/a01b19b68359e93fbb4d2a5bcb18358cc33ac730/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/f2f913ece6e9f5919dd15651f6318a0aa57058c0/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/4c83e646ab6a92f555ad72b4a92738c2bfbc884b/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8653ca9a2e7b51a2d526a7db083598217afc3fdd/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8ffc9fe81ee666f5cbd307b25cadead7d2bd61bd/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/a47ffc47193a74c57d5e76301afb2f71fe360fd8/
    mips64el |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/f8c41f35ab56fac86f2877b09a60924256f57028/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/46f9cbea3768e694efccf56515ce22a9f885024e/
        sh4a |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/8ce51f3e2a6e93db3ffa4076c293dd56828de349/
        i686 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/8e17d896f02cb2b2e49b9fa53ec01a2d81f54383/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/2a8af93d6439b313b048ccac7b6cfecbb6baff55/
        i686 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/17971c9f8925ff8623a7d97aac8eda0c287a76c9/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/98826212d69e4549f2e324aaaca3b1d32f6236c9/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/3f6ea32e774f3cd5201b26a6cfcabcd9c4e72f4c/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e883451eaf66646cbae5d169e60f54b4053fc7fe/
       nios2 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/b7eee52f6c2b6a57b85348641086072aafa172aa/
       sparc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/96e9ae0df7ebb7ad3d748a6b518cc59570e0b995/
      xtensa |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/ca045a90789b9a8a97ebe1bf07d3dcbeedabaa4a/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/93f0f15de1d61639c90a3c33c8f65762eb3a80c3/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/5dbb510fb404bea964bdc64836531b9908492a43/
         arm |                  mbedtls-2.2.1 | NOK | http://autobuild.buildroot.net/results/6b267b9cba37655e7d8e6d78821f96d9a8dd7d2e/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/ccd712024347fc5c3e740759e7c9bb9e2c1633ea/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/9a1d5d96e8084db443cd2044b15572a2e726def6/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/69869d295d6cb4d531c0599fc921bf355186d934/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/49976323231fb15042524937d79a6389f38e3bc9/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/6d8d8093b3bdc02dfaef8eea3569c508796fd044/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/9bd44a6f0b357242de4cb8c2342d50a1d7f84105/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/b196b9e8f4dd76e11c9790d91bdf7c7559265b5e/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/4dcdaf9e64db0070870f0b0a3daedc53787b58e0/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/b7780ae966e50d422f4f8b401e9774002cbfcef9/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/5c7ec925010144b013f8012062d3de03a2bee208/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/a76b2ecbcaf9dcdb8543c4ca10dd269bb732db50/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/958437b34ff54055656d11bb4cc14f8a67e03466/
      x86_64 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/9074fb146baaf6da6932674118b3eb2ddf6128fe/
      xtensa |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/2ccf8c5bc27cb1638ad990bd538d44d30b9251e4/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/e1ea48f8b122cf56f683f78355e6dce2cbe0fcb6/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/74f1fa2e295930a48472f1bbd84cb4f5963db4e5/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/60182c09e9b5fb8e315bff5d1a9ff9b1d8e4efbe/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/abe1bfa84f56466b00a24365f8be30f9f170afe0/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9406ec11c2ddef17fc9382e7a57797f43af77fdf/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d952558d9d04569faecea8924743dd0551786c1e/
         sh4 |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/23fcec59118d197ba2f051171a67dc5d586540ad/
      x86_64 |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/edbcb616b6019bced330238228fb5c6f880ab885/
         arm |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/8b2d18e838306b960f5499f2200883808d6eb719/
         arc |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/8311f611559b3e7e98860d5a0264db97d4de1a54/
         arm |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/3921166d4567da74f213ac0c1ab41c92df4c1a2e/
     powerpc |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/7826081109aca701b09bdabcf9b6f37d77bb0ea6/
      x86_64 |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/36102954ea5c2b2dcc27d5843cebdccde229354b/
        mips |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/13ef485a82148b3883b44e88deced9d9142f9436/
         arm |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/918f5ced9c7dd59a8fcab654dc8f6d2798515e34/
         arm |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/530b40357c734069ada39fe06162193519aef5ed/
         arm |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/e62c2c448805044b44ab88febc2c4dc1622db39e/
      x86_64 |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/494520d6edb7b1af178e1039352849a96dde05ed/
    mips64el |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/c015501dfe1f9d1da7996949dd011c6996211fa6/
        i686 |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/eeb9e455e89f9fb56b69254b7d172881a9f89525/
         arm |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/95ff6c49028b4d83fcc5bb579da0a4d0f81710f7/
     powerpc |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/b9ec07ea916714ac9d39b292e9617a449cc1e3bc/
    mips64el |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/61c57a2dcc6a355fda6720737aaee2c805f93e6c/
    mips64el |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/78e4ccc8fa99f11abc99349f3db8e6d6dcd02cb4/
         sh4 |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/669e0ea4d98feb7198646912fa0f228e4640119e/
      x86_64 |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/a0c5a926992ffef73c178c28db8443967a7fa381/
    mips64el |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/950e67844dc652b88f9f8b21a58706c6e3ef829f/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/4516e6cfa31fd3342cc8b6b3d260f8ab450d9ee7/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/c75efc6effdc36e4252ca42fc95bfaba0ab732fd/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/5f73134ee03fe274078afae36dbdbabe380b7024/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/7149849e325646d0e302d5e8cd17ef7c2ea4c8c9/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/82df92521d2cb69b69747fecad6e9fceb9ba0d48/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/b477abd34b0429249356c97166831a0edf709300/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/ba1e473178bb66ebc43897b20e534606d2577ee3/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/69d81296f5283f149d79b991eedfc1bdb043445a/
       nios2 |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/79fd7d23cc5b02928f8bdb2dc83cb78d0e7cd1f0/
         arc |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/3c74c1138c1a6962e686e5b17b46b44b54e19d1d/
     sparc64 |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/40331fe92afd4cb9796bd37874c39ca96a60f8b3/
     powerpc |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/468bc0e6c8890ca0f7136eb030604f1fe3689d1c/
        i686 |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/affd3f3478ba8e31f71ebc6bd5882b3e64861f5a/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/d90476f8a542b2a87583218bbe6119ce45c808ef/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/be5aee5bc45f5a5ac2f2a9bbe3c63d7a27efc3d7/
        mips |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/8ea1151c5d741a2d7be1bf8d790348e3fc76fdd1/
         sh4 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/fff0d6a814b765699cba803ececbc00d77e5d8fc/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/c4762a58a1834aba9a0d67aeaa83cbda140a59c3/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/f94815fbb2474fefeaffa5252a80a771f3f21031/
       nios2 | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/5d66a20b198740aba12f73af8f98dd3b56aec3ae/
     powerpc | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/6cb4bfb2dad23b85094f5800b7b4823c11486498/
       nios2 | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/031af7c1d67bcdba77d4d5a731e0d320449a657a/
         arm | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/f5fd573c5a4ae6e34086f6e23a171c043757cf34/
         sh4 | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/0fcea05e268e5fe7878085a36b7f609f7184ddb6/
         arm | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/fb835d334b21f3e269796c098ff5dfca35833503/
      mipsel | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/f33446661f5daeef16ec55fb0f9e8ed6bcdb6710/
        mips | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/7ca7e8e8557b73774c223a473339d780e6380d09/
         sh4 | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/96a13de7b95e626d03ea420208d8543f42d4ce1c/
       nios2 | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/4e403fa4aba6196ddc362cfe9c1e37743fa3cede/
       nios2 | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/df93f2be3c3c19721a9537850eb6b176c5a8913a/
        sh4a | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/19b3179811d38ea4b0ba1241eaa9277dc2100ec0/
         arm | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/0081ef7670cab1ae0aa449ec63f37c27fd1a53ca/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/7a259f21c3443724805a887a4ecb25a3bcdabedb/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/c87b6c9cfdf1fbaed8238bf41559c38cfdaf41b8/
microblazeel |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/50e59496a188d6fc559cfd04109f64e6fa5b6897/
         arm |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/e56dda3b06e5c3b10c6600816a226c8f3106c112/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/0ebfa9c2e0fde2d719f04fbe40d4d187dccf9c14/
       sparc |                   zeromq-4.1.4 | NOK | http://autobuild.buildroot.net/results/8f2a3571611dc9414c23808e7615f87b677557dd/
       sparc |                   zeromq-4.1.4 | NOK | http://autobuild.buildroot.net/results/372186f3b138edc97ca857730d2d4366c18fdc71/


-- 
http://autobuild.buildroot.net
