From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 08:13:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-09
Message-ID: <20201210081338.934A687383@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 11  |  3  |  0  | 14  |
  2020.08.x  | 14  |  3  |  0  | 17  |
  2020.11.x  |  9  |  3  |  0  | 12  |
    master   | 44  | 59  |  0  | 103 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 22
            quickjs-2020-11-08 | 6 
                   rhash-1.4.0 | 6 
package/nmap/nmap.mk:89: nm... | 4 
                  boost-1.74.0 | 3 
        host-sentry-cli-1.57.0 | 2 
               nmap-legal-info | 2 
           python-pybind-2.6.0 | 2 
                       unknown | 2 
              asterisk-16.14.1 | 1 
                 dc3dd-7.2.641 | 1 
  gobject-introspection-1.64.1 | 1 
make: *** wait: No child pr... | 1 
                  ndisc6-1.0.4 | 1 
                opencv3-3.4.12 | 1 
           python-pycups-2.0.1 | 1 
                rocksdb-6.13.3 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/7f2d818f8aa91b0dabbaa9e14cff66cd2061e5ed |     
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/353240ceb706a69f1275385f5ca0471e3bbf0371 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c6b9b5f18392cfc9484247db009396dfb19561f5 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b4b9217fa3f39515e49179f64f796c3da930405e | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/47a59c4fa405d0ee029188c8cf6b82da2981bc7b | ORPH
 powerpc64   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a7f9a0f59e80b2ddd4191e17f0ba874c19d2be17 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1564c622718ccfc79d4983e16c694c3008a5be73 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9efa4a799c252f380ddcfbdef9f1c8a232a41d14 | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3eabf899a530dc7d1b1c58a60067a8f248c0e699 | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/91fcf6a90af2f42301093c72783997081c18c215 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/410e5b3ae08a397e8f17510b687a8d8197417fc5 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1c480f09f1500be9027c89477faec1c129bf9ca1 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/21fca06165b441df1936e007c567b4337f0cfa0e | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/38f559089634fcdb9b6e16f4e62a96095707d74c | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b5c9a8dfba8a3fa97dc834eb06c798068a02631a | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d970ab37ba12082daff7ec96a93c4cf1329cb370 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/29c59389fd74d758c76e236288b3acf168e8d8c5 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c95bee6ec89f794b079e21b695dd9e033964531d | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e74490cb14c9f3a00b2fbdf2140f8db231aa8e21 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4b31d9191717cb8b87222c07b45f2fc944f321f9 | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c82b55b72cb5de05e3900cf9490545af4defa9fe | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d7d7d4244585140c9bac5b7946204af09042744f | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5e70e89ca46fc30086a879c0507cf9ff689d34c7 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/22fed416bcc85fb575351ebd4d4fb151308a3812 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/d426ad889824109da3a6321b35ffefe7d9970a60 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/4965365d733361bacc99c529378fd656b05186ec |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ea8a54302d3eadba9e2d9ca95a05e686dcc7f2a8 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/356c22550a3936a0506c31361029ea874b311258 | ORPH
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/228af837741da2185e175e8a9d123e742ab4aac1 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/476b854bfa0fdd53b00c095bb58a633bbd4d5192 |     
    sh4      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/bd7c69d5a9139e01f5a7f9f07dc6ec8f216552d1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4ea58f9aaa679d346f625bc333f1c5ff4f9adf7b | ORPH
  powerpc    |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/9d9eaee5be6ec3c67ea2afca4811f42e8d9bb28a | ORPH
    arm      |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/89b6b42a7db673a0a64bd92d6ca4081add2a2112 | ORPH
    arm      |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/4efb3772882f3fe2e1859fd62d57292a4be21901 |     
  aarch64    | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/b4cae06185424423438c6e9d8ae739947fa495d4 |     
  aarch64    | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/10aa4483ea8bd98310a4bdff2ac7aa3edce5bb49 |     
    arm      | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/89214e558375ac262d09d5f11f47a7c28ba2abe7 |     
  riscv64    | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/7ff2883d34137285d4dfa11a3a27a0fd540de56e |     
    arm      |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/244abfd7b25bc62c655345bbb73781aad31a795a |     
    arm      |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/98ae9d32e8598a8a28f4d932612df2ce562a8b85 |     
    arm      |      python-pycups-2.0.1       | NOK | http://autobuild.buildroot.net/results/2f061c7f81c5e4145c288c9537b026bc9876801f |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/8eba8f4ba71893c1f07173d1a1c4977a80f86b76 |     
  aarch64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/5141f016a164b76bf999e7ce5c4f7f78991edc72 |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/c73d109b781476bc1651359f2a6057fffa45b72c |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/6a38f0630ce66e1d5136b29913cbbf7ab20455b0 |     
   mipsel    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/429ff3f3354870dba19563d932cc23f851befd73 |     
   x86_64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/8d5556c0aad29cbabbaf59700968943074bab7a1 |     
   xtensa    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/9fb83f5d740b4e35692c568ba03312369bd382ba | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/c9ce743f285da94b94e849882bba836668483b2f | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/a4fb68e1856d4c81704467bf142c60ccbe581c0c | ORPH
    sh4      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/3b9119a9dbcd01365d61f0ba99a01e7f3f4e8d9b | ORPH
  powerpc    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/e906329f78aa6dfc035c587e5b2b4e9c25474357 | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/186c2af660fafee2bdfe3419f64a12003a3016c0 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/0af694014f940463bcb7ca5f060741c31717bef1 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/59131671a01b30b6e40b78146e04e4d030986e92 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/b24c3077a3142c0d4e0e66f60d39edd27c582a29 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/074ee3120c0537a4986e123ceb8b3803d0610406 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/5f67c24399af5bec34d040c3fd1443edade090bb |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             host-pango-1.44.6 | 1 
             kismet-2016-07-R1 | 1 
                qt5base-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/68d2dcc601b09abc29f1d02556b35bd8d7ef03d0 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/bea3e54aca87892ce95c03adcb28cf6df34dd6a6 | ORPH
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/448a60f37ed9799ca5465cf8558e0b0c10f06d33 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

            qt5location-5.15.0 | 1 
                rocksdb-6.10.1 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/6d7e8752e3b63f1182cc376a93f2d6917ad4ef0f |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/12b410eb401565ce6705f6a9f0dcc6c553f1b4ea |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/f269c3b904a0782f5d5325fefcc9983aae1fc608 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

              ejabberd-19.09.1 | 1 
                 ripgrep-0.8.1 | 1 
                    rpm-4.16.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/4f8dda7ab32b534e8b227ffe3a75c0e44cbfa632 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ed6698bcab71de92ce19de710200e08306617f8a |     
  mips64el   |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/507704220bf7299ddc8a5fb2bc6eb73bda7baea5 |     


Gitlab CI results for 2020-12-09
================================


-- 
http://autobuild.buildroot.net
