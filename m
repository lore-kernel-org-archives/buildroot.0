From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jul 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-03
Message-ID: <20130704063005.AD97652C109@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-03
===============================

        success : 94 
       failures : 69 
       timeouts : 1  
          TOTAL : 164

Classification of failures by reason
====================================

                classpath-0.98 | 15
               xfsprogs-3.1.11 | 7 
             lttng-tools-2.2.0 | 4 
               libglib2-2.36.1 | 3 
                 libffi-3.0.13 | 3 
                 ffmpeg-0.8.12 | 2 
               ruby-1.9.3-p429 | 2 
     xlib_libpthread-stubs-0.3 | 2 
               qt5webkit-5.0.2 | 2 
               aircrack-ng-1.1 | 2 
                openssl-1.0.1e | 2 
                libtirpc-0.2.2 | 1 
                    fbgrab-1.0 | 1 
                 qt5base-5.0.2 | 1 
                    flac-1.2.1 | 1 
                  libxcb-1.8.1 | 1 
                  imlib2-1.4.5 | 1 
                  libedit-2.11 | 1 
               libsigsegv-2.10 | 1 
                     m4-1.4.16 | 1 
                  connman-1.12 | 1 
              fontconfig-2.6.0 | 1 
        ltp-testsuite-20130109 | 1 
checking for arm-buildroot-... | 1 
                  zeromq-3.2.3 | 1 
                  ne10-88c18f0 | 1 
                  dhcpcd-5.6.7 | 1 
          host-protobuf-c-0.15 | 1 
         matchbox-keyboard-0.1 | 1 
                directfb-1.6.3 | 1 
                 cairo-1.12.10 | 1 
                      qt-4.8.4 | 1 
               libglib2-2.36.3 | 1 
               bind-9.6-ESV-R8 | 1 
             gdk-pixbuf-2.28.1 | 1 
                      icu-51.2 | 1 
media-ctl-ac40b79f002a2315f... | 1 

