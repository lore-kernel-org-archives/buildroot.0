From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 08:28:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-25
Message-ID: <20170326062832.244E4207F8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-25
================================

      successes : 118
       failures : 35 
       timeouts : 0  
          TOTAL : 153

Classification of failures by reason
====================================

                  ntp-4.2.8p10 | 11
                    lz4-v1.7.5 | 10
               host-lz4-v1.7.5 | 4 
              ghostscript-9.21 | 2 
                 qt5base-5.8.0 | 2 
             bluez_utils-4.101 | 1 
              leptonica-1.74.1 | 1 
               pulseview-0.3.0 | 1 
                    qemu-2.8.0 | 1 
                 sngrep-v1.4.2 | 1 
                 xenomai-3.0.3 | 1 


Detail of failures
===================

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/d112f2cfc881be80149ea16de9d2fe83e6adfc76 |     
         arm |               ghostscript-9.21 | NOK | http://autobuild.buildroot.net/results/61af9caa7fe6fce6b11f78f66b9d3590f37e92e7 |     
    mips64el |               ghostscript-9.21 | NOK | http://autobuild.buildroot.net/results/904f06e14247c22f740d8fd8902618017e0518f6 |     
microblazeel |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/b24ebe9bf34ea6c17c1f8ffb85da41efa6a68c71 |     
    mips64el |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/cf3620444cce7e9c398b8e753426ab7eb4e7bb71 |     
     aarch64 |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/d3f22e6f1933a2c15f80b18da1345dfd177a65f5 |     
         arm |                host-lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/bd558e79c977646e8904deb429ea71882217989e |     
         arm |               leptonica-1.74.1 | NOK | http://autobuild.buildroot.net/results/f7ea889b2fb96ff7de492e282820c800187573cb |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/38360b04a8901dc1aab0b9c8602deb70f4414af3 |     
       nios2 |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/e4c260eda7973e7a7079c70da63fb42f2cec4fd4 |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/c685fbcbd6d790b1566eaf3cf1f549c94455d6c1 |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/4e4b55be3ef3ab3643bc48e6e81c56d44261e982 |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/7bffc645590b5e9576fe0b465aad9dcbcda8775c |     
      x86_64 |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/b1a44dcad7a047bfd19bbde24db15cdbd1a7337a |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/aa61550c10c3f73824ef808c5d5cc85c7119b47d |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/8f244d15b2ebca032aea050eddd3ea4603ee1b9d |     
         arm |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/1cfcdc0dbe9439ba42930e0569cbf27122556fd0 |     
    mips64el |                     lz4-v1.7.5 | NOK | http://autobuild.buildroot.net/results/6c8afc832f4c26f37c99fbea4068d6ab267aff4a |     
         arm |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/93fe917af55404ffae39f7c6068fc50c62b9b0a7 | ORPH
         arm |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/3fbddd8d752c69b4d5e13d511776decc75d93ad4 | ORPH
         arm |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/048a311f8ae1672ae9e1115eabb6c6315d672d60 | ORPH
        m68k |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/dad8178114d2f8c4aeeb77b4d005ce0e0964fd52 | ORPH
        bfin |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/8f77469dfaa700869e2f126a2a64ac0fa3bc9764 | ORPH
        or1k |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/6273fcc9407e6a2efac6c5d79419fc1b3a13f1a8 | ORPH
      x86_64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/b574985c5d65dae8c2646d100b40b3fd19e66a2a | ORPH
     powerpc |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/1aac8e07bd89d851923da2288be12a988465baaf | ORPH
microblazeel |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/5896ecedb4edf886ed7acc735d0593e81cff8f55 | ORPH
       sparc |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/8577d2bf25260af7cff05fe16374abd18bc887bf | ORPH
    mips64el |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/d09739b8b095cf03e443a49c0dc763fc86d61d54 | ORPH
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/9141766d83f21dcde5936bc33c87773eb38cafbe |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/a75a75fc0056d498578c1c5d067dad11342b762e |     
         arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/4d25cadd0ff0ee8a951d92af8624ec7e9e8be4f1 |     
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/89bf460a68fa11a08065edf71f1bcc45a6a7ed3f |     
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/1a585e203c9b6bc997c5f8fe48c1392e5091881c |     
      x86_64 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/f99cf51c42b845e8a998b40dde25fac984c226a8 |     

-- 
http://autobuild.buildroot.net
