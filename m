From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-22
Message-ID: <20130823063006.42BFE52C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-22
===============================

        success : 43 
       failures : 31 
       timeouts : 0  
          TOTAL : 74 

Classification of failures by reason
====================================

               ruby-1.9.3-p429 | 2 
                     pcre-8.33 | 2 
                  connman-1.12 | 2 
              fontconfig-2.6.0 | 2 
                   attr-2.4.47 | 2 
                      pv-1.4.6 | 2 
                 cairo-1.12.10 | 2 
                      icu-51.2 | 2 
              e2fsprogs-1.42.8 | 1 
          host-protobuf-c-0.15 | 1 
           libcec-libcec-2.1.1 | 1 
        host-util-linux-2.22.2 | 1 
            host-mtools-4.0.18 | 1 
                  aespipe-2.4c | 1 
                pulseaudio-4.0 | 1 
               libglib2-2.36.3 | 1 
                   cups-1.3.11 | 1 
               libassuan-2.1.1 | 1 
                  libnl-3.2.21 | 1 
              strongswan-5.0.4 | 1 
             gdk-pixbuf-2.28.1 | 1 
                elfutils-0.155 | 1 
                  cppcms-1.0.3 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/7bb07c7ef39f8f7047b73825adf63b761072edbc/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/27c0b755b8fc05a1669c6896dd5815eb7fc6be56/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/8bff3ed2a93eae90a1a4d30361d078828dbc8731/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/394671c55a57ead4024d5f01812037cd3a7f87db/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f8be2cfb12a17866f69d31fc674d519325c16a10/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/7550538275fd656d284716d7b22b094f1bae670a/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/4fcdc975c1d704746c19f07d13d7ee944613d720/
    x86_64 |                   cppcms-1.0.3 | NOK | http://autobuild.buildroot.net/results/e93085a5e5c1c2449570b84adb86bd739e5d2d75/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/18ac8e01e6246a041c68344ee4ba0388e93d310f/
     avr32 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/9b0c1fd5f290c6acd8888a3ed6c302bb0ccc0714/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/85ef4f96e8745627108e7dc5b78f6e82645a059d/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/c231262f16179307af947ab98a732b2925f544e9/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/e1e0bfe094c085f06a4e4f8ddfd0ec1e9e14632a/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/eb184cced99fbde5142acfa16944c5e79c5ecc5b/
       arm |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/75a025443a17919b398284cdbed9c30870a3b2ec/
  mips64el |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/6fc344038ee52aada84f856d8a8fe137a96a41c1/
    x86_64 |         host-util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/0b685566c931e6d25d5a10232b5398c5eb13dc82/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/1b1711da4c73d6bbd63f69bc5f8390017a62026e/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/4dc0d9e08561139ea01e82e2dd88ff8555658fc5/
      bfin |                libassuan-2.1.1 | NOK | http://autobuild.buildroot.net/results/0e551bfa6747fad750c8e62238dc20db00fa0601/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/3a07752c52931899107eee8910b4baf1edc86c94/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/46cc6d0a96a99f43bc9bd4209b8ee9f323920a96/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/e239c3c8a2a8df6086c76b8d8568577dfe2f3c80/
       arm |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/95c06b1c76cc590a3ec17074c1706c7192ecbe88/
   powerpc |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/2a7900e6055f921a3fc5867fd45c855dee320462/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/675c96059be348b594cc92980bef391126931c83/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/a199b87b7cad773346bf628c5ba92084d90e5b86/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/d267147015f05df999fed1f3657907a7a2e19a82/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/525fac2f2a31f7eee376de4afd164c995ed6552b/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/89d40537c217f34d44df5ca2446924c47bcd711c/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/5edddb1e9c232b172aecc0d521fd787222403172/


-- 
http://autobuild.buildroot.net
