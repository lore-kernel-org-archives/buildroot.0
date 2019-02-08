From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 08 Feb 2019 07:00:28 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-07
Message-ID: <20190208070033.CC86487848@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   1 |   0 |  19 |
   2018.11.x |  23 |   0 |   0 |  23 |
      master | 231 |  60 |   1 | 292 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              swupdate-2018.11 | 1 


Detail of failures
------------------

microblazeel |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/297e9dd68e3a9604aa8892d5424fdbc1fb43449a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 12
brcm-patchram-plus-94fb127e... | 5 
             gst1-shark-v0.5.5 | 5 
                mongodb-r3.3.4 | 5 
           host-sg3_utils-1.44 | 4 
             libopenssl-1.1.1a | 3 
              sqlcipher-v3.2.0 | 3 
                  brotli-1.0.7 | 2 
                     efivar-35 | 2 
             gnuradio-3.7.13.3 | 2 
               host-qemu-3.1.0 | 2 
                   luvi-v2.7.6 | 2 
                tpm2-tss-2.1.1 | 2 
       gst-plugins-bad-0.10.23 | 1 
                 ibrdtnd-1.0.1 | 1 
       intel-gmmlib-legal-info | 1 
                  libssh-0.8.6 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
               lynx-2.8.9rel.1 | 1 
                 mesa3d-18.3.2 | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
        opentracing-cpp-v1.5.1 | 1 
                     pcre-8.42 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

     sparc64 | brcm-patchram-plus-94fb127e... | NOK | http://autobuild.buildroot.net/results/627e7d96c4ba5b8d33dac38963f41ed65c6fa812 |     
       sparc | brcm-patchram-plus-94fb127e... | NOK | http://autobuild.buildroot.net/results/6bdedce4321f601c97ae9ed08ad472ea5053023a |     
       sparc | brcm-patchram-plus-94fb127e... | NOK | http://autobuild.buildroot.net/results/747b03f800168fce2214f92087a9b56b3a996e60 |     
       sparc | brcm-patchram-plus-94fb127e... | NOK | http://autobuild.buildroot.net/results/0008af21568a6064cd0eb9964dd8fb722b4cf18a |     
     sparc64 | brcm-patchram-plus-94fb127e... | NOK | http://autobuild.buildroot.net/results/43371a9c6ef94f7316207564b6cfbacc81f25b08 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/77818ec1d28b7d3827b584c58d001e202069803e |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/bff37a019f23ee6c825e65a44b95075fbf93e60b |     
    mips64el |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/60239b43fc29ecf2e0466154245116df6bcd6223 |     
     aarch64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/1133247db1f74eb055152f07c71085471972229c |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/83ad6660ba615ae629ddb92f6a63551c65a6f7d8 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3c5ac0f8cb14f0f2991f6eeb8c31e9ad3d1196df |     
     riscv64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/f4a64192994650ac06858bc9f3a84fd96f3517bf | ORPH
     riscv32 |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/1133dbd8d76ddae4aa9a458bec9eec04749352e9 |     
         arc |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/ffa98d300b8f54a6681002c10b15a1ef3c9b6a42 |     
        mips |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/72f0031d6be12a9596f1bd791b813b97e7d3cac2 |     
        i686 |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/23d8b3c4e6d0c1dc3b7fbdbb04dbf0af9e03cef1 |     
     riscv32 |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/cb53fff9f8fd5e4aee58db43177e6406bf7d7c86 |     
         arm |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/9be2fe73ccf7c6c37c22ea778f158b63452184bc |     
         arm |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/391ed1e0d0c5c67a986be0a3d5a5c5c8f46bb725 |     
microblazeel |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/78de904126e54e4cabb41a5f994f55dbd51582bb |     
         arm |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/1c39ab30bf6e969f9810ba65ea6daacda47efc16 |     
