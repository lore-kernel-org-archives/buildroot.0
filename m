From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-22
Message-ID: <20141023063017.0B8391011FF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-22
===============================

        success : 187
       failures : 217
       timeouts : 0  
          TOTAL : 404

Classification of failures by reason
====================================

                beecrypt-4.2.1 | 50
                  avahi-0.6.31 | 31
    host-shared-mime-info-0.90 | 22
            ecryptfs-utils-104 | 14
        glib-networking-2.36.2 | 10
                libsoup-2.43.1 | 9 
                libsecret-0.15 | 8 
                pulseaudio-5.0 | 7 
       xkeyboard-config-2.10.1 | 7 
                  polkit-0.103 | 6 
   sound-theme-freedesktop-0.7 | 6 
           libmemcached-1.0.18 | 4 
                 rt-tests-0.83 | 3 
                  botan-1.10.8 | 3 
               alsa-lib-1.0.28 | 2 
          linux-headers-3.17.1 | 2 
                 libhid-0.2.16 | 2 
                    ruby-2.1.3 | 2 
                  libv4l-1.6.0 | 2 
                    ipset-6.23 | 2 
                  zeromq-4.0.4 | 2 
                   systemd-216 | 2 
freerdp-440916eae2e07463912... | 2 
              librtlsdr-v0.5.3 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               libglib2-2.40.0 | 1 
                minidlna-1.1.4 | 1 
                  thrift-0.9.1 | 1 
       liblog4c-localtime-v1.0 | 1 
                 schifra-0.0.1 | 1 
                 webkit-1.11.5 | 1 
                   perl-5.20.1 | 1 
                  autossh-1.4d | 1 
                 dmalloc-5.4.3 | 1 
                libcurl-7.38.0 | 1 
             subversion-1.7.18 | 1 
               qt5webkit-5.3.2 | 1 
               uclibc-0.9.33.2 | 1 
                xapp_xfs-1.1.4 | 1 
                  python-2.7.8 | 1 
     x264-20140930-2245-stable | 1 
               openswan-2.6.42 | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/3da4b691ce767d18a401b6a7c9bc8e9102989e28/
     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/fc1ea14f6f0fe794c4b8212b7b0f142ba8300ea8/
       nios2 |                   autossh-1.4d | NOK | http://autobuild.buildroot.net/results/51969c175fc955b9d11233c40f391d22da3b995d/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ab7cc1afc7e754439937b44e69a087feec3fb195/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/1dd2e4a79c3faec9ca49c5cd256f76bb58b0750f/
        mips |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/00e5594294eae94ff8dcea78942014ecf2b46c8c/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/eece136d95553c1dbe1c48212c23a1b316437c6e/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/4675abeb7c561b3c0998a8d5ce6ab04a19ccf49e/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ad16c3d1c75992a07ff12833f230f06bb347dacd/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ad3173bd759de57531559bacd4809c925b25f17c/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ca56b976e18864e029324cd44da053bd44175125/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/7ac0765ead4615e756b1eac9245d84564997b86e/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/3f90f662b04628c509d742591a6a6e1acaaf7efe/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d59679a25190b8a089f3ef302f996c24095f4f16/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/07c2396c60cffc7dc49830137cdd9e899e96f1b7/
     aarch64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d9c6d45f664b6ec79632c31712b61c769b10d19a/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/4513101d3e31358103950812c4f8dae1a49d6cbc/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/99a2f754b7f3609dd75c010d7a59243dd51d40c6/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/80b5e67f94e3bd727edd648d73fc32733410c50c/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/47614f0fa6e525c3c058c47a01207488682c3eb5/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e91b6a1e312ab5266ed8a6be6589ae65e85a99c3/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e5562db8b875f1ce9b20538c41d0e99afe32dcad/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/892fd4ea67af956a6c95f1da0bdf68170bf547ea/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/6ae5ba64f8953bb849f7e62571be4cfaa496c9d4/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/9349a9e9906daae517356783ff2ec6edb6efcfcc/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/2a8b7cb9bdc9d5bc1250aa855c93de37527b54fd/
        mips |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/af72767b081aa7507a212cde1d6f785e24bdcf08/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d356599e398f6c5037dd1c179a4510f91de3c1ea/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d00e5f424abf5055597ba2275ef6eebea7b7c095/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/0450cb74478598e1a2a89aadd7a3332c675c24d9/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/a8226e71bf69825a8e9ef27922140716b658b197/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/f065768a9b987ca63dcb3bbd53998ebcae681bbc/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/cf7e1a2e8c0704f954b008c1d24135f3bb4c61d4/
