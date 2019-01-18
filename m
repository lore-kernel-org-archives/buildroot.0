From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Jan 2019 08:00:24 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-17
Message-ID: <20190118070024.07E672074F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   0 |   0 |  22 |
   2018.11.x |  20 |   0 |   0 |  20 |
      master | 168 |  71 |   3 | 242 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  nettle-3.4.1 | 16
                     php-7.3.0 | 10
   libtorrent-rasterbar-1.1.11 | 6 
zbar-006b465a267ad3c6c754b8... | 6 
             host-grpc-v1.16.1 | 4 
               curlftpfs-0.9.2 | 3 
                 dmalloc-5.5.2 | 2 
                  ffmpeg-3.4.5 | 2 
                     lua-5.3.5 | 2 
                   netsurf-3.8 | 2 
                beecrypt-4.2.1 | 1 
                civetweb-v1.11 | 1 
                collectd-5.7.1 | 1 
                    cups-2.2.7 | 1 
                        glibmm | 1 
                gnuchess-6.2.5 | 1 
                 gnupg2-2.2.12 | 1 
                  gnutls-3.6.5 | 1 
       gst-plugins-bad-0.10.23 | 1 
                 haproxy-1.9.1 | 1 
                        jasper | 1 
                libmad-0.15.1b | 1 
                libnice-0.1.14 | 1 
                  libssh-0.8.6 | 1 
                  linuxptp-2.0 | 1 
                  monkey-1.6.9 | 1 
                    postgresql | 1 
       shadowsocks-libev-3.2.3 | 1 
               skalibs-2.6.4.0 | 1 
                   strace-4.26 | 1 
             stress-ng-0.09.47 | 1 


Detail of failures
------------------

     riscv64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9ea6b10b793ba956c86f87e0a89cb95cbfb252db | ORPH
     riscv32 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/47d4f73d58c15d1256a00bf6b19adadb0ddeb313 |     
     riscv32 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/c089557bed476ede4c50719359e86433d2df003f | ORPH
       sparc |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/441695479db58a7e09214c5f7b937c5d7c5e2558 |     
     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/c6fa3e3eab219b2e6b78a05e830d61d5b691ba05 |     
     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/e6092152392a45811a47cfcccc307b6e5769fa53 |     
     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/87b40be72442dd3dd793dd070ca053fbec769eb0 |     
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/f30a983dd1caf559b8513b3dca61d264ef9a97ff | ORPH
      x86_64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/c8f66ba98028506101cf94af7f95f542ee368fde | ORPH
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/2a56a7edf47b3bf4350d2b62aaaabde386e5000e |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/21366b29a367284903c73eb73a24b5b504e9c5fa |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/02d03f6eedda44e0b0c4cf738323da7a61440612 |     
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/a0a64368e86638bbe4e2ffa8533184512aa037e4 | ORPH
       sparc |                  gnupg2-2.2.12 | NOK | http://autobuild.buildroot.net/results/27f86b4af4c7dc388e69c4bd7590e111cb1e707d | ORPH
       sparc |                   gnutls-3.6.5 | NOK | http://autobuild.buildroot.net/results/6c749bd592ceffeacadd2ab570d127936cce64b2 |     
     powerpc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/a5866c54c6ebb279f5bc9752830251ced366dd25 | ORPH
         sh4 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/2e181cc874d5389f10ecddb0d11253c3aa5e7fc4 |     
        or1k |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/9ee4e368ee574eaa0710c843cf16a8e9faf98a5b |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/f61348cce704901cbffbea04a0a54439bdd82040 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/2bfa79f0fecbe7f58c0948b18474a417db1e4733 |     
