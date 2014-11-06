From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Nov 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-05
Message-ID: <20141106073016.844071015E2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-05
===============================

        success : 243
       failures : 68 
       timeouts : 2  
          TOTAL : 313

Classification of failures by reason
====================================

                 schifra-0.0.1 | 11
        host-gdk-pixbuf-2.30.8 | 8 
                   libcap-2.24 | 3 
                    urg-0.8.18 | 3 
           libmemcached-1.0.18 | 2 
                libcurl-7.38.0 | 2 
            mesa3d-demos-8.2.0 | 2 
                   lame-3.99.5 | 2 
          shairport-sync-2.1.8 | 2 
                 clamav-0.98.4 | 2 
             lttng-tools-2.5.1 | 2 
              libarchive-3.1.2 | 2 
              sqlcipher-v3.2.0 | 1 
                nodejs-0.10.33 | 1 
                 rt-tests-0.83 | 1 
               libsigsegv-2.10 | 1 
               iptables-1.4.21 | 1 
                      bmon-3.5 | 1 
                 webkit-1.11.5 | 1 
                  thrift-0.9.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
                gptfdisk-0.8.6 | 1 
                 libssh2-1.4.3 | 1 
              uemacs-4.0.15-lt | 1 
                  tstools-1_11 | 1 
                  nftables-0.3 | 1 
               expedite-1.7.10 | 1 
               alsa-lib-1.0.28 | 1 
libshairplay-64d59e3087f829... | 1 
           xapp_bdftopcf-1.0.4 | 1 
