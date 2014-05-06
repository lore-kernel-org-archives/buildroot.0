From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 May 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-05-05
Message-ID: <20140506063010.AD7E9101299@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-05-05
===============================

        success : 81 
       failures : 28 
       timeouts : 0  
          TOTAL : 109

Classification of failures by reason
====================================

          glibc-2.18-svnr23787 | 5 
                 clapack-3.2.1 | 5 
              postgresql-9.3.4 | 4 
                    sdl-1.2.15 | 3 
                  python-2.7.6 | 1 
                p11-kit-0.20.2 | 1 
              wireshark-1.10.7 | 1 
                directfb-1.6.3 | 1 
                   czmq-v2.2.0 | 1 
jack2-ab409a65df95bc261ff72... | 1 
                 cairo-1.12.10 | 1 
             armadillo-4.000.4 | 1 
             dosfstools-3.0.26 | 1 
make: *** [gdb-legal-info] ... | 1 
flann-d0c04f4d290ebc3aa9411... | 1 

Detail of failures
===================

      bfin |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/5e7338492674df410c65a511df65b313047597b4/
    x86_64 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7e518acf0a4c3cca5a02827786db6b80549f80e3/
   powerpc |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/514372d79ca9548ff5921c481bb4106dc28399bf/
      mips |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/bb664779892b0efa9c2031294c0563cb1314979e/
  mips64el |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/5d06ca7042b00ebf3fb70324ff3b229e5f997c7e/
  mips64el |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/83d78c97561c308226c11fffa4f2b7de271cda7f/
  mips64el |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/a0fd49bc9030f85cbe2c94bff21cdccd98f362cb/
      bfin |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/6dd6954e5ab8c422070e53b0e616e1b1a821c626/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/8c6ffa519df45bc6de3b07acb705123f676abe9d/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/c88a03c869c138efac41452bfbaf1e61568500c7/
     nios2 | flann-d0c04f4d290ebc3aa9411... | NOK | http://autobuild.buildroot.net/results/ae5c68b20b5f0cb3d0131db3c9b38661364ee820/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/ff63f70812eb8ab3ceae4efc8754865479ac1a27/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/dd04d058bb26343c9dfded76608929942d83db5a/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/4244da86604fbe1e51da2e7269bd373e8940a178/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/65471a371199f79a60f3a8b881cdf2bdac633336/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/7a828d00f062d33f3fd9df0be6e00f0c4e2459b7/
       arm | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/8cad866c3e91eb13e5d10cd5cc7fdd421a7756f5/
      bfin | make: *** [gdb-legal-info] ... | NOK | http://autobuild.buildroot.net/results/47043d66267affbb6cbd00890a5e72136f5aaa2a/
     avr32 |                 p11-kit-0.20.2 | NOK | http://autobuild.buildroot.net/results/9cb5ebbf726431365e5248496b2d54e487af3246/
    x86_64 |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/4c7504117fe8a3a426cecb79714534694a109ebb/
       arm |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/260170529c7786e24a32323894623ccdb75db3a1/
  mips64el |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/9affb6416f293e049c7971fdc381cd862f5ae3e0/
       arm |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/b9b3fecea5fdc4a1ff5162d2310b9cdcf8098b05/
    xtensa |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/229f34b8ffee8fd5c07f4d007cead112731b93eb/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/37863f5e4a0c12603c2c2240b15d2444b3524ddd/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/182b1c7e0bb6741d43a2dc314650eef68dc6b543/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/fb66c515be1a36c3bb32672e3d71cb360f3d2057/
    x86_64 |               wireshark-1.10.7 | NOK | http://autobuild.buildroot.net/results/1731b4e55b59258246ac8ca23d15932a446f4545/


-- 
http://autobuild.buildroot.net
