From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-28
Message-ID: <20160429063023.80FEA1024B5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-28
===============================

        success : 153
       failures : 64 
       timeouts : 1  
          TOTAL : 218

Classification of failures by reason
====================================

                    mpv-0.17.0 | 12
                 host-go-1.5.3 | 8 
           host-cryptopp-5.6.3 | 3 
               opencv-2.4.12.3 | 3 
                    cups-2.1.2 | 3 
      ca-certificates-20160104 | 3 
                   mplayer-1.2 | 3 
host-gdb-6be65fb56ea6694a92... | 2 
                  ffmpeg-2.8.6 | 2 
glmark2-499aa81a68fb4c8aac1... | 2 
                     vlc-2.2.2 | 2 
                   erlang-18.3 | 2 
                  psmisc-22.21 | 1 
iputils-3a86a2542c6fe29413c... | 1 
                    ruby-2.3.1 | 1 
                moarvm-2016.04 | 1 
            qt5serialbus-5.6.0 | 1 
           quagga-1.0.20160315 | 1 
               valgrind-3.11.0 | 1 
                 libgee-0.18.0 | 1 
                    ustr-1.0.4 | 1 
            xlib_libXtst-1.2.2 | 1 
                libinput-1.2.4 | 1 
     python-setproctitle-1.1.9 | 1 
                 mesa3d-11.2.1 | 1 
                     mtr-v0.86 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                collectd-5.5.1 | 1 
                 rsyslog-8.9.0 | 1 
                grantlee-0.5.1 | 1 
                 jack2-v1.9.10 | 1 
                blktrace-1.1.0 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a476af82c8fe4a279117314b278b08af9a08fe54/
      mipsel |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/711d7758fb99682ecedbab9d263ec0e36a639e1d/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/46cb1ffb6a8da49563a445fd5fbecfb876ade401/
        mips |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/9f9d7d62447228769039b4705a78c4d8e5e17c04/
         arc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/2f6e5bf172d0c192438537e5a4f443e5eebb3fee/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/436f4a932aacf6d4bf8d73c5f1d568fdc8a4ec66/
      xtensa |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/c4c5fbee706c0ead4771f2bf3a520093bc7b76ac/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/b8ab55291f5dbaa71b7f637ae141d39086cc4b5b/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/a5357c19ead50cf55d034abd1d2b8bf499e3b014/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/e5758cd0ba4d1afca9b64c15e0a2770ab4fbd96a/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/38e4aa861a66dd93bad62a49b2672f5c039e7146/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/717d57f85f915093d240b34a7fee431c90304cf3/
     powerpc | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/b3b5a29bcf5db02ab9162ff1ee55190b1c86af57/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/00bac38bd8657ce4f9114252526d425ad67b223a/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/84ddb6dda40c9cf1a5de21299ba3cd08b2c7239d/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/74600533808904cf5dbe1b9fed4a06699f4ef1de/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/3241465323127d8bfa545c3e45b5a9a9942076c1/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/277414cad0c5ed1ca88fbf73e0c4fff35b713bc8/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/a1d6c7c53ee232815faa691b7a0401a7f501ac3d/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/da4d33196237e874c848c4688cae9856953f8914/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/b7be7c0923233a8aa63fa176de2901577de9fa48/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/83a248184180eaa44e4bdcfb2dd3bee2e9d1c1ca/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/774f548c46b4fe72f08689af73983acaf55d7db9/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/148ae126e7dd00f72bc64496f7638cc3977ad362/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/33403839e0593a73b2847fc7204d073613fdea19/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/77c2d90ab45c596bbdc0e81bd146e242eadf8cd1/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/14e4dd19f112919e6d19195b87afec89c2564db8/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/a780df1687960798de36c7885e05ec2d8c781ee7/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/2e3a76b19b22d684aeea891cf060e51ec65517da/
         arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/e569b290b04b05c369b8c0983e198857d214b170/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/40073a8a4fcf7e28b7bc227b5c91beb5233ec66d/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/df2bf31f84ad6f852b1bb53a5005d72c44984f0b/
         sh4 |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/d2cf9303b52201b01b38ce7620316e3c472ec676/
         arc |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/d3d9317c8f2e54c4cc0d9ed689b499908564c967/
       sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/9502e2d36823ce772f8178e348de45db815a980f/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5b6eafd87c1924f9b1db62c86f9d04010d132d01/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6a86aa2fdeaca767ba525976c19f0a017b2aa1c2/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a7e336ef48d6393ad7da48d8307d7b28eb7aa58f/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/4b98d0c2c0617715e77fb47b3d97037c6b7562ec/
      x86_64 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/569bc3ef35c31833d120dd5546b557dc5dbcfdac/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/578beb2f3b34fc83109e79d8db7de7219dd8340e/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/2a58b31e74e85be5cc36b3e412c2cc7115369b35/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/d70243806098e76adb7155addfae29ee1ff658f5/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/56cddb9b6db910a7c5663ad15ab7950dd95aaad5/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/21ce67041792d29082f5bba76299da19dd1856eb/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/dbdaf0b856129ce84a6291b1afe4acfec4c2777f/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/20b327a5c9fbfdec625502b4e2a9c75fdded7b9c/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/e588e77fe711a71689075a0ee7f62efdc3f19bfe/
      xtensa |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/6af31a381cfc5290e4ee2e6786c9863621b801cf/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/ed2660361c9720e48dd5959f2711fd7f14031b0d/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/97776bff06ea123806f56d4c0a64ef7f5cde6fc1/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/c2931b0225307a898f2e99c13d90e324f31f30e8/
microblazeel |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/cf78139ee70a7a2c321d41d55a7ea928464e4b6b/
       nios2 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/f8039ee162f4ae1fd47750f714954573a3575460/
    mips64el |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/88dc6e6085af7690b4192a328607a113ec4a08af/
         arm |      python-setproctitle-1.1.9 | NOK | http://autobuild.buildroot.net/results/cbdc9be897c6f35a64f79107eadbbbb72fcb2f07/
     powerpc |             qt5serialbus-5.6.0 | NOK | http://autobuild.buildroot.net/results/e73ece09f881a31247c9d8cd049715c1ec689a38/
         arm |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/1f6893a5190a91d249e52d6ae60df28ae362d491/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/0dcc93ce87014f6d9010b457a5e48fc9df0dd7fb/
     powerpc |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/b673dabee3b6abf263c1be48363caaea478fa3d9/
    mips64el |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/ab90b47b6d343973ae32a7e600e3c3d60f542cea/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/d421cb5e9b00831bb07159c2c3b2254ccfab65a6/
        i686 |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/c3405a102f36dd1d9933e71d3502a38c50ad82df/
      xtensa |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/9c4df73cbcf1265457b4cd5ef04bfb27d4fe4459/
         arm |             xlib_libXtst-1.2.2 | TIM | http://autobuild.buildroot.net/results/dbf6edc8a64f3143321ec7daa211671118cabec9/


-- 
http://autobuild.buildroot.net
