From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Nov 2020 08:08:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-25
Message-ID: <20201126080826.7766C87800@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  3  |  0  | 18  |
  2020.08.x  | 21  |  0  |  0  | 21  |
    master   | 99  | 40  |  1  | 140 |
     next    | 14  | 17  |  0  | 31  |

Classification of failures by reason for master
-----------------------------------------------

                  boost-1.74.0 | 9 
        host-sentry-cli-1.57.0 | 9 
                   mimic-1.1.0 | 3 
               wireshark-3.4.0 | 2 
                apparmor-3.0.0 | 1 
              asterisk-16.14.1 | 1 
                  autofs-5.1.6 | 1 
  binutils-arc-2020.09-release | 1 
               btrfs-progs-5.7 | 1 
                        bustle | 1 
                clamav-0.103.0 | 1 
  gobject-introspection-1.64.1 | 1 
                   gvfs-1.44.1 | 1 
               host-efl-1.25.0 | 1 
               host-flex-2.6.4 | 1 
                     mc-4.8.25 | 1 
              micropython-1.13 | 1 
                    mpv-0.32.0 | 1 
                opencv3-3.4.12 | 1 
                samba4-4.11.15 | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/1979d7b9ec5ad360bbffedb3e962c053e4e433fc |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/44044102e3c4dd00ee7ef651799637682664445e |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/d709a5c414c727fa7be2ab8b257734d9c22bc7d2 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/cf206758618f6de5f22a257579d86b02d5360a14 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/7085a70d7668a7bf848f9d8c6d4755d40a4b818e |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/523d8ab3c78b03d3f833a65a7a14584fa147a302 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/f2dfb5e5bf3070c6c10549520cd6f7b3feea3377 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c49b73bec2d38b67e3ecdee19d8cc6c307fd9129 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/81d811243304ef4862ff11f839ab500b386a7faa |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c03a786791e3aa7801cf1bff9934c4a105f54ce1 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/97745e4dbeadedfaddcb95c3ad9dac3b848ed4fb |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6cf8cf2b7e975b00dc9f878c688310dc0ea92bfe |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/02a2dc59d798545c512885b23fd305eed3cbb643 |     
    arc      |        btrfs-progs-5.7         | NOK | http://autobuild.buildroot.net/results/294151bdf9e7bc2c782abc6d9781b09df8ee40a6 | ORPH
  aarch64    |             bustle             | TIM | http://autobuild.buildroot.net/results/3fe651df85c0f4a8056e28d7dfa8a3ac5f89543c |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/6ae529c2b3f2f7de13821d29c9738b629772e74b |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ae006edd7f6f87ee04c50fe5310c248e7eba6d4f | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/edcb9963cef7ae889150313674011486fc09bf9c | ORPH
  aarch64    |        host-efl-1.25.0         | NOK | http://autobuild.buildroot.net/results/f42e09bece054fb8278e54d988fb669171b1726e |     
    arm      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/aa6cb1eb7792a982907e6e1e782089aa01b9cd8e | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/216bbebd55bb34635d77e2e2faf1c055820687e9 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cd5c9796cf28eba6bfbe53558198fcb2bf4ccc15 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aeff7edfe56074937e17f85ea4922318f5c73444 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5e2f631b49620429bc68aa9fa3045542bf205bfe |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1f6e85bb65972e9b4ba0c0b5963ca9f1fbcce74a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0adb53995ee28099940871e86accff0ba28f4d63 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/329d97e56b995fc69135b3d2ad1eb1aef090b896 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2602aeec37ecf7c8881a278b3faddd714b85d2af |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/531288f941431248d57818a911477a56e0789261 |     
    arc      |           mc-4.8.25            | NOK | http://autobuild.buildroot.net/results/6f6acbb1a8708ad840a9361ee72b8d14699b44d9 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/ad570beb55abe6bfd731be481fe4485cf83051e9 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8faf1113b7a85cb645a11dda181a63e7111423a1 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/4f5bf2367d4175cf3247b450ab1f6ef17558dc13 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/fa00b9bc4de125e1671eb8df002eb0dbcf8d7eb9 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/a1fd3e553d853aed66b257e3c3dbea8e5d46d436 |     
  mips64el   |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/a35d773d77b273c5130eaaf91aa37c27edb75911 |     
    arc      |         samba4-4.11.15         | NOK | http://autobuild.buildroot.net/results/e6895339bb57b0018e5e63db8be8c66fb1dc0fd0 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/18b27af713671d0528dfc8ac012442b7eeac6df6 |     
  powerpc    |        wireshark-3.4.0         | NOK | http://autobuild.buildroot.net/results/c50a4cfb1b5e23f632a74f9f1859de3daa39f9d9 | ORPH
  powerpc    |        wireshark-3.4.0         | NOK | http://autobuild.buildroot.net/results/078acf6b1917af1073c901dd8ac53c3c12894304 | ORPH
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/00321517cfc2cef6a18debd8b1b97421d5ab837e |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  apitrace-9.0 | 1 
              asterisk-16.14.1 | 1 
           libsamplerate-0.1.9 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/b7dbd97c40ae7f374ae59283e50f3a03242766d8 |     
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/aa0c5000251c08aac53bcd3f33314834311fae19 |     
    m68k     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/9ad833f85cc9276d935339fa036ed299259fb4f1 | ORPH


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 12
            quickjs-2020-09-06 | 2 
                  ffmpeg-4.3.1 | 1 
            resiprocate-1.12.0 | 1 
                   rhash-1.4.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e9d1848f97a9d1029520e8910c120073c2f1f8ce | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0fedb4b70d82faf628768a00ad01ed6d05574ec4 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f116134d96331e6ffad52b2839f212c817194e80 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/06f30db34853c01a936ab597a5fc678c6c3cde25 | ORPH
 powerpc64   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f1a966c65ee36287da5667fce9fcee76c50e7020 | ORPH
 powerpc64   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a69b9980ad027b8d2a6728c2020e85e2e652b225 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6bf637b0467b016444faac125c58a67e9a7ad335 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/bde886c606c44a2f42fd7a3c59d382b6b24e78b5 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/df4c73b028687e2eed927b91482bb55e0bad00db | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/616a9f75ccd3c1dff12db9c3201ffce48bf22df1 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/81831a3dab6659004abfecdf5414aba3ce5b2919 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4a1c77ed355edbfdad1a19276ee257188c358709 | ORPH
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/7ffbd229b898a95afb3b84a4fdd7035c74270034 |     
    arm      |       quickjs-2020-09-06       | NOK | http://autobuild.buildroot.net/results/d456eefffd138a714e367f9520adb662f5e0f57e |     
    mips     |       quickjs-2020-09-06       | NOK | http://autobuild.buildroot.net/results/290de164ffc59a416ffac75f75c96a9c17db099f |     
  aarch64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/93037ff8b3e8376b4f05eb22f10a4981401fd115 |     
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/f768a58512cd2045f3eda127b4304f9ae71b8b3c | ORPH



-- 
http://autobuild.buildroot.net
