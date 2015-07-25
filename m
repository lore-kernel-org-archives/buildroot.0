From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jul 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-24
Message-ID: <20150725063019.0CB80102476@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-24
===============================

        success : 168
       failures : 165
       timeouts : 4  
          TOTAL : 337

Classification of failures by reason
====================================

                busybox-1.23.2 | 80
                  ffmpeg-2.7.1 | 7 
        host-gcc-initial-4.9.3 | 5 
                  acpid-2.0.22 | 4 
       host-erlang-rebar-2.5.1 | 4 
                   argus-3.0.8 | 4 
                      atf-0.21 | 4 
             expect-2014-05-02 | 3 
                  zeromq-4.0.5 | 3 
libsigrok-fe473123ba836445d... | 3 
                iproute2-4.1.1 | 3 
               libglib2-2.44.1 | 3 
                  c-icap-0.3.5 | 2 
                   audit-2.4.3 | 2 
                  midori-0.4.6 | 2 
                   bdwgc-7.4.2 | 2 
                  boost-1.58.0 | 2 
             libselinux-2.1.13 | 2 
                 qt5base-5.5.0 | 2 
                 lrzsz-0.12.20 | 2 
             util-linux-2.26.2 | 1 
               audiofile-0.3.6 | 1 
            host-nodejs-0.12.7 | 1 
                    bwm-ng-0.6 | 1 
                  cppcms-1.0.4 | 1 
bullet-19f999ac087e68ffc255... | 1 
                twolame-0.3.13 | 1 
               curlftpfs-0.9.2 | 1 
                 netsnmp-5.7.3 | 1 
               kodi-14.2-Helix | 1 
                 clapack-3.2.1 | 1 
                    ustr-1.0.4 | 1 
                cppunit-1.13.2 | 1 
               linux-pam-1.1.8 | 1 
              lirc-tools-0.9.2 | 1 
                 cdrkit-1.1.11 | 1 
               polarssl-1.2.14 | 1 
                  ltris-1.0.19 | 1 
           qt5multimedia-5.5.0 | 1 
             armadillo-5.100.2 | 1 
libatomic_ops-libatomic_ops... | 1 
                minidlna-1.1.4 | 1 
                 libpfm4-4.3.0 | 1 
               arptables-0.0.4 | 1 
                  dhcpdump-1.8 | 1 
                   systemd-221 | 1 
