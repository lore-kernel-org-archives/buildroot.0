From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Apr 2018 08:00:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-03
Message-ID: <20180404060008.D9DD12076B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   0 |   0 |  15 |
      master |  94 |  34 |   0 | 128 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              keepalived-1.4.1 | 3 
                  libbsd-0.8.7 | 3 
                     lxc-3.0.0 | 3 
                prosody-0.10.0 | 3 
toolchain-external-codesour... | 3 
                  udftools-2.0 | 3 
             bluez5_utils-5.49 | 2 
                  host-go-1.10 | 2 
toolchain-external-codesour... | 2 
                  cc-tool-0.26 | 1 
gst1-interpipe-10dba89eecc2... | 1 
                   jamvm-2.0.0 | 1 
                    liblo-0.29 | 1 
                   libnss-3.35 | 1 
        python-yieldfrom-1.0.3 | 1 
                      qt-4.8.7 | 1 
toolchain-external-codesour... | 1 
              tpm2-abrmd-1.3.0 | 1 
          usb_modeswitch-2.5.2 | 1 


Detail of failures
------------------

     aarch64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/01299c71c184cf8304986a4c94f52fa8c0f0d88e |     
       nios2 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/6712a13952879711799e15b974558a5181ef2268 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/dd578020ff9bb1db03c7ce15909168e467381b32 |     
      xtensa | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/d28986c9840fe5a0ef1c671af13d87b451cd73f3 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/de297277fe6820fce84f8e08d6a1de73045372fa | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e64981713c42d17b0ac3c9482eca926255d6f8f4 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/8c167a77585b6870cfda038de2dc8675a9e25d79 | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/89fa362aad3b0d7d68ec7c3e9baecd3edba85c45 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/a68b27e2ba39c5fa1222bdf941ef3cfeb052cb5a |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/6a6376e6e5363cbe390f00c16ea0acd0ea54617f |     
        bfin |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/623756fdf1b6cce9b177da5c84f1d12dd1523afc |     
         arm |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/4fb576c644a7322730658ed585bcc4a353a42e85 |     
      xtensa |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/8e4b3a9db756afc5f21cc93f579cd6b7f30a541a |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/9b976c89f809a12c0b2ec2d74d4f68c5a62b9490 | ORPH
     aarch64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/037c772a36762df8febd529b329743d18ffbf66a | ORPH
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/05142ee8f200282fcb30f9000d46b6577d530ed6 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3348c277777562e24be1a4534981cb8725e9f778 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/9c5abf79663e98e544d91baad5d98234eba6c6a1 |     
         arm |                 prosody-0.10.0 | NOK | http://autobuild.buildroot.net/results/42cd6e3be761d1cb358bc50acd7fa58c8aa1c750 |     
        bfin |                 prosody-0.10.0 | NOK | http://autobuild.buildroot.net/results/449d7f021d0bbe3125b7cbe724e0265bf7a016cb |     
        bfin |                 prosody-0.10.0 | NOK | http://autobuild.buildroot.net/results/7faceac0da14bd136d8021d340d1d1c4a056fe00 |     
     sparc64 |         python-yieldfrom-1.0.3 | NOK | http://autobuild.buildroot.net/results/7342b25f01d60cafc4a5422a5a1c282629f361c5 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ddb9a7728856962d9413f4824edd395930d0944b | ORPH
         arm | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/6d8f33d4f333da43e7ebbcb09a815d5be6967588 | ORPH
         arm | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/8640125e50a0aacd132378cd95dfd221fb629cec | ORPH
    mips64el | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/57ecd8b909485798d7c519f819bc87067a8aaf32 | ORPH
       nios2 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/c42a902dde0246ac870ac09f7dc1637b9e7d17eb | ORPH
       nios2 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/01dbbef640d528b261b16ee0a8b6b74f6397d563 | ORPH
       nios2 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/b4af0de4ae9630ccbe7890f69047f216f2ff5119 | ORPH
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/f21d9c0329c589b29017229b7aa1e6934147a21c |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/136f33f7d83bfc1ce0ca6427db11e507ebce9864 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/257177013d50b01d7c8dcd8507ff99cc7b4bd2db |     
     powerpc |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4630236a1c4ad16d428f974aa331b832c92c8093 |     
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/77ec0bb6f90330f05a1479b14e2f54b0e13f34c0 | ORPH


-- 
http://autobuild.buildroot.net
