From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-20
Message-ID: <20150621063016.D39B9100AEC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-20
===============================

        success : 181
       failures : 52 
       timeouts : 0  
          TOTAL : 233

Classification of failures by reason
====================================

              wireshark-1.12.6 | 8 
            python-tornado-4.2 | 7 
                libtirpc-0.3.1 | 6 
make: *** [openvmtools-lega... | 5 
pulseview-198f9bc74d6c955a7... | 3 
             berkeleydb-5.3.28 | 3 
               qt5webkit-5.4.1 | 2 
                 setools-3.3.8 | 2 
                 clapack-3.2.1 | 2 
               upmpdcli-0.11.0 | 2 
                grantlee-0.5.1 | 1 
                   glog-v0.3.4 | 1 
                   dhrystone-2 | 1 
                    ruby-2.2.2 | 1 
                  python-2.7.9 | 1 
               sdl_sound-1.0.3 | 1 
                    mpfr-3.1.3 | 1 
           python-django-1.7.3 | 1 
               mongrel2-v1.9.1 | 1 
c-periphery-0fdfac3264f1dce... | 1 
                minidlna-1.1.4 | 1 
               libsigsegv-2.10 | 1 

Detail of failures
===================

         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/57ad508d899798173e02eca6135093e57ec1e12f/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3daaad038f004ff95bee7fd864cbb9b6f06a198a/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5900914bb27b21bad38dae8d21b8927db5c449a3/
         arm | c-periphery-0fdfac3264f1dce... | NOK | http://autobuild.buildroot.net/results/8e5be9907fd13edf7fc8c3014949d48b4a0d8977/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/140779847344cc58ef8fbba35344cdb87f3cca51/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/5144906515953a7eacb2b8f9e5984b7b814559dd/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/7183953d4d70180f91407a480eb71a7da72bb228/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/df6abf2ff4adde4ab9212bd6df8c5eb773cef69a/
        i686 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/8448d1e02d21e3752b9a118d3c9de360cfe2ae7a/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/d8f48e8a50318a7f8e9a0a33e8d3dd551e0547c9/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/259e4f3b9e9761f220aafcf7fada608de546ef65/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/b89e0afec858b11cf108ed6858b48cc077f2f389/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/eee7f191707bf712926bd4efeb8868014ba08ca8/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/547a0ad8af2bea6bf709dd67eda2ac81ad05b06c/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/cc92b2414d4fcd10fae8be787823954b525155b7/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/46a42221a04f119bfa48ce9d1067712e83ff7c3d/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/2a5ed1911026dce625d820d52419f0f744386216/
        i686 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/5636cef01f231c59d1331e3a858991d3cebe3a19/
        i686 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/0cad40099481fc98c28b5367cd3f697262b1392c/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/04951bdd870e6147013c6e99cad9f3b3d8489ec0/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/28762ba72502b17e9fe4d12a577edf5dcf28f46c/
     powerpc |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/4d1c27bac727aad64fd356d304a74a87ee57c8f9/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/6d8c7cdadd028fd8e0ea8b532c4e37d6a15d5c28/
        i686 |                     mpfr-3.1.3 | NOK | http://autobuild.buildroot.net/results/698ba899e8d38a7dedec48461a9054c6eeb37dfb/
        i686 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/04ed3cb86fa3ff09fcadbd1d1d77c67aeed7f178/
        i686 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/992cc015b566640bb1dc61608ca20dd7c24e2de8/
         arm | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/d58a17be0df5a64e6969f2b811f178f6b552577d/
      x86_64 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/3aef1b1bece2aa273ff854ce301c6cc3bfd6fa0a/
     powerpc |            python-django-1.7.3 | NOK | http://autobuild.buildroot.net/results/90d0c8ef1c43cd7e1b4057ae73708961cf82f73c/
        i686 |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/ebfcae235c72b77ab81cc77784350a4b29a3133f/
        sh4a |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/d4043c6b8c5e0df3b824ab4835b929d1b07b2a08/
    mips64el |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/297282203f96180fe7222fb266cf95bc94ce37e0/
      x86_64 |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/7ac2acdd04627b2f8e4f5eb6f7edbd0801149be7/
     powerpc |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/63dbc2769d0f1f868548270794d55c082abb93b9/
         arm |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/8539ec8380ae03b09e18b1ffb13c72545eea2b99/
      xtensa |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/8ff897401c8f16f15ca2f2b625eebee1918cfec9/
      x86_64 |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/99125750c5888f7dc804b3c498bc76fb1c7780f3/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/283d442289df3adc284420bab6129cd3559a3383/
        mips |                     ruby-2.2.2 | NOK | http://autobuild.buildroot.net/results/7d30cbc2842a663ee0f5c22b592da07f7ef8e871/
         sh4 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/973392c41acd8d2dda71b951d3d59093ba99a13e/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f49a3b7141baba508c59ea2881125c9e7ab5e4b1/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/582659a91fcb9075635524787defa39f25a261ed/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/c5163a245f59b8dd40a6ac82aac45c038f9db352/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/47d0a99c5c9fb2e283682e7357ed68b50b0359e5/
     aarch64 |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/b72556cd78f9c6f235d890141e703987734cdf88/
         arm |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/5b17d976c353f574da1baaf6087da1885d16e5ef/
      x86_64 |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/0782a92c1763f1bc532ca12665221650bfcea00d/
     aarch64 |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/03b6b49594f4ee6fcda5151bfe2444130045c37c/
         arm |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/05f17ac9dc99b65f1c0b3801b99cb6858fc6b61e/
        i686 |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/fd4f04879ab4706e099ab8e4988edc8885e925e1/
      x86_64 |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/5adfb5cf9a7505c346f8865108dc00bda5ff6b4e/
         arm |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/e9c2fab7a4467c89f7794db6fd5f8a495a3e374e/


-- 
http://autobuild.buildroot.net
