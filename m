From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 07:00:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-18
Message-ID: <20190319070044.0EA2587534@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   1 |   0 |  27 |
   2018.11.x |  27 |   0 |   0 |  27 |
   2019.02.x |  24 |   2 |   1 |  27 |
      master | 217 |  65 |   0 | 282 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 


Detail of failures
------------------

      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/a85f80a8369536136b87713c1fef5391e2d14414 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          python-ipython-7.3.0 | 14
            optee-client-3.4.0 | 9 
                host-go-1.12.1 | 5 
      host-uboot-tools-2019.01 | 4 
                    uftp-4.9.9 | 4 
                   netsnmp-5.8 | 3 
android-tools-4.2.2+git2013... | 2 
host-gdb-arc-2018.09-releas... | 2 
                   mimic-1.1.0 | 2 
                   netsurf-3.8 | 2 
           uboot-tools-2019.01 | 2 
                       unknown | 2 
               wireshark-2.6.7 | 2 
                     gdb-8.1.1 | 1 
                   glm-0.9.8.4 | 1 
                  grpc-v1.18.0 | 1 
                      gzip-1.9 | 1 
                host-gdb-8.1.1 | 1 
                iptables-1.8.2 | 1 
                  libssh-0.8.7 | 1 
                nodejs-10.15.3 | 1 
          openjdk-jdk-11.0.2+9 | 1 
                qt5base-5.12.1 | 1 
                 qt5base-5.6.3 | 1 
    xserver_xorg-server-1.20.4 | 1 


