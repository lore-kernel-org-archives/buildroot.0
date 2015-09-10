From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Sep 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-09
Message-ID: <20150910063018.1DE24100E3F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-09
===============================

        success : 225
       failures : 52 
       timeouts : 0  
          TOTAL : 277

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 13
canfestival-7740ac6fdedc23e... | 3 
libyuv-1ebf86795cb213a37f06... | 2 
libbroadvoice-f65b0f50c8c76... | 2 
            ibrdtn-tools-1.0.1 | 2 
                 gnuplot-4.6.6 | 1 
                    iostat-2.2 | 1 
                minidlna-1.1.4 | 1 
                  libnfc-1.7.1 | 1 
               iptables-1.4.21 | 1 
                  tstools-1_11 | 1 
                 dropwatch-1.4 | 1 
                    dash-0.5.8 | 1 
rpi-userland-b864a841e5a459... | 1 
                   bdwgc-7.4.2 | 1 
                busybox-1.23.2 | 1 
                     mtd-1.5.2 | 1 
                directfb-1.6.3 | 1 
                socat-2.0.0-b8 | 1 
                 lvm2-2.02.130 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                      qt-4.8.7 | 1 
xdriver_xf86-video-siliconm... | 1 
             webkitgtk24-2.4.9 | 1 
                dbus-cpp-0.9.0 | 1 
                   open2300-12 | 1 
              strongswan-5.3.3 | 1 
                    qemu-2.3.0 | 1 
                     gdb-7.9.1 | 1 
                 mesa3d-10.6.6 | 1 
                    ustr-1.0.4 | 1 
                coreutils-8.24 | 1 
                  samba4-4.2.3 | 1 
                     tslib-1.1 | 1 
                 sudo-1.8.14p3 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/27e21de3d1b7bb7884bc82a9c704bd09c12aec14/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1c413668cfae6b8c456b54cd74edf8d7a32135a0/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/ef29765946bba3867474d5f86b43bae2fc25c078/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2b2a629182cdf5c6ee2fac77a5df73ef116d15ab/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/fb593c620282a961f58349d2a735e46fd9c1b4db/
      x86_64 |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/73c65930d2254c9018d5171dd7ae8d5222d86a07/
         arm |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/864b897e4559c460e98a1c57513b252c081128d3/
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/7e957aa134a66c3da4aa02af49a2f3269c2115e8/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ff0f8086abc82ad2e934b52faf6f6ec1092afc28/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/e429d17503338af7a91bc6ab1d97261fd7b05b6c/
     aarch64 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/acb1fa660ddfefd08c5e42aa6ba757bb480d8079/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/1804171afa7e08d73a3bdda4dd07c87239404d63/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/4501b0e542a90c71ee29e5ea06e9335054295db0/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/d7c95c89e2567e5d3befa5c8ed5441ae83595fbe/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/a02c6395324b6193da0c3e9547a89f6584efe416/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/dc0fb966bd54b74a71ba0db783b95b4031338903/
        sh4a |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/93e2485a3f886a086badd31eb70166c247b90040/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/a15ceee00e7fa1dbedc8ba36f7bc18829e7097e6/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/cb9393548a83cb3d7ca00e9fa8f0801e6343ca7d/
       sparc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/974a3eaea168b797b82c116a30ad3066ef8a8443/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/dbf40795c0ecdbd38281ad74e0af0074bf0c4164/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e47ba2fcf1fd6b8443cc7e54456fe486eac32e69/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/3b7c13671a0fe6af7a307f59ae01712b25adf9e1/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/5528d92dbe5726bf4bcd3be3a900445d3a8b88e8/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b4d32326c2f577e22e61c9ea5d62b98a6766d3f5/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/d204def495973ab807e80d27b7a68b29e7dfb953/
      mipsel |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/a87a764d3a28f835ed8645923594f7023a662ae8/
      x86_64 |                     iostat-2.2 | NOK | http://autobuild.buildroot.net/results/a22ad6b8af3389bb45cc22881f17a7cf5acd1de2/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/7ab8f7e1a905fc179d75998448be64dab480d76d/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/af2fea1e9fbe2aa6edb35b66b8d88bdf2713721e/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/43af1372bf15868e908ab185d005044509b2ea86/
      x86_64 |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/7ee3f0932f21554c61b90f01a75493300347a0a4/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/634c2bf09b0f2bff3efe6995831fe0a508f8207d/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/0830a876b160797aa53ad8f3559221a1237d9370/
         arm |                  lvm2-2.02.130 | NOK | http://autobuild.buildroot.net/results/4e6e25f02f5197624ce75eb1f8447a7669629b86/
     powerpc |                  mesa3d-10.6.6 | NOK | http://autobuild.buildroot.net/results/83a6d33a05db282d79758c72dfd086d3a7e8c6d0/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/cbf69d3f63edf3f4ab5204fd67865b38da83295a/
      mipsel |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/2ddd714446d9eb75701bd48c117dc5bbbd291a76/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/96f6296d9d8e15a312cd4fba6ae0a0d653aff40f/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/b6ad6d08471f055a4e1f0d0b000472fac774defb/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9a9fd93e2b605ecb3516222dfbb24a083e977e7e/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/11b84a3b9cea3ee3833864a1b2922c1441eb6812/
         arm |                   samba4-4.2.3 | NOK | http://autobuild.buildroot.net/results/17b63c657e74e0136ca04c14acbe2cf15ff27c9a/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/5712070906acb98b321cab82f2f6830ed01bd842/
       nios2 |                 socat-2.0.0-b8 | NOK | http://autobuild.buildroot.net/results/943d4005fc1227bf1ef833938aa0412ff5e2e9cf/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/4a063ac63381fd452cb283db7df5c51107f068da/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/1427589e317bcb709dc208191da683adfd34cd72/
         arm |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/e50e15c57f7196f10759c3a8afcfb03c55fa0296/
         arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/77ed771d14e91c8cf01cd40a80b8d405833ae05d/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/0e90ba880f63c91c19657e3c13effeb0b64ec388/
      x86_64 |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/ca939accd285b0159cbfe5deee1a51bb438159b7/
         arc | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/fc4a0efd47b233743929b8a064ee525a38d4bafc/


-- 
http://autobuild.buildroot.net