microblazeel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/78e3d2f66cf0fc9cec45972d6f206779f68e9d9b/
        sh4a |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/0d448e2086f849f51027a07cedce7cd662622fb4/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/07426013167312c5591f6108cf568394b958d103/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/5b8ae218e1f069a288dda981c89ad9cc6a4fd9b3/
     aarch64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/0ebc773333c8ae961471a608c589339664b7d784/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/660f035ce24a1f4bfb402122a620dcf102ffb153/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ecd8ae2c1b249471ad370ab14200affcd5bdfda8/
      mipsel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/1bc572744b77f9d90d947386d2427dbace690723/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/f4b9baec69c7882ba0d99fe4ea699c64150fa599/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/674684103f2aa9cb71c43784427def61f268d923/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/e952717f7b500521a001553190f6d3b964c31e04/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b2cac453f31fc24d76b19da486924502917dd599/
      mipsel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/703f9aa34e2d51382190e8b9daf958d06f0df681/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/61f944de81fc1b858034937d78bfecba2e9918e5/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/06dcda48e5baf87ce56cf9f62a8b9f768299d45c/
         sh4 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/aaf9f9116c2f37b4d74955d3d5d6419f72e8ad9e/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b9925c46fde67f186442d4f47455a2c3d39b5401/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/1ca98879143dd1e38b454258c8bd4dd9bec68f4f/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/cfd5d2c4dfad4fba84c723db0d1f9c18269100ed/
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9a7d501228fe5a407fdf637ec140c77f6ed25fee/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/103bb2f893bf2126d045261359e97b5b3e83f8c0/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/f81f1b697ddd818d8a2565336e4632dd45f6ed5a/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/44cb2834a386caf2912b52fa8d1ca6d5b3a34386/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/5f8fbc49744667f5492842f11117ccb47ac9de02/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/0814b808913f8e3a32478f7622595c6b23a5c368/
        i686 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/bb22d5a0caa614b96778ce8eb52072563e8aa2c5/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3a8efccf7e807d866aae71c31cb1c0ef17cbe45a/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d7190f92e7a7cb306f06088fa1eedd82fea8a107/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/253e5a0e2fb4554132e9e45a25ff7cb292ca551d/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/639a5bc24e3c5e965001e7042bfa16eddd7c2fd0/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/4ab6d255a8b9422dc0ad7e3108e766e0b12f4977/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/04a784ecec660c813a0369d3cbf6c2a41ced4915/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/7c64e1a06696b307762d9bf82ac9a62383e845b3/
     aarch64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/0d55bbc0b19bb601700f8fabe8d83ac589c7aea4/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/01966aebebb5c0e466ab31bc8a54b475c9d4e315/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6ab936b8035253386b15e4fe3733437f7dc28b4d/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/0bbdc4c4dc53a5927722e341ecbc5d776dffd108/
        mips |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/cb33307b9a4fc6c9788ba7e6a1e204d8817355ae/
      mipsel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/4b01dfdbdd2b26e178dab00753f266defe2118cd/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/5a6e4bee1d37b6ea4ab8049ca7feb605f0812a92/
        sh4a |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/8ac07fdd276bb3cc2925de67ea926e3dd4be3f7e/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9b8dacd6ee384eff1b939438d9e43d421d1a741f/
        i686 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/fb90424453cd4d32cba478aaaeaffd4969d1e14c/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/10865d29dcc7bad62554edc6c38767d8ed732dbc/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/46539ddfd8859e742794ccdd6d7dda33e66a96a6/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/46a33bc6b8c3a5219691165b82947511a326f11a/
     aarch64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ff934d7fc5e5b72c2059c2ae8fd283f99fea22c1/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/1a6b753bddccc95e0273c6d8d74eebebd6c49c59/
        i686 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/533975f486b7508bc81f1ce2953748005bd37ae8/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/7531eeb9360377f7baaf965b51ec43f2750096e1/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9645192727e395cf62f70c37dac4cf33645a800a/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/8ade8873c1d955fc6a5be79b8c2d5dee10648637/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/0e1bce4c6c7d059fd27a24e38c82df1ab1024827/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/f3a8c056afcf7e9ded135f4d715f1f5763e21ee6/
         arc |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/744a83020637c79ef20337000ba25fd158626e9d/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/171175c1c902af47524cdfd52b1515723b130a1f/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/872ade45b4ac9533b21979c29e1dabdaf3653be9/
        sh4a |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/fec474e95ba14cba37bc715c96a0b651535490ff/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/7af232d0b802511b8d66c3aefc3b0aeaec1ca8d1/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/57748c8d95a7fac0c3975891b6ae8cec33ad554a/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/7c9c8c461b54246b53d14f5c40afc41e01bc533a/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/7d5d3aa52a8c83409fb8a55208bc2c1e4a5811ba/
        mips |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/f06c9c00e0270e958cb25edb2bee86ee06a43832/
     aarch64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/95a7c166990a106dd8f23cace18905f2c995bf43/
        i686 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/0dff038cc1c08d0982739244bc8af1d964c54a73/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/d8edbb2dac3cf635ce01c35edecc8c2bf056c7f8/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/725551b998ef24722714d6defc41df7b2694aeda/
        mips |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/408a893133eaaadca46a17fc91c528554c3f3bc5/
        sh4a |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/8eae64c471a7f8496d7da0c35b3a0dc683b70804/
     powerpc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/0d5b7202ac17f082aca068d6a0cd417fe1b13326/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/c23a8ae4894d9c2c1239c1ca4f34f81bf859a5de/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/d84616f66f12b05cbd69daee87f07bc15bb0e789/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/e1a23e1ef1e1920813188be08a6dc70438d29037/
      xtensa |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/ff6047f92431cb65e13e5a3a004dc0d0f78c2305/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/5aaa89dedfd6f6349ae03a6ae72f41ef9045d2b2/
        sh4a |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/6a4ff170691a11b7a2b4d1799b7da71501bf53c2/
    mips64el |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/98dca48209877d217c14f52f2e657e3d9c6b7aea/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/8e6937f01aebdd55d09059b03b6973a6b90c8a16/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/1b9fc445dc0f4bc464911e745c68c293c4b2bdb1/
