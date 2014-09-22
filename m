From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Mon, 22 Sep 2014 14:24:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-21
In-Reply-To: <20140922063014.B7E4E10156F@stock.ovh.net>
References: <20140922063014.B7E4E10156F@stock.ovh.net>
Message-ID: <CABbD_XAeJyQ==Lv+ARfsiZyRzhODXF=sLYjdToxSwmmD7=oWdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

just for the record: all 3 openvmtools failures are caused yesterday before
the 2 git commits, and I successfully compiled one with the latest version
since then.

BR
Karoly

On Mon, Sep 22, 2014 at 8:30 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Build statistics for 2014-09-21
> ===============================
>
>         success : 195
>        failures : 31
>        timeouts : 5
>           TOTAL : 231
>
> Classification of failures by reason
> ====================================
>
>                  gnupg2-2.0.26 | 5
>      openvmtools-9.4.6-1770165 | 3
>                 minidlna-1.1.4 | 2
>     xserver_xorg-server-1.16.0 | 2
>                     ola-0.8.33 | 2
>                 elfutils-0.155 | 2
>                mpdecimal-2.4.0 | 2
>              bluez5_utils-5.21 | 1
>                  sudo-1.8.10p3 | 1
>              lttng-tools-2.4.1 | 1
>                   zeromq-4.0.4 | 1
>                    geoip-1.6.0 | 1
>                 gptfdisk-0.8.6 | 1
>                     ffmpeg-2.4 | 1
>             wpa_supplicant-2.2 | 1
>                 busybox-1.22.1 | 1
>            libmemcached-1.0.18 | 1
>                qt5webkit-5.3.2 | 1
>                 libinput-0.3.0 | 1
> znc-b396cafdb249544164ed029... | 1
>                     ruby-2.1.2 | 1
>                 keyutils-1.5.5 | 1
>                       gd-2.1.0 | 1
>              subversion-1.7.18 | 1
>                  webkit-1.11.5 | 1
>
> Detail of failures
> ===================
>
>       xtensa |              bluez5_utils-5.21 | NOK |
> http://autobuild.buildroot.net/results/b35682b856b5a51615edc901fec4e6efd5ca9f77/
>          arc |                 busybox-1.22.1 | NOK |
> http://autobuild.buildroot.net/results/12adc08ec2d9234eb43862e159dba5fd844e4dc0/
>          arm |                 elfutils-0.155 | NOK |
> http://autobuild.buildroot.net/results/6d5c1bcb70aee7d47bc126893e5fe10dcc5204f4/
>          arm |                 elfutils-0.155 | NOK |
> http://autobuild.buildroot.net/results/7aaa4b82586f35142e9b90b6d893c5ddbc4fdd9b/
>          arm |                     ffmpeg-2.4 | NOK |
> http://autobuild.buildroot.net/results/cdad51f610c339d2ad4c7d09c282cfb4b10770a0/
>         bfin |                       gd-2.1.0 | NOK |
> http://autobuild.buildroot.net/results/0e2b28e8561c6f7623185c35eb24bea573b79d11/
>          arc |                    geoip-1.6.0 | TIM |
> http://autobuild.buildroot.net/results/f1cde8088e05e5758138ae3a696d9501a140f693/
>          arm |                  gnupg2-2.0.26 | NOK |
> http://autobuild.buildroot.net/results/366f43896113e1e025e2de85678b0ebc0e372efc/
>      powerpc |                  gnupg2-2.0.26 | NOK |
> http://autobuild.buildroot.net/results/0db794d5688f36e232822d05ab757cfa929f529d/
>          arm |                  gnupg2-2.0.26 | NOK |
> http://autobuild.buildroot.net/results/0b86c6de3769f1002138b221a06a4adf322b7a4d/
>          arm |                  gnupg2-2.0.26 | NOK |
> http://autobuild.buildroot.net/results/da91045c88272eff12ef31aab9f2ff5c67ba1bdc/
>         i486 |                  gnupg2-2.0.26 | NOK |
> http://autobuild.buildroot.net/results/e8a1d9b8d98c059d497bc493a9d2ae0ef5f9d0f5/
>      powerpc |                 gptfdisk-0.8.6 | NOK |
> http://autobuild.buildroot.net/results/ef783e3776f25c28ea0de0c082c93f7ab97db56d/
>       mipsel |                 keyutils-1.5.5 | NOK |
> http://autobuild.buildroot.net/results/ced596bd1c73286f7044f5a8e11b6588fc973f11/
>      aarch64 |                 libinput-0.3.0 | NOK |
> http://autobuild.buildroot.net/results/8b60fdf4fdec834dc79f8dfc4fd050f763c83457/
>         bfin |            libmemcached-1.0.18 | NOK |
> http://autobuild.buildroot.net/results/97b8aca5e9d41ebf73dfb9def0885bafe2f40525/
>          arm |              lttng-tools-2.4.1 | NOK |
> http://autobuild.buildroot.net/results/12ae7bd284220b0ebb8029002c08af2cb5e9527f/
>          arm |                 minidlna-1.1.4 | NOK |
> http://autobuild.buildroot.net/results/452c77798718d55c2f182dee8debc756d4f6fd28/
>        nios2 |                 minidlna-1.1.4 | NOK |
> http://autobuild.buildroot.net/results/f4023faa2540bdd73739c112dccd43049247b70b/
>         bfin |                mpdecimal-2.4.0 | NOK |
> http://autobuild.buildroot.net/results/11d8dbdf00f87baae2ac13156d2c2f0e48616894/
>         bfin |                mpdecimal-2.4.0 | NOK |
> http://autobuild.buildroot.net/results/d222a752c103e479d9607e22a236f8652184aea8/
>       mipsel |                     ola-0.8.33 | NOK |
> http://autobuild.buildroot.net/results/466995f9534447a4f54327a14c44ef9e16dd1123/
>         i686 |                     ola-0.8.33 | TIM |
> http://autobuild.buildroot.net/results/4795487e30c6850ac96cb344b3c3b04484e65db1/
>         i686 |      openvmtools-9.4.6-1770165 | NOK |
> http://autobuild.buildroot.net/results/4400abc17115d0f5eb65c4eb012f11766cbe5a56/
>       x86_64 |      openvmtools-9.4.6-1770165 | NOK |
> http://autobuild.buildroot.net/results/47c0a2952e05063984deb5bfa1483551e7e33d47/
>       x86_64 |      openvmtools-9.4.6-1770165 | NOK |
> http://autobuild.buildroot.net/results/4473d8a99ffec1fde491d172520e86ae1e69fae7/
>          arm |                qt5webkit-5.3.2 | TIM |
> http://autobuild.buildroot.net/results/78999edfced4945b2b453248957ba2d58691d2fb/
>       mipsel |                     ruby-2.1.2 | NOK |
> http://autobuild.buildroot.net/results/d423c0208917ed2b5d7120581250278b372b5d39/
>     mips64el |              subversion-1.7.18 | TIM |
> http://autobuild.buildroot.net/results/7e7d0d25b1bee4c945ebcc82c0014e12d990ab4e/
>          arm |                  sudo-1.8.10p3 | NOK |
> http://autobuild.buildroot.net/results/2ae18bfff5744808fb31a7a548bbf37c71b18487/
>          arm |                  webkit-1.11.5 | NOK |
> http://autobuild.buildroot.net/results/f9293bdeaddafdd51827b9ad3376ba54e1f0fb08/
>         bfin |             wpa_supplicant-2.2 | NOK |
> http://autobuild.buildroot.net/results/9ffc5c4f88d76f9ccc8a630c7cfdf74946ef19bd/
>      powerpc |     xserver_xorg-server-1.16.0 | NOK |
> http://autobuild.buildroot.net/results/9d3023d8ab206fb99deea5b34b404cbf53dca801/
> microblazeel |     xserver_xorg-server-1.16.0 | NOK |
> http://autobuild.buildroot.net/results/a0707458e45eaf5ed50fd52793c698dd5354550e/
>         bfin |                   zeromq-4.0.4 | NOK |
> http://autobuild.buildroot.net/results/8a817fcfd9d203237d6c93e11de9594edd2a8a09/
>          arm | znc-b396cafdb249544164ed029... | TIM |
> http://autobuild.buildroot.net/results/90a9d290bdad29a3ffd44921bfb9e923f4fd8a92/
>
>
> --
> http://autobuild.buildroot.net
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140922/bf6ae606/attachment.html>
