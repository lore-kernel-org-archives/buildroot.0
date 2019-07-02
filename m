From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Jul 2019 06:00:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-01
Message-ID: <20190702060050.2996186A40@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  22 |   0 |   0 |  22 |
   2019.05.x |  25 |   1 |   0 |  26 |
      master | 126 |  46 |   0 | 172 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                   mimic-1.1.0 | 1 


Detail of failures
------------------

     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/71653b08006fe2c0d638a504c5a6867817a335f5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.4 | 8 
                       unknown | 6 
              iputils-20190515 | 5 
               libcap-ng-0.7.9 | 3 
                    proj-5.0.1 | 3 
              domoticz-4.10717 | 2 
                 hiawatha-10.9 | 2 
               host-efl-1.22.2 | 2 
            host-mfgtools-0.02 | 2 
              libsecret-0.18.6 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
             xlib_libX11-1.6.8 | 2 
                    efl-1.22.2 | 1 
                harfbuzz-2.5.2 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
              libsodium-1.0.17 | 1 
                   mimic-1.1.0 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

         arm |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/60e1f316d6c22f9ac8ff9a1bcc5ea6ac86b58fe1 |     
         arc |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/9b943ceb2198bbfe0ad3ba22a369ac5bda86828f |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/6bebe94473cbfd3b17676e5765ff7ebec2fec45a |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/eeb4d1592a0861f44e2f87924fb8a3beb5d4981d | ORPH
         arm |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/ae30057b90016e5d8fe214afe74d92d1c6674418 |     
    mips64el |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/be02604250eb4412d3d4d1405924e4e7651238df |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/98aa8f41dbf0667c85f2b56937d91dca10d39ad8 |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/71475a7b6d81b2cc6964f1d7a01473914427382c |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/b6e1d9e02fb6536be43154328bd985300bf51684 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/f80f8431ba8c32b398b2f1f29ddefdb193edb2f4 |     
 powerpc64le |    host-xapp_mkfontscale-1.2.1 | NOK | http://autobuild.buildroot.net/results/a53f3c59c607e1630fde1ae8059960e01876cf3d |     
         sh4 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/e2ad49ca3b59c5d4b0fb883fc3a79483ba023428 |     
microblazeel |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/53c8354aba24ac99a532d3fc50132e4d5eeb1ff6 |     
        mips |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/cf3c2016be18882713a70baa367ef6836df207c1 |     
         sh4 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/c891df50b2ca01c969e5275ca92d74ce861af8ee |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/754179740a63d4c34480804f2b733f687a7128dd |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/892e288102c7f46dfe1099746f3abb9ca15c17c6 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/9dbbe5f51d78bd569bbe22ff83bc682f6d558c45 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/e6b21a60b10bd69c52b89720f0a597afd69c9716 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/3493f37f3c33eba168330b46968ab998cae872a2 |     
        i586 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/f15ed04631b97a9c0754e1f96143051818c98abe |     
      x86_64 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/f6e0dfea675b4d7c38f87f40861c5e66a780739e |     
    mips64el |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/ae0053d8d247b91a4a45e0f1632a7d11e41b5a44 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/44566a7e88d1ff0961f0bffaee8ce14d36bf6b4a |     
     powerpc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/ffed0628a09d12126a014830f28d7046baee338c |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/e02211d365d7805c0cc429e1f47a0fac0cd175d9 |     
         arc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/b90e06ecfc663ce9b0b94927b310c1f3c65e8880 |     
     powerpc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/dfa3a43b752799e890fe7a3af8499f046c189bce |     
microblazeel |               libsecret-0.18.6 | NOK | http://autobuild.buildroot.net/results/30ad181b69380714f45ec2dfa598e3a9aeb5660c | ORPH
         arc |               libsecret-0.18.6 | NOK | http://autobuild.buildroot.net/results/1497d7c2485c4a107ab82c870d78744981efb6d3 | ORPH
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/6e8a2521a2474c9de4d43bb303aa0bc26e4e0561 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/785e8071d6e1fdace76a86955ec2ff8cd858308a |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/733133be8de9f6d3db0d69de571ae6f3fb5dbe36 |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/9aac5cb37c364c984e7577a62357965d6599f983 |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/1037654c65e226e1c1130bd22a4bcf41af7ec704 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/4336c9d11de504a212daa13c85582eca70d64210 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/ae973412934df920ab7291fd7a72d5cd77867609 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/583000f0c31b2055b2bacbcb26c85c4bce39ae33 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/da77b25ff200344ea4f5d35531119936d0919709 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/13976edae26cca2f93f0a0bdbb103b0c02426cb7 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/3d1dbd1ca585c7507d6d9bff5c8f34067c2397cd |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/bd1db60353e4a3b257944ed022bf12b52930a2ba |     
         arm |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/55645b01a1767542f9528f63a73345d033f62653 |     
         arm |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/4df273a621a808660a8f036cef2a585bf8ee6077 |     
   powerpc64 |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/281bd42a69d76ee442350c4e0239e279d8b7f4f7 |     
    mips64el |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/ac7c777e5fe31b6eda8b8b662881b07299e57ae9 |     


-- 
http://autobuild.buildroot.net
