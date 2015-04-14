From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-13
Message-ID: <20150414063018.99FA6100EA7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-13
===============================

        success : 209
       failures : 47 
       timeouts : 6  
          TOTAL : 262

Classification of failures by reason
====================================

                libtirpc-0.2.4 | 5 
                     vlc-2.2.0 | 4 
freerdp-770c67d340d5f0a7b48... | 4 
                elfutils-0.161 | 3 
                ipmiutil-2.9.5 | 2 
              postgresql-9.4.1 | 2 
                  bcusdk-0.0.5 | 2 
                    webp-0.4.3 | 2 
                 mesa3d-10.5.3 | 2 
                libevas-1.7.10 | 2 
                host-ola-0.9.4 | 1 
                  xerces-3.1.2 | 1 
                 python3-3.4.2 | 1 
                  dhcpcd-6.7.1 | 1 
                    neard-0.14 | 1 
              lirc-tools-0.9.2 | 1 
                 civetweb-v1.5 | 1 
                     gdb-7.8.2 | 1 
                   sudo-1.8.13 | 1 
                 lvm2-2.02.117 | 1 
                 host-xz-5.2.1 | 1 
               mongrel2-v1.9.1 | 1 
               host-ruby-2.2.1 | 1 
           libmemcached-1.0.18 | 1 
      host-gdb-arc-2014.12-gdb | 1 
       gst-plugins-bad-0.10.23 | 1 
            host-mtools-4.0.18 | 1 
               openswan-2.6.42 | 1 
             transmission-2.84 | 1 
pulseview-198f9bc74d6c955a7... | 1 
                       unknown | 1 
               libecore-1.7.10 | 1 
                    bsdiff-4.3 | 1 
                   atftp-0.7.1 | 1 
                  python-2.7.9 | 1 

Detail of failures
===================

         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/559b661f98c90c9e2742fafbf6c162cb7ca04d7d/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/dc2870295f511e27425126ba4ab165ffb68b18f8/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/5e5da7f83ac5a0d45016ea52da8cf7c8d326231d/
         arm |                     bsdiff-4.3 | NOK | http://autobuild.buildroot.net/results/262891bfad13cf114d19be62539f17465ef2483b/
         arm |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/7346a89b5e7dd3633ecf9ac5292379ec9e832b2e/
      xtensa |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/5ffd15ab4b866e8c0187667ace305202514bdab9/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/d0f67a9b0191c1a0fd797ddd8c42eead56c1a6e4/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/3f242853e600bb6bec6ce2f0598d304751ceb81a/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/7e9e03458642fa4a81d65cf3ed955053c35d77cc/
microblazeel | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/b1df02ff2955ebcf33d2c0d91b8d3a1ab83bfa67/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/9c3cd59e5809fc1efdf7975c52f3946a8388a3db/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/0e1430fa46a2442bb9251c6f52187e7b1767de5e/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/0506c71a2090164668ec031b3e06cd79e52dac3c/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/aadc41073bf2d286cbe4752c01ee0b224f3ccfdd/
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/d3107cdffc37604651b49414d179a3d11177df20/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/3bca981be494e8df058c3a485d02112421cb1575/
         arm |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/5903674969ec870c70af608f7761af97e2239180/
        i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/905dd9e75f353d04c14c57b1e1f1e852ac790a83/
      mipsel |                host-ruby-2.2.1 | TIM | http://autobuild.buildroot.net/results/0df43a10b8cfeb6ca29dbf22ad35a43865cb2c03/
        sh4a |                  host-xz-5.2.1 | TIM | http://autobuild.buildroot.net/results/ce9047ac2393cb96082ca73b3b9bca32144dd6fa/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/f0bbbd54349b5239872d6de185e16c1d90b3f779/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/de1a2d78294b1c8718c49d2adf57f5d75500e4cc/
        i686 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/b0602be4528d57010a1b677ca05600bfeaa55272/
         arc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/29741c6f07a76f812838e393ded27695fea5b9f2/
      mipsel |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/2cc1af09a6b73713ac091f6c33905a83a0189bfd/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f5e725702468d0eaec89d814c7b28b4bf16de891/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/6c0c0ab98f670b8e670c0759b60e1df5cbaaf464/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/29e34a7d6c1462fc252395a24ccd33fcb0adf9c4/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/54c0546ee43405df440676e5fb6d7fcdfd60a763/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/f9a3fe2a131b2fb07c6a338ab4dec21fbd1e9741/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/0d7d30b849afb45652ba7001533006529d518123/
        i486 |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/0020ec67f2f8faa2183355fb72168b65ab6d06ce/
       nios2 |                  lvm2-2.02.117 | NOK | http://autobuild.buildroot.net/results/ee2fbdb5180963819586f2c8eef27ab7939cd13c/
        sh4a |                  mesa3d-10.5.3 | NOK | http://autobuild.buildroot.net/results/25b43a1898d5f3b4e87efc3147b33972668aa52f/
         sh4 |                  mesa3d-10.5.3 | NOK | http://autobuild.buildroot.net/results/35fc6608b1d984587abb86700a51bf763770c795/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/e55650283dff0bbe03131d73df458ee83a02f389/
         sh4 |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/06dd0485f6921b03a600acbf8a01f11289e03928/
     powerpc |                openswan-2.6.42 | NOK | http://autobuild.buildroot.net/results/909f6634a393fd460a2c9acab557f8071371a1fd/
         arm |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/4b38f5d910cd5c208e89cdb876183cf0fccf619b/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/3f24c48cdb1149c1f27bc967c4f404f3ca20e336/
     powerpc | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/33c996b3be0e1efc6e1747a57f56aa4d619a08c7/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/fccc05caa83425c7cbd897168e9bf56e791afbae/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/a5757f8558b13789b35ca972c8a92cd67b37dd99/
         arm |                    sudo-1.8.13 | TIM | http://autobuild.buildroot.net/results/7097ea8f7f1c84a21411c138b1ecd9f81782fd33/
    mips64el |              transmission-2.84 | TIM | http://autobuild.buildroot.net/results/8bfc37a89395d2380813b852cfc545e4feef50c6/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/ca75be87ce2d81ac357e5ff8057022ef826752a8/
        i686 |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/1a58cce4b81b980a7f356bbb577b6ec2440e058e/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/86db5714bd6e214f42c8c3046110562e2228ebcf/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/3b9abfd84ada1a41b2e394ef340b3673eb86b762/
        i686 |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/06a7ccd95c435e58cc3e03ca8be3434faa71fd61/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/ff880de50b06f37fea4870ee931b74ac82954804/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/fa70274034d566592a96b49d7f97566900c3a29e/
        mips |                   xerces-3.1.2 | TIM | http://autobuild.buildroot.net/results/69bc435309dd87ccd28b5b6bf56f91ee1e691c0a/


-- 
http://autobuild.buildroot.net