microblazeel |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/014f884ee298a818cdc840bd2057f0501f22ba40 |     
     powerpc |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/961caffdde551352e34ef9d906224d297795b155 |     
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/042876247cb6cca90dee32a7b9e4e21ae451a7ef | ORPH
      x86_64 |        intel-gmmlib-legal-info | NOK | http://autobuild.buildroot.net/results/8d262cde3df24148a9073f1123af44ab17a84620 |     
        m68k |              libopenssl-1.1.1a | NOK | http://autobuild.buildroot.net/results/533e817695cde321b725145112cfd83c092d9d75 |     
        m68k |              libopenssl-1.1.1a | NOK | http://autobuild.buildroot.net/results/0cf719a29656a618817dfe682e261b4c87313d5d |     
        m68k |              libopenssl-1.1.1a | NOK | http://autobuild.buildroot.net/results/e5a61882669288dd4fcf8d18cfcfa168d912edc3 |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/6c405b825081804d2e847d74e8b390e64ecc8a43 |     
         arc |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/052c33aff06a5d94687d5d9a100590edfc822cb1 |     
        i586 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/e025cb32de5e5e39ccc7fb3a4ab31f6e72402ca8 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/fba092d49e0ebd0a49ce7967c2811cab73d234d6 |     
microblazeel |                lynx-2.8.9rel.1 | NOK | http://autobuild.buildroot.net/results/c49327e780eff40de87dd3fb69fc5c5bce8b099f |     
         sh4 |                  mesa3d-18.3.2 | NOK | http://autobuild.buildroot.net/results/a4a0ccf7a86ab1ed4a4ed205190f76682c1b849c |     
     aarch64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/a508d4b9c029a782105213eb90cd15dafdec59c9 |     
         arm |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/c532575854ef50c256a12627223a16f9d9fc336f |     
         arm |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/897e5f66584def518ffff21edb4243d16be3bd9f |     
   powerpc64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/c4c46438aa6638affe01ed376fa80ca8e7028bf7 |     
         arm |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/7816569ce08fc1247af23e5bd179d3af4b117284 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/7da77a3e43f0faffcc19935cac0cad7ceee96821 | ORPH
      x86_64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/a94cd367f4c81eb6f8b629405791fc2daee234d7 |     
         arm |         opentracing-cpp-v1.5.1 | NOK | http://autobuild.buildroot.net/results/454173aef9ff7c808294a974088d7682cad240a8 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/a03dc177cea79d31c1fca8f129d83863a203564a | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/3b84b2e805f62df26a3bbfb2f5575367430273ec |     
     sparc64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0afc88b91485964c73bac41876cd9eb43cc9dcac |     
     sparc64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/554bee18f1e0e3b9d75d3c3213e00ff3f1368663 |     
        or1k |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/7a00cabd41e4c5fe23f79e318da7097868e2aab4 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/241c0739f1954d26fa7a60ca273aa72c39c44e3e |     
       sparc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3b49e9f868f2dd40666ff2c962118ba85c9ba650 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/920c11240ea79e2b37e13571ba8a1a309d8c8c64 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/a5518cb212af496b442ff09206418ab093b764cd |     
     sparc64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/99a1a4288a97461018f908117e48f2de6eba23af |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/bfff751f5cc2fe4fe8a593a837f4de8cf5c0caef |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/a6b8eb07b0b619d51c8c7344fb49f9b43c6db2c2 |     
        i586 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/bba3a5f5684409271367658475e70c7472e31b3a |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/75666954af2bc92e150b16b3b323926f279ef37b |     
     riscv32 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/32f6ea780848988f16ffe10589277df7be2b88af |     
    mips64el |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/f224b8fde1b808f680f629c3ea37bea8f91bd03c |     
    mips64el |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/12b631313dfffd7237cbc43ecadb8e865582580a |     
    mips64el |                 tpm2-tss-2.1.1 | NOK | http://autobuild.buildroot.net/results/8d7b6dad6602fe67338abc696bc4752dda8e9717 |     
    mips64el |                 tpm2-tss-2.1.1 | NOK | http://autobuild.buildroot.net/results/9004f87461cae29e340a450d549c73e04c4ec050 |     


-- 
http://autobuild.buildroot.net