microblazeel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/2625cba7fb9d4a7de08e5581d270cb83d2cf0d1a |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/d8362441976cfb5703ebcb5fd4b36f5f503760cc |     
     riscv64 |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/cca898925a08b8bd087aeac97ed772efb974e13d | ORPH
       sparc |                 libnice-0.1.14 | NOK | http://autobuild.buildroot.net/results/30aa83d3cf3482af8a59250c196c85f4a278d343 |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/25b3aeccddf5db3628313f2dd341ecc3603bc251 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/c6c2102ce7684c201ccf69784cb502deba1d3abe |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/7e7e7c333d9a837909157415723917c5b63f4cbd |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/d86e403994711f27697258e971defe1385ab6626 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/38268e86ff83da432d8bf96333010d1d7e9efa6e |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/2b1639d498a785993eecc238e19f63bbb1aa5945 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/3064fb29a385cbd403a055dc25cb81c971ba4b81 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/5001e5a4c367219de4d893d9f46ee6774c69d7ff |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/5064f158645365f6ab9e12ac5064334dcf05e3c9 |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/a560296e667054fef30d417cb7c5cc05d9c26bc0 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/168005f834f9e1a0bed3f9b9d4b9b72669bb73e2 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cabd2256aa54fbd74f17fd78498c36904a895255 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1824de8c0362d696c2428c02ff47fd3777bf9edf |     
        i686 |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/f43fc5920418d6655de1b418ca5a74ec2a991b99 | ORPH
     powerpc |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/1fc7c5382e72ce8ecbf7dbf488caf67de98a41f6 | ORPH
    mips64el |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/62d45784b406423527e95791f236bdd475247905 | ORPH
         arm |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/a7bf7cdc95a3b88de9b75c230800abefe3d0ef2a | ORPH
         arm |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/b12c2ae8cffc36d6d01db57c746de48235dd0254 | ORPH
         arm |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/225a58cb8d5cb5e1f9b5f51980a68942b9690325 | ORPH
        i686 |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/9c1be70b417cbf8cd76b3b0b4c53c9aec6a3d408 | ORPH
         arm |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/0f99e03c6dbaa9f4ec09bacad93bfc7a2c3a567a | ORPH
    mips64el |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/27e9d50fa91c14905062a9106acda2d3f12dfb7c | ORPH
    mips64el |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/7f0900491a57821a4fe0b0dddfc2d701efd9b9fc | ORPH
    mips64el |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/65d8b7e642e8491b8850f37f7f6f2bad9ab7e11b | ORPH
        i686 |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/bdfa29301a1d19488692686003515014729d278f | ORPH
    mips64el |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/58ea4637f1035a32e4be2b28eb775b3cd525bda6 | ORPH
         arm |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/ebfa0524b621ddd88ee348b7db1aa2035f449009 | ORPH
     powerpc |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/4c1050a3c313e16252d15cc7d8963571f47b847f | ORPH
    mips64el |                   nettle-3.4.1 | NOK | http://autobuild.buildroot.net/results/fe9b558d47331cd31bf6d53d1245c7ab9efcd643 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/bc8773c087b5c9ca79f0663dc907f2af7c9e3b26 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/18281fbeae23fa900747cf92a2868411973f3a08 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/56aebf61ebf771d2914f3bb9ed0fc2ff66f60ab5 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3f475675378f05c254239b847ac9e66028d68fb6 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/583af1034110bd11ae7af82f3bff9c5379bbeab8 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/42294bdd0bd2215d3e3bc4a86c60f139434c200d | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f65458f0165bdb2c6d63f6b93e7d177a1c0fe495 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/daf5abe9d1dcfb4cf5957e7ed166d337f23b1d79 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/b90ec49310d66bcbce4af31fa85e76f0c35ee0ad | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/5ec4415b8acd29d44741ac1f6a6edbde47c4da21 | ORPH
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/4b9dd99b772bb76439c482949d96105445ee539e |     
         arm |        shadowsocks-libev-3.2.3 | NOK | http://autobuild.buildroot.net/results/6a3d52607095a9d336f25680b3ce30830d0ad2e4 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/410d2bc01341bbfe8a3bbce7bae88bd771b1ea65 |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/8affc09f7d386bc22c2d55b3efc0fb4b2826ea9b |     
      x86_64 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/380aca8295f4b14f83feb68ceb4454b501eba96d |     
         arc | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/dc672b623aefad00da33eb655d447aca41e12b18 |     
    mips64el | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/232c66925424c48357e6fc143018def3154c6251 |     
microblazeel | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/f912e828d73f61e2bf971b572bcff733d4359fea |     
         arm | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/22175026de7f97f3b6d06a2fc4e5ae873b012253 |     
        mips | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/cefd31ce2b0fa8166fe33e8387f9f20ae96063fc |     
     aarch64 | zbar-006b465a267ad3c6c754b8... | NOK | http://autobuild.buildroot.net/results/630204315eac6e2800bc13c1486a5a525bf9ab37 |     


-- 
http://autobuild.buildroot.net