make: *** [qt5websockets-le... | 1 
                    qemu-2.3.0 | 1 
                 iperf3-3.0.10 | 1 
                 mesa3d-10.6.2 | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/0f41e6b767c9377fa4f7c3acff35abeb8f72cf89/
      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/0b2a49cdb1499b1abd874f2eba4bb87c936d8a57/
      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/e25de201c29da3d70f7ed68561441e2f59dc18c1/
      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/a3e75cdd1b56124275c8fb61957ade88cf658e18/
      x86_64 |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/b6bc8d5d381c8247605c061df263674f1909164c/
microblazeel |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/1690b640efc6e9b8b5762f14b6005c5d52801681/
     powerpc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/16f5c2ab2788546cfa2b52cb352e32921d24d842/
         arm |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/82f05511e6276dd8f046afd856478c28e60777fb/
         arc |              armadillo-5.100.2 | NOK | http://autobuild.buildroot.net/results/1fcca883cbf36187532a735652ea4a4a8589990b/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/d4f802db6533ea5fc46838515ab36efd63c10e27/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/c84c9afb1294521c1f1449b236c42b18d1e359fc/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/9290a39d9b77e5a57e59912ce3d901149e9d6c11/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/d2f72f58c0808c9c199a527114fda7bdeb4d6039/
         arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/14e76deba1afb6c2f4c67dcebd322fd22013bc7e/
         arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/84650d52d42d9e0c5fb6e396b0761aa32dc5b26c/
      x86_64 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/6203caa999bffabe4fa622d62fb9b9306c761006/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/b08e693a40e03d8b3a2b34782556b177188988e2/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/2390e9b855ce551b5fa59bb21332a946fc877e3f/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/f43b5d2e796de42884c8071619f5056276c224c7/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/33b2b0528bf239747991b91a065f5583ebb8dec9/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/59ef7af2691569ed16ece682cd3c34e0ff74cb21/
         arc | bullet-19f999ac087e68ffc255... | NOK | http://autobuild.buildroot.net/results/9712673e30e367e8b372f5d5f71e00a92052ce3a/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a06470de350a2808e565d651cd30007ed6af2889/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/602f1f73ce9369bdf55cb53685821d819df61e1d/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f9d37314bcc379ea80ae8e2960bb726cd7e1adf1/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6a5fe6d458af8af5fe0c2f6ca0cfbf1dba2a2ec7/
        bfin |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/33f1849c6d1441d8565835872281e33a980aba6f/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f0b5b4d92134ff104198e959cb74bc390e553202/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4316a5894a67cdfdc312587dac7c59ba0be4fc2d/
        i686 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2d76896f821084272234ea87ae55a3c0a0496a54/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/477672b5fc80cff0ce8801713ce904da595da70d/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1a7231a1bf81ff3c09ac4d18db887a74d57ef5de/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/40697f11970fd6d7faefee2af2d5f83558039257/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5e75e6ea8a21e4c4cb241a7d1e783357dc70caa3/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/898281b4f86218e46cf0134d20f8077b77af272d/
        i686 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2fb4535ab3ff9c56fb18df5dd83733c45fe71f4a/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8a6fe6962a052e0a31a253f6206fbf789f7ac6a8/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9d371a341e9447eb3ef21db495d8e9f25f547ff1/
        sh4a |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/db255f70f7411b860c6b3b5677837bfc84b937c0/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e1f3115e1a95c055fa9bcf01e65b964579a1deac/
        mips |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/633e2964e0124916b27baf12b115bf6afc4252fd/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9a3ae2c95619e8f6c00a38d855c920418704852b/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/55d1fbc478666182c840a7f9aecfca45b35d483a/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e8c99130a3f466506a5507d0316b517e38daad53/
       nios2 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/921a66a4c56f6447913df2d51fde12763a8f7034/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f798ab12a168f8aba8cd0d9ff14d5202e9086d37/
        sh4a |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6ef8c830b525b16f208ff5dbf1f45930935e701e/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/cda4d6485761276faf3f442bfc0b085d185a4141/
        bfin |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c9e4e8a94215d5b7973978f866113d58ed3fb120/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c6d90d18c3a6df20286a0632de94b8a83379c4f6/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/49e2097970f2213326003ff3269442b0019e2ce1/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c4022c6ae7781f5bdb9bd5432450707115f9f8b8/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4ce0c629a275e63e1f13172020a66eabd695cb7e/
         sh4 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/bee7eb00869f1ad4765613c84f380f92ac367fb8/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/bae7f36865056060f460e1218fd7d14cc11a7dad/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a67c3fc214a18c9551e53a6b8546491f968e30a1/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9ffae69493e780a0a3492e55be42e155b6056a48/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/0b21a8c1ba23533b92680ec9e23ec5b6d82b1b7c/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/36505b2775f5cc472af7a5786550d7e03ba95a71/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/fbe0d028bce42501e977b2bb4c2ef4b136303e98/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ead25dc9b8ecbbf51af6f7aa326489e1952dd7dd/
     aarch64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/b5d62127f3ed0684fc9fd14e62cb2d15f88761da/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/b628534002ae3d0243039152e879ee88f027bc3a/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/fe06f8fb0e91f82a7253d848370750e85cc03792/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c87909d32232fff12b1555b9b7cbd53816804213/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/639268c4fb751b566b84bddab0000eb28cf7ec0c/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/29a5edb209ee04daff8b452cba12ffadf6b514e7/
       nios2 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/95f3d02d9670d26522be37b8bb3a6e57841766c9/
      mipsel |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/0e0f7e8c83f9d495b0565bd9f09f42b48e275a26/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/0966164d045a2d814fd67e10e679abc4a316e142/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9992665e008b9af3015b03528a8e3bb2737865bf/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8058389fefb6ce26747205e2524a7cab56edb498/
        sh4a |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/be64d98e1885a2ee1b989a43a7859d1a332d0373/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/73e55125e935a4727acd9f183e61ba3477f953b0/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c7e2d8a1aa5bafa4a29486f93d7f6615b46603de/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/628c3317de5de29887e40e029f24d67a86d3ae03/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/22ca21de65e1af47eb5d95d1700582a68aef77bc/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f66b0140bcf7ac8396c327cc728b3c58aacf5565/
         arc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5502d45c2e2b88d9ea5608698b68c7a03305ce4a/
        i686 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/571e06c94c0692a838eba93258b0c26077cff1db/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6128f023dfbaef220a15acb37b42ff1727fe4e12/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9e5841d129595212f30d47feabe00890c6368ad7/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/047b1ad87dfd0fe05c740fce7d4015339e71554d/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/df035a46b614722dc2d2fbbd55fd71a161580955/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8a79c48c8bba100f5f243bdc4be3aa973f981a55/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/bcb494d4713781e66eb50e86316cf0b96c5784a9/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/97e0a2b95fa224fe84aaedef70085ed6b4c43000/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/13ac2ba7cc610c36c46df4b3a28c939f7ad3f00f/
     aarch64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/bd294e12336f7546f5350114dcec795068ab420e/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8808a773f4f2121c8bbe0f649523d8e10c99fda7/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f1dd580d7f098ccc67074af157e28b7da6c8c766/
        mips |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/fc339445a3e9ab4e16725f8f879fdd1d1c2a4084/
      xtensa |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d9dc7ed84a3f772a261e524ed25d8397bbfc98cf/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/423dcb140d166698ba148ca10f16cf64ceceb9bc/
        sh4a |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6396a4cc10f9e95bd3ecda756fa95f178624ce34/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/34891a017ce3d76a4ec4375cf23720e31ec0960b/
      x86_64 |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e3febc6ebd1f07a7b064c8d9b5221bbf620f6813/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3f8ce8db4ce527ecc12e8174c71dbec6394be8fd/
     powerpc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f695eb505f8330d1e4e49c2e770d92b5f3ea158a/
        bfin |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e1d3ab4771f2158973eb6245ab0e1e16683d6f70/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/0daa145d8bac914303c7946201134634199a87ba/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/eeb6250a22fec2e86bb4354de4f002b8e5574c87/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/cdfb0380b2bb20e04a24def786f48331ea2a48c4/
      xtensa |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/4f2ebde483a6531bcb9b3c417f29a52580b0d3ec/
      xtensa |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/532df56e213cb155ddfed938058b2e929c47bc27/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/cab98a29f0cf667d77e775e5ca52b6bbbe10d03d/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/ea6d35d3e993647f1d3b2aebda46904aa21b00f9/
         arc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/48867cd52a4ece469f1f3313b949ddb97f3414b2/
         arc |                 cppunit-1.13.2 | NOK | http://autobuild.buildroot.net/results/2e1b81bf6855cf1a88eb23eb5ae6c24008c1ca84/
         arm |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/eead7079c4beca4e08bef9b63357ac696d80d135/
         arm |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/0038c7b73ff51a64d07e7dbdb217e64d2a192e25/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/cfbe0f1e7d05691b82f21e2adba402af17120e82/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/715044609bc46ab0cb1ceae3295ef493fff0fe74/
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/4fc4147e257c39817c714a254101301981f886e3/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/b07132b6cd87898e86de70423d7e8396850e739a/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/03055aa696e9e885baabb43fff613d751974a4b7/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/1d2122021826f379da95daecddc528c7eab45c95/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/363563cbc156f302224166c6cf857295363fdb7e/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/6b5c13c949e8ae23f1b58c6da4002371130e9bb3/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/1af3c68bc21503438fb0066f5e51e82e35a5442b/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/cd71b4fe45360c8f19c25aed5e57483ed1d9b50c/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/2b848c3d70a046b61beaf5e7efec22685d1e78d1/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/98e5d106a95c149d19ee34bf208c80af32fea9a5/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/292966085b2edea4e905d6fc7becafe7b63dda73/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/11a1164007b72a072b7b719f81267048c9ccd294/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/229288bf4e47b535033a2f8f27de219b7d12c295/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/d797efca444a85e0f91714fcbf6ffac2664e6e31/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/801b6b229dbf4e1db1395ff13ee000ed0117e90c/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/0dcc296efa8c64e567a55debbfb85ba4ecefe4a4/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/88324b896c880df9ef6d153928ea9b07b7f2f491/
      x86_64 |             host-nodejs-0.12.7 | NOK | http://autobuild.buildroot.net/results/596de90e7310f8d1c2a4243437f5af9d9c8ad837/
      x86_64 |                  iperf3-3.0.10 | NOK | http://autobuild.buildroot.net/results/ba87068a7e5eb82f2e44d43c0bf02e4cd518bf52/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/b7ab1f73709342a30b466cc727a19598038f7f32/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/f3f3db1ee2dc76e1e8d4f9fe1d8b97e558033921/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/4b05be2a4a6121c476d428de8c4577d522ff6378/
         arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/7033594221b4a75e7f8aea8c145c8b7d2db0637c/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/35afd3bd485007f43afa9b1f78bf5ef0582ee290/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/9f658ff85cd234841e96496f0ade9fa611f00bc8/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/debfb86e9b600c357142656b24b623c410f99cc2/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/1072819d25e9022e104e77643e1fb77983828ea7/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/c79e56839914886aef07a26bf941f25fa5e13595/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/5291874cfff5ffe1801d4588a45e33abaee45dda/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/874ad66e1104bab9c150a6ad84a365d7a8f8b633/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/17d70b04e1cde47e96aea88a49012a7ecc697295/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/bf21a620f07e09d01f7f9f68f8348d1b10089de8/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/17c1c188c6e532d74633cc00513dbf0b7b1ed95d/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/403a22fd11fc53d762768d1da5f715f0870d7527/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/63775aacfaa728cc45cc0c4ea7c91a794ec857c8/
      xtensa |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/afa273f69fc3973022dd2d42975c1e9efa7ae99a/
         arm |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/53a292e74d68ccf028ac13759aaf0be72a725b76/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/369b1454315acb76f721b3d5fe1fbfe4483e3dae/
         arm | make: *** [qt5websockets-le... | NOK | http://autobuild.buildroot.net/results/71b32d609890d90aedf7a901aeb975241a25f98c/
        i686 |                  mesa3d-10.6.2 | NOK | http://autobuild.buildroot.net/results/03588be2fbd71bfc68619297dace52a909ffe261/
         arm |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/9ccfe509351b7f1b5ac0f1f6133de8dc0f0c88eb/
      x86_64 |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/49ae52bf09cdba54d214456b305492515e861d3e/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/aeb5481526497a01ada8ee9403f282a2374b0383/
         arm |                  netsnmp-5.7.3 | NOK | http://autobuild.buildroot.net/results/a9d9d0a8ac50c1c9b616ba3d34283b55e5c045e7/
      mipsel |                polarssl-1.2.14 | NOK | http://autobuild.buildroot.net/results/b3d697b7cb03f13a3aa9e790f8a3ec23ce001ab1/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/560b32fe54076b23b2056fd19ace283010eefabb/
       nios2 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/a6bf5293e3403ab9213c4043a7b5281c812b4a5c/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/5fd9d1a8c1ec02e41e1c0fb0ad0977c9923bfe4f/
        i686 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/9dda88358d90b8dbdcc566a4da32ce64c036251e/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/387c4987b9e8241b74e00edfdb4f4823857e9182/
     aarch64 |                 twolame-0.3.13 | NOK | http://autobuild.buildroot.net/results/86659a3589e249508eaa8023469ce3adde0cede9/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/4156b6df2760fec9de156cac0381220b1c247966/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/cef994f59857f1a6733396e3089f3858f0e61410/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/a5ecd3048ba2ee7b574bb04e694f75d70acfc1a5/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/93ca885e43bcbe8ea08a58050c55860390b7c4be/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/dcc800faecf6e1dbb1a6f8c70d7eb6e3c3b6338c/


-- 
http://autobuild.buildroot.net
