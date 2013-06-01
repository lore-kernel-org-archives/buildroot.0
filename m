From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Jun 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-31
Message-ID: <20130601063004.E0C5652C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-31
===============================

        success : 97 
       failures : 39 
       timeouts : 0  
          TOTAL : 136

Classification of failures by reason
====================================

                 qt5base-5.0.2 | 4 
                 pixman-0.28.2 | 4 
               sconeserver-211 | 3 
                  zeromq-3.2.3 | 2 
                   icu-4.8.1.1 | 2 
               libglib2-2.30.3 | 2 
                  ne10-88c18f0 | 2 
                    acl-2.2.51 | 1 
             util-linux-2.22.2 | 1 
         host-gutenprint-5.2.9 | 1 
                  boost-1.53.0 | 1 
               tinyhttpd-0.1.0 | 1 
                directfb-1.6.3 | 1 
                  iozone-3_414 | 1 
                 binutils-2.21 | 1 
                libtirpc-0.2.2 | 1 
                 libiconv-1.14 | 1 
           imagemagick-6.7.8-8 | 1 
                    crda-1.1.3 | 1 
                    fbgrab-1.0 | 1 
can-utils-836d3cc0122ce31a1... | 1 
     xlib_libpthread-stubs-0.3 | 1 
media-ctl-ac40b79f002a2315f... | 1 
              matchbox-lib-1.9 | 1 
                cegui06-0.6.2b | 1 
                elfutils-0.155 | 1 
                gptfdisk-0.8.6 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/185be421d1f68fc1c766cee095c7500a052abb8c/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/c68549feb8512bbbe9f475fc8101601df977cac8/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/4a2cb625bedfb1d0a95f154c45dc25fcc8cda4f5/
microblaze | can-utils-836d3cc0122ce31a1... | NOK | http://autobuild.buildroot.net/results/454915fe8828cd77622c22b51f6483a4d347d65e/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/f8ffb8d48fd5b2fdee0480fa352909b2b1c61f84/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/02bea0656fdd2738dcb9f9e061f8a31404637587/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/3cf067fff26103f4c07f0130b54ad54180946b49/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/8e176af83390604e033a929695f2211c900b80e4/
       arc |                     fbgrab-1.0 | NOK | http://autobuild.buildroot.net/results/8cb6e9adb15138c1635a9a9f6ed31d1a09d51b85/
      bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/b3a27c5b4057dbd0cd3a41b30a5057127bb4facb/
   powerpc |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/390a5cdc719ba6d977a2cb75c770c5cb3aad9e0e/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/a2884d2a2d69ff48055c7ad64e4486a2858eccaa/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/e140f4ff00c722e71154f0b66e9b7c5cd9170862/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/e7741158213107081f41a4d4971a8c1152976872/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/71040eefb4b88aa25138dd8e2819a854d5e587cb/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/1b666517bb5cabebd2df4c64cfe62d603377ead8/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/471090bb4e5e7ff8fe65dd1e253711088fc76a16/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/d4fce8996082e8cfdb9ded5c7026a9087bc3fd2f/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/cfb8e2f73627278e03ff0cce6da1c91146a07136/
   powerpc |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/4db84eccef5cc5e8f0d6e0d767c318cbcc1c7ad9/
      sh4a | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/79bf4cd95f98fc6c39f8d8576ada3a0d0d0b70b8/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/c2a6b3a680fe04e2266ce26ac9fb1a266fe67682/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/45305cc428b3465d8d9b2e0fe39572ed33b832f7/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/eac089a71c59dfe47509106018b974918de24430/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/11686faf404ebb547ae4868fb38677e72a4d2453/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/2b118510797c41d2937b52d3f732f8d3c35eeb3d/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/341892d3edf28f47bf4a5e0966beaee4e0dddbab/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/df8324ba73b993131c09e5d1f7b9c8b16e8179c9/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/f7ea92fd48cea0d05af3e17db51512550518fac4/
    x86_64 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/6a1598dec107bc864ca1237f167b2e2c5439b379/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/a0f8cfd1565bcb48526119f870d254471336ffec/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/58ba15ab75496a399e85e69496c711580a237a23/
      i686 |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/4b8a05d3d40ec1b6c6eae115a2ac62543634ae7d/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/74789665868aada828bc37c6819d08a364add307/
       arm |                tinyhttpd-0.1.0 | NOK | http://autobuild.buildroot.net/results/2e61a80fcbddd62c76e0406c34ab44d14a4b5c79/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/cfbc20f65acd68e49d06cb68cde4e800f7418db1/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/1d90e5abba2a6c8172aee34f2d5b6b7336a033e8/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/c1de2031bf61c6f04728dc7c855d95b173a1ca49/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/61ef166913ac853d668d8cd9d80b9c056732f5e7/


-- 
http://autobuild.buildroot.net
