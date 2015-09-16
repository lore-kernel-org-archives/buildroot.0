From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-15
Message-ID: <20150916063011.B01A8102A34@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-15
===============================

        success : 225
       failures : 46 
       timeouts : 0  
          TOTAL : 271

Classification of failures by reason
====================================

libbroadvoice-f65b0f50c8c76... | 4 
                busybox-1.23.2 | 4 
                directfb-1.7.7 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
               iptables-1.4.21 | 2 
rpi-userland-b864a841e5a459... | 2 
                 mesa3d-10.6.7 | 2 
                  mono-4.0.2.5 | 2 
      host-gdb-arc-2015.06-gdb | 1 
              drbd-utils-8.9.1 | 1 
ltrace-c22d359433b333937ee3... | 1 
                      qt-4.8.7 | 1 
                    ruby-2.2.3 | 1 
             ebtables-2.0.10-4 | 1 
                mongrel2-1.9.2 | 1 
                iprutils-2.4.5 | 1 
         qt5imageformats-5.5.0 | 1 
                   kexec-2.0.9 | 1 
              strongswan-5.3.3 | 1 
             lttng-tools-2.6.0 | 1 
                    faifa-v0.1 | 1 
                  c-icap-0.3.5 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
             bluez_utils-4.101 | 1 
                coreutils-8.24 | 1 
            gst-ffmpeg-0.10.13 | 1 
           libfreeimage-3.17.0 | 1 
                libnspr-4.10.8 | 1 
               nfs-utils-1.3.2 | 1 
                openntpd-5.7p4 | 1 
                minidlna-1.1.4 | 1 
                  apitrace-7.0 | 1 
                  libftdi-0.20 | 1 
                   bdwgc-7.4.2 | 1 

Detail of failures
===================

     powerpc |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/2d24a1ef84d3b71e24d332c3f302a9d2d6723638/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/b2722f3d9d4f997c5b07322cd0c418d11030100f/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/82c5ee432d32777ccb133fa2baa90dbf88a347d9/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d7b2997341c9d15a9b7836a8fff2b0d94d0ed626/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7cbd13daa4421d38268c8f9f95c010644886c546/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/dcdec25ac46e4f6d7bb6a2c0a37a4c23118b6c05/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2ed92115ec2c59e5114cbc023f028e9ff674db4c/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/c1e37c23059df310e1bfcdd4c3d87fad0f1f3904/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/f2041f62a4035bc349c9908e7c85a64210f9abb1/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/e57d5a8da4e94563d7cf4ead0269b78a7a48b8b5/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/eaeda2393aece2b0f339df24cfb75a0f9d112c54/
      x86_64 |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/acc603468b788c510ad5b20bf58a9bcba68e3cc4/
      x86_64 |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/792f21e02c016c0dd88f3b211fa71c2f07ed90b9/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/03f606c980b5773a6e6e2c064e29bf0fcecc6cc0/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/78d5c7b24aa3bd93c862a69377f23b429b5248c3/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1a03aabcb86da9e5f7663dde364cd543b9567bd5/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/54b14bb681b1de1e7caf22aa8fa927b27d3b584d/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/549f7d6b71278d5c94de43fb7c78642691c4d856/
      x86_64 |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/57e455fcfaf44c5f1b664e259bb51b22fc105beb/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/0120cdf7da7be151fd14d5872718a8ff0b870f97/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/7ad40150e931a7909700a71dd1b823c8bb5c16e5/
      x86_64 |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/cf537a8b51b225d67112c69c1a71d7a56af457d1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ab3f629ae75683f3c37fa039e74a23ed4bd1599b/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/1999be18c8ade725ba25aea0c260dc1ee86b2d4c/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/3ea84304fd4af4893aa12de419173729ed7d2130/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/099efaacb950943a12b91b9c22c318142569238a/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/970c880d9aa3733b0293d3e78a5c43e2d23f2f68/
      x86_64 |                   libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/74bcedc0c296b4644ac9a8c2fc06d12338537724/
         arm |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/d0442adc4e5074fdbca791618ceaf445203328b0/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/3a6ef00b42c01c70ee3b4b71613c9ef574f835f5/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/3ebbf044cd967bb6338a486d64fc99155a3e1867/
     powerpc |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/67340a3dd56d4cf7c3407121453773e507d74ca2/
        i686 |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/021abb8594799e0a0af9b21f86078df93f942c1c/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/93687b337695950507f12c0e0ce54bf254b207c3/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/3f52248bd9a8d47a51b0c38cc63e5e5b02b3ef81/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/0bb4b240de61440cf265f272beba3a1ac3d6f119/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/7aa4b12e1673e40d86ab529d9558ff4e1ca0397e/
         arm |                nfs-utils-1.3.2 | NOK | http://autobuild.buildroot.net/results/2d5bb262b7636c13d1a961cade45a69492d1de5c/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/f8b582ee5c57fd06cf34a0eac9c6f9d51ae1a445/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/8a742d8603210cfc3bff2817e625a07337885586/
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/29d9efbe36e90aa10dc4edc8dc75b1851acaa4f5/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/d3b2ddb6907b5f6be92f45707bf0ae42f7bfa4e5/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/01c083df6916c22397b796feeda2d69516bb3aca/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/7232c40eb993765b151fff9c7cdf75a0999190ec/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/38cfa4e7249a8770b06dbd392acba79303d3f9bc/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/ce9af30b8c6b6f634285185ed12dab78f0a7e31a/


-- 
http://autobuild.buildroot.net
