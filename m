From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-30
Message-ID: <20141031073016.162E2100B71@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-30
===============================

        success : 236
       failures : 76 
       timeouts : 1  
          TOTAL : 313

Classification of failures by reason
====================================

           libmemcached-1.0.18 | 7 
                   libcap-2.24 | 6 
                 samba4-4.1.13 | 5 
                  nuttcp-6.1.2 | 5 
          shairport-sync-2.1.5 | 5 
                  avahi-0.6.31 | 3 
                 libssh2-1.4.3 | 3 
                 pixman-0.32.6 | 2 
                 nss-mdns-0.10 | 2 
                 webkit-1.11.5 | 2 
                     rpm-5.2.0 | 2 
                   mp4v2-2.0.0 | 2 
              host-erlang-17.3 | 2 
tvheadend-596b4e0b29937a612... | 2 
               libglib2-2.40.0 | 2 
                     tcl-8.6.2 | 1 
              uemacs-4.0.15-lt | 1 
             host-mysql-5.1.73 | 1 
                      qt-4.8.6 | 1 
                  python-2.7.8 | 1 
            kismet-2013-03-R1b | 1 
             alsa-utils-1.0.28 | 1 
                libcurl-7.38.0 | 1 
               iptables-1.4.21 | 1 
       directfb-examples-1.6.0 | 1 
                   mono-3.10.0 | 1 
                     vlc-2.1.5 | 1 
                  tstools-1_11 | 1 
          shairport-sync-2.1.8 | 1 
                  libv4l-1.6.0 | 1 
               sdl_sound-1.0.3 | 1 
              libarchive-3.1.2 | 1 
               libsigsegv-2.10 | 1 
                  thrift-0.9.1 | 1 
             e2fsprogs-1.42.12 | 1 
                   duma-2.5.15 | 1 
                    orc-0.4.22 | 1 
           heirloom-mailx-12.5 | 1 
                    ruby-2.1.4 | 1 
                   ushare-1.1a | 1 
                 schifra-0.0.1 | 1 
                   lame-3.99.5 | 1 

