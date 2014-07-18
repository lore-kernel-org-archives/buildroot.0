From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-17
Message-ID: <20140718063015.041A91026A1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-17
===============================

        success : 72 
       failures : 72 
       timeouts : 1  
          TOTAL : 145

Classification of failures by reason
====================================

               libconfuse-V2_7 | 12
               host-parted-3.1 | 12
                    parted-3.1 | 11
          host-libconfuse-V2_7 | 10
        gst1-plugins-bad-1.2.4 | 5 
                     popt-1.16 | 3 
            host-python3-3.4.1 | 3 
                coreutils-8.22 | 3 
               iprutils-2.3.15 | 1 
                  thrift-0.9.1 | 1 
             host-mysql-5.1.73 | 1 
make: *** wait: No child pr... | 1 
             util-linux-2.24.2 | 1 
              lbreakout2-2.6.4 | 1 
                  python-2.7.8 | 1 
               libglib2-2.40.0 | 1 
               netsnmp-5.7.2.1 | 1 
      perl-io-socket-ssl-1.997 | 1 
                      qt-4.8.6 | 1 
             lttng-tools-2.4.1 | 1 
                  cppcms-1.0.4 | 1 
rtmpdump-79459a2b43f41ac44a... | 1 

Detail of failures
===================

       sh4 |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/bbf78b905b858b777b1dbcbc3a4f2a17af38aba7/
      sh4a |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/7f0b41582fd5febe0b939c5169fbfc9a8a941d86/
    x86_64 |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/43de2c1e80bcd59f10cfe8e7615116588929673e/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/79283573c6996f09085303de1406a8acc7bd3ae0/
    mipsel |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/9e57bf70d1a6f3a95f7b4b20e5285fed97d0e040/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/dfb171e808147815ba5977b9387265ac1664cc7b/
  mips64el |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/0be61aa8c828a8ccd839468f42d452e27a856aed/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/4fea251da63e54c06a913ad5573ba3637e530a95/
microblazeel |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/ac89056b838d757635a6ff21d17a568345a0a876/
       arm |           host-libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/2c755ca872792429afdf4b53a3f4a663d76f3c72/
    mipsel |           host-libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/de1708f0753ca3a81c7208da305d08802ab454da/
       sh4 |           host-libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/e500ee0a9cb597f5ba1ccc22c0cf5d549adbb341/