Detail of failures
===================

       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/6d9fdc051e7830294d330eb9cc16a495f62b7bf7/
      i686 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/0a6fc3b5c9ac13448fe29501735cd7b0bc42a800/
  mips64el |                bind-9.6-ESV-R8 | NOK | http://autobuild.buildroot.net/results/7a17519d43eada640560605e521146e156c0bca5/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/24a240a2783d795cc6e30c7d96786ad038200991/
       arm | checking for arm-buildroot-... | TIM | http://autobuild.buildroot.net/results/4a5d2a251b9a3ce6bc8dc730e2d4f410ce5d25de/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/d9d9a6098f409f7296e78cf088dbe8f8024aeb1f/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/c65933ad8527d05c09b504a92d77e8b23fddf940/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/52f9cd6249a25e7a9e90b64a88cf782bb246d134/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/5e5a48866f926d276d1713334ef53843ee874ced/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/4073381eb5b9e1bd15b39912a139a5ffd7b64627/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/d5df7a56b261b89318b0cc63486daacda9b8137c/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/85a36dfb234c33dd493f1dee1370fa57ef8082c1/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/733b80159dfcecc276fbf43a6c55ed154e418782/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/0e9ed7ee3b05923ebeea6bfb0c09aeef1171d7dd/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/afed8bbd1d3ec758d4ad6bd7272932e126a29d2d/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b117eded58a1b626be89b28ab2a8ba1c711fec29/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/3a11323381e425354e784920cfa9f35ac7adb1d8/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/4c12992a28591bb621583302daed0ae52dac4e97/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/11b36abf206c7ba9646b21d78f9f3746a98caff7/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/f5fc88a98673338d3dcd5f9ca180d3c265581a86/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/f889ce5d65be64f9242e024284ef54e60f0f1a9d/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/3aa1f58623bfa93e8790519ecb781fb0c10bce24/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/05eb3aff917ec20ba9bfb9d504017f7587439f98/
       arm |                     fbgrab-1.0 | NOK | http://autobuild.buildroot.net/results/ae398273994d272562bea8f43bfa39ffef3380a3/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/6bc2cd2976860674b2c0393ea87c1b3d5bcc6501/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/e030e44933bd25628c3bcd10559b40475e591af0/
  mips64el |                     flac-1.2.1 | NOK | http://autobuild.buildroot.net/results/f8844e5308344a373ed7caa2bcd86f553dc750ab/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/2f1a2cbf337bbbe10ca4cce776f0d37c373252a0/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/e258c2294132705639934a57e39c0fa0147ed3e2/
      sh4a |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/d9841cfc53cc0c7f4b18fd4269dada2449a4590e/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/57dedbc35783bf77e2619de85faec05880e32af9/
      bfin |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/dfe8aad28329355ba80684fdd3146538b22aa28b/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/517a4ed8aba85ef49505632680e5e0921505b0c1/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/fc8f5dcaa88a8122d4371c0ccc85e103d72a6515/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/9c1f24e17b0d83edb03d83c027dd22ab46589579/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/175ddc364361e90ea719af322676a581fa1b7237/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/bc05eee28e2d42cd014d0a3a39816dc5699f65ae/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/ff63ebb8b4e61ee747f43aa33f7dc72e037b5ebc/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/2c2df05b12be1d4519458795baf835902c94712c/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e9fc40239d13a2fcdc842eced2c39994ac2ca498/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b305a29f3602b95a78bdeaea8702d8e44ea9f393/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/8326f476f56e3a42648cff577acb9c0370aa9db5/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/bc2231f6dbca6fb06ae730d28aaa7b247ec34937/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/68a15487a5a92ad222e84a95451465635933c1c5/
   powerpc |              lttng-tools-2.2.0 | NOK | http://autobuild.buildroot.net/results/f3bd21760ab37fcafe8e4a7b137f675e148bafbf/
    x86_64 |              lttng-tools-2.2.0 | NOK | http://autobuild.buildroot.net/results/63f2b057203f9cc5373b08e015e6864a5126007f/
   powerpc |              lttng-tools-2.2.0 | NOK | http://autobuild.buildroot.net/results/30a86662ab2ddba423075dd82b056d23c72b591c/
       arm |              lttng-tools-2.2.0 | NOK | http://autobuild.buildroot.net/results/76a91bd139a93f63e17732c9a933664e8e5d3fe1/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/c375f0fa5295c3e7be33bb175fc73dd7327d9256/
   powerpc |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/bdc6d275459335aea91c4a2bb08511003d41235b/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/4619f7d2127195b140dcfeeb7573a0807b5320fe/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/bcd5abf8e828ea137d9506cb80296ae17772eab1/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/879674bae76d2194275ef4dbb20241b5b33fceba/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/6eb30b022bdc2b032d4e6de87151a43f28c0debd/
   aarch64 |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/160f7a67316f0f7fb8f3557b01c3052e98e934c5/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/f6f6d605963644aeb9ba0838ed1d77ba7da55aae/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/a53d206583c3f38c26db881e668462c5caa2ae8c/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/ac4057649f5a49c3b33f88f2f3223c32ea857ea4/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/632fc818fccb3c8034ac6e7a0265e29864ae97a0/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/c1123143c6cfe0233bb4a91f8f6a83bcdd274b94/
   powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/843f65e0481136b7f6f37a3350d0ab114074e29e/
   powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/0b8fb57174d96fecd4bc3db31812e9f6f1292899/
   powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/9538267996e40e1677f0cb4815fe72023a78c987/
   powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/3796373fc4bf5051a211da884fdda66305d3524c/
   powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/153caca94ac70e3f67fd28f688615b999f8761d8/
       arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/72b336892ad37ac74e9d59fffdc34d84dbc8c00a/
   powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/1a77f49ae13ef53f1c9ea6518ba57adde6c83ac8/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/c8fa42a2cd2d622d78c027abb581250a40bfac97/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/e6a2e3b0349d19c5eb7833679ba0d882deacd84f/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/455ba097564cc42e543d5bcf17d078bcbebf09e7/


-- 
http://autobuild.buildroot.net
