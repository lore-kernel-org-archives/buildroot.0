From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Jan 2015 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-16
Message-ID: <20150117073015.15AC610102E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-16
===============================

        success : 290
       failures : 34 
       timeouts : 3  
          TOTAL : 327

Classification of failures by reason
====================================

kexec-lite-fb8543fea3beb052... | 5 
               host-qemu-2.1.2 | 4 
           python-pyzmq-14.3.1 | 4 
                     rpm-5.2.0 | 4 
          sane-backends-1.0.22 | 3 
          libmicrohttpd-0.9.38 | 2 
            gst-ffmpeg-0.10.13 | 1 
                     ntp-4.2.8 | 1 
              host-erlang-17.4 | 1 
                libsrtp-v1.5.0 | 1 
                 python3-3.4.2 | 1 
checking whether __clang__ ... | 1 
               lightning-2.0.5 | 1 
           libmemcached-1.0.18 | 1 
        host-xlib_libX11-1.6.2 | 1 
               dvdauthor-0.7.1 | 1 
                 cdrkit-1.1.11 | 1 
freerdp-440916eae2e07463912... | 1 
             host-python-2.7.9 | 1 
            host-omniorb-4.2.0 | 1 
                  weston-1.6.0 | 1 

Detail of failures
===================

      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/96572da30315aec729acfa0943da273ddfb96dd5/
        i686 | checking whether __clang__ ... | TIM | http://autobuild.buildroot.net/results/4e25eef7a4f4d75ca3e56b2a01294b3ad4d53bd8/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/767f06c3142b1c2d367265dab9b1511d92d0a7ad/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/f145f25d01584a8b7b43d8cbc5356e3afcad5072/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/395a4f919fe9c6237cc3fdc9cff76c34b9cb6b89/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/f7f58e311df677d12b2d06b44d84bb44bdccd21c/
      x86_64 |             host-omniorb-4.2.0 | NOK | http://autobuild.buildroot.net/results/33fd991d35cfa5fee6bd062ebca91cdb9bf3df93/
     powerpc |              host-python-2.7.9 | NOK | http://autobuild.buildroot.net/results/4813700333da788b7426e56f082e817a320412ad/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/a0f6a72fd15f4d7c933673a61d6651a503f982ba/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/21968f2581f300d6dc0c41a24f110d66ac548e09/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/1957ae7c88f4197272341e5a9d83fe7f3ab2570a/
        bfin |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/085fd44b7523012dd95cb91784862f3354486151/
         arm |         host-xlib_libX11-1.6.2 | TIM | http://autobuild.buildroot.net/results/0b6170fdd03c7a04198e7eac47b28a3f9215222e/
     powerpc | kexec-lite-fb8543fea3beb052... | NOK | http://autobuild.buildroot.net/results/b09f15c7b59e972d2180d071804810315d2ee047/
     powerpc | kexec-lite-fb8543fea3beb052... | NOK | http://autobuild.buildroot.net/results/a72ef17655adf3261a3d7c67c6b046affab1fa06/
     powerpc | kexec-lite-fb8543fea3beb052... | NOK | http://autobuild.buildroot.net/results/ffac8b8296f8666108e6154515286606667c3b09/
     powerpc | kexec-lite-fb8543fea3beb052... | NOK | http://autobuild.buildroot.net/results/02376cd3dccc98d10a58e5398b9f8db75239f263/
     powerpc | kexec-lite-fb8543fea3beb052... | NOK | http://autobuild.buildroot.net/results/515d32e45957e911fda6345f909fa9200df311ff/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/87617bce854c1f4faa935ca5ba828a57a83252e6/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/5b3b86f55a7181650d3e4605a2c294f2fb2f7bdb/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/b7893212c6dd0dc01b57370277af8fac6e89e4a7/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/52af0bb64af943b20d71c9089f0d199a5e417504/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/ee05c3ae5db621f0a062e9d60a82159782b72672/
        bfin |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/a6296a2cc9a1a08dd99582bdd65dfea91b1c7e30/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/3076f5dcbe558bbfa26bad42d31c61aab5445b58/
         arc |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/17825c18c361a1f8b8aaf0118af1646c971006d4/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/0cab05b4966de112bf304521dd6403fb88011186/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/dd3d028fb0f3b0178f0c25abe5e9da4a06a925e0/
     powerpc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/19a93c5bfee333019cd178da37d9ba256827fc08/
      xtensa |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/f9c5ea16f481339bde7457a1069c4cd886cdeefb/
        sh4a |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/cb699c08ac22371780560c94c4b48b54a9ad0e60/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/2c61562008418ff58fa3085a3342b0e304923073/
     powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/937e34fd992d84ade7ffb7eca3a122ca389d2f8f/
     powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/47b69b42aaa68ed1c81b064bc56daabc5d85e37b/
         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/11e80cc75f0d5968707bd2dbe94985f8675ea615/
        i686 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/ab9bb998519b2e6db2e3d35c3fac7517170b9284/
         arm |                   weston-1.6.0 | NOK | http://autobuild.buildroot.net/results/3f905e5e53e00be8946d8e479f731fc46745aa25/


-- 
http://autobuild.buildroot.net
