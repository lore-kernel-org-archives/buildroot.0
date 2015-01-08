From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  8 Jan 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-07
Message-ID: <20150108073016.C6B1C100D51@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-07
===============================

        success : 197
       failures : 34 
       timeouts : 7  
          TOTAL : 238

Classification of failures by reason
====================================

                 host-xz-5.2.0 | 25
                    ruby-2.1.5 | 2 
           libmemcached-1.0.18 | 1 
             lttng-tools-2.5.2 | 1 
           heirloom-mailx-12.5 | 1 
                 webkit-1.11.5 | 1 
Resolving xorg.freedesktop.... | 1 
               lightning-2.0.5 | 1 
                  squid-3.4.10 | 1 
                    fltk-1.3.2 | 1 
                  thrift-0.9.2 | 1 
             libselinux-2.1.13 | 1 
                wavpack-4.70.0 | 1 
               ding-libs-0_4_0 | 1 
           qt5multimedia-5.3.2 | 1 
                directfb-1.6.3 | 1 

Detail of failures
===================

        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/97bd6af9237adbe61c22a67b1b28dff8ee13a40c/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/c10cc0dea2b6a219a3809e15e73b545dc375f2d4/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9f4d7b1aeb89b54b14d209ca699b9e8089b2f1b4/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/0ce992dd017c8dda0c6e3d36331a121e51c4e0ed/
      xtensa |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/974b7078b44635734854f8eae976abf497f0a94a/
         sh4 |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/229b688d4d6b055465754d8f35e6d72a037b05b7/
        sh4a |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/ea1eb329e0fd0ccd83bbba3158814a3ee527373d/
      x86_64 |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/c8ef8b430346ebe3a16cbcbbe97819f775eaacec/
     powerpc |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/a026bd3fdab2bdd247ad04c350dac35ae7c5a55c/
        bfin |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/79ecba46f353546ba60ae86dd3898b4d86c056a0/
    mips64el |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/f412395bd5c3528b1df585df2903a3706a0301ae/
    mips64el |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/bb72d860841a4e9728feb613592eaa3ae6d12cdd/
     powerpc |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/ec63edb9389944a025d7de05cf9fb483298527fc/
         arc |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/402662e18fa958fbdf44a8a4b239c086ca0bdf94/
         arm |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/b8f81804cdab53d676fc129d78b9bd18d5a81890/
     powerpc |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/765bd47c2a65c5632057eff62ce5586af22b938d/
      mipsel |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/c91a11894e37a01a08321c4f8fcb54b1bbe410c6/
        i686 |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/41d6283a11aec38a5a42419720ec97ca734f5392/
         arm |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/bf2499a451438144f4e831339c542626a886f740/
    mips64el |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/e978a6babd0396d63669d8ac49ab1175894b5f3d/
        i686 |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/817358c069f23f2f9204ddd121786340e887b382/
      x86_64 |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/c907603d2af7bf410530289c1d3e77a2216b753a/
         arm |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/9dbf0473f546caf0c156ffc10a9f9915895050d0/
      mipsel |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/24bdeb3cb056972c834fa4ec14acccda838a576e/
         sh4 |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/5c9b7301b562bebb00cff8e6ac9d6b2788df2cb7/
        i686 |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/fb76b5def63e0a0fd20110e1a0ba5ccef03fef51/
        i686 |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/daf16988e86770130c3c13b94b2c01767eb030b4/
         sh4 |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/152ba3d38ba5fd04a9be68b21a9f54e9e7eb7308/
         arm |                  host-xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/917ff94021e8845c9ff30d9c40addcebcab199eb/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/35b0eb9432b702bd45d67150629ed0720b924910/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/3d7e59f688a50dbe94abc37e3f8ef17cd816c2d0/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/82d8d46c7acecf2932c75241846e9990c08aded2/
         arm |              lttng-tools-2.5.2 | TIM | http://autobuild.buildroot.net/results/a2e8c8aee4793e38ceac464b5c89a13f2d2cfda2/
         sh4 |            qt5multimedia-5.3.2 | TIM | http://autobuild.buildroot.net/results/0f8fe37780147a5f8d4c3365a77e64ca3619f9cd/
         arm | Resolving xorg.freedesktop.... | TIM | http://autobuild.buildroot.net/results/bc7c812047d4ba817c468274b37f0d480793d481/
         sh4 |                     ruby-2.1.5 | TIM | http://autobuild.buildroot.net/results/3ef70599268d9492b0878f2f4e1070aab46eeaec/
         sh4 |                     ruby-2.1.5 | TIM | http://autobuild.buildroot.net/results/7276296b24d41c93d4aecf0fb1ccffaed8a1e978/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/54135001fa4b2c105550c76b612a344252ef5dc0/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/acc2b8146e5d0872d265b3c93361b236f45f5ea6/
         arm |                 wavpack-4.70.0 | TIM | http://autobuild.buildroot.net/results/a90c4727e2f3be3a3225eecf5ba8f79aba63e966/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/08b70c70f059763d84aea3e4b1ff1b88546e1e7a/


-- 
http://autobuild.buildroot.net
