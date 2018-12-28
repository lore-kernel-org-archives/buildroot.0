From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 08:00:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-27
Message-ID: <20181228070027.D4E072072F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   2 |   0 |  20 |
   2018.11.x |  20 |   0 |   0 |  20 |
      master | 112 |  47 |   0 | 159 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   qemu-2.12.1 | 1 
                  stella-5.0.2 | 1 


Detail of failures
------------------

         arm |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/d5a103e89a26f8b1db695198855bc82b7d265ec2 |     
        bfin |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/575cfa98a52bf13dca419155f6cce1b41b5f0ba1 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 16
                   netsurf-3.8 | 5 
    json-for-modern-cpp-v3.5.0 | 3 
                  linuxptp-2.0 | 3 
                    php-7.2.13 | 3 
             stress-ng-0.09.47 | 3 
    azure-iot-sdk-c-2018-03-16 | 2 
                  libssh-0.8.5 | 2 
   libtorrent-rasterbar-1.1.11 | 2 
                  dbus-1.12.10 | 1 
                 dmalloc-5.5.2 | 1 
                  ffmpeg-3.4.5 | 1 
                  grpc-v1.16.1 | 1 
             keepalived-2.0.10 | 1 
              lua-curl-0.3.8-2 | 1 
                qt5base-5.11.3 | 1 
                   whois-5.3.2 | 1 


Detail of failures
------------------

         arc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/0edba6dfbddfa06bee30c5aca22314364f12f8ae |     
         arc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/379d698229be31c8acd5712254b863c64a98d6eb |     
       nios2 |                   dbus-1.12.10 | NOK | http://autobuild.buildroot.net/results/542437c182c09123f262f6ac91cecbadd212c43d | ORPH
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/61c31a08a75a30512afae3305a8c8adf2fb5aa5c | ORPH
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ed82a95e1866ea2caadbb3433b2a255b2cf621d2 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4fed9d16dc8d298e96d93d1db6266be8e4fade05 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/3af41fc09c593008f3b232a78846f80d2e7e13ad |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b1e5661a64eb9ce33a4ef72e309bdb8278707bf4 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d8f175c21e7f35adae6ab4a9b0ec46b09eab55e1 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/2c9203a9da31da0e880b49293d77925fe1fd5b39 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f0a1a95d391e9d670bd5e10d2241e6fa71ee50cb |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ef9baae1ad5b1a9eda08213d17948324b304d335 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/303a1f0fae316a36a6b1714c53f66e4c9c4e99a8 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ebd36418696174cf013ed1acc3330455badea09a |     
 powerpc64le |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b27fa0c106d95fdb9238e73fef4d1bf6468bef5e |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ae79249c0a357964d96c1d36983b944c0c1ec507 |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4167159c4a03f5a72dbd7e286aedb3845164cc22 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/dd899652dda33ef324bf82cf718d45ff2c704e27 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7cc55847a9a1ebe0290fcc6b127a4beb3250ee8b |     
 powerpc64le |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/745a2905464ebd44b06ce88d7775dc500ca98581 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/65a975d14c7f0a5634a5bb67820ec25da9ed122d |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/fa7bf2cdeaa9c75e22f2c95d5bc620729eb82a89 |     
      x86_64 |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/6dd0d2c9083bd1c688a35fb6ba7fe67ac3f38cdd |     
     powerpc |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/389d9032a72000664de9c484cec92ed780186284 |     
      xtensa |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/9b8d9f15823adcdf9f8bcee0fdcb3322266300b1 |     
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/52138de21425e3a23af112cd1e57ac245bd10f9d |     
      mipsel |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/6b8feffba87731ade3c1da773a56c49474577779 |     
     aarch64 |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/5902bdfbf96383861bbbea13686fcb2a5700645f |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/fabaea5766b3e3e0146144de67f8b1167e3ee0a8 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/5580445c511f29d6d251674bb23e9161ddfcf6c0 |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/df6d6c171af75f78edc1fd523548721403657144 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/d4276a461fc37a76c0dd3b9696af0de78b749066 |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/50de8c555766464e296fe0ee2a028e904a81b210 |     
      x86_64 |               lua-curl-0.3.8-2 | NOK | http://autobuild.buildroot.net/results/0691fef5cf45fc30d256f08d5c085da4ff9a7ac7 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e4b76904a6b6c3a5a78dfabdc75638f89f7ff1bf |     
     riscv64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4ff6a8c4017d006a4b6b9ca369a569fa72862900 |     
    mips64el |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/dd521afa9fbbac83df4b7488d104375e1e4550c8 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e01056dc5745466bda7ed1fee55415e27fe3f9a3 |     
      x86_64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1ada96eb6e39b9aee5e16fbcb99936e9c61285a5 |     
         arm |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/3492c3df267a492437c337d8888c43eaf3721575 | ORPH
         arm |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/c152e27c7d139ee9cb6924a5016f08c35c36d8c3 | ORPH
         arm |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/44b9ea1edca85b222a117a8e241a26b8dce33929 | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/c6b75501640ec7b7c6547940501745ce301e168f |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/d056e36832338437539a47faa145d9bfb3bd6352 |     
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/2bde09a6a8d5154c5622ff2cf03da3624818a878 |     
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/a76509180671f2e6ac8c1e2424dce5ad835a4f5f |     
   powerpc64 |                    whois-5.3.2 | NOK | http://autobuild.buildroot.net/results/9a2cf92ec7b1587212aceae001de42237b4e0a13 |     


-- 
http://autobuild.buildroot.net
