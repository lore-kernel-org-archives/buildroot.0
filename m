From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Apr 2014 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-10
Message-ID: <20140411063008.70B85100F1F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-10
===============================

        success : 56 
       failures : 27 
       timeouts : 1  
          TOTAL : 84 

Classification of failures by reason
====================================

                  avahi-0.6.31 | 6 
             lttng-tools-2.4.0 | 3 
                 mesa3d-10.0.4 | 2 
                    php-5.5.11 | 2 
                  cppcms-1.0.4 | 2 
                  zeromq-3.2.4 | 1 
jack2-37976441044d69b91d61d... | 1 
                libcurl-7.36.0 | 1 
czmq-b5730c5f8290a611fd3b92... | 1 
libwebsockets-v1.22-chrome2... | 1 
                 cairo-1.12.10 | 1 
                  dhcpcd-6.1.0 | 1 
                     gd-2.0.35 | 1 
          openpgm-5.1.118~dfsg | 1 
                  python-2.7.6 | 1 
           GEN    timB18-ISO88 | 1 
                     vlc-2.1.2 | 1 
            lttng-libust-2.4.0 | 1 

Detail of failures
===================

    xtensa |            GEN    timB18-ISO88 | TIM | http://autobuild.buildroot.net/results/6769c2bb05713d97f96455627a7380e4dd2195bf/
       arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e54a3ff5542a11197f3aa6e543350f097647cb02/
   powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d67269598335db792c0134de76af2db3445cca62/
       arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/678cae8ba5deadf599ae541468aedc9e52ce0942/
      sh4a |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e86b40a3f8b8c8f97923bd3f263984dfecb5a032/
       arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/33ab1c8f1af73cb73022ae2c0652bbbc82d856c4/
    x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/71698d593b63dd7817bcd6583a4f75d9adf85e2f/
    x86_64 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ef6df790cd98b29b1f5df95fc923f7b8a62caa34/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/6e8a0b0d19b4b79e34e256265d6310094954b52c/
       arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/d530be6e49a5f223955d14e3d2f5bd9fd23632cb/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/f6f8eee52099afbe5fea75ffdac2074b19096c3c/
     nios2 |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/9b8002f99ea10cede106b2f1cf0e36eeddff017a/
       arm |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/4b4272876385cc21dd06ee946d658b8f9e225d78/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/2ec7893cac7dcd22518196f0e435215297363544/
   powerpc |                 libcurl-7.36.0 | NOK | http://autobuild.buildroot.net/results/12d63e7c06547716179f40ecbb8c4f266c05201f/
      bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/b7f7d9218d9b3f22687e04986117db7b8585e539/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/4bcbc168cc3cd6a5813ac4842ca98f21ad3750fa/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/f6a3099f1a050060397f887fdfbf55df6ba66fdb/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/4bc0723938b50e089576ad38627038de866b2217/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/2359dd80c5b0171ddb29fc8590ef094b09bf5ccd/
       arm |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/ce64164d76972f82acab277afc9c95a876c6433e/
      mips |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/843dc89f6ac4dd3ac80a32db86e4546fa079bfd6/
   powerpc |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/dcc68ada4d8b82b089cbe28263fb2264d8a446ab/
       arc |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/9480f76a1db384d27fbc2f19742fd0c39ae63297/
       arm |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/827d545e665672798a8fd11c2b1df8b38c98f346/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/a4c1fba538c9576a18d5c21807ef508fdde8f328/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/74d516edc26dedd5622afa3a499b4b234904090b/
       arc |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/a098b850eb5c40cd4e9525caaa4e2107b9f4a89d/


-- 
http://autobuild.buildroot.net