make: *** wait: No child pr... | 1 
             alsa-utils-1.0.28 | 1 
                libupnpp-0.8.5 | 1 
                   duma-2.5.15 | 1 
                  libv4l-1.6.0 | 1 
             e2fsprogs-1.42.12 | 1 
             subversion-1.7.18 | 1 
                    ruby-2.1.4 | 1 
                      qt-4.8.6 | 1 
                    fltk-1.3.2 | 1 
                     tcl-8.6.2 | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/bb9ff6550e671ccb30b3956fe266c38e5d4aa68b/
        i686 |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/707016a2490fc97b98d17e2b6a9c6423a56bb4a9/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/2f5e592be083029ab30b8e21eb1fcbcf5dc66c58/
     powerpc |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/2e92cf7044c694f3357018bdb4009f81c92f614c/
      xtensa |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/7adcb24d8fa6213f35d7027f8efb25c90999d838/
         arm |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/6ba848cf3ad30384ecf1e296eba13a71775c357b/
     powerpc |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/cbe80464d1c7e2322f5a72e90505fa09075381a4/
      x86_64 |                expedite-1.7.10 | NOK | http://autobuild.buildroot.net/results/580f9e5ab8ed61a830f8f93bddd329218b84d4cf/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/ed1959ae6211872816802dd9e21292661faeb516/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/99d7b51244aa05f1cf8a2e786de3f23d12fd39fd/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/e09545e0181c59f357a7728745aa91f3e9b3991a/
         arc |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/a34e243d1d7c21d75126e128c1ea6ca78d776338/
         arm |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/310a847f35b5a90fbb7d4955cea748020c981531/
        i686 |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/84be739819cee81f4e5a66448709c21b56d7e6b4/
     powerpc |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/d5f156af2b901bf557d60d2bbc7f0c5aa2d28548/
         arm |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/0b00b9b2964a7ab84996d04dd2d0fb05c4e1e34c/
         arm |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/d99519130072158d79e570eada0352e3f77fc9eb/
        mips |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/dde10a5cac08ce287df859d84e622e73007be6ad/
         arm |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/01ea86deb12d4be5e5fe504a942ca7e3be744c55/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/b56915c653e03a500b1d57b18776ba2af3848b33/
         arm |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/3f9d4c9cd901991b7b2d870ebd446c9d8010e604/
        bfin |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/4162e2c4d2eddc99f417fe3de6f5931a87baf942/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/55c8006b09f0df97a5d576692f1a730e267800ef/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/b54aaca30be39fd82e96434b0038f66bf8279602/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a3a8b592c44ae14729b666f1109999aca088bad9/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/20bacca83dcee10e1fa4dcc4a8967d3ea47477fc/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b5b180445fb02611e889db14b5b5ffffec2c0feb/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/a7eca44a7bb544b816f12de82b9e225f4b0b0b2e/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/8e3e71c46a07a7102f74ffae71f5566887ab00f3/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/323cb43c6d241b60fb443c457a5ad98623dce6b8/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d431824c0f79d3fed357b2149ad6a6c2d3ec49e8/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/1bc6d5f6d2c5b892764e1cb64b848cc2a89278cd/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/204bd3e0374c4ec1da6d2ae1e67b3ecc2f13335e/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/4194971d5bc20f976e8062ca6b380edd62ff51ed/
         arm |                 libupnpp-0.8.5 | NOK | http://autobuild.buildroot.net/results/a0b40b7b711becd71a0d46130118f4a1d5de1c44/
        i686 |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/ebbaa70e1a277162ba53c7bde8335ee998486703/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/6c4daf5d6b14ff5fe5aa9d9ab52e6158d2b1a2a1/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/99a23681f46d0335cc612e6ea4617f7649f295cc/
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/800d7f800ef470dc47913a6fcbfdddf0036daf5f/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/f3db50d0c5c74fecafd6b4bdd89f97e8e566d820/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/ac0f22bf87e2b48bd2191de88999404d1c55de9b/
        bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/3c0c5de290f361af9ea2ee6a15e25ee7ff3a9b43/
      x86_64 |                 nodejs-0.10.33 | NOK | http://autobuild.buildroot.net/results/e5f87dc635e0e6a6d1cc234529a433e12d810097/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/8fa9300ebb2d77ccd7a6c191b49e28e806308d1a/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/ba3d1ed9197fe1872e92b69dd7f723d775413beb/
     powerpc |                     ruby-2.1.4 | NOK | http://autobuild.buildroot.net/results/5fbd99932ad8b86bd5ffeb49cd866b1e4eaea7db/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/fdb26be7274ee14387e17dfe86a6a548507b6122/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/524d7583373d07406da65fad6d9e9c3f13331b9c/
      mipsel |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/bad4ddb1d5e8723e9e2011f4fd55757d543ccb30/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/9715cbec3020577de6f9875d09ad431c71c10a61/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/a363dccfbef9ded9bfa12e356c14dce9b81d241e/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/7e4c35d8d9c8696a573e3b51cc83607e30f3ff03/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/ef7731439068615bdeaa9461e0ba0e3442b6c6dd/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/21af22e2298ef73b4bfb0a025f1516ea7347ce2b/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/424eedf87f9e893a031a97c976841ffef135b039/
         sh4 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/9e81bb0d0e8cf40b37d492935c8a6a0b7a4a0e48/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/8b37811a26f9200d33dd999164a616437e59882f/
      x86_64 |           shairport-sync-2.1.8 | NOK | http://autobuild.buildroot.net/results/1c5f917f5cb2a4bb127f83507cb270c8cebdf5d8/
         arm |           shairport-sync-2.1.8 | NOK | http://autobuild.buildroot.net/results/cc98204f5ee080b8cc7aad030a94efdacd3e9c15/
        bfin |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/ac678436054adceddf0dfa28f320a2ae2917ab4d/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/fc69a19c66462585449f7c4dad174d45a84e4947/
         arc |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/e1fcaf6d2d295e6f80065fa5444be0c5d6152ed7/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/3432be8beff4fd6b4fbd35fdf60541b9ad80261b/
    mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/39ac4bab3e8c6b54b2faab89a36e5988c6988fe2/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/b39d3997466951df078a5f47c5a75200b07dca4c/
      xtensa |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/c890830ddad2d11349dd974573af9045a35a0dfd/
     powerpc |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/5fa74292c9e5900474441c742995296725032438/
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/00998272153f1acaa3641be7c936c75c2ce72836/
        mips |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/5beea967b02df202bca1d42afd6fa8c2c13383d5/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/5beb9a09fe3cc55a311c3c7c0bc015bc082fba5c/


-- 
http://autobuild.buildroot.net
