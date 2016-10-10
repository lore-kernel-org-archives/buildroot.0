From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Oct 2016 08:30:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-09
Message-ID: <20161010063024.6BE69103507@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-09
================================

      successes : 224
       failures : 158
       timeouts : 4  
          TOTAL : 386

Classification of failures by reason
====================================

                 glibmm-2.50.0 | 26
               wvstreams-4.6.1 | 11
               linux-pam-1.2.1 | 10
                upmpdcli-1.2.2 | 10
               libglib2-2.50.0 | 8 
                    gdb-7.10.1 | 7 
                alsa-lib-1.1.2 | 6 
                 uclibc-1.0.18 | 6 
                   gvfs-1.30.0 | 5 
               audiofile-0.3.6 | 4 
                 lvm2-2.02.166 | 4 
                   assimp-v3.2 | 3 
                    lftp-4.7.3 | 3 
                    mpfr-3.1.5 | 3 
                  cc-tool-0.26 | 2 
             ctorrent-dnh3.3.2 | 2 
czmq-5205ec201e97c3a652c17e... | 2 
        host-gcc-initial-5.4.0 | 2 
              libarchive-3.2.1 | 2 
               libbluray-0.9.3 | 2 
make[1]: *** [libavfilter/s... | 2 
                    mpv-0.20.0 | 2 
                    pppd-2.4.7 | 2 
                     vlc-2.2.4 | 2 
                 weston-1.12.0 | 2 
                    cups-2.1.4 | 1 
filemq-e59951489045825d6fc5... | 1 
                     gpsd-3.16 | 1 
                    hans-0.4.4 | 1 
       host-erlang-rebar-2.6.4 | 1 
              host-fwup-v0.8.2 | 1 
host-gcc-initial-arc-2016.0... | 1 
                 jack2-v1.9.10 | 1 
kvm-unit-tests-0b04ed061003... | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
libasplib-f7219142e790a329b... | 1 
            libmodplug-0.8.8.5 | 1 
libsoundtouch-010a91a59071c... | 1 
                libvips-7.42.2 | 1 
           libvncserver-0.9.10 | 1 
          libwebsockets-v2.0.2 | 1 
                   lunit-0.5-2 | 1 
make[1]: *** [libavfilter/a... | 1 
                 mono-4.4.2.11 | 1 
                    mosh-1.2.6 | 1 
net-tools-3f170bff115303e92... | 1 
                     nut-2.7.2 | 1 
                    ola-0.10.2 | 1 
                 opencv-2.4.13 | 1 
                 opencv3-3.1.0 | 1 
                 openssh-7.3p1 | 1 
                oprofile-1.1.0 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                  stunnel-5.36 | 1 
               tcpreplay-4.1.1 | 1 
               tinycbor-v0.3.2 | 1 
            xapp_sessreg-1.1.0 | 1 
                 xenomai-2.6.4 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/a3010e7c284420b59e6702b129bde10713244cd8
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/140c2c03d08614dc5eb0af177e8049bddd3abd73
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/46d8b8802908cafa4684ff444beaeddf632a91f3
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/51fd2e9e7a974e98e2535143768655cdf90b466f
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/bbce14fd81ac4f647cdaf03aa1211153e1c49897
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/4cd87c9e0436f39533e41845ea50086136fe568f
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ade4b693e3fd2ac21e6cec3ec07a0e8c6a09d4d5
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c8ba514fe54236fdb896381188e5d321dceb59bf
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/04da7a1d719f8ef4d32d14d740bd0b83befc3fe6
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/16346083beed8c645b2b6caa52c37b437479ea35
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/a840464b31f38d3c1c415ed670a4d7c94c1645e1
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/1c7908c3f8558f80aaabfd06d173ac3530b83947
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/004a894ea00deef1a1ce4145d61985221d9ba85a
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/111726495f487b7b3f7e7fe535e1299c04504ad9
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/0480154c9b6262f9410ded15353d12eda3d3b864
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/f012dbeac409365897e050488c5e7c5e65c81d46
        m68k |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/7cb59011dd23dfffb6a3445d247d4cd364f1641e
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/55b17a17449d36dcad6467d483f31b8c2915d381
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/8695964383e799aad6f72a1c64e055f916140c9e
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/224b0d042e976312330d30d8c0918ab7c8c1344d
     aarch64 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/301188d4317f57cd2bedc0429527d9ed22893424
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/0cfd14ec8f8f11cd1d71d8020625f32f0f0382b5
     sparc64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/d04be57e0b6717dcfbf72be20cc49c017c3a2ea8
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/1f83fccd31f12cfd43448261736a957d478cba4b
     powerpc |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/1be181abd50723a52b6171690bc088957208b377
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/3352af60db56555df27ba748d142a341da1b8c78
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/6b60d199d47689001fa10d46a987ceb90e6837df
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/4c3f0281cd9ecf3c2be72b1b250e9049bfa5570a
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/123f79c54c8fd4794ff713496264a46cbaac71ff
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/cd3210b6752d8b0b9f1ff24ac2781b0b904f9138
        i586 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/bfd1ae11f4e62d5bcdd6284535b55031d9385268
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/71a6c99f0f1c16edb70d81d88ba37ea2c1a64ce3
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/38bab932e475ec549a77dd5cb50978c111b84fea
     aarch64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/750043c945de2113deed5a5e4d3467bb22e12dff
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/4045fd9a2d91072767151a4c3d8522f1942daf6b
      mipsel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/3e62fa7ce432454f781d2987fd9b145896c5bd51
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/f9bdb5cfb7bfa53d74c521c847a6462cd516cb8b
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e684cc79797159b38d63447f291980210840b348
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/4f09a5a9c378b8ab773264070674eca1b32425d2
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/92e7cb859f634deba5cbc4b700f85a15f4fea19c
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/715ef7f418c01f81950a3482c7d9cfffb547f9fc
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a1794bb3766b623d1a77aad614c81efb31a1f850
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/2783032ced591bad1286cced8ee4ff0a2e601c7f
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e575fa8fcb22363ae8482c362d05c0766e3b09fd
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/3999af2ee7b2b610ab5fc26a313aab8320d08ee3
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/cb1cc210cede15ff2029258475217c1023c68bf9
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/1482fafff2eef2068c3a19db1e2b9aa4305566f9
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/c74ef482a92f2e2e73923354ab9e2221bc96a744
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/2664e8dcf9149c517f747e9569cc5cca9216d35c
        m68k |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/523c771476cbf12ad1957692b41e0b4254dbe272
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e9224243f185a242a9c71cf89a18c4381e7070b5
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/573a3c6f02dc23abe91bfb53a80e4bb7dae9ddf9
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/336f057fca42b0f2f0567cdd0c081a1fca28fe85
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/9ef62c8050f0ce5639cf27a8a1f1edfbba363038
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/9a3a5fa6c96244688eb42ec4d8abdc5d1941fea5
       nios2 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/1a726093df0fd8696456b46f76697dd664df8eb1
         arm |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/e1f7dc794ecee717d143d3ae0d2d3df86faa12ad
      mipsel |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/a5ed23874c7f63beb812e82b3b9f0c9f19c25c4d
         arc |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/5f895f3f0f1a644cd473e8de6347711e99733005
        i686 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/a66b5b9408c8c738b423906f716defd9ac4f681b
         arm |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/992917fbca50244d4a42c3ad6dad55e0b5b1120e
     aarch64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/415a406803da562f319b28bdb902e1245d4b094a
        bfin |               host-fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/ccae87c67f7beb27618cf4660a7a6850b6742aa7
     powerpc |         host-gcc-initial-5.4.0 | NOK | http://autobuild.buildroot.net/results/90d0537bc12cbb2a7c6d344b3c6c9e1a5046d791
microblazeel |         host-gcc-initial-5.4.0 | NOK | http://autobuild.buildroot.net/results/d8a4afeeec8d6b070b17a067d0ded5aefe4e3f6a
         arc | host-gcc-initial-arc-2016.0... | NOK | http://autobuild.buildroot.net/results/9a2b30bfd08c3a4af43f0523276eb5f799699aaa
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0542fd2bfc8df45e4cc9433eebb0e11bb7f8722d
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/e21a9fb1906603449db5960181fcabd284ef3e0c
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/6b070e863e179dd0ee8705c43a4e277d7477397f
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/a73f32c127888f0c8938953917e2c03da0eb9863
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/d32484ba462208d3dc3958c91c7a6db2b6c53ee8
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/9ce0aea9677ba1763e6ffe05e73171e8099293d1
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/15ef2afd41890b6445fb522fa6efd8f9a5d26bc5
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/9a192140c466506d190c4404b6d6fac84d2394a7
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/f347d8d4c2716b21d9fc8ca1e29cc4aa8908799f
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/9c668ed00b0fe4753b002e8d413dde87ffe72d11
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/b1a9563611838b6b48197581e9eb6ac2ea0c7d58
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/25efb79dd6ff1d93b5775baeccda23194d68c711
         arc |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e3226d5baabd7ec1170b0a4a732432d1f0ee9a16
        m68k |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c83e90c487b3686e5ec45a560868ec28da0514ee
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ba061a23bab46fddb41510c375e086ebcf7bee07
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e26ac4c42e526a07cc7e47f8f3be9d13b642765f
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/18c11564d8431ad1ae0da01530b696c0264d0bcc
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ac65c9177dd63fc8d76dba3b9845f81b15faa716
      x86_64 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0d7d1c9c9375c0ca71dc5c6a28a426dfde48cd80
       nios2 |             libmodplug-0.8.8.5 | NOK | http://autobuild.buildroot.net/results/3064dcd23f2f3fe73a80210cc3c1866cdec38883
         arm | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/fd6ca2c00467110018247a1b24da0df1f3ba8c83
        mips |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/f07c921f9527fdd5ea5c619fdcdec144abcf8a84
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/4a84180d340fabbc598bcd74e57c17096929ae06
         arm |           libwebsockets-v2.0.2 | NOK | http://autobuild.buildroot.net/results/d88889ba30444e73cfb12ae1357db25ff6a3a4fb
     powerpc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/8d4339c16f58e75ccda5d620e6016f28450d6184
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1887c8c62493f246566a549716697d84637821ae
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/f4d1299b46d57f5fbaba78fa715e5818ee6fa235
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/d75e7d7c00e8f1310051ec1d0114833613e0395f
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/8d4ac91e2e28d967b8ae5ba80af1170026289f25
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/d9091aa395bb4e859b55ebd8ee885cb7ce3632f6
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/9a7ac80a47f167f0164d420acb688f9cd4ab7507
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1056b35a173e41e994aa4f8bcb4ae1af2fed0867
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/178f1de6f1fb2777ffaf7dc2e15a8d7c02da81a5
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/f210327816fcc8518fb9d67f517288acd097f208
      x86_64 |                    lunit-0.5-2 | NOK | http://autobuild.buildroot.net/results/1aa3495075898f235365583f59603a06850cd999
        i586 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/3f3ccbb31d5a8ac2c148a029a6da19b169cf0f12
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/c00b3acc8a164be76bb6e41a79af853ddb29e416
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/c3c14f87563c0b97b71e93cb8c4904a86b641c34
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/d8a4b3b358a5f702d68f83a1628aab98b4f19b80
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/79efbe8703a41100bcbc2c3d2c3b27d2b7b3fa86
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/1ce8a4775f3acb561550e2fcd6452ebf8ad9ef5f
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/412c6064e7ee0af570fc529d4283d328ee01cbcb
        i686 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/b6d973683312121a3163c861f60bd2c20c3c99a5
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/d01ef4c8f37f21de323eb3e0507c22920410803b
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/cdca997a656d60a2da79d573fc37c69ca8771723
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/3b8fc45dfdde21d41daed9aaa23a1173c1d1a6df
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/cd9974d2d9e015ca60067316b28c1e56a52833ce
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/d0fac388750a8f555ce778f42b425778b19c414c
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/79302819b778369860b066d937e6613961a80dd4
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/6071ce36932a86d18404454e7eb33685b40784b6
    mips64el |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/e739165a53753c9f91a7b93fe686689598ff533e
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/b4d86734e4a66a571209c042bcc47e311b38d57b
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/69273c9d004f61f424ffaee457af8209cb03d6b9
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/8afcb047d5df891671f8966607c14098a67077cb
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/94b7be997f189c3c68b25731e294dec116baac1b
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/151a0ec2fd68f2f5fd2aa6686d4cb38c93ca5939
microblazeel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/d5f6db2f06eee0ef2ace368e72f0779cb958b294
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/546e5792be011164522bf5c5f8bf3a4418bfb482
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/88a1ce7ff3b44e48d654c85c344b8e07011dfdb7
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/7c9945741a077b74156b2e308028c494da40b596
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/b0bdebbfe2385bf4c5691978f2da878940b4a27d
      x86_64 |                tinycbor-v0.3.2 | NOK | http://autobuild.buildroot.net/results/1566fc4c1f5771292e2e959e730750f263b78b6f
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/875598192800ee9cbb88ae03234b65553808145d
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/18075ed7cb185d188c8eca09851b5ca09a2b69e9
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/732fc00487c33009a0091d4e36ea7e6d93f3ee3d
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/191c6cf0cca91d07823c7bed0d5e579ad304e5b8
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/85e232e415ac4d7853532eb7b0c41e23f09ca04d
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/4f9c5a0aff766dfba1f637ea67ad1641437d80c7
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4402e4efdf8d58d1f9dc61981058385486a20059
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5dbdcefefa08fa7b8c6c178a3677a379c38913c4
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/08d61e56cc50336f1a80d49e4f60fe3e4adbdf4c
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6522620deced263ef133eaee7e52d88c02aa3701
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a2368054da206bb33638b092b048c9a1b6609c5c
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fd2f8e7b36737014977cda85c4720edb94fab16c
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/e45e059987a677f9d4334744ebbc1f83ff1498bf
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d44f3846bcee56a5b9e87cfeb459a628c94ed32c
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4070ec0c07d734ccf5a7ecf597dfc4bac39c6c8d
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6ff2101cb5b0994cce70bc413f183c8ac3d0c71d
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/b0855346cd8f96454a3837a0c957792c72b64e08
      mipsel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/0af5fb6a118f9207b51b527524c3f42f19a69891
    mips64el |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/7a4385ffadf0649a9f0027c3664aa8e7bc6c3e61
         sh4 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/e5cef79d2c56871bdfed6798a32bdca0aef14aca
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/586f94ec126072a3d5b536c235af7ccd2d1bdf2b
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/aa4eeca56fa97d56218b43fea7250a93882bbbc9
        i686 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/b1d6f63440c58b8818e363157a168048a03a85af
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/9292fbb6d5b4211b3d95c6087650705a9c503ab7
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/db0d7ca0df0c97c3fc634164ff6203463bebef6f
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/6a0824e518e9f672e971d57bf66e33dd717dbf34
       sparc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ec6b36542373991b8407bad59cff2c42a37da7e0
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/9a8044baf72155903c1e6f343c5067bad7b92cfd
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5d1d821a04ca759625628bf719e5744b38f8df0b
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ac83e4edca1c092d52d229afa63ddb4fae54ec61
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/b96f37f81a177e8f6b569c62f95405aaa746432b
        i586 |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/2f27fe3cc471d264dfd9cb26bfa19760eb5d7328
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/ae87bda183ada9401fa00c060a7cca660cdcc926
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/58036fde018944f5ab553d44293114d6921e6e60

-- 
http://autobuild.buildroot.net
