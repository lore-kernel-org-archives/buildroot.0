From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Feb 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-01
Message-ID: <20140202073011.1A91E100EB8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-01
===============================

        success : 79 
       failures : 71 
       timeouts : 3  
          TOTAL : 153

Classification of failures by reason
====================================

                      axel-2.4 | 12
                 libhid-0.2.16 | 11
              pcsc-lite-1.8.10 | 6 
                  ltrace-0.7.3 | 5 
               alsa-lib-1.0.26 | 3 
                   minicom-2.7 | 3 
                       unknown | 3 
                      icu-51.2 | 3 
                     vlc-2.1.2 | 2 
            libvncserver-0.9.9 | 2 
          sane-backends-1.0.22 | 2 
                libnftnl-1.0.0 | 2 
ne10-88c18f02199947b2c8b577... | 1 
             util-linux-2.23.2 | 1 
mmc-utils-11f2ceabc4ad3f0dd... | 1 
                  mongoose-3.7 | 1 
                keyutils-1.5.5 | 1 
gpsd-b4c32aa40cff1b4e1041d5... | 1 
                 cairo-1.12.10 | 1 
                    mpd-0.18.7 | 1 
         host-elf2flt-20130904 | 1 
                  libv4l-0.8.9 | 1 
                  gnupg-1.4.16 | 1 
                  dhcpdump-1.8 | 1 
           libcec-libcec-2.1.1 | 1 
                  avahi-0.6.31 | 1 
czmq-b5730c5f8290a611fd3b92... | 1 
                 libevas-1.7.7 | 1 
           heirloom-mailx-12.5 | 1 
               libsigsegv-2.10 | 1 
                     nut-2.6.5 | 1 
                coreutils-8.21 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/f813714b3f8be1b83c6e9769793fd19fbb35a421/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/294764a294c2c0ec0f4ddbd1b6599846ae427a2f/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/80224680e876036cd174700d3fcbc7e3b154ed40/
       arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/dc607c35471ef6dda04e06ad05ae7794615af578/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/57b30b679623c72d2f7880bc255ca8eec26525d5/
