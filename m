From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 06:00:28 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-19
Message-ID: <20190720060034.6C862875D9@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  11 |   0 |   0 |  11 |
   2019.05.x |  21 |   0 |   0 |  21 |
      master | 124 |  48 |   3 | 175 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 5 
           can-utils-2018.02.0 | 4 
                 python3-3.7.4 | 4 
             gstreamer1-1.16.0 | 3 
          qt5multimedia-5.12.4 | 3 
tvheadend-8f1de1621d78c9143... | 3 
                  dnsmasq-2.80 | 2 
                  flashrom-1.1 | 2 
                host-libsodium | 2 
              iputils-20190709 | 2 
                 libv4l-1.16.5 | 2 
                libvips-7.42.2 | 2 
                qt5base-5.12.4 | 2 
socketcand-df7fb4ff8a4439d7... | 2 
           tesseract-ocr-4.1.0 | 2 
/home/br-user/autobuild/run... | 1 
              domoticz-4.10717 | 1 
            host-mfgtools-0.02 | 1 
      intel-mediadriver-18.4.0 | 1 
               libgtk2-2.24.32 | 1 
               libupnpp-0.17.1 | 1 
                       mongodb | 1 
                    proj-5.0.1 | 1 
             qt5wayland-5.12.4 | 1 
                suricata-4.1.3 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

 powerpc64le | /home/br-user/autobuild/run... | NOK | http://autobuild.buildroot.net/results/05b23695dd0ca05588db98835b2143896402fe83 |     
microblazeel |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/1932ea77d665610897d00a8bd7c4109ec47abccb |     
microblazeel |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/8b0cd823e9722ae804c7405ccdadf46bf89ed4a2 |     
         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/28c98d3171973cbb4250c3ad0279cda5669f2f60 |     
         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/af18ee5b43dcec5b5d137ca1112d7901c9ab6f50 |     
      xtensa |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/b67cad5e1f86e6a81ce2df3ba5c3653de86a7ee8 |     
     powerpc |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/edfe5d208f1626903ce16cd481a29e54f9e8c611 |     
      xtensa |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/6a001d5b3427eb7d0222bc5827750c65f36f9989 |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/57d9c1f5f0d3772e3360a86d0c27827e1653febb |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/442928100cbf329617124911529cb928b5849de4 |     
     powerpc |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/51ca43e97c0ae5f10e6be036d3a730fdd2752d7d |     
         arc |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/fc0e587876dabace9ba22286d6144ad68ba245db |     
         arm |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/9bf4742a4081d0a0040a86ef1b9e0b754ff6d962 |     
        m68k |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/77eddfd74a404805a2cede4a6e3cac47050a77c2 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/ec21dfb2137e28282455e9f332710e7e1276cd67 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/089b1377e8a03abb271ec4a8b46c347229e438c4 |     
      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/df391f3e948a400b3a99887aa3b86e4a08a14efe |     
      xtensa |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/fcdb8f65000111502a360421bc0240c41713d099 |     
     sparc64 |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/127823ddbd75336abc0fe0e9bd11e4f5249df87c |     
      xtensa |                libgtk2-2.24.32 | NOK | http://autobuild.buildroot.net/results/393ed80cc158a34811611dbd15ed62460981f8cc |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/fb8123dac56d7b82c825c3317b8264eb4500b1d6 |     
     sparc64 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/6271e421562eccb6315393acf773fdcf0fd5b5cc |     
         sh4 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/d5bae516dde6778074e4496122ada3a68b061249 |     
         arm |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/e8b40c1b7a72b9f9b933c5e51a3f69255368c123 |     
        i686 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/5395859690bcff3a96ffa38a7a98c28a38ee382a |     
     aarch64 |                        mongodb | TIM | http://autobuild.buildroot.net/results/3602ff1becaf8fc762a315be00127e1e612afa2e |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/62a24d8a412eef57752e1a052114f32e0ed8d0a3 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/85d635d11ab9e5d6700cd4c559ec9fe4df4dc50c |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/142eddd5c89de6aa75b774ca6bd641800d3f5b07 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/3a68c6cde31dbbdba2d587c8c8fcbc604872ca45 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/a7476a4c690ba896c64e045152b32e1c285300b5 |     
  aarch64_be |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/336976310833a96f8b71ae3b99f9a4527d6a7e93 |     
microblazeel |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/7302fab0e9577204de361d5e5b07e4dab94a156b |     
       sparc |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/d851a0f2991f9f696ca7190fa777baef28f65183 |     
    mips64el |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/f5b48a7f1734c1fed44b01abe639f8f7f9a01d2c |     
        or1k |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/db8eca11ce5cb61f6b022bca41f92cfe0c154747 |     
   powerpc64 |              qt5wayland-5.12.4 | NOK | http://autobuild.buildroot.net/results/a300e49f66c776c0fd0f6a9918faa002b91f2b4c |     
      xtensa | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/e4ead8f8e6aefc44a561aa0c6adcb9c2f1d4aef0 |     
      xtensa | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/95f68c693f700bff3d7194cd1e99d2229cda23e2 |     
     powerpc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/7a68930ade45786e9ab4ff7b731d81df07f95a0d |     
        or1k |            tesseract-ocr-4.1.0 | NOK | http://autobuild.buildroot.net/results/faf3c65bdc5e76088dc99f169b3afa1de3a16999 |     
         arm |            tesseract-ocr-4.1.0 | NOK | http://autobuild.buildroot.net/results/b74783b347e3e759a2f6f7eecfa6756ac740ceda |     
      x86_64 | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/8d6013c5b080ed10c6ede1042ae1b2c365a6143d |     
        or1k | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/7275440d79728f2935a64ad8e71810ebca4f8734 |     
microblazeel | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/0abc20e47533b49e7ff99b5831ed80ad86c7321f |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/7b3c824acea94de54ef2f45b62e844a559823510 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/723c7043a71fe8072150279463989f66b838a4c2 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/f5837be7891a9a5e621c4e40a301c2b3d427792d |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/6a068318eef4f26bf055048ac5051fffd8510e76 |     
  aarch64_be |                        unknown | NOK | http://autobuild.buildroot.net/results/d4103affbeae03fce30f4dfede7df0f87436e57d |     
     aarch64 |              xscreensaver-5.43 | NOK | http://autobuild.buildroot.net/results/e17015ab66c2a3deaa9fceb39192e129b17b224c |     


-- 
http://autobuild.buildroot.net
