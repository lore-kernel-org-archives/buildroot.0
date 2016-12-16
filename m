From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Dec 2016 08:29:53 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-15
Message-ID: <20161216072953.18A9220E96@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-15
================================

      successes : 127
       failures : 20 
       timeouts : 2  
          TOTAL : 149

Classification of failures by reason
====================================

kmsxx-bd5f6471e619a6ba2987b... | 2 
                 libnss-3.27.1 | 2 
            lttng-libust-2.9.0 | 2 
                  stunnel-5.36 | 2 
                 synergy-1.3.1 | 2 
                  cjson-v1.1.0 | 1 
                collectd-5.5.2 | 1 
                 jack2-v1.9.10 | 1 
                  lcdapi-v0.10 | 1 
                  libvpx-1.6.0 | 1 
make[1]: *** Waiting for un... | 1 
make[2]: *** [alias.o] Term... | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.22.0 | 1 
                    qemu-2.7.0 | 1 
                    rpm-4.13.0 | 1 
               wireshark-2.2.3 | 1 


Detail of failures
===================

        sh4a |                   cjson-v1.1.0 | NOK | http://autobuild.buildroot.net/results/bea0032c0c19df6a88fee9ea02fd84b002642aec
         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/d6e211e6cc6be1cd9a2b2694e5565caf6a615b3c
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8244e3fdda52d3f4f24d7199e8855c99a2a7b4b1
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/657e5a9d6a8f9b1d77ab657bd346fced29558df4
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/8ec57756ccc1fc5dbffbf87803369a434fe91c62
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/8f4d341b32b293c4561435e88e1faf21c28dc43a
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/6f8aeee7de5cf203f2ca58e09576ba994196b0cf
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/c232aab312cf24ac8b0f983c199271cb1be24ab3
        bfin |                   libvpx-1.6.0 | NOK | http://autobuild.buildroot.net/results/680e4d28644369308944bc18f4ea6a07e4fcf6bd
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/11ee4e8e25be0deff16ff91f77ffd82ca04339da
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/0997a5fc944fbc659db1d739e8dea150aa6e2c4a
      x86_64 | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/5b774eee951ba2a1261ac6bd359bfe1cc14d0a6c
     powerpc | make[2]: *** [alias.o] Term... | TIM | http://autobuild.buildroot.net/results/a122f34aed523cffda8eae540724c7fe971f43a8
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/70ef5939fae758a6d2b9445a14b9f80caf789e92
   powerpc64 |                     mpv-0.22.0 | NOK | http://autobuild.buildroot.net/results/d0f8b5409d2d0219d1156bb8529b62f18b128eb9
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/e20e20aa9ae0b545f1bbaa9032fff3ac4007adbe
         arm |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/2736932c0e1d47011be0f0bc18ad262d46d23efc
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/01b357135df796e8c19e814c3876ae2dad786e2e
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/a8f24a0e366c19df67ff62a1ea9defc9ac57edac
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/f51168a77b46526631cd75c3ea88144116ba647b
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/4dbd52578ebc1b86edb335961b080d592136930b
      x86_64 |                wireshark-2.2.3 | NOK | http://autobuild.buildroot.net/results/190d611a72fdf0784deea1d38561c62e6325cb5b

-- 
http://autobuild.buildroot.net