microblazeel |           host-libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/8bb264ec48e70767fa7c71d7fc21c1e2f47e2f0d/
    x86_64 |           host-libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/10c7309b34aa5ee0d74ad1da14c783187463fde3/
       arm |           host-libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/087e860173069f58fa9ceb2460d7455d31b2dff8/
   powerpc |           host-libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/076a66bc797939f18863ef509349d78d55d034b7/
   powerpc |           host-libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/309c12fdc978c4f53d0ef8967cbddb4203c808db/
       arm |           host-libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/2bb94cf7ac0d30b25c2756a5f7041fb53e0a86a9/
  mips64el |           host-libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/c053e3090a94d7606426a17d1414b21c4ae63a8f/
   powerpc |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/ffe8229f869a67e84c1eacec0055cce8b1906441/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/202bf723362b9713b65330ab3a420c27ca0b40fe/
    mipsel |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/04ebb6bbe28700475be2072efadf15750b920c20/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/06cd3e70ffea0e85ef0764587acfbb3da00cf800/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/27f573e8e3a1d95148aff9b485a838dd1dd673c1/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/cb750b9b4f61be88c607bc7ce672b4e65a3429d4/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/42d1c21f3b625471a37189caac656fc2cd6abd48/
    x86_64 |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/cd5dfab013930f0b7187a9da6b27a195fafd4b35/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/7df742c1c1b492bf57e85d87d50f4a41c4303d53/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/232c761f6d1007daec65e00dff0249d753d8dd7c/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/7125cc07288caca49b7615f7c815fbea0fe34ebe/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/b11423f3411a2ec5ea521b87224cdf3d0e04c462/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/0ea681dcb8464edcea45de3549ce55dfadf125ac/
    x86_64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/9459d5dcfe81992c68593ef33d09521bddc4dee1/
   powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/1ebcd450eec47dcf7b83997a4262b6581c67a6d6/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/e62634147f71297052f2c009c7a2d1993a7c7979/
       arm |                iprutils-2.3.15 | NOK | http://autobuild.buildroot.net/results/c0215213cf663c00b6cedff6b4ba45e851a9a63c/
      bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/0dac7e4da7ab5653a424e9f0ca5931eff3729193/
       arc |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/5e13616087f89f00c5429a92fb51b2cbd57a430e/
    mipsel |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/f6089c90d4f0ba579725ac834d8ac43b839bbc3b/
   aarch64 |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/9307a2c6c9f0f1a535e768e88dc395f688fd7522/
       arm |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/f1f3fdcdaaa90e38a382e5712fccef90e5f08992/
   powerpc |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/567fe8680428cb23c271788a5d4c89f5da87daf6/
  mips64el |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/7fb0787310cdb44771135d3227d5b12a5b080005/
  mips64el |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/63f6f6204058932b02f79eaaa44eb4555c5bbb1f/
   powerpc |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/c6ca0a9b06c8f9e7dd6ea8403500350ef58e92a1/
       arm |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/e2a7cb047fa87b6e474b2127b59218c25b476f5c/
    mipsel |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/1fd8d124f0d795fb468a80fd73f1fc39228034a2/
      sh4a |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/3bc9eac6998f11c76d7c5e3e1c2f841d502a38cb/
       arm |                libconfuse-V2_7 | NOK | http://autobuild.buildroot.net/results/1cab1aab564bbd5bf49bda3237c18113c8447028/
    xtensa |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/55463639620fbb21f34f70e4cdc54a94b4018fd5/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/f6fae6c71c04b301f942fc00d5444be4d714d434/
       arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/ce8f571d0d87c2ca62a2087dae040dfbfa91af61/
      bfin |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/7769afe0da09e3f4f96d9a0f4c0febb0c72cc34f/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/8394274b11788672eec9b12486393df60a868f8b/
  mips64el |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/81b106db32370257d180e533817bc8b781bfe952/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/c6c81e18f28c9c050bd372cd30f7a8a3b667c60a/
    mipsel |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/b40e89b978cb68b21e183e3aeb15def96dd960ed/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/46e37b868f2a9abf1268d70d8f01a10211d15738/
      sh4a |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/b8eff2c5f2805ee9f3a6a52678403ab73befbb7a/
    x86_64 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/128ffc4c1c7e7997674153d19f7205fb290d3a10/
    mipsel |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/ed112b33e1796bb3c602dd83844e6a0c6d2b61bf/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/c3c3b0fd739dce0a597bcf7e43445782fa082957/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/742af8e6a98154581e9d6c6573f9c9c815789548/
      mips |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/17e306dfc4370579b0788e28350f80c535be22e1/
   powerpc |       perl-io-socket-ssl-1.997 | NOK | http://autobuild.buildroot.net/results/5f15763397244d6f89918a8eebc6952a2895bad0/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/08c10fa07f2cff181d8955690c84dd003af4422a/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/8aaee526ef86af3acb32fe3a9b1d801298c5ad45/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/c36680be7505edb3b7c8955a8ee6797a5ce3309c/
      i686 |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/ccb9f31fc97ded1805104858846fe5db6401b6c1/
  mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/1f1221f27ef600937b65e7e658c0d3d09d6fcc08/
      bfin | rtmpdump-79459a2b43f41ac44a... | NOK | http://autobuild.buildroot.net/results/4f2e20cfb7ba6350adff3364a035b1c9101c5c5c/
      bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/18efcf61c48d9123cd6d75719d600404ad9ff40b/
     nios2 |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/f9eeeb056bd99e724dbd59ac0d965fd1232b9541/


-- 
http://autobuild.buildroot.net
