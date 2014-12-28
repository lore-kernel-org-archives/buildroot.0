From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-27
Message-ID: <20141228073015.A94B5101313@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-27
===============================

        success : 225
       failures : 77 
       timeouts : 4  
          TOTAL : 306

Classification of failures by reason
====================================

            libxkbcommon-0.5.0 | 20
                  guile-2.0.11 | 12
           libvncserver-0.9.10 | 7 
             libxmlrpc-1.25.26 | 4 
                   erlang-17.4 | 4 
                  sispmctl-3.1 | 4 
freerdp-440916eae2e07463912... | 4 
  toolchain-external-undefined | 3 
                oprofile-1.0.0 | 2 
               host-qemu-2.1.2 | 2 
                   libiio-v0.3 | 2 
                  dhcpcd-6.6.7 | 2 
                    lftp-4.5.5 | 1 
           libmemcached-1.0.18 | 1 
             bluez5_utils-5.25 | 1 
                gptfdisk-0.8.6 | 1 
                 webkit-1.11.5 | 1 
                    php-5.5.20 | 1 
checking for ld used by /ho... | 1 
                  xerces-3.1.1 | 1 
               libcap-ng-0.7.4 | 1 
                     rpm-5.2.0 | 1 
              postgresql-9.3.5 | 1 
                      qt-4.8.6 | 1 
   200K ....xlib_libXxf86vm... | 1 
                xapp_xfs-1.1.4 | 1 
                  nftables-0.4 | 1 

Detail of failures
===================

        i686 |    200K ....xlib_libXxf86vm... | TIM | http://autobuild.buildroot.net/results/8c3b11b42fd1cee5bc933b1f2fe9f5f34e5da69c/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/9c032c6cf4dd54ff8d29b30064888fd51699723d/
        i686 | checking for ld used by /ho... | TIM | http://autobuild.buildroot.net/results/ac24908529f65a47fc91134ffddfe94da1736610/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/61e7929d5400705aa37e344120c3757611aa2d87/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/6f24184d9705ca4215260aa0169c309168a31e10/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/7b01b9e977cfed6993c3915d3384e1241f799555/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/90b8629e61c7b7ea41ca74032ec7dcbee5efbd1c/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/2e7e88f27f243854a28227dd29f8d177d53b5a59/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/69cf0e971c01d68bb03c056fd4dd1eed947cd4e1/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/a6b3254ff64431cdfd4edd7cfadbb59cc9ebb994/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/d4a61e686cf11d993d02ece0c4e2835a926603c2/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/ac0be56a9bfeed5e7e0707f4d5df9e744d00c697/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/1d7c1dad0c98b4fe15824198d1db5946f2512b8f/
         sh4 |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/2553290cf2d40dda0c41278edb852f2e11653e44/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/af43b60ed722852b1364a2412a067c9f55a42a02/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1fafde78cbb3a6b49b6f80252c245e7187c4f719/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ccb08734c7f5618d5cdce84d1c557b39ed11108d/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/94f09ed7304f0c78e863323ad1b9e4a582d4cee6/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e4802d5607fb42075b1edc6542c994b922aebcdd/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/62d5f56ac9583d6f90c45d8a390b3aa3b441d0d8/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/056b7fcbf3b73a8d15ca635b000771cdc2d7fbf9/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/acf8926fc096e27af383bf7338d62487f80aa818/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/562001d3029b443ee66f2b7be3b0d7b53387cd7b/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/03a157a3d85a542b95536d2a73935302aeeeb689/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/bad84aac5608876d27cb63ef72e3e03212859425/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/0e33884af30bc2de339a4346d660ccadc766b98b/
         arm |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/ab2ea8841ac1982e5433c742971b980e3274fa44/
        bfin |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/ba1f305928a59f8ef1d7037097907ee1d601f0f3/
     powerpc |                     lftp-4.5.5 | NOK | http://autobuild.buildroot.net/results/a25478d2eb45331c265f3b43af5f0cb95956f5f7/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d0c1acca306bf8118ad874897224368e8aea5b30/
        bfin |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/0f34fa6013ef9ee257570475ea17562bd2483cd8/
        bfin |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/79caa59f99e7c700076f1b34df1eb0e100f19036/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/0d8a6a5d4543abcf38435f0d18b38c7b4c152a2c/
    mips64el |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/cc1b3b5a531989fcbdd1b3ffc724cf8fa65ea5e1/
      x86_64 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/0cb3798156ac2b815f4c7e47e3b72f12fde6e3ef/
         arm |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/c62253cf4f5bbf01a2c05f88dc623256b1178864/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/a4c7dc1fbc839de9d16a3595b3f1c7be0dd2d44a/
      xtensa |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/03b395d1cbfe02f88636984203469f7a481eebdb/
