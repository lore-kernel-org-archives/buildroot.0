From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 03 Oct 2019 06:17:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-02
Message-ID: <20191003061740.D28758475F@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-02
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  1  |  0  | 18  |
  2019.05.x  | 25  |  2  |  0  | 27  |
  2019.08.x  | 18  |  1  |  1  | 20  |
    master   | 97  | 88  |  0  | 185 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      fastd-18 | 15
             subversion-1.9.12 | 14
                    brltty-6.0 | 10
                       unknown | 7 
                    bird-2.0.6 | 6 
                 uclibc-1.0.31 | 5 
                     znc-1.7.5 | 3 
          gstreamer1-mm-1.10.0 | 2 
           host-harfbuzz-2.5.3 | 2 
                 libdrm-2.4.99 | 2 
               libsigsegv-2.12 | 2 
                 mesa3d-19.2.0 | 2 
                   mimic-1.1.0 | 2 
                    strace-5.3 | 2 
                collectd-5.9.1 | 1 
       gst1-plugins-bad-1.16.0 | 1 
                     gzip-1.10 | 1 
                      icu-64-2 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libgdiplus-5.6 | 1 
                  libssh-0.9.0 | 1 
                   libva-2.5.0 | 1 
                    mpv-0.29.1 | 1 
                qt5base-5.12.4 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.3 | 1 
          xlib_libXfont2-2.0.4 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/47688cea54716a4da7244400bfe0c6d7db440bfe |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/832b2e0f80c7ff67d5f1847f0cf1e9b9908eb3fe |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/2bcc1e5c904bb6666c95fa709be1c03f63a3244a |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/f150e16346bcc1f294442d56d6691a40be416538 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/3a2924e0e89414233896d42f0c28f59e6a6a4b67 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/a41c237a51e3c8705809e0372d3075ba0a370993 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2f38258b4d01296b8649730641672aadbc66f160 |     
    i586     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1b3c09bc1aa9c6ae6caccdf019ad963f569a8f07 |     
    mips     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4ce3b0acd22348c4692548cec61d62ff30f8d155 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/def03e0b1c342f955d4f0c0673c365c1ce2eaa61 |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/346e672fa1349dcd3a288ce8febb697a47e8282f |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/048b9f7bb191c82962414aefaab732c09f3f19ed |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/628d73bd69b1f3ff4fb631b8d10fda43d80685c2 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b469c46ad14b3bb7b280d61e899baebc257d16fc |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/38ab11e725edeb9aaf93662761803940a41489c6 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8ecc3178262185a68921f5f79e49947aea87720f |     
  nds32le    |         collectd-5.9.1         | NOK | http://autobuild.buildroot.net/results/4e6f3e5fd0e64f166ae4f7db4832b37ae1fa99e0 |     
   mipsel    |            fastd-18            | NOK | http://autobuild.buildroot.net/results/2441dc361cbb150994269063440d2ec072bb15cb |     
   mipsel    |            fastd-18            | NOK | http://autobuild.buildroot.net/results/c860c9aa76c0d985ee5ea7ccbf46f6bfe417413e |     
 aarch64_be  |            fastd-18            | NOK | http://autobuild.buildroot.net/results/f27ba402e56a8838255719d76e14929425dda932 |     
  mips64el   |            fastd-18            | NOK | http://autobuild.buildroot.net/results/8a8269aae28fe876b79c99f536b226dc129c887f |     
   nios2     |            fastd-18            | NOK | http://autobuild.buildroot.net/results/5bcac3373fd04b705077df05ae8fc73655f0961d |     
    arm      |            fastd-18            | NOK | http://autobuild.buildroot.net/results/fa1342a8351473eddf31df53661570d28bdf4651 |     
    arc      |            fastd-18            | NOK | http://autobuild.buildroot.net/results/14883323945059bc1e2747ac08eb1bf1ad16ba4d |     
 powerpc64   |            fastd-18            | NOK | http://autobuild.buildroot.net/results/e72520ff0387d479028257f8b517732154051ff5 |     
    i686     |            fastd-18            | NOK | http://autobuild.buildroot.net/results/7797180704d95be2b42c06c464c599abc6c17283 |     
  riscv64    |            fastd-18            | NOK | http://autobuild.buildroot.net/results/9811df928689cfeba3216d486b5b608d41309607 |     
    arc      |            fastd-18            | NOK | http://autobuild.buildroot.net/results/125ff566154b892829120fb0cdff82e2580c37a2 |     
    i686     |            fastd-18            | NOK | http://autobuild.buildroot.net/results/965aa6b52f4291a543c135b6634c21585244e297 |     
  powerpc    |            fastd-18            | NOK | http://autobuild.buildroot.net/results/38bf0f1591b0201fef1728e732b1634487d8a562 |     
    arm      |            fastd-18            | NOK | http://autobuild.buildroot.net/results/86c139dd65700d99dedf180effeeb213f23bed10 |     
   mipsel    |            fastd-18            | NOK | http://autobuild.buildroot.net/results/1273b5000a16a70903d5ff32c8c223570c503f0b |     
    arm      |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/c8f8a43ca4114c3226a42199d77fbbfd13d207d0 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/0637269f02b13be58b97d659006bdb24896c4d8b |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ba2636ceaaadb21b5ec16ed3fbbf6c5cfc697078 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/00f8c2da84c069c960f6db3314a05e3230c1b658 | ORPH
   mipsel    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/122c8ae4b3779509561db1d34258a951cbaed974 | ORPH
    arm      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/b0ae05cd24910a882bd6c3b70efa9d6f54e5200c | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/24005bc54cbc742decee221fb09bca19ee70502c | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/057c4b2f91540c53da9a88cddedfb19e12d27ed1 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/2b21531747b53dec978bf8b54ead79aa660134cb |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/99d0545722c4ba685ff9647de0ab784a76d11dfb |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/b7952510427ecee4be9c196e736e4c36e003b8db |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/6eff8ce82ffa4e6632d2fe13c5e0eeaa6a6f2947 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/e53f3ce724fe82cd8a848bf17274875b4f19bfda |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/d4377d3094488cf4b084198f77519c3e06025d0c |     
  aarch64    |          libva-2.5.0           | NOK | http://autobuild.buildroot.net/results/cf9d74ffb61829ec85ce4e35c994b029cd32d1e9 |     
   nios2     |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/023080a45dd0025b8b7ce173c5718ccc06c5b2a4 |     
    arc      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/1e3df942d4b8c38af9df899ae07f5690f015b9fb |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/cac11d7d1656b336909093f5cd76f134d2990f48 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/afd0f4684f127536b76894eceaaabaf31cda8a46 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/74d600c9164a2aaa808d0d2bbab4d6492fa14682 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/e6acdfa589e717978d37e5cbd9f204a630366f5a |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/c1c9bbc726a543b7fad80851198cc9392a06ebe5 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/bddd03ee168010c9a2467dbf8d6ae0e39511ac27 |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/37734520ba96f3be05f46e8a2dd866b72caf21f1 |     
    i686     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/596db60c3c4afa3ec5500cbcd02677343fee1df1 |     
   sparc     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/015a2ab03fec0c335d6ed73316604f9bf32617c3 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/7be4f23a8d65566d8082ccd72329327b00d034de |     
    m68k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/fd952ba0a54d76395ea6e1153369edebfd345527 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/751032f7750dd1baeec6e7aa311b429626af62e0 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/193f9cfaaf4c56a979fc5eeede236d7ae7e89009 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ac2c0fccd69c89d00078132fe13b11f492ef2e46 |     
  nds32le    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/cda1cacea96b5d163e39870656b45175c8381bb0 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8a6b0f90db1e080e12cb8d3c1248ec13febb0e92 |     
 aarch64_be  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2e5ff02fd8f7e5c71d2c9e62e1bd69e279ce48a0 |     
    or1k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f2739011abffa935cd8561a24453e2a1fbb9e99b |     
    mips     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5c4d8414e2c61a77512649e4b350026ddd5459b8 |     
   sparc     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/09ca4703157df84b1433b8b59453810722b77e94 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/a106b269e05ac2b66edc68268b54d69bf820b27d |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/a3529c0c9a8470e73734cd7318e0fbb1c801294e |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/c70583ac64e1e1e6861ccdcb0b88c1831475d017 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/61f0774909e5823a4aad9ec4085dbd7aea7f6af1 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/90e43e367a0862813b126be8f9c772eae817bfa3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c456b0d0b2999fab451a0ce8d0f4ce9e8059e383 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/81e5de57f3a2b6fe321659db916a866dc0a93417 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/270ce3106411a4be3211d890c33fdd2326c33c36 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3053d6470da905218817a7d9b3945f07d70f8296 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8c2b8853bcfa073a5406f8a7381d515062401c96 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6402b3f383b2ab4c545ee3e681b91545722fdd9d |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/e6d0f7c15b6efe71838d6e2bc018ef153b5b2fad |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/648eea5b35cac978d523f8c4c1a4a389e6c474f5 |     
    arm      |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/ac66328a9f19b7cd2b3db2f339be17ed5fe7ac9a | ORPH
 aarch64_be  |      xlib_libXfont2-2.0.4      | NOK | http://autobuild.buildroot.net/results/5cba479a35622c2374ce6cb0e6c85c52d7a3d216 |     
  mips64el   |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/35c0b19e8b75d528a4b5ef9a08a896693a794ce8 |     
  aarch64    |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/55cf1b6c23a41ed12a55ca7e3f289024dc2dc8c2 |     
   x86_64    |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/e004c0467dcc7cfdcc4699d666ba7616fa77de01 |     
  sparc64    |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/991dd1d74f00f027a905d2ec3ad1a1b2b723f978 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           cups-filters-1.21.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |      cups-filters-1.21.3       | NOK | http://autobuild.buildroot.net/results/d06f908cbe80340312bdfe1b75cb577b68cd46d8 |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 
           uboot-tools-2019.01 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/96706ae139d7196e0895460a0c3fb377849805be |     
    arm      |      uboot-tools-2019.01       | NOK | http://autobuild.buildroot.net/results/f10968bb5930048e101de16de85cc2b73f508bf4 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 1 
                          llvm | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/e85a2c08b4081e03628d73fee74880e827916ef6 | ORPH
    arm      |              llvm              | TIM | http://autobuild.buildroot.net/results/d370d59ce9e14de8aed5858f2a8094d4bd693842 |     



-- 
http://autobuild.buildroot.net