microblazeel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/7a1382f65fd0f2385c1cd26f3b6747a9455b3130/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/53364939a9b7c943922546d69b4ac5cd433b2a31/
        sh4a |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/4b8e1bbaac9a0b57176850bcd1075b353b22f8c6/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/aa73a86e3233f3ee46d97092298de5b35b4f5671/
    mips64el |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/1d5e94ae4422db4b76be5a61b58c0131db4361c2/
microblazeel |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/6507cba252c89e0471376dae5583bfd0df7cb3cd/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/60999fb5a7ea77c63ee930e80e70a81029d00d6a/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/8ef9c524f41906462de9077924a5747341a9e404/
      mipsel |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/4546e437e7f16bcc91ccdbb3c38a3d89660baa96/
         sh4 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/ac614aa8ae15ae8ccfebbafd6e55a60314d639ca/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/0d14a201c5d080187ba93b33a9e6c72c8a0407a3/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/45aa7bb108dcdfc6436bd5576666f4cf4b1ffca0/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/25f8488ea4e33cf56a3276caea9fb66f1b4269b5/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/7ceb700f693f9eb99230a7e4a8f9a53fb21553b8/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/bd9b76d41e5d121f5a27b796088225876451fbcf/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/b6376ea7004069e4e5bee8628b680241868ec76e/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/89a3a4d37cde6cefdb1a7e8fe3164fdbb632417a/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/44f6a81ef46850bc50ec1c2d4f473607a55a1da6/
    mips64el |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/9694925fb63c2bc95d65b6f6b53ff10351d85fc7/
    mips64el |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/c7ca1887efade2713fc84e0653b23063d2eb958a/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/9d29752785bafede36981bacfe90094fccda73d3/
      mipsel |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/b0d597a667447b9b795410ee12c61902a1b54d24/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/527d3fbf7164d60a7bf36c68de305bdf98032bc8/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/a678ec38352c470c3ef9351c93ba7cfe1f2454da/
         arm |                     ipset-6.23 | NOK | http://autobuild.buildroot.net/results/2ae233d33b05fac10e9b6676a6ca179c75e4c1d9/
    mips64el |                     ipset-6.23 | NOK | http://autobuild.buildroot.net/results/4f55c2415281c6204500efe28fe9e24c8ef73863/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/e45d4592705c0393b9ee3c17956c928e25eb7df9/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/2341b5e9ca06c4aa89174a3e82e99ea9b8560f03/
        bfin |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/da5fac87cb3063be11241b037a9ca691eeb9b1f0/
      x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/122d9bfe4a7b49f892f12a1b2a3f8ccaf747539a/
        bfin |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/2cb6a4b8a1646a91379b4fdca8a221f1ce82b79f/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/4561f5895f6c0c6320880f701069c44a381924f2/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/11aa8608259c452274e0fff32ec17a2b7d279bda/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/6a472182a3fd575167c6c301f6566de6be61e55b/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/980aa746e97bdd4e73ab42fd3615dfb11a1056b8/
         arm |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/fdd63a537295fcf1a90a644e1fbb6ef87149399b/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/e8566e9bf6b7a860daf3b610dc548bf23915dc22/
      x86_64 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/743cc670b7a3cbc1c404b0367d80ea2a72557992/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/5e080071b40aa881aa85e25022155b1e3912ba43/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/c809fe7c70bbc12de2048db3ae09808b56dabad7/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/35a98b6b8ef468ffaceba5121e94434b291cb4af/
     aarch64 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/de509f40160d14336e69f77829b6d581ff6f80f7/