microblazeel |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/75afaad317264fb3cca80fe82cfc5a786f7e42a3/
        i686 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/ba142548988ca66ed61b828cc9d58a42daa9d00b/
     powerpc |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/4b454dfc384f5d6f29e3b821efbf7e5f32e36d80/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/a3c55c6c0d38528efc1058da747ea71b7a4221d4/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/c3c9c5edd61e1cd4f9a11b833e3ad3061df6fc4d/
        i686 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/3a7c2ccc11cd864cb2cbd0eb9f3df245c00c7888/
     powerpc |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/92741f6b9b7909b226c200e453ac6cee8af5abd6/
        sh4a |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/870128ab2aed601ea791898cfdb00d79de938494/
      mipsel |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/ca2ff56220f996efa6c17fa0adc92e6ccc8563be/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/f6dac62ab231369ca01bb04fc17e0d8be5cf0781/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/7fd2cb3472ec320e05138ddebfca76052a0cbb75/
      x86_64 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/51cb09f7f267319948c685f905e29afe99f59589/
         sh4 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/cc1b97a61c647583c70df62358e2ea1d535fde88/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/e3981341b75de65ad25ed51691466b66f8045b91/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/3dbfca58d1eb1528936443e19efbad359c46ca5e/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/58794f894a4950b77e38d5fc877852d6cc507d8c/
        i686 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/ccf6c0b5940ca42f21ef53f1ec4ddc9b68221b1a/
     aarch64 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/2f978c44ea951acb0b872b99305f6b375df500bc/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/3c166df9b1408362e6dcdd67b7f9a8d538aac22c/
    mips64el |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/defa47c07c8eae97108a2837e09795bf3021d10b/
      x86_64 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/facf345c6aa3f8494e4f0bc2ba29a701b0f4120a/
    mips64el |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/b6fbbdd994c1176bb2dd30299eaccc85e07ddb65/
        i686 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/8f500b935765c63b39bd6a4c0a1e366710c626e8/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/3872305f9728fd5410857e2d5c96d29abed00791/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/1311fda4cfd70c5a5c777388412f056ea889f2b8/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/06b7eada721483eb57adde147768a1f306b7d0d7/
        bfin |                   nftables-0.4 | NOK | http://autobuild.buildroot.net/results/a5d55afb78d0c59306058fa44e7648c89b2e7c00/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/94bab80bda3dc1f546a06ce5b45bcb519c7c2c08/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/27f1c2070d624a610b1fb6b43da5dac0044c65cf/
        bfin |                     php-5.5.20 | NOK | http://autobuild.buildroot.net/results/78dd1ac9c4c6e7bf4e31feef112982c5bf85d013/
    mips64el |               postgresql-9.3.5 | TIM | http://autobuild.buildroot.net/results/996b7b869e920270dc2e366bbff29cba3ff94bb5/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/70dab45ebfa7bec0ed039bfe3a0cbd98aea16cc0/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/ea0b25fe20e23f83ca7932e54629c0a97c4f74a0/
       nios2 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/bcc4971bdb7ec3c4fb039ff47c3cc0bcb72e6856/
      mipsel |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/648f26f6724ea7915946b0d12823df275d84f25b/
     powerpc |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/1b3a55a8959739a4083fa13d3de30a83d78cfce3/
microblazeel |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/bb47132b56d15d2a8953b813a7e8ebc5f29eed55/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/fa5e38246dddd661f1d674f3521d21297796bce3/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9db4e97997d9226f087ed1537bb167ff0817d48c/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0874a8adc153844afb8924297e2a076f51a496e4/
        i686 |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/4bffd05fbbf8d2e356e066360fd5c7b919410ed9/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/3517f85a4832e7878cc97e99e3e89c1f9bc2f8c9/
    mips64el |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/c3c6be45d0f764fb931a46dbf1509ccf2916ecbf/


-- 
http://autobuild.buildroot.net
