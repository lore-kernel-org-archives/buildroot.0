From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Nov 2013 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-09
Message-ID: <20131110073023.122F852C60E@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-09
===============================

        success : 91 
       failures : 37 
       timeouts : 0  
          TOTAL : 128

Classification of failures by reason
====================================

                 qt5base-5.1.1 | 7 
                openssl-1.0.1e | 3 
                     m4-1.4.17 | 2 
                beecrypt-4.2.1 | 2 
                      qt-4.8.5 | 2 
                 libnspr-4.9.6 | 1 
                 binutils-2.22 | 1 
                  nettle-2.7.1 | 1 
               libcap-ng-0.7.3 | 1 
                     apr-1.4.8 | 1 
zmqpp-31220ca4a0fb43a0848d7... | 1 
                 libffi-3.0.13 | 1 
                    zlib-1.2.8 | 1 
                keyutils-1.5.5 | 1 
           argp-standalone-1.3 | 1 
           imagemagick-6.8.7-1 | 1 
              vim-699f8d8f096d | 1 
                 erlang-R16B01 | 1 
                 webkit-1.11.5 | 1 
     xlib_libpthread-stubs-0.3 | 1 
          enlightenment-0.17.3 | 1 
                sqlite-3080002 | 1 
                  sawman-1.6.3 | 1 
                rrdtool-1.2.30 | 1 
                    fltk-1.3.2 | 1 
                  aespipe-2.4c | 1 

Detail of failures
===================

      mips |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/8844a3bf054d2c963a74bdfae09330741fc90788/
      mips |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/fe6de7b8294ad059dfca2474481c2c03159b3871/
      mips |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/8362297acbc061fe0cbba6ec9c55fa16b07e2ce6/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/69668a4071350a4e94c6b8e498f10910275a3ffe/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d6d61f6340a8474fbcbb6aa12a00831cdba2d6fc/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/a476260a0fff7ae7502e858b30943d9067fb1214/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/32026206ff9cb2d7436ba1ede08d59dd5cfc563f/
       arc |                  erlang-R16B01 | NOK | http://autobuild.buildroot.net/results/55a9ca707e50ad0bae3891e22da49cf0e68384f8/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9c93637b332917219756d9484b536e66270c8f3b/
   powerpc |            imagemagick-6.8.7-1 | NOK | http://autobuild.buildroot.net/results/aca7b1a5e4a2e32f88482e5a98afa655ee597950/
       arm |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/11bf08760d9216b9e3beb4a38e794379366e1a52/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/fb4cd7f53c56eec70463f2782250881752c5af4e/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/77a6ec72084c71ff1800016954abb91e87953e48/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/57818eaff199c145cc56e14d5f66f530901c0542/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/aef9f8657b77b1eea3fae7c187e59475037df31d/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/c1f90ce60d135f349f09e2ffaec913d586af0dce/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/c14243502b4ad26e67d077fcaf45a454ee0ffbcd/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/31eb4ba3484d4456a25257acd1c55d4a8938aa93/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/6270af5879285515c0593ef258bb5daa4ce0a478/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/dc6b1aba5b81b40b1f3923aaab7aa0bdf69af186/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/159c4c2ba74485b29f3b87f293998378b5ee0b3a/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/1c75939893effc96b6ed1f8fdc5a4043ed725bd6/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/207a6d453fa8dedd34ec8eb1ed584e5b8166fb7c/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/646da7d4eaa4f84e06b9cfaad95b0908df09bd00/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/30dcb41f39bb73251d03d2e721a33ec56bf0897a/
    x86_64 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/f3808b699dfca7965b6e2680708f1a9b4f4b0b98/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/eb627f72c7d3592ba00a42a29439c01abca72251/
    x86_64 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/0dbde103ce8aadb7408561be3682a1679eec2de4/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/a4c85c55678c7cccb72f6313d5b76ec2e064109e/
   powerpc |                 rrdtool-1.2.30 | NOK | http://autobuild.buildroot.net/results/685bed8a842e332b3b03f2fd66d11a63a69101ec/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/fc5f598b7ebdf82125265d0f09db1a5e9fbba2ea/
       arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/0d27928bceaf4faa132521cf498274b210c910c1/
   powerpc |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/93200103875e7509fa8bf969a663a5843ea6e3c5/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/1ce1c9f39752402736407895c165a13741e01218/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/8b3a725bc90473b8660c308cfb0ee13353d0b3bf/
      mips |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/c7f4736be418b676e057820b391fa8c73f57d45a/
       arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/d0a740d4d5414844ca7f2de266fc92223d3d20c8/


-- 
http://autobuild.buildroot.net