microblazeel |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/31aeece3e4b1850f5426893427f30fe3350a74c7/
      xtensa |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/9e5df6fcc14213ca4a8c78a3acf5f8fa356df7e2/
     powerpc |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/4618d4e3f524cd3139f8c28cc9f28222e8f3dd42/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/5f1c8b1eced42ef5ca48a3ac14f0637be50bcb71/
microblazeel |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/be40cb4a00c216b372a42eede8189ba6cca9eb57/
      x86_64 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/468b623147e38e46da816c16c8227665cf6f73fc/
      x86_64 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/46720c5081ec2eadacccc6a790de509dcba7c760/
     powerpc |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/a1effbfd192afce78f9d86a3553fbfb22ffc6e5e/
      mipsel |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/1838268ebe1271ddbbf30c92209feb74456dcbad/
        sh4a |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/e0640585856a9232c7833d699f17e07f412e842b/
     powerpc |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/5b88e1b6290367b3c363f45e42c4f6568ba51b24/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/cccef521fdc403d001d9d5a1b09f83b6151d93b9/
         arm |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/901ed0092ee0411ba77a6f1f46d161621569c7f7/
         arm |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/a4e8837a56b143e8428240cd32c276ecc7a07dca/
microblazeel |           linux-headers-3.17.1 | NOK | http://autobuild.buildroot.net/results/c90143f37c53424c140539e03ecd9ad0d87b5813/
       nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/0c8cd3068516bc55abee146c10c2dec1366168fc/
         arm |                openswan-2.6.42 | NOK | http://autobuild.buildroot.net/results/8f5df154a637d906b18f4f7b71ef0b8c19db4e63/
         arm |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/5599f085c2f85435d2fc0b06a6a5c9a772e27bfb/
        sh4a |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/b2db474c5e24fba36fc0eca9006b43f393b4b5cf/
         arm |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/93f28f6054c89bb0083720acbe220363b4a07068/
     powerpc |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/ad48ca01664541171d72263c994db8af8c5212bc/
      x86_64 |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/8ef9cd36089d54f97cc20dc6291566cbdc7a6fe6/
     powerpc |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/152a1f6ae9f34aaa3bdbb8b8422853fae59be855/
        i686 |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/00b1acda4ce836702ffe1b3ad6e267e29d7028bf/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/537191f726f85969d3bdd301853d3fd1b07eaefa/
        mips |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/368fd128f543603639267d5d47da70333552faf1/
        i686 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/5f9f424c3ebaa6edf7619f768765e96becb8437f/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/21cfee1ecd869f8babef80645d5facbf865ce10b/
    mips64el |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/5c3e0865154002bd4aa3a089dab78be649eb2519/
        i686 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/b54c5cdbf0f6ad9f7b0548d3b29e1e0e28fa959d/
    mips64el |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/12e7e9c17b386410b7a15fe05b3f80b651825297/
      mipsel |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/1477b228d77faf975da3f2f69839018389c958cb/
      x86_64 |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/b7fa707bb201d88b9123de373670ec4ae6a33d08/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/9bf9c495734fef355930490cf284e079264bf35c/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/ee0a5e4487aa61fa2e612493ef3c622779784e58/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/954459472e120fd9a01ebe4c80b81b642c5ae87d/
        bfin |                     ruby-2.1.3 | NOK | http://autobuild.buildroot.net/results/0a854274b520d4daca3911a64777a447b5756a52/
        bfin |                     ruby-2.1.3 | NOK | http://autobuild.buildroot.net/results/a9f2fcb66a282105ff9d6866877e1d854ef25f16/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/0f0eff591a50f0da8ecbbadf75240f3ab66d5b82/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/e2c0bccb854ea7736ed81ce9071dfb8700148da9/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/40030b5b210fe0cca547136a34e9f2a8ddd27bc1/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/c66c3ba8f7b912d584f72f71283ebe9b3b6ec628/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/f4ce3665b8953b52433627c2e743f7c3c4d9423e/
        i486 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/eabda08e4b1343aaef039198d8695ca5e12e1650/
        sh4a |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/4eecb13a1479f3d175ef1fece9569e647066a20f/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/1382cbabb8ffbbd8bac5bd93129579d2d599f58b/
         arm |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/2d78a0e41912799ff9bdb70299bf6ee9d79f8c64/
         arm |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/5418de20e8c28f9969402def719e73f9f1da059b/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/8f859ba672156bb093114adf41563c2af0503f2c/
         arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/7a36fddf61d9cba60aa7c659385c132b37eb1efe/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/48c7e3d15fb2f690dd73a606be37aa767aa0df05/
        bfin |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/d9c46ca92bc349b42673a60f1b66d6df99d26545/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/cd569f11f80167d019677fa5946efdc2313a24cd/
         arm |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/5222ac26e27dfd6d203f3cf5a5273e1a79d68ae1/
     powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/c08e2411ccaa923ab765f662972d0086689266c5/
     powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/878e910759c128158405749f70216f69a3d79a10/
         arm |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/48bf6d7c6ab39361719b4ae041bf65b5527fec8a/
    mips64el |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/858f25477aa3b75819d6f8a9c4a83e8d13459cd1/
     powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/0a9e434bc9cc41e09616d75aa3c7d62401298ac3/
        bfin |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/3cb73aec1c01486256f8ebd104d7cd3b8684551d/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/d29914afebcf42d4cf1acfae8de8b94c83a5485e/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/bc58bb6cca3d32f9b60a5cd42870fa87ceeb462c/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/d6c99e291ef635c2b112c771e21de0f67a18ca00/


-- 
http://autobuild.buildroot.net
