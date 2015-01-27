From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-26
Message-ID: <20150127073016.8DE73100E0C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-26
===============================

        success : 266
       failures : 35 
       timeouts : 0  
          TOTAL : 301

Classification of failures by reason
====================================

              host-erlang-17.4 | 6 
                   mono-3.12.0 | 5 
                benejson-0.9.7 | 5 
              host-bison-3.0.3 | 5 
               host-qemu-2.1.2 | 3 
                    mpd-0.19.8 | 3 
           python-pyzmq-14.3.1 | 2 
freerdp-440916eae2e07463912... | 1 
                libsrtp-v1.5.0 | 1 
               dvdauthor-0.7.1 | 1 
               madplay-0.15.2b | 1 
libwebsock-3c1615eeadb0b582... | 1 
   python-zope-interface-4.1.2 | 1 

Detail of failures
===================

        i486 |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/71f19d5056b56d40463b9fef7fa859e0025c4991/
     aarch64 |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/e91e9b5eda81d694853f64b3df8b72932b1eda07/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/0afe005a5be6fdca18b6b2944469c84cbfdcf477/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/4c73c0befd01d7885d2f3fb497f5d5956368487a/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/538aea6a3792f1be4cd5bab1d67059b1142d170d/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/bd79a655853621e12153c1326f510f4f0d51d056/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/53d8edbe1035f4b8886f331f7a4e7ae09e506289/
    mips64el |               host-bison-3.0.3 | NOK | http://autobuild.buildroot.net/results/187c2c3858974bd32313ed2928992d006d4d4251/
    mips64el |               host-bison-3.0.3 | NOK | http://autobuild.buildroot.net/results/ee88f2c2a80dc19699d176ff2acde62fbc8a251f/
         arc |               host-bison-3.0.3 | NOK | http://autobuild.buildroot.net/results/344922bad2ce4272474c3f06d972d707e94214f7/
    mips64el |               host-bison-3.0.3 | NOK | http://autobuild.buildroot.net/results/4b1109cd2d83742b2fe3528d42ff84d4d4f87e29/
         sh4 |               host-bison-3.0.3 | NOK | http://autobuild.buildroot.net/results/3ed083cfcad71a21c455fbd8e947554c07cbf3da/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/dd1e331774cb5c2135b8bb8a5801cef9f89250b2/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/db94883d4643b71d37b2fab95b10c358a7e0a6df/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/17d4f03663221cbd6301b84a4bdf1f5a63cdb03a/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/298c52bce7004dda9c49b5e1b50fad12b640e3b1/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/59633fb5ac532266b060d8d4bfd4192caeb5f607/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/f3e1d915b0df9f92c4c5cc97870a5376a53c885f/
         arm |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/62425cfdd4270bf1a9b15bd57490478b1c04c720/
        i686 |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/79f876adb98ca7d5578e97fd40d9659bc8dd3e9a/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/ddb4418890b58a017de4743c7127e71966c61f03/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/602dbbc495433c4a4b16efbfff1e023883ba6702/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/8b7c87e51f03c874fd6e6f5b6af4cc97db858d9a/
        bfin |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/fcac33e60cfc60254131bf60d418e370b9eb96b8/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/a1d702cfbaeb517340c8a4da23965c86775602fe/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/aab5daa5222f1bebf4c34cfa54ae3336bf3ec84c/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/f4f862cd54d850606560947bbc7839c71455b167/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/66e5414d93d2a451729837bd3ccfbea486b6f958/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/5830c5dd604201b90dd62b8fb3777b54bdab6415/
         sh4 |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/6c64c4629eb15d776e28b5ac2fa065200be22fb4/
         arm |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/69ced52980a40fde10fcfa496fe78767983939eb/
         sh4 |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/14cf165e63fd7bb076d7c8f5aab92d24aa4622c4/
         sh4 |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/478edbe6c67cb5a896d652d2cde50057e6c83ccd/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/4622595791d8f6ba9f1e782d322eead92b4fee44/
         arm |    python-zope-interface-4.1.2 | NOK | http://autobuild.buildroot.net/results/69ffbb3126ba3682406b27723d8a9d079496fd41/


-- 
http://autobuild.buildroot.net
