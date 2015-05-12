From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 May 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-11
Message-ID: <20150512063016.AD506100F8B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-11
===============================

        success : 307
       failures : 31 
       timeouts : 0  
          TOTAL : 338

Classification of failures by reason
====================================

                  boost-1.57.0 | 4 
      host-gdb-arc-2014.12-gdb | 2 
           libmemcached-1.0.18 | 2 
               mongrel2-v1.9.1 | 1 
               libcap-ng-0.7.4 | 1 
               harfbuzz-0.9.40 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                     php-5.6.8 | 1 
                host-gdb-7.8.2 | 1 
                tinyxml2-2.2.0 | 1 
                    dash-0.5.8 | 1 
               host-mono-4.0.0 | 1 
               openswan-2.6.42 | 1 
               host-qemu-2.3.0 | 1 
                   lite-0.8.10 | 1 
                     lxc-1.0.6 | 1 
                  hwloc-1.10.1 | 1 
                   czmq-v3.0.0 | 1 
                  snmppp-3.3.4 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                  fbterm-1.7.0 | 1 
               qt5webkit-5.4.1 | 1 
          google-breakpad-1373 | 1 
                ipmiutil-2.9.5 | 1 
                 rsyslog-8.9.0 | 1 
                 qt5base-5.4.1 | 1 

Detail of failures
===================

     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/880927e159c2846c4cbdf46703a311a802e6d203/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/9d2e41d03fd187c3ca322de3c626031e13c51786/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/df8e4979421a74e1edec02240e62d07af46fb102/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/35bdd12740bfd2afcc6a4422c348814857c9bae2/
         arm |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/8d279baa4c8bffbb01f897119092c7b736942df4/
      mipsel |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/dfd217806e862cd2bc07b7440595ecc6910e431a/
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/899eb7e36dc31b7dcb51c0dd23d91965111d22c4/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/ab1e75066e42b0de243664b6891e642255e66e32/
     powerpc |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/c70f793c7c3b380428d6e2e622a90805cffc4dd1/
      x86_64 |                harfbuzz-0.9.40 | NOK | http://autobuild.buildroot.net/results/5bd9229ddb9b44639ff0060c573ab5f2381ad79c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/9334adb0a9a845ba1e6906b7da69234811b17a7e/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/cec39af4c4d0310b3d80eb4963ec6cd6212fac9c/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/4089d707339291073f48187466817dd17198a3b2/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/92d581b74b805864fb36bef62721852a5960dcf1/
      x86_64 |                host-mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/81aadff4232cf1f1c36d8effe309a87d706b858f/
        sh4a |                host-qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/8f99a776f35d4ab0841d9fd2db509850ef603bd4/
     powerpc |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/98364cdbffa06f151ab34b301762321b2a251ec6/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/99056071f4734ea23d743c0a38b3aad2682133f0/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/bba9f7130315c9d97cc060a73663276d0fa2c1b3/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/8cbf57f9136cb42be31c88e0f1f32d3d2353e5ff/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a8217947919fcba7ee94c7e64b6ae9a10bf74414/
        bfin |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/dacaaeb14fcf22dbf998807ce84cd8825ab4d351/
         arc |                      lxc-1.0.6 | NOK | http://autobuild.buildroot.net/results/d0bfde7bce942e8b5ffb1a8e062e69bcf849a983/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/8fc1222139f58ae76746a20f54ae8c349f7d1f12/
        mips |                openswan-2.6.42 | NOK | http://autobuild.buildroot.net/results/d2d7f337a82ba7fa082116da65637634f8c8da39/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/490a9558635c90bf510b6f80cd0891fe322c3f46/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/c89e0ef7d537fdee5c34da9fe3b187af07750a76/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/0f7cceb67218d6c97b3cca40cdcbb6132163137b/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/e769982e3131581b38698c109c9bc5215e3d5b11/
        i686 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/9edd141037f16446b2a6e4771342fd7d45e7d464/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/c1af14ccde6c82063962dba42e16f8bea3836bd4/


-- 
http://autobuild.buildroot.net