Detail of failures
------------------

       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/bf614368a27c1f800ba5d69e24f4923c9b14156a |     
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d259ae6e96b22819fbb87ba76b6ce7537cb2962a |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/adaf777e7841595db26613433dc5059ebf7c3a43 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/1acd6021d8b42b7bdda680aaefd5cd6007fa54d3 | ORPH
      x86_64 |                   grpc-v1.18.0 | NOK | http://autobuild.buildroot.net/results/bfaa0d82a8dc8e43ee7ea5fd06fc02953829c427 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/a25a3f078ffcbb2e3f99fc307e850e41593d63b1 | ORPH
      xtensa |                 host-gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/1098d6380f12f5bbd6dbc69edb06bd953d1edc3d | ORPH
         arc | host-gdb-arc-2018.09-releas... | NOK | http://autobuild.buildroot.net/results/39fd168a0a573ade438150f88be58df464effd1d | ORPH
         arc | host-gdb-arc-2018.09-releas... | NOK | http://autobuild.buildroot.net/results/9ef3dca9448f1ffe3aec6573d9b8dc053b2e268d | ORPH
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/81ae87e67de10b43ac6cb90ee38a4ccb2e574f1a |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/e06714ab81713c78b15925c5a7e2480b052f029f |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/e091072047fb421ed35752a84af89a7fb5feac6b |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/d6949dfa299f16968e24f743146738aff367fd23 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/64930ed6cda33ec7daf6ea4697274e0d12acf9ec |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/97d3335915fb3d00a6b2a11e773b8b730b2cf1a1 |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/616b9c83bb0162860d89afadeef0c025cf253a58 |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/db2b5b9480a6da146fa8c26a3e983a7e60a49a85 |     
     sparc64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/bf17c5285e5f14e6876b93269ec68cfd11a5acff |     
         arc |                 iptables-1.8.2 | NOK | http://autobuild.buildroot.net/results/1110f41cf0e3bd630321c244441b0d16decc0953 | ORPH
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/df8c21b796ae67d68dfdb8a50b75373ae05469bc |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/c6f70020cba580505a10416171bb4cf7460e3d8a |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/52b0391dc2c90e421f23d63de9669306497eaa42 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/4e72f00fac45ad1f9c29d6e4568b034608103c14 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/997bb56c1dbd9899de3f6406248b69e67d252b0e | ORPH
    mips64el |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/98db41ca2dc786419e935402ecd26954fa8f76b6 | ORPH
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/41e0235b6a336eea53701d90189dcb175b69a7b5 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/3d4050cb227007b22cd386577b28c1b83ef5844e |     
      mipsel |                 nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/798bac8032f11a71875893d17623c912c9d8f398 |     
     sparc64 |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/9d27e6389a18ddf4266511b58e827487d4a78437 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4a53e0f8cc22a3de6e2f91be8ca033ee390a4f21 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/de1af5c073703be054c49d4115270bc70d15ebd6 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/cdd15b2f63444c3fa287d5d27a765a3f5e005b1f |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/6081b3873bc9ca415261b1e94d0c6e5746e4ff80 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/cb99cc36045cfe22586b7571df788093a4c50ad9 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1d5cc2ddb79af041da5c8957c7f76e415b85e381 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/27d179421cecb40b44d692b283369fa80621c428 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/96db01b782076c0cc87b5072486270a32ef8db71 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/3f65758023d656300052feb22d0c697dab23e5be |     
     aarch64 |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/ccf326485f230502fec33bc819e89db94ed29734 |     
     powerpc |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/f96189613a1310ea5c9e0d4cda21c8dfe11a3f34 |     
     riscv64 |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/c3e5b7d69236434bc7e9de1c58c7441d055f8742 |     
     aarch64 |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/c9f41b7d448d196c4410a9571b28b662860c447a |     
        mips |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/773536ad20c6ff1db874d683570e2df8d3cf81c7 |     
        m68k |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/07caf0b5318d75c4aef7e8fb1e68ef80a1c98f76 |     
  aarch64_be |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/effd39f981d6e92b7590297c01f4e370005a6034 |     
         arc |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/c2b38bfe0a2c54949ce92eb0ede00c004a2ed8c8 |     
         arm |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/06e8126dd786ebfecc10ad0db83cc7ae6a966d72 |     
     riscv32 |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/5be67ff97b344552ed1ecc97b0bdd268fe91a65d |     
         arc |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/bece6399b389d9b10abf25f901fd0644a7c282b2 |     
         arc |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/56d496db6acbb7f3a7c51bace51c21869baa77c1 |     
        i586 |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/fe064a594f3bbd80157cdb336729eded95923fa2 |     
         sh4 |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/bb302e506fea0773a13ae96aad33c16f66d17752 |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/4281a90c40d7fbf2d1b83192e8500fd5205cc5c5 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/38350902e55f85f1fd5c55bba7ba68e71af06a00 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/179aa01e7f261d50c576654cbe083689e5273a6a |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0f86e9e6fda5cc6bdfa55549a3aa85241fcb8132 |     
        m68k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/051cfd993b65830c34e675d797e241c272b6f35a |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/47dd067dfdcaae99d50216f59ea6af115d8f1e1e |     
        m68k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/2aba0f75dce40076197e5af5cfdd0a969ca4951f |     
        m68k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/02d2dd9a30c83cc74672d10dadf4d3ad07b737e3 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/c6828df1f3782564451ddd4187ff026679bf37d8 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/09db7125f43479db7de78b83f524e71063b78af4 |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/d95d85779dde25eb0ff5700420bc52f2f9ba67e3 | ORPH
      mipsel |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/16a3a291c0297de392cfb7aef89a462be0327b95 | ORPH
         arm |     xserver_xorg-server-1.20.4 | NOK | http://autobuild.buildroot.net/results/230a9c0097671b4775e724820b068cbaf851aa08 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                mongodb-r4.0.6 | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 


Detail of failures
------------------

      x86_64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/25b843fe1a04e722d8ac1fa9ab443da03782447d |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e8843964912267f73887d0c34fa70cf0fc08cf4b | ORPH
        m68k |                        netsurf | TIM | http://autobuild.buildroot.net/results/81cabe1b4232842866607ecadc3e1c47ae6cb6bb |     


-- 
http://autobuild.buildroot.net
