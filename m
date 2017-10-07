From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Oct 2017 08:31:00 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-06
Message-ID: <20171007063100.601F420922@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-06
================================

      successes : 206
       failures : 48 
       timeouts : 0  
          TOTAL : 254

Classification of failures by reason
====================================

                     nmap-7.60 | 7 
      host-uboot-tools-2017.07 | 6 
                    flex-2.6.4 | 5 
                 mesa3d-17.2.2 | 5 
              lbase64-20120820 | 4 
             dbus-python-1.2.4 | 3 
            host-lvm2-2.02.173 | 3 
                    sdl2-2.0.6 | 2 
         xkeyboard-config-2.22 | 2 
                 cdrkit-1.1.11 | 1 
                   evemu-2.7.0 | 1 
                grantlee-5.1.0 | 1 
                host-m4-1.4.18 | 1 
                      lzo-2.10 | 1 
                openobex-1.7.2 | 1 
                   perl-5.26.1 | 1 
         python-gobject-2.28.6 | 1 
                      qt-4.8.7 | 1 
           qt5multimedia-5.9.1 | 1 
                      x265-2.5 | 1 


Detail of failures
===================

      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/4f9592171809743364400b8f2f7c271a2b65113c |     
        i686 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/1f184b9a19f9a5b065be5956b6208a2fcfc57ee0 | ORPH
     aarch64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/442e496e192d073621e4999f276120fdf972514f | ORPH
     sparc64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/d6074477b9231043e08a2d7aba7e1eb66f662ec3 | ORPH
      x86_64 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/37a443604cd328f8d10db927c8c88908fc6c05ba |     
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/d7003fb8e70861046ce3c269ba44d59a68190715 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/c02720b0f602fd6749be7d32b024d6cfac1b0a07 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/a185f43ba7be8d46828fcb44273c8a5f4b6087bd | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/d6afeb0b82e494c2ffee6e316509d1a247adf215 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/5eb278a4ad478449c6e8e6465ce1c33dfc431fcc | ORPH
      mipsel |                 grantlee-5.1.0 | NOK | http://autobuild.buildroot.net/results/03139406299771339fc38663b440fc742da3c7c4 |     
    mips64el |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/c95ba5ee0b0407288d0b4b2707e08d66c7347aa6 | ORPH
       nios2 |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/6821c3200473aa2335dc973eebeda637efe18c75 | ORPH
        bfin |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/5a9fc94697982858a41466b8ebf066740003ee95 | ORPH
     sparc64 |                 host-m4-1.4.18 | NOK | http://autobuild.buildroot.net/results/ba8768b1a0e033f01cca14a7154aa99a44b371ab | ORPH
     powerpc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e623156a31ca3369bfbfe398815e5c05e8555ee7 | ORPH
microblazeel |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/afdf5d94e7caa48a572fdfcc1c8a536a55041952 | ORPH
microblazeel |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/3ccacccd8cd471d091daa2a45776a847ece91b04 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/4cb956796ff7847ea16970769f1ce6af325d37f7 | ORPH
     powerpc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/9ab97966c2545045b36cf4f045123c7bff850fd7 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/2a7a21901ec3a12d40da83c0f505343572feb91b | ORPH
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/a4d28af5473b16458f4f77daf2985f31ff0118d4 |     
        or1k |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/243bdbf8380e4cc63d4e69dcab63c9c7e3b8254d |     
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/d67332495bfb9ea7c33540753751eb8499e4bc33 |     
microblazeel |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/e5f92186a047f80580bfa85ad5599d2d0a0972f1 |     
      xtensa |                       lzo-2.10 | NOK | http://autobuild.buildroot.net/results/d1181a4313fe905bec6574be787560a4f77d5d8b | ORPH
         arc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/30b224524feda3136c528f805a8a189213b56cab |     
     powerpc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/458f695bcb0021fc869e2e70820b037a66df586a |     
        i686 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/30cea010b59ed3fc8be6e706fb6fc08ed36de4c1 |     
 powerpc64le |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/4aecdda49fb351a4d06d9ea68ebf885df57c1134 |     
      x86_64 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/6e4fcef6d3c96dc9034aa5147f94a17463973e02 |     
        i686 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/17e8a701f5725650abb2395f9bde8f4820b7407e |     
      x86_64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/3d1885b17afe5035a9a9e928ecce680c55439d15 |     
      xtensa |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/3d597303ee40b1304975b02f406e09e159d94168 |     
        i686 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/4431c01dca29671147f5377cddd68380953add62 |     
microblazeel |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/94e7d43089b242ff9d3b30a89c1c7b8afb06e617 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/f0fdfba1f16e905d35ef233985520232d6d3df89 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/e1fdda1ee05431b94739cb5b21f4c41e0b2b5493 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/8185423b12c509e901262d309a6611a5dc38ea27 |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/c893e92c53d68aec192bf05f08f5b04cd802cea3 |     
       nios2 |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/3ecdbf06d7ef83d46f6c23b2aaf38a88e3b590b2 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b914328c24bb6d21a4bab528028d0a69962d16c3 | ORPH
     sparc64 |            qt5multimedia-5.9.1 | NOK | http://autobuild.buildroot.net/results/d8ce4534d3ad07a4a2ac91f97a2f9f9f5eb18d2d |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/6b260c853fc1999294de2c43db495219bf4ce78c |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/348340c84bc8fbdbafb7c51d8bf61999e888cc35 |     
        i686 |                       x265-2.5 | NOK | http://autobuild.buildroot.net/results/d0bbd9c84c574fd961189c9a623b72320202dbf5 |     
         arm |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/33692ab886a73dba2ae927ed808a4c475c24c34e |     
         arm |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/d8d135520a8b05ef773758ccfc1854024adac60f |     

-- 
http://autobuild.buildroot.net
