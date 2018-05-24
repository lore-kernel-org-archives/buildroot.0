From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 May 2018 08:00:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-23
Message-ID: <20180524060009.6718520873@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   3 |   0 |  26 |
      master | 230 |  18 |   1 | 249 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-faketime-v0.9.6 | 1 
             host-nasm-2.13.02 | 1 
                   libnss-3.33 | 1 


Detail of failures
------------------

         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/ba9982b3cf94d0e0a9e12d4e26b998e08696b841 | ORPH
      x86_64 |              host-nasm-2.13.02 | NOK | http://autobuild.buildroot.net/results/98a89f7203377d2c8b2f47bfdf00243a8837500e | ORPH
    mips64el |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/de48755bb7970188657305805741e11631911d43 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 5 
                    quota-4.01 | 4 
                  samba4-4.8.1 | 3 
               log4cplus-2.0.0 | 2 
                poppler-0.59.0 | 2 
                host-libsodium | 1 
            qt5location-5.10.1 | 1 
              wireshark-2.2.14 | 1 


Detail of failures
------------------

     powerpc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/15e20bd3eecaa537d238c27c4b6b932dcbefb7e9 |     
         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/ea550127e55c8effd3ed19acd8b9dc4e98468985 |     
    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/b4c153fc6f8d8bce7379a312dcf933a79a96bcc6 |     
         arc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/070abb9166759828a904359d9ae62ff454d6026e |     
        or1k |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/075fc35acc02cfba70f9ed2fe668ae2fa96716ff |     
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/123ebcc2f277796c1ed39bf9c8c75b87276fa956 |     
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/4f53f1a475d79e15aa7fa24151f1e460db4bf645 |     
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/31d82cf4e6e8ef6125128584c54a3ca514c1bd8b |     
       sparc |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/64a96663a48ab644bc03c9a3ec2d6a644119dee6 |     
       sparc |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/82e85e12478fc1972b70ad728ed7c1554920c9e3 |     
     aarch64 |             qt5location-5.10.1 | NOK | http://autobuild.buildroot.net/results/1f076f5e2384ef79483cb1a445558acf0dbf41ff |     
        or1k |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/36f8575061f999c0287c76ec5cf5fd5b05cd2d83 |     
microblazeel |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/5a7049092c6da703ecae0c34b1883436bc640db4 |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/f56077752666879333ec59cf351acd27a0260b91 |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/c42ef0938a3b45ac6033d1ec7d44a02d13a5a9b2 |     
         arc |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/4c440318302cfcaecf035a41fda42970de1c6862 |     
    mips64el |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/283f2fbdce25c093536097880e974ae9c55add81 |     
        i686 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/5119ab496566adce72561fa99e18a56bd21890a5 |     
     aarch64 |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/c0154b5407a881694632124b6cb401dded8cb080 | ORPH


-- 
http://autobuild.buildroot.net
