From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 08:00:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-18
Message-ID: <20180519060025.B1070207F4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  33 |   5 |   0 |  38 |
      master | 264 |  19 |   1 | 284 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   libnss-3.33 | 2 
           cups-filters-1.17.9 | 1 
                    quota-4.01 | 1 
                  samba4-4.7.6 | 1 


Detail of failures
------------------

     powerpc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/909eee5621c06aca436eb2fc75ffcaa0c6c68cec |     
     aarch64 |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/b40b82047a93b5f2bb1888a3077179df808c7279 | ORPH
     aarch64 |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/de3307ce0e0cd76a656efa21b5bc4e717244898d | ORPH
        m68k |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/3a73c942e8f21ffa32c3695bf75ec287c07773e5 |     
     aarch64 |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/bad3dd25f1a3701ac7ecdab506d5c29757cb5898 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-faketime-v0.9.6 | 5 
                    quota-4.01 | 5 
                  autofs-5.1.4 | 3 
                  samba4-4.8.1 | 3 
                    efl-1.20.7 | 1 
                qt5base-5.10.1 | 1 
                       unknown | 1 
              wireshark-2.2.14 | 1 


Detail of failures
------------------

       nios2 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/50b66d2a3c8264f618d7aa813b10050ed147209f |     
     powerpc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/0c00f72512754b721813e13f0828d3a942f7b955 |     
      xtensa |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/383bc8462f32a226645c9b792b8d65a25d74529d |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/395b3d8395ed3bab98db5ad6b6726710ee55ef4b |     
      mipsel |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/35fd80d09f8d7f9eb824db973b374c0ae4e112a6 | ORPH
        m68k |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/6e09528f984281e74c47bce05614c2e554009be9 | ORPH
    mips64el |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/a27ed707da704b64bf4b44f212975c98a6c6e730 | ORPH
        m68k |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/2e7f95973ee49f3ac1d52faccbc8d92e25111e0a | ORPH
      mipsel |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/19d42fd2830a3756f63349dd7bb7887498d343d8 | ORPH
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/6dd789aa3af403a853530a51a7db348545a23c81 |     
    mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/8c924f6072a2ee7f7ebeb1d3c3890c8a5e8c152d |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/e16790b595f8aff7a7c17324e9339b24e8b73979 |     
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/69371ac00671884878ae38ad4dbdf87078007a52 |     
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/e49932e9d958203d585cdddd795df06aad6ff3a9 |     
   powerpc64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/730acb23663ebbbaba847073979654670a8bc64c |     
         arm |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/4c228dd6369e4fc11b798af6ab2abe06d7473b78 |     
        mips |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/6f869b8c7c182dfe7f1a291b5952320504540ebf |     
    mips64el |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/a93bdd5665ede10f07fe74fd03d53c774417538f |     
       nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/1272a3aa3077e434c9805ec3034f35e6fcc330d4 |     
      xtensa |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/ce4f8d4165444ebbfb082a8d21909e230d4b20a9 | ORPH


-- 
http://autobuild.buildroot.net
