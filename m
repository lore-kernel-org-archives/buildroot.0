From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 09 Feb 2019 07:00:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-08
Message-ID: <20190209070050.97ACD882F3@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  31 |   1 |   0 |  32 |
   2018.11.x |  27 |   0 |   0 |  27 |
      master | 260 |  49 |   2 | 311 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                beecrypt-4.2.1 | 1 


Detail of failures
------------------

         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3d786973c53d300ef7639c493c04fc50b136a7b1 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              sqlcipher-v3.2.0 | 8 
                 qt5base-5.6.3 | 6 
                     efivar-35 | 4 
           host-sg3_utils-1.44 | 4 
                   netsnmp-5.8 | 4 
             gst1-shark-v0.5.5 | 3 
                 ibrdtnd-1.0.1 | 3 
              lua-curl-0.3.9-1 | 2 
brcm-patchram-plus-94fb127e... | 1 
                  brotli-1.0.7 | 1 
                gerbera-v1.3.0 | 1 
                        glibmm | 1 
       gst-plugins-bad-0.10.23 | 1 
           host-cryptopp-8.0.0 | 1 
                ipmiutil-3.1.2 | 1 
             libopenssl-1.1.1a | 1 
                  linuxptp-2.0 | 1 
                   mpd-0.20.23 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
package/intel-gmmlib/intel-... | 1 
                qt5base-5.11.3 | 1 
               qt5webkit-5.9.1 | 1 
                   tor-0.3.5.7 | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

     sparc64 | brcm-patchram-plus-94fb127e... | NOK | http://autobuild.buildroot.net/results/f7012c08c935c3a6ccae50b84170190af5cd5cba |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/d8fd26e6f8f97a4f1c5624102f0493df9897069b |     
      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/030655cd60954a000c3ad5758bc02f162fd960c5 |     
         arm |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/f172359aeaeadd74bac2764c77f786032828c04c |     
 powerpc64le |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/7f4efb38df65a0668a15247c9cfd49ceab574bfd |     
         arm |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/d00a43da391bfb47d8b89b395ceb05d3bcfab6bd |     
         arc |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/6405647b47b132ff5d0d211b92d407322d52d507 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/2d9a807d4042293a6021b58155269ad282c83990 |     
     aarch64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/8fe081b0d3d90cf2754dcc67e0ea8932fa75592d | ORPH
     riscv64 |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/4246402c3f813e3377e760b4b81a1f5e30682bfb |     
        mips |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/8029aa037a91836cc8bfd9bc06cafbd4a79c9d52 |     
     riscv32 |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/bc50e8bb445c2f7eb708890fbf54de476e8f980f |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/3b5796e990f692e7a403622d5b03153650cfb0f7 |     
        i686 |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/46358f9ccfa8f2a6582e243c9489fd188709cd4c |     
     riscv64 |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/f34b071391ce4f0406c93229643da6dfc9da9839 |     
      mipsel |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/722c6fe9f785f9075670a13795d0c411811078f2 |     
         sh4 |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/8d3d8e56f2f4dd3454d0c4f675c4c70b39ea9a0a |     
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/149816e145ec71443effb1669c781df56f7f7ea5 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/4eb3dcd6e76bc15d364059c6be6444f4c1fc7f1b | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/abe4ec710458dbd3f38400e5644417e81c6d3da8 | ORPH
        i686 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/ddb4bb1c31071b8e2d1e52711e4c9f7bc97b4fdd |     
        m68k |              libopenssl-1.1.1a | NOK | http://autobuild.buildroot.net/results/4ee22cfd378b6708a3eb1b4f3bc00cb4fea6d5ec |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/f0cfceb9b6dca0213f138a4a5eee1d0a888a1bc2 |     
     powerpc |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/a6aa41870ee83f9537a78869cae36194c3d521cb |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/033652250a2947991d41cd1f9f5057540213d3f7 |     
        or1k |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/a4148e516070b79816769f3443fc24d6d8192073 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/75fb65727b20c3e6dbacf8e7d060fbd5909d7dbb | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/3742211a155441f0a6f677ff3a26a07109b1911a | ORPH
microblazeel |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/eee5f305e5a588abed9d0dc86423a3992252410e | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/836cf1f86511e6b6d8d5fb4c4d9d3b2651862e68 | ORPH
      mipsel |                        netsurf | TIM | http://autobuild.buildroot.net/results/6655dbb663a99fb09c57c7f5753a81504594e570 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/33f9d520e809d60d8cd0d28fd7f3bf1ff05c4540 |     
      x86_64 | package/intel-gmmlib/intel-... | NOK | http://autobuild.buildroot.net/results/09e4c14effe58ec2bc6f3deede7cc17ae6590767 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/b27f3a07a77a1361161250f4d67f083cf096eab1 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/431f607052704237b3165b32372f7cd1411853de |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/f5f79056f0cee8c62056362677d716233f46285c |     
     aarch64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d1002e2cff9f61470c9ab56a54823aa6ec43d74d |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/a1bc2c2c63cc37db835cc3a57dec650815071d3c |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d6371cd60491d2bbac1cdb53ed356ed31c44a70d |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3986aed986908482f2f6fc7da24fc72efb91239e |     
      x86_64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/e843f5972061fbb97f759b8ccd25063b47891b04 |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/e2718956932b7bf71d39b8a861c1444b33f4ce08 |     
       nios2 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/1a47b20a286443e3867e9106d56dd9476273c964 |     
       nios2 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/a286af8aaa225d5b1ad92868535be1be47b9a0ee |     
    mips64el |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/1e92636505cf1caf2849da1b0dc135e85b62a751 |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/b190bbc0d8b9fcd349140da62ecdca977f192b34 |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/40447a6430adb8cf295891f892c1f3069c2ea869 |     
microblazeel |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/65073a3a3a1b86b792458a42dc06781bb9dc6842 |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/c2e95158fa69eacb58036f89e42c51353fe39db9 |     
         arm |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/ad213cc1c2fb1849e8b46223be6d159fa3dcddc8 |     
     aarch64 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/fb4c4961a514929fb1705c4b9d03711ad9d769f7 | ORPH


-- 
http://autobuild.buildroot.net
