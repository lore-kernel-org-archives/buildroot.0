From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-14
Message-ID: <20130615063005.916E352C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-14
===============================

        success : 114
       failures : 58 
       timeouts : 0  
          TOTAL : 172

Classification of failures by reason
====================================

            host-erlang-R15B01 | 13
        host-dosfstools-3.0.18 | 9 
        host-dosfstools-3.0.20 | 4 
               sconeserver-211 | 4 
               wvstreams-4.6.1 | 3 
                oprofile-0.9.8 | 2 
                  connman-1.12 | 2 
                openssl-1.0.1e | 2 
               openswan-2.6.39 | 2 
                      gpsd-3.9 | 1 
                    acl-2.2.52 | 1 
                  sysklogd-1.5 | 1 
                collectd-5.3.0 | 1 
               libglib2-2.36.1 | 1 
                   dbus-1.4.24 | 1 
               aircrack-ng-1.1 | 1 
               libcap-ng-0.6.6 | 1 
                 cairo-1.12.10 | 1 
                       kmod-13 | 1 
                 ffmpeg-0.8.12 | 1 
               libgtk2-2.24.18 | 1 
                  zeromq-3.2.3 | 1 
                  ne10-88c18f0 | 1 
                     m4-1.4.16 | 1 
                pulseaudio-4.0 | 1 
              vim-699f8d8f096d | 1 

Detail of failures
===================

      sh4a |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/464648c57b9b34f8d0906afb2e76df580706bc93/
   powerpc |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/e1b7ddcd82d0b7e9ce79fbad2d6c7a6722588f5f/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/a43153f2f22c53e16626a3942d6d4195d49b8e6b/
     avr32 |                 collectd-5.3.0 | NOK | http://autobuild.buildroot.net/results/5c7c933717ab791e7c8901fd7171b34385b88cf0/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/789d44229025bd2031f69ad5031546016a20e2e2/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/038808ce0f1cb798433c3a0f9d0378d5d313c042/
      i686 |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/88dd0bd806e82c773a69852119335d2e1dcf58b6/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/36ec0f6c83ccb7a0d3ae040c237d16ceb3fba0bc/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/8df1d8fde53dc0c88a5413051f170bac6c9135b5/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/4c36b4f16cc1198def67da8c4a4e98b00c20dfcd/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/3c8605a85a7ce47e83db7e34038925892895a8b4/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/44edbf1492197fee60dedc54b2ef6abe56ece4ea/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/117dfc7fc5bd324290b48ea2f8ef775bb0ab4ace/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/6973c8ab8751b06ecb2207c2a13ea7810e8eb011/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/fa75f77a0dee419fcc79a2c68bf3495ff26d5f36/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/287a66b00c78b48dd94e8f064cf16d2c39cbdd2f/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/9479a746e968e45b3f0a42ded2f026b481e849e6/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/9afd44c1304b094b2f6bdd31afd0df02ed9c86e1/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/1d4d43cd1a12f578fd80d18d991c855dad3e77fd/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/966c9932af655f2801b3cb847168c31cf89eb7bc/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/88b94ffe19983020868e093a0dca7e45e94a4e69/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/ce855a0505aae5ac2f34dff85338077783463c31/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/2a7823a36a819b18ca5b9320bb3d5094ef9a2e72/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/fd4d8f32470b1d349ad2a229a5a36bd1885cc161/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/3fe4fa977b312ff71af94fb926eebdddf10b2881/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/e282720ef604ee3ba1f695edcc039c4f551d0988/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/95047ca12d3f78d62e253be68777a23bd4579fb7/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/fba9c7d8745631aedc8623809baca4fa37662c4e/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/d96c84b7cd7348ea4905d823202e0082170f30ed/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/7b3b19481c0ce8b84f7d5a41f5490844b01ef469/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/669440c8538f7caf17784cfc3c1ee4aefd53d871/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/ebcc250e9f3c01923f3c24fe8ac1f022147f2826/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/3486474842e45197bd225f2384bcd0eb1edc5b93/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/e4872c6c8854fd258b815beeb2c2bb87f090f214/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/b50bac4a12c56f4a790280f9c9fe1fbca1792ae1/
    xtensa |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/9adfc86b71c072acd4145f2c48fce985693ae898/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/fafb9f6d114bb41a177900a36fb2ba0211b29cb4/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/74fcbb15ef0b29654272db1ff9ad77d78cb39339/
   powerpc |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/3d8a8519e94b0111709bb56d9e351a5502ebdd18/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/3eac83207ecd35c121d4f32be315a2883a6607e1/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/f32446a2460cbd6835a7dfc68cab79290d5c68bb/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/d94916e20409d825abd2adba8cc835266fd4f6ee/
      bfin |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/746027ed1ea0f2ce86e4025bf65045da7ff122d5/
    mipsel |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/0084159c39e5190aa9d2ee925e3de002e707fbff/
    mipsel |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/533d06ea61e03f60544ba321a5588642ed4a67bf/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/bea6e10cc7ceb56c676cf968fa77e57f90ab03aa/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/430bea4330f091e478085d9417285bc2d8086846/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/92c05a1884dbb93620c94a8e86f32eb52a4226be/
      i686 |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/19fe17aba0e35722797f7ddf0ec25ca5d77ddb41/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/be442f42d8109484a7b82f020532b84f4b5de2f6/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/f6e5ff5d8606238f81134fec4177951ba60793d6/
    mipsel |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/6c8e9ce26f8abeba8306b2b6d76e0208faa6673f/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/c8eed02cea8240596b1e0fa94eef6264ff614d06/
      i686 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/d31a59d1f45b8412da4adbfc6bdcff21326ec8c2/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/0fa231cba3eac14924b343de817bb4e63d10155e/
    mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/74dfbc54c6ddbbd849de70ebd45b9292acf15d82/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/eb87abaa73c302d523337491320e62e9482dab96/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/84d450bfa52e5e9330280c86102a9a62a4a60376/


-- 
http://autobuild.buildroot.net
