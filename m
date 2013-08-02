From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  2 Aug 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-01
Message-ID: <20130802063007.9322552C1E6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-01
===============================

        success : 71 
       failures : 78 
       timeouts : 1  
          TOTAL : 150

Classification of failures by reason
====================================

                libgpgme-1.4.2 | 12
make: *** [/home/peko/scrat... | 8 
              strongswan-5.0.4 | 6 
                  ltrace-0.7.2 | 5 
               libglib2-2.36.3 | 4 
                 dropwatch-1.4 | 3 
                 libffi-3.0.13 | 3 
       sunxi-cedarx-74923e55fc | 2 
                   mplayer-1.1 | 2 
               qt5webkit-5.0.2 | 2 
                 libnspr-4.9.6 | 2 
               libgtk2-2.24.18 | 2 
                  prboom-2.5.0 | 2 
                libtirpc-0.2.2 | 2 
                 cdrkit-1.1.11 | 1 
           libcec-libcec-2.1.1 | 1 
             libgles-undefined | 1 
               boa-0.94.14rc21 | 1 
           argp-standalone-1.3 | 1 
                openssl-1.0.1e | 1 
                    acl-2.2.52 | 1 
                  imlib2-1.4.5 | 1 
                 libfuse-2.9.2 | 1 
                  iozone-3_414 | 1 
                   cups-1.3.11 | 1 
              e2fsprogs-1.42.8 | 1 
               libsigsegv-2.10 | 1 
                 ffmpeg-0.8.12 | 1 
             gdk-pixbuf-2.28.1 | 1 
Compiling xercesc/dom/impl/... | 1 
                lua-ev-458165b | 1 
                     pcre-8.33 | 1 
              vim-699f8d8f096d | 1 
               binutils-2.21.1 | 1 
           imagemagick-6.8.6-2 | 1 
                   dbus-1.4.26 | 1 
                   gob2-2.0.18 | 1 
        host-util-linux-2.22.2 | 1 

Detail of failures
===================

    x86_64 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/df4cafde6ee84c8bdbc406d106871b7b99e52020/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/79fdb68924b43eefddc2033208133ffd5eaa3778/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/9568ef0df943fe39b88186e1421ce01391964266/
       arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/24dbbe3bf47ee201fcf7f981685d166cd336e873/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/542f2ba8b8e639f1893126bccdf4019baf3e8ed7/
    x86_64 | Compiling xercesc/dom/impl/... | TIM | http://autobuild.buildroot.net/results/bd9c8a36c77551f31664aac8fc61a5b8203a6ea8/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/86be624074fde246bc6fd60725a517ffad2bb1d1/
     avr32 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/bde2ad371298e69766a0feb5c2909d2bb1b248e3/
    x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0dff29808e8fd3c0e0e8b246e21d4c8ca73a021f/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/61c78401c8ce658dccad95ae55c2b7025687d599/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/1c7eb252cdfcbf0b373fa33a31e3ff9a0cf9c449/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/b0cbf4e144c2cacdc3eb09f7728e69f293601112/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/d1b9dac270a2615508599af4c4423fa7530e6f1b/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/c1c897e91391e8567649f4caaf6f82f7d61ca8f8/
    mipsel |                    gob2-2.0.18 | NOK | http://autobuild.buildroot.net/results/effd8f2ff18d077f4a039c09a4ffd65a1d63ac4c/
       arm |         host-util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/a4a840b1a8ed55953d8d09d140f1cad618e07a68/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/805e2ca841817d4bec7b3c4c69ed289e3f6c728b/
  mips64el |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/ba2a5b5f428d4b0ff308c6b83def65d6ea49e399/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/cc5b610dd3e6b298ee9d6d3e5feb461a1521eb3d/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/f3a6fde9af87cf0ec70bedefdc23a5b1e9c4c668/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/73b1d9c1230ba1aa7b2ef1dcf31e68fbebfa361e/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/7cbd28bee03b96c050d222ea38e4f904ea1e7b31/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/9775ea3faa57fe244877f7910a9450a83d45adf5/
microblaze |                  libfuse-2.9.2 | NOK | http://autobuild.buildroot.net/results/ceb412cfac865f99d04acba30d58c8d1d7032561/
       arm |              libgles-undefined | NOK | http://autobuild.buildroot.net/results/99a113d61da8febe15a27c0c05c69e77cc654ef3/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/44c0f0726c502adb412c0882b7834c980a46de07/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/71165271f2b7af4d5fac8dff11fc32c8b28de08e/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c4f075c0d7aaaf7254f132dba83efe854d5d89de/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ce6b82377cf728cb2e2ec65839cbd7dd76352406/
   powerpc |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/8ebfb29e511dd948ca4ef95cabf89e7ee73940b1/
       arm |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/bf73287415853c06d21ebd0c46691fd9dbe71f1c/
    mipsel |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/2005f8053f7f8f4566e26986dc0ee88811cdbccd/
      i686 |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/5478a9d22cf1f235d8769dd9dff3519d29c55ee8/
   powerpc |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/f8d950003f85e39cb4bc7ed3525aa7dce77a4ea5/
    x86_64 |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/975d0321e61764b1c83153232c5a47b67b215a7f/
       arm |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/2d15f29e9f57ef5fd833c333d83ca52367a8396e/
       arm |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/d7a8e74a5107b19f29d72fc8ff0449b46b737a51/
      i686 |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/ea06f317014c4f2a60e805b93403f1696e3708df/
   powerpc |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/9522586c77216a54e281c4018a65715400b78c85/
       sh4 |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/fdc167820d43f5167a91b9edd443478ddce43e66/
      i686 |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/0b513c9ef0f620606f233ec228eec1d1886175fe/
    x86_64 |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/ee5162e6d312c99ffdbd4780eea2885585b642d5/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/5238a13898e28034c9a5cbac166a7997b27508e3/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/95f04194963a0587f1844c72fc8aadfc74e82be4/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/89ea5fbc16c941a4f3c4351db61fb6e517def52f/
     avr32 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/e8b94999b824efebb05c30a90e924dec3f28c593/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/a7b4254add94673389440fe3d8b6a15abc49922e/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/4846a1ce6b733d6528dd5bacd8531826d683d809/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/daad3c06bba82dd6fa0f516dbdd4fa6be9332c21/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/61770417f9b906ea3c41ae10602b34d9ca057029/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/fc84fb67e89c48f533dfe69e407dcc26ca9ff601/
       arm |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/cc0646d4d2f32413fb84d48102994ba1c325e265/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/814e1dafaf45dce71a8943c0b53a529e419ebe2c/
    x86_64 |                 lua-ev-458165b | NOK | http://autobuild.buildroot.net/results/0409d81696cb014a0cfdaa9708a3ba28ce2ea437/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/dffccece14053846e112b891b673095b7a114d0a/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/8dbe379a09e37f73307d11a6d36c4d5754c1bda5/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/892ab018f8339b564318c753645fcf8b3ef3dc97/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/16537dd478773ddcac175ff6db8afe74570fa3e1/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/1ad9006aefc81163bdb2e71b94ac19c92acbf28f/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/bc08e20b06e252211cc6f6480a3b961786b63639/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/2a126139742cc31bcda433ab774002e660d10841/
   powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/e33b714815af27e130ba4a04914be8c4e240f86e/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/445ef1a31c84c483872116c4e25dc96c84abe2fa/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/2d3012baa8d4d19651d4f3e6f2d115835ace54d0/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/3c3ba5293f3af2ced42f45f8653d39eb124efc82/
      bfin |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/34aa40e8971525358204b2dd9908aaf926e11d43/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/a21e12aa1e331716ca93cdadb5c8a8c187928d7b/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/d5745333dcc86e60ffc1eb5f116c707790d8250b/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/67150f7cb5e9262a55f11442879405267940d157/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/568dac4e8e7ca5bdd2ef9dae62ac82a70c1d67f6/
   powerpc |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/fb21df612a843c7e906f15da022cab35c2609552/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/ebb7a3da811ebb653f3b416638da20eeb59dd594/
      i686 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/2eabef738b75fd764969dc689c17fc4290b67dc4/
   powerpc |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/19326c9a14d7c65a6ac08a6c59f13fe27ab27f75/
   powerpc |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/cfe4dd34835db942219fac8d4b3ed6b764818a8a/
      i686 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/caff717ebfdbd50738d5e17969cd2dac349747d4/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/acb60bac4a581e1076a2a56e2386ef33c8beb6ec/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/75254112c69454115e6803d15b6448f9158e592d/
      i686 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/5f860457feb1cfe349c272e8a844869d0be4c55c/


-- 
http://autobuild.buildroot.net
