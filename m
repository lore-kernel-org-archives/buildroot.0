From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Mar 2017 08:28:45 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-10
Message-ID: <20170311072845.949C8207F9@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-10
================================

      successes : 114
       failures : 36 
       timeouts : 0  
          TOTAL : 150

Classification of failures by reason
====================================

                  libnl-3.2.29 | 18
                 batctl-2016.1 | 2 
                      bmon-4.0 | 2 
                  boost-1.63.0 | 2 
                 dropwatch-1.4 | 2 
           aircrack-ng-1.2-rc1 | 1 
              btrfs-progs-4.10 | 1 
                   hostapd-2.6 | 1 
            ibrdtn-tools-1.0.1 | 1 
           linux-zigbee-v0.3.1 | 1 
                lmbench-3.0-a9 | 1 
                    neard-0.14 | 1 
               polarssl-1.2.19 | 1 
                  powertop-2.7 | 1 
ti-utils-06dbdb2727354b5f3a... | 1 


Detail of failures
===================

     powerpc |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/699f4bd687a2d93de2f851c9d101d26e32808608
        m68k |                  batctl-2016.1 | NOK | http://autobuild.buildroot.net/results/b6a3bd1b0e5cb4a7c0eef88a566a319b8a8ad641
      xtensa |                  batctl-2016.1 | NOK | http://autobuild.buildroot.net/results/911fe854b0453823fc257473f0681f908a3bbc42
microblazeel |                       bmon-4.0 | NOK | http://autobuild.buildroot.net/results/91b80278e62de56406f0f3e5e5131be15d23e1c2
      x86_64 |                       bmon-4.0 | NOK | http://autobuild.buildroot.net/results/21ca67aaf53c3c92e2e1a8ac75f062887c5dfe00
         sh4 |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/d362e7eee7f66768cfdf658effe749a702c50985
        or1k |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/140e7211cbf4ccfcb37d6155d51f22e6213e6341
        i586 |               btrfs-progs-4.10 | NOK | http://autobuild.buildroot.net/results/ab12d07c73e3f8af102f00bd2e7124f6c6a076c3
        bfin |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/baf80ee4c3586035d36a1922f09d84a43bd6afff
     powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/b531f56e15cb8a5194973c38023960ce4568aca2
      mipsel |                    hostapd-2.6 | NOK | http://autobuild.buildroot.net/results/16034c0b1a5917afeb86021f802b6d1433c43129
        or1k |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/c1789a48114afb467b3974c2c3c3e8d159d52d78
        sh4a |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/3b29bc3b5301483b997595f4610e024cee1dff5a
         arm |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/563f46e9a11f9e3b174a4e1308444f284d1b3421
         arm |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/03a4e629dd50de2bb009c3ee51993da7af7a1997
    mips64el |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/ceea635a9d620398cbcd44ccb859b07bf6682780
        sh4a |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/970463b628d9c81d5e217e92a455d2e05d0aa89e
         arm |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/a071a71634db5d5dcb17d7b61af13754a92a78df
      xtensa |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/dce5d21c27df57ac96d9302752dd1802e7a9786b
         arm |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/fde486b548e11e3ed7bf9d9579916102fb61c92c
    mips64el |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/2417157b35a155c427064f823f7e51595ca58941
         arm |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/7cadb911eede56ac26e6eb224a0e69d58935601a
     powerpc |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/e355d941de9af9919de83104ded27d953e66afda
        m68k |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/44dd3db6cdda4646fa12ccf243d6aca16bed3c90
       sparc |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/d9ca7d69f5c8a487808e79bbffeee1c4d5b8c099
      x86_64 |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/17beaa70062e06268b4164eb1be3795c4bc55379
      x86_64 |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/5aef057e1d70bda9e7d75cbeda948db644b018e7
        i686 |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/0b905dd720f13f024601ada4738178f4c0b76a32
      x86_64 |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/e0ac3d4417e4bf19ca26c6db8c1ef44aac8d7eb0
        bfin |                   libnl-3.2.29 | NOK | http://autobuild.buildroot.net/results/c4b1c3f396ddd1d9242aed0953558606f929d57d
         arc |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/fb699ed6f47b340e0b1d0fc645646b3cd0ed4df8
microblazeel |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/261ff25a9db09654a4e77bffb9b2280465e522c7
     powerpc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/9955e23d3224e671e944dae9d40280e1ad2986de
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/06ef15a089283fcfaaaafcab7a161061b1189775
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/d487f9ee646ca3e913f4a4650c57bc5aacb45715
      xtensa | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/2caa7c0bc9372632ea680e1d21d226e54d4bb2fa

-- 
http://autobuild.buildroot.net