Detail of failures
===================

        i686 |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/b1527e96edd185352ba969fa6236ab7b75902bd3/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/81914317ce82dc1321484d8c2b65647f92aa6929/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/3dd913c00c2c568047d86e69e5b2e7ec6343c782/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/02b4ab9ee07707ee4a4d4ea2b9c67bee91b1392d/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/e68c469f459b773d6331ee85d13388b262d404ec/
      x86_64 |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/358293d22ae24237719f0aa27e88e87d03856973/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/72c220f1aa0e329658b7c3910eb8069f4807bd0f/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/ab85520df6c93a40b2c0229737acd26d07be1769/
     powerpc |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/98e1c8f7b0491201a02239b3f5e8991bff54fdb9/
        i486 |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/ef3270251b363aed23f38ad8e562a9660d4f5bce/
         arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/194a96accb55bef2d9fab645c70a959621bfcb12/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/1726e5bd58094e3079c03b217155c752d7bec34a/
         arm |             kismet-2013-03-R1b | NOK | http://autobuild.buildroot.net/results/9f8ce7c0efba3bc6acb1f5983189bffae22fa7e7/
    mips64el |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/65c3cfe08fea5b6e8f25c8bec0d6e21fc60af70e/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/8a4fe4026d28584ecd516258ea985b56f63defbb/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cd4b2b1ce3e5cad8c15ac838dcc113902c6095b3/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f940a4a29dd8de77c08ca49e7c9edac2d95dfb05/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0b679d414893e2242161cbcc27b63a9fb2c7ca79/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b9aa0c62488b44783fdbdb91bb6dbb97ebf24689/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3462803bb3ff0531aa8e3ae08a2387debb3e6e23/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/12ef51927a0c39be929d354e6c30ce78beeab859/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/1783d227cf21fc4d7fd23825e39a6770e3fda1bc/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/887972990bbf1c092f5520e056fdc2122724f640/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/b59aed921e37b138426f42e36a29e1c7230e677d/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/96dd76805af6b26779d26c8bc80d7ad9eae5e565/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/671e4cae2473a8acfed24204099f68470e58edb7/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/6dfba1493f9c8606da688250f84d1334668c7270/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/4c77942faa72f4d73c83667b8892eee4c4a4ac51/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ca9183ab674cdbd8b2fa03dff9cae1e78abdaef6/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/89b3800af60a28088ef66fe4cb36a17d3b09191a/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/79e61489377ee6753dd4aabc0e3861c7230ec93c/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/029ef56b36848cdc365ad690d8bdc449f00db189/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/d42dbb139c3d5959a9c1aca1eb1399a08e4432cc/
     powerpc |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/c87eab6f81883b5d46883e23222ae08dea9a0f9f/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/c3f08b7f770448317b571fc8c8b54595e5f33956/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/75ba14687629da81663f14e21ce9b4246cc5f1dc/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/557b2529bf147ea3bca68a054e2fadea80e2d258/
     powerpc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/773c53c9c7d422b319dc0d9196426cae06d81c14/
     powerpc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/41eb1936c3afe329d1321f5a0f071db098b2fb37/
         arm |                  nss-mdns-0.10 | NOK | http://autobuild.buildroot.net/results/7dba3a78013db577ddd17fc7db4b36ecea2bbc0b/
        i686 |                  nss-mdns-0.10 | NOK | http://autobuild.buildroot.net/results/e390e383f6481c82b936d8a644784803a2536dad/
     aarch64 |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/4810de845bac9ec28cba86379de0f8c554038ea0/
         arm |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/3a86624cc872c5f35c18ffb13e3b49f2a5f62d30/
     powerpc |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/e75c7a958a18c0e8675f5e72cdb87246d1cca4b2/
      mipsel |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/384b627a104793f460072aa43381a8c2d703a693/
        mips |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/2f8574a5bc692e3dfb803b420fb6ae2dc420cfed/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/8fb6ae8f60d036b19067720eac1b0f52dc56e9e9/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/b241ef7b7283efd92028d98355f268d93a12ffdd/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/36cc9386747854b632ec4e22bed8f32a0e2eec32/
      xtensa |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/1935c5d3b1c987c0ae1c2faacf8139d99119f965/
         arm |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/a7a65b9e7676958a8b3e639c00b07c537d9023d7/
    mips64el |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/8ff2cf3eab4eaff630c71ddba6b1b0a9c44d4534/
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/381528f838bfab7ece10bada847d0c9206bfde27/
    mips64el |                     ruby-2.1.4 | NOK | http://autobuild.buildroot.net/results/28da0143bf3bfc00a3c1ab222af45019039a3e6c/
      x86_64 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/b38d093d83c9f974ed9725488ccc11160ab1c816/
    mips64el |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/4c634db7cb7ce0dd2dc098eb035b8ecc513e243a/
        i686 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/d43a359074a2b9378f6cca7d7ca170f5b528b2b6/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/ac2d8d9a4837dac23d42a2825c9f08fbfce4ed77/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/3f2e64eb7819add20e95b9fed3d0a71a14766a9e/
        bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b6f2e6d77df612bd981a3c2126bf680fad4ac47f/
        mips |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/6d2a04afb3bf21ff77102bdd462fe5ffa60f4b8f/
      xtensa |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/d7286bc73c034741d899fb839c918dc3efaa4267/
      xtensa |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/5bf6b400012cc6f55fc7e7eccc07f155b086ed0c/
         arm |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/d06ffb37872590a1c27ac539ba9cf9d878049573/
      x86_64 |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/9cd01fb907c752867506356f863c4ab3f4bad76d/
      xtensa |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/577952ad5f4d0dc45dd4c06bff991d097246bc3b/
      mipsel |           shairport-sync-2.1.8 | NOK | http://autobuild.buildroot.net/results/1b07712a014444ee91b3e144a3a08187c6ee2bfa/
     powerpc |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/8d045d58ea5546aaa35e9b40474f12a75f4e688d/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/59bf8c2945579a50f65cd76f858de37c72a6c9fe/
      x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/8da80e5b795305b7239f60c59cb48b6cae121dfe/
    mips64el | tvheadend-596b4e0b29937a612... | NOK | http://autobuild.buildroot.net/results/3aaa28eb4fd04a5b578c5128b57ce89165e473be/
    mips64el | tvheadend-596b4e0b29937a612... | NOK | http://autobuild.buildroot.net/results/467df0fde737de0ec89fe023b2ce33546543d335/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/1821dbbee1a1988bc2912972acc3d1d942b24d70/
        bfin |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/faa3581ca031116765bb8fe999d18c0b64e1c46b/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/c72a72090aaf51fa26ecb18794b836c20199770f/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/150e88fc0218907cdd688968acad43b4abd7f274/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/fedcc9a609b3e8cb48781d4031caf48f613ee789/


-- 
http://autobuild.buildroot.net
