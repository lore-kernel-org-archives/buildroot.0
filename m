From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-20
Message-ID: <20161021063032.858D01027B8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-20
================================

      successes : 133
       failures : 73 
       timeouts : 1  
          TOTAL : 207

Classification of failures by reason
====================================

             util-linux-2.28.2 | 8 
                  kexec-2.0.13 | 7 
                    pppd-2.4.7 | 7 
          libmicrohttpd-0.9.50 | 4 
          shared-mime-info-1.7 | 4 
libasplib-f7219142e790a329b... | 3 
              python-pyqt5-5.7 | 3 
                 weston-1.12.0 | 3 
kvm-unit-tests-0b04ed061003... | 2 
               libbluray-0.9.3 | 2 
                 libnss-3.27.1 | 2 
                 mplayer-1.3.0 | 2 
net-tools-3f170bff115303e92... | 2 
                  olsr-0.9.0.2 | 2 
                privoxy-3.0.26 | 2 
                benejson-0.9.7 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                libmpeg2-0.5.1 | 1 
make[1]: *** [libavfilter/a... | 1 
                    mpv-0.20.0 | 1 
                 opencv-2.4.13 | 1 
                  openjpeg-2.1 | 1 
                p11-kit-0.23.2 | 1 
                   perl-5.22.2 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    qemu-2.7.0 | 1 
                qt5tools-5.6.2 | 1 
                rsyslog-8.19.0 | 1 
             tinymembench-v0.3 | 1 
                     xen-4.7.0 | 1 
zlog-6ddb9bbf3ff0123e701bf6... | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

         arc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/6f6d992f06e3510eb34b22b1eefd13cf0b4583f6
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/b8342dc0b30f6e467531d3fe7a8e4876cda84409
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/199aa7dbf00b407f6f74becb44c0b4036c6eebbe
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2cf8fdd61ace453ae7dfb4325812f2e4c60ba63e
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/2ba829e112b4a8bc4088104dbdacb3885b64d9ce
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/6a1656b0c3aff2ccfc51aa634f019fced306628d
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/6018ae950f967e5af891efdc98926d998a603667
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/ec26f1dd97f1e861e401d2709a243ae55bd6f022
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/c9696b1fa8459fde12f7f124c8d64e2477d36268
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/a3418a7342526e54056426362ba91c78fee25c11
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/1b0a0a8c19fe3252659dd9381b66e33eee5aeb0d
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/c68fc19abefb7972aa88a72bfe9c2d554d1d55b6
         arm | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/d81b8fb2a5d63826fed7404c9fbf4b8224857617
         arm | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/cd352be51e0fc82e23b1242b6486d7b8d021f47a
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/7bbb2a544a08682cc6eab81d3ded7fc380843825
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/2d150423bcc2491c7c1fc3675454791c0d3928d8
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/7684de2faa8bc3b89601ff93d6d9457ca0c1ba9a
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/1400aca4734f3d5c24369b5f5764f760af3b5aef
        bfin |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/ec020b6fd77564b9d6acd3718adc802af0e6ce62
        bfin |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/532d5cf536e22479a346b28d7027313183c31d68
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/c12045d05015b2d4e69416c22f7fbf4e419af49f
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/08df2165bc6dc2a52bf28eee36c3dd60a087df10
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/a1851f569f0e3769e3eb8c486e19dbe7c5fde50a
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/3b8473eae7bb77787c3d07f7f7748377c31fb7e9
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/26bbd0998a219c53f02473a4bf541445de00c003
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/556a098d28a4f626091954acf8b8ccd2de1eb831
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/f71f7aa0e0b37d0c14d2c71e444f59a8d847a86c
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/d2432045c0a12d818abadc2fa056d1a6f347dcf7
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9c4d25b572000173d8d5e1376ac4145caa64bfc8
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/625584896c848d69f143d65a5630add4750842d7
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/fd1e693480c6e986dc9dfbd386bdd15fcf6f39f1
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/37c4da7acf5c37cbdaeb8b88578e1df491f7e96d
      xtensa | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/916798bccebb5a052a5e01b8e81ca2d033baed6b
      x86_64 |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/59d0de841cddfdd8736eb0c124fc0a86a844cc09
      x86_64 |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/74cff8fc87d95d70840394fc049fc038797b9888
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/65a9b6c9dceed5058efc6e4a01cfa7d4d60b3606
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/e59de4e620fd62ea0c3da020061e108882fee97d
microblazeel |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/ca0769144553bf5894fec412234873cd48b6e707
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/cde53be1d0f34a9666c731a81854a4dececceee8
    mips64el |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/b83b0b29209134342bfcc82cb6e7cbc532441f32
      mipsel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/47e9d7e201aaf08f3af9a8fc3637fc3a7d082c3b
       nios2 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/bdc4f274e527c5aebf9bd1b2ca85ba8e7da57e9d
       nios2 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/c7afbe4342be9c516a330b2b0822766042531319
        m68k |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/2452dd2fef0d8c1b2aded511f0ca1a241a6fbf86
    mips64el |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/758ce7f64f682f7ae740325601cbfa011e39c493
      mipsel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/4a547d009c234e5f5ae8fd7116efc08e4d3edc8c
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/1a5fcd17c6a4e3ca270fffb7187c3a79ccee7b0b
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/86d624ec6d001a50ad67364674705c888121179a
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ce16e09e392a4cd5793194e89813d94bcdc8ce55
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/c0732ecaebd488c902770a6208b9160d4d09f0d6
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/3f9708b6d2aa84940df4bf74b9257a3cdcdf564e
      mipsel |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/e0d22693d5268fa376c2e800f472bb9edb4f7587
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/0850e80ba62294397b44d8adea197a244a9a8205
         arc |                 qt5tools-5.6.2 | NOK | http://autobuild.buildroot.net/results/edc0042bd380c6ca2815ac9ec592241574f1e600
       sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/bfe8ebe3966324b16ca572bfba0a1a8ddc275db9
        i586 |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/9e3ce42d05058b9ec18780176c92d686ac727b4c
    mips64el |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/479bd75f6413219c61268db3c872860ecb32bebe
         arm |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/dd1a275d60f6c20c3d0a8af537e36790cbe50f29
    mips64el |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/93477e816ba8c33700409792f1dbb0581d787da1
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/080c90e858f7ec888abed4d3eca18c76b9dbea3d
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/038c62906b853869c13aff91b5847cff5b077936
      mipsel |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/af4fe27f9c8f2801fdb488ec575396bb02511db2
     sparc64 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/2fd09997ecd388190b07e22872dd3ba4546c2e4a
        i686 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/b4cb0b22edc0550eae0717b91660b27af166ef06
        i686 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/1819763ef229f56ea089a80992d237d32dba3325
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/730e55b999d616fa787809074d0097f358b49e8c
      mipsel |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/d8974d08abc23c46fe491b7d66ba7cc3f4b80fbd
        m68k |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/5c5b94a4be8ddac5b57e4556bedcefbfc7d74c55
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/47fa4219f6f9b7f6015af435c8f898acb362c584
      x86_64 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/93dc4eb29e0296459501588e635921be440c1bcf
      mipsel |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/91049a7df3a5e0ce233d20bdd53ecb28e70aa550
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/1ff598e9a33d89724306ff8495ba0d1049a7dc4c
microblazeel | zlog-6ddb9bbf3ff0123e701bf6... | NOK | http://autobuild.buildroot.net/results/ec80c6d0dfb5cfce38afd101201f6faca6ffd194
      xtensa | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/4473fe45e367fc629d43212736807de011b32954

-- 
http://autobuild.buildroot.net
