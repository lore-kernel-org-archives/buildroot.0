From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jul 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-20
Message-ID: <20130721063007.0DAF652C0FD@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-20
===============================

        success : 97 
       failures : 48 
       timeouts : 0  
          TOTAL : 145

Classification of failures by reason
====================================

                 libffi-3.0.13 | 6 
               binutils-2.21.1 | 4 
                  zeromq-3.2.3 | 3 
make: *** [/home/test/test/... | 3 
                  boost-1.53.0 | 2 
                      udev-182 | 2 
make: *** [/home/test/test/... | 2 
               qt5webkit-5.0.2 | 1 
                     m4-1.4.16 | 1 
                      gpsd-3.9 | 1 
                  aespipe-2.4c | 1 
               ruby-1.9.3-p429 | 1 
                 ffmpeg-0.8.12 | 1 
                     apr-1.4.6 | 1 
          enlightenment-0.17.3 | 1 
                libiscsi-1.6.0 | 1 
     xlib_libpthread-stubs-0.3 | 1 
              fontconfig-2.6.0 | 1 
                   neon-0.29.6 | 1 
               libgtk2-2.24.18 | 1 
make: *** [/home/test/test/... | 1 
                 libnspr-4.9.6 | 1 
                   bzip2-1.0.6 | 1 
                 fdk-aac-0.1.1 | 1 
               libglib2-2.36.3 | 1 
                beecrypt-4.2.1 | 1 
             gdk-pixbuf-2.28.1 | 1 
          host-protobuf-c-0.15 | 1 
                 libpfm4-4.3.0 | 1 
                 binutils-2.21 | 1 
                 qt5base-5.0.2 | 1 
                sdl_ttf-2.0.11 | 1 
                   ncftp-3.2.5 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/b101146d0c0c68fa7fa674d1a7ad39c4ab62b848/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/11a48bf24cd96961492c2d5ed2152edcee2e5e6e/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ba46f24c6b370b15102b51e8573b46bd6c8adf4e/
      sh4a |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/dbb7353f6a606085465f5fff0ca7e19edfe71349/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/e13e10b717624046862e278a6f07320a53870294/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/03506ab0305ed0dbeb7bb491449e5fe70c9761c2/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/95e926ecebb1bbebee605e1a960fec602cea072e/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/c44adc0bfb52df183ca03301e66de05a1e63275d/
       arm |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/3f9ffc79f050360ea1e723a5e020e798caf883e9/
       arm |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/89c1164a76de293cf300d5f565a7587b72511e25/
       arm |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/c9d9d30513e9994e6f798ee46524dca84e29bb3d/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/05b1e6dd951b11360cb91796ca47334cb48f0ab6/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/040a1f289f853ea8f321948e534ffa6e46da0be4/
       arm |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/7923bf9303c9d6261417660abdafe182af13dc6b/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/d86bb417ed5476984386ec0c4a9aa7dd09ba990f/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/78dec25a42afe54592436288bcfccf3a7f0d7ba5/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/3016934c259e9792711ed82f4ab9694d6494c8d5/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/61b9918a443c5337cb042a2c5dfd5d2d9c699c5e/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d826cd232144604f6cfd786baa9d6aefddcb2d65/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/95dfc262acc41c29b1460414c9ca8aa979f27299/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/7e9e3b0357aa063053e4b3c05b9077cf9b081bf6/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/cc7576af9ab3fe04128f6088d7fff43748329241/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6d231f1a9747ef69f3e5b9379981581c0968d88d/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/06e0ca54abf4d5e67367e47e1f2f633222cf47e6/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/258aeaa052ad07e3892f108641ce5d4c6eeafa33/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/1e510cd1a6970c799f117f6bc4e1159b0d77363c/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/2b59ad23ba65b431c5e313382f54a28f4bc1e2c2/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/8b592f40f7c1b5e7fd7567bceede16239b670074/
microblaze |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/54d831d0b66dd0ae1e1fc58af69cee1b2d158ff7/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/24fb9d277ac58ed1441a8ee477a7ed97409f5a7d/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/b5c4d915a2f5e17df587237c74334a30c42ba945/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/ed93af4048077a81d0f9caef8a8b731622412b75/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c589ea21c2c9af1aad8aad676e9b34f1013ea5d3/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/97bf336231b5c5467862b91f00bc10b0ac98773f/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/194a39c8ad8ee21c35d970f1452761ca050e9b68/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/78af9ede8dcbc10150db36d015808bc4863b565c/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/bc87770110817ad85a2a06565dd43b67b089024a/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/fa8e34bdc4ea79c45525e8c4121bbdaacb507503/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/1c264950e3dd7b6f9df0633b3b0350fc793be63e/
      sh4a |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/35e85d3449476218f21ad4033e30de4193c5dde4/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/7b8ae35b24daa936bff73a6706812bdea5e08d75/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/b01d417d13b9b0c3a3e6a99558cadef66722770c/
     avr32 |                       udev-182 | NOK | http://autobuild.buildroot.net/results/5051497871adc00d1ddd75985b9a5e406a114153/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/4131a4b3cba1e6728280d69ddf45682d23cf9356/
      i686 |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/dbb84b78c76734b4dabe1011568be2c2d69c9638/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/261d111a31acc2b3c6ce3db949517c82bae3f1ae/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/2d00db1e57157762c3ee54279e5303b53769e243/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/27e8ea48e3cae74e08ae41716343183dd6f1d3dd/


-- 
http://autobuild.buildroot.net