microblaze |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/187f53c7aed25c5fbb143984639ed57cef372d5c/
      i686 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/de0286432ba764684118afbbe80606662bc0ea71/
       sh4 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/39839987735ff9bebf7376502bb383770b70c981/
      bfin |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/19cdda91764e8f3a7d810621b96d95bd39047024/
  mips64el |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/360154ed8d0a5d8a39a65097978531f7c71186bb/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/abf5cce0cdae13deec4eaec96ee5ab8299ebe7c0/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/e71a9a283f6061b76a91f19c0c89a33bec56b351/
   aarch64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/57312727aa9375a07709dd6938e090b5fffcb785/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/f13c914034ea5e40702db4c978932c65fdddadeb/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/94719d7259e3b79717d1d712ee38471227720ae5/
     avr32 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/eb779bd94d809b9bed9c5022adcaece01ab84754/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/1a6af7c1744cdbf54baed40334cd83aa75e5ec55/
   aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/268b690f718f74da8f95f29d2da112e102ff9d1b/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/ddf976c9d61110dd8c961844a1c05a50d47429ea/
   powerpc |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/b7743c9b1c5edd613682e65b962f47ed9b7daaac/
       arm |                   gnupg-1.4.16 | NOK | http://autobuild.buildroot.net/results/9ad86794522b0de52ac57c41b4126a82523e61c2/
     avr32 | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/b4a5a0ea10854f2e10951aaef25e427f56d21830/
     nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/81dfcb8e009ea2de749083f2ab7d307463f85cd5/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/7ff8c29b7054446de1b95fac955d6e5964a5a848/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/045cac627809b7a6ae13f6230919d8f8aceea9b1/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/4d54db645a11c46699baa616a207773488caba16/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/86249bbe5fc901732d2d1f4b83bed5257edb4b32/
    mipsel |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/aa4b1a3c414e8b8d1c534ae8aecf550bb3fc9e5c/
      bfin |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/125644e0cfc43e58d54fdec86579008b13335fbe/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/575e7c5d5f2543420348abff6051a639836f38e4/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/2a4c8013357701693ec4fbc740db87ea2b6be9bf/
   powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/fe022622364a1bb83e3adf9e0fbdd26311abd065/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/a870f63b91ab927f626e3b6df8ac481d837cf1aa/
   powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/f5ab5d4e88b5478bc4d2b3ddceee9aac6f76d4f9/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/6e083001e4e966264df6fe6f0c761b321178b9a8/
    x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/40d54c33ae63c28597c8c8ccbe5347c9ade31a71/
   powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/ba756af1bf94bc3951f10a2e957dd9ff5d0a91e8/
   powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/d085f890f236ad3ae36145654e004be5e8b08f2a/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/df654b879ed148521ef23805911daab68f56bac5/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/8e8af41236f58bc158c7500b43020d99cd7d76df/
      i686 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/7f13b853bca6f144566b47b70471e2aa4eaaa70d/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/2475d96727e0c16e2fd7551d02054ade9c20335b/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/d53e2a58698e5cdcb0e77ba06b562e5b9f3882a7/
    xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a08fecc4f355b94a6ebe7de1104c38979adf82a2/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/57c1bc4a6e7ee0062cf823334a885d9163285d61/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/3e0b18e31091ace660a9e7a0502c4e42ce5d1d38/
       arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/89ad29a1996c7848dbc287470d155197281d2363/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/5d7b2b5a014383021590f38a5a1879ac4b98b664/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/c3b8bffef379c65367d7fa86faf1c5f97e37161c/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/a3850a1e3b76beed396da35e6a81cf50db9df4a5/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/f9daf7de3fb052b5f553af2ad47cbbce46cf6bd1/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/4eef71682ac12667c9918afc2c0f76934d5fe3c3/
    xtensa |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/11e44e1912bfd87552d4db02efc4b5ab773183e9/
       arm |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/fac07ffc192a502de26ad8150f935e1934776636/
     avr32 |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/e9fbc01ee25fa4a51de02903ae83fdfb4bc2ecc7/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/65e7ad9cf487f58033013beabc00fd2a5ac7be29/
       arc |                   mongoose-3.7 | NOK | http://autobuild.buildroot.net/results/9d4fbcb91cf76e01c833d70c401c0828ad37631a/
    x86_64 |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/dbd2192c1955642fa41f228d35ca8c2c98e35d18/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/4c5bed955a7c7eca5c1ce4ae548c8025fec6349c/
   powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/66cecf670a2bb64ca705567e687eff0bfa765610/
       arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/12ab0a0ec02ee6bb70bbbb4d13de26ddffd0bb2d/
    x86_64 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/5fb1eca5eb37ca283fc14e9e14a7003507ac4787/
    mipsel |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/ec7b82c662d9810caf18d498e8ab1959013e816a/
       arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/ef94cf985ca78a5aad0e967ba58e4b7f5d854c3f/
    x86_64 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/fcf86c4433b927b9da6b670f08b2f16c25893755/
      i686 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/2fa5018ecf32cefee94951273c688c2dae40b8ac/
       arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/5db56bfdcc968edfc34ff17f71fab90137fcf832/
      mips |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/dbbfe06bb8d51151e3f983c1cfff853679b580f1/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/9cfa1b9200fb6f7b7f9e887e99bb801bf31d15a3/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/8a980fef76ff2f723fc29f33e91c8f06a66f7b7a/
      mips |                        unknown | TIM | http://autobuild.buildroot.net/results/679e0a3990c90d5b5e9323c42ebf5f787cc7fc44/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/a6b0ec0d96d5277d63a73ec81265acd4b76cf1fd/
   powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/2f13811ffd6e4b77533f4077e906823739af1459/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/ced4f4b1000a95177c187925718d454cba1f7e15/


-- 
http://autobuild.buildroot.net
