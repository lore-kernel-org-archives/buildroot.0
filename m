From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Jul 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-22
Message-ID: <20130723063005.EA2C152C101@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-22
===============================

        success : 96 
       failures : 48 
       timeouts : 0  
          TOTAL : 144

Classification of failures by reason
====================================

                 libffi-3.0.13 | 6 
                 dropwatch-1.4 | 5 
             gdk-pixbuf-2.28.1 | 2 
                  zeromq-3.2.3 | 2 
               binutils-2.21.1 | 2 
                 binutils-2.21 | 2 
     xlib_libpthread-stubs-0.3 | 2 
              python-pyro-3.14 | 2 
                 netsnmp-5.7.2 | 1 
make: *** [/home/test/test/... | 1 
                openssl-1.0.1e | 1 
               w_scan-20130331 | 1 
                 fdk-aac-0.1.1 | 1 
                   cups-1.3.11 | 1 
               qt5webkit-5.0.2 | 1 
               libglib2-2.36.3 | 1 
                 cairo-1.12.10 | 1 
          enlightenment-0.17.3 | 1 
                 libnspr-4.9.6 | 1 
                  poco-1.4.6p1 | 1 
               libsigsegv-2.10 | 1 
                    php-5.3.27 | 1 
               ruby-1.9.3-p429 | 1 
                      pv-1.4.6 | 1 
                  prboom-2.5.0 | 1 
                 libiconv-1.14 | 1 
                directfb-1.6.3 | 1 
make: *** [/home/test/test/... | 1 
                      gpsd-3.9 | 1 
              e2fsprogs-1.42.8 | 1 
                    acl-2.2.52 | 1 
                libtirpc-0.2.2 | 1 
              vim-699f8d8f096d | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/2a8ae443f9015318a96dbdc6c7ebc9d3ae6a520f/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/3b1d8fd2ef205a8cb3ef87b1abfa0ed4f77f427d/
   aarch64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/3d4598a16281a8cbb909f8785fc9a0280a112fd0/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/fb6cd6f1ae2d2e1c7f37edc58f18c59a370aab1b/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/fd095cfadf5e4368f24910f1a7b379ba0ea8dfee/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/02961b86543596cd13750303ffff63e83407293b/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/d20bfcb92b2f357470dce100fb7117fdadd07e81/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/fbcb96d6a65090b4ec72159df8749e4521421d36/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/a4135eac61991204fe7b0e349ad207a899822e24/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/6dfff67f635446a17834dd15b771e4fb339fe612/
      i686 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/c24d8dd711696b1c17caa83979af1e10a3668957/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0868ffa25aba71b94bbbdfe8891572300c557ad2/
   powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/ede74afbf15f15ef8b46d46f5adf80ffd946be09/
     avr32 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/385c33a3bf2ca98190eb94994f49a28224370bc0/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/78337b9d686a4c6a9cdfc478db08e1d0dbe257e9/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/163aa0d50b3ba69ad25762631d085812e21ac10c/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/7c6886772e99d3e15e4aba8648f0ac23f6cf972f/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/d913b8b11c8836dbb873fd0139cd6e94fb3bb8b1/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/76dd00dbd0d673e4bd25b752c2dfd06cd39f78ba/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/26ecddd5ed564b65f11f0e1d0c00679fc1e10509/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/8efdc06193951cc6b2fe78efad59a2df902524ea/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/e8a930e75763090a8f16279e39dd841e07696226/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/51c6298b97d0f5852444ffeb498febdb12f1c384/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f56cd897d888f1e8abffe57cbe583052c2973994/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/64e3f3fee6050311f1227f4d2e4ef863c4220c5e/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/56d9ad7dd3b999591ff91da4825096426214f59c/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/f27a36be6f94b940f448582d930f7cd084b490af/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/a83d5ab77db99ca4d28b7d67bb87b203f6234771/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/590f9fd0b3d1147959a967d44ad384728ef11492/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/8d0d1361d591bd5650ce41a881f89a8139bd6d64/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/8a60bb21ba4148e93650d2cbb9fcc43054233d70/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/db01c031c620d9c5de43278570be6f1ab60ee287/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/c2835ebb17fb63602d11e09fb87e4bd6e5f8ee8c/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/2f7ddc73739cb2a04b2f28df702b494dbc179899/
   aarch64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/40f7fe17b79f9656fc2cc1dbe7fde8643ea43474/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/d2b2bf32922b31a873359173bb077acb0b8a32e1/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/e6e3a5fcb285c4bfc5423f4c8eccb9c79aa475f8/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/f428d1bd3438cd6d1559b2c78befe0552f7f174a/
       arm |               python-pyro-3.14 | NOK | http://autobuild.buildroot.net/results/a5d2b9b79c171e5a549a07c8ed6138b0f12d7ac7/
   powerpc |               python-pyro-3.14 | NOK | http://autobuild.buildroot.net/results/995d2d322848bb407e40019857e05cf5a2177afc/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/5ab765584e4504708a3d4a23d7b8e8349be2a3cb/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/7d605eb1e3376e14e7f2cf8ddbcaa809605ce617/
       arm |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/bf1c18bd630d06dfdf5d8e694eafe9650d0e4d17/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/4b8050ff312ff2fbe173a9fe05782add87d5cb90/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/b8a7abce054c1faced01ad1bde8762d74e676ed6/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/a3271f66913c480b1f6d7124772d4582d504f8ef/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/8a62ce81f6d64fb017dbbdd84e88deb88f2cdc94/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/d8e50001b4b3d4469b571a15059cd943a1880353/


-- 
http://autobuild.buildroot.net
