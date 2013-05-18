From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 May 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-17
Message-ID: <20130518063006.E936E52C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-17
===============================

        success : 70 
       failures : 39 
       timeouts : 3  
          TOTAL : 112

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 9 
               wvstreams-4.6.1 | 3 
                 binutils-2.21 | 2 
             bluez_utils-4.101 | 2 
                 pixman-0.28.2 | 2 
                   dbus-1.4.24 | 2 
         host-gutenprint-5.2.9 | 2 
                mongrel2-1.8.0 | 2 
Generating grammar tables f... | 1 
          host-protobuf-c-0.15 | 1 
Applying qt5base-uclibc-no-... | 1 
                   mplayer-1.1 | 1 
               alsa-lib-1.0.26 | 1 
                      gpsd-3.9 | 1 
                  gnutls-3.1.9 | 1 
              e2fsprogs-1.42.7 | 1 
                 cairo-1.12.10 | 1 
               sconeserver-211 | 1 
                 libevas-1.7.4 | 1 
                      qt-4.8.4 | 1 
/bin/sed -i -e 's%^BUILDROO... | 1 
                  poco-1.4.6p1 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                 libnspr-4.9.2 | 1 
                libiscsi-1.6.0 | 1 
                  libnl-3.2.21 | 1 

Detail of failures
===================

      sh4a | /bin/sed -i -e 's%^BUILDROO... | TIM | http://autobuild.buildroot.net/results/83eaf41b7577401d9164f954eb4f8326350675cb/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/d1aebe936d120bed9fc3e0ff9382067746fe04b8/
   powerpc | Applying qt5base-uclibc-no-... | TIM | http://autobuild.buildroot.net/results/ecc7641c0829a4f903beee63bce74db543cc4552/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/763a144b732e56d0beafc9812a244c2d96091f34/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/4935107bbe40cf678ceae71429c1d79ce3b89e36/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/12ac8f2521fa059b791f6c1b33c45cc1bb81b7a8/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/05ddc731f0b3bb752a12ae09cf6597b1f36352be/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/1f9acb438d51b853a48e24307e43958554fd9e19/
   powerpc |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/8628f1b33d2f2ef8dd7bdcb29e647f7c2addf1d5/
microblaze |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/4d788cc85b4835473f373da409a051f77328c823/
     avr32 |               e2fsprogs-1.42.7 | NOK | http://autobuild.buildroot.net/results/9e9f8976b538c6f2de078651588aa9265c51e535/
   powerpc | Generating grammar tables f... | TIM | http://autobuild.buildroot.net/results/8bb8b9540e8e6ad29152e861be919b6f2cfc0ea9/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/626eff00b9c066cbd72ef4818c268ba1ae1825a5/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/7573dc4e1046ba59d33320c04e81e1c05dbb3488/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/dea06f095073f3e882dd37ede61ac57894e425d0/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/482f029d870ec387e633453a84e180ba20e14d4c/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/234edd540460e2a9700a0c9f9733061e028b87df/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/d0ed2a2f98354a86f242f5c7be8eea5859d160d0/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/9b6ed9d3fa3d8444459a5048268e8f50be08c10f/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/875ff2a39c5a6a3af87b2107b7844d8a44b16eeb/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/8430e4507754d0c41dfdf20802f15833b10722fe/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/1318e23076191329585fe425d7364c4cd7c88763/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/6ef67b74438bf1626b471d3d29706d7df0b483df/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/272169e755530270172a85aee5362b78555bc36a/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/36f8f5821d2f83600ee691c9ad427fda6b6c6e20/
      sh4a |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/f4cb3d7986ae18b48382bf1744f2a91fc9cc771a/
       arm |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/ddc61a511b7e91d7ad7b723c883a10fa54afd8c8/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/d3a05e7def441d70eedb7999cb7ff6aa29b8b53e/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/f11cf59ad09b0aab04e5cf5dd4d089d60dce8e44/
   aarch64 |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/cd064ae716d34fdf384225fe63e68257d7df48a1/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/b591f7abc5b1c524882c9da48b27604121e50cf1/
      i686 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/8573fa0cb1af4b5cf2cf484921f2db5e8e6c6307/
      i686 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/fb3125068d0c677c2ff94d10755f9d2e947c13a2/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/ad79f1a46b495140dc9f83587ee88c16ca1ceb44/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/d3e08a9623b2cbce78ea1709dcc464c919997017/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/8ba600c793d6eea4237d0aa1dd6ece4c79cd1e0d/
   aarch64 |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/297eff9290d19284c730eff1d704b62fca75693f/
  mips64el |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/cbba45739fc12c245ad6aedcd3669d832c784827/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/7cc50534a671712426832181068ee246fe252c50/
   powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/28c266338f8abe90ea85afe971f89055fc218a54/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/22c782d1aece9ff4420ed401d80471fc50e8a7dd/
   powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/9ca824202e2f3844d117182c1eab1d9e222db46c/


-- 
http://autobuild.buildroot.net
