From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 17 Jan 2014 10:44:18 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-16
In-Reply-To: <20140117073009.6824D101588@stock.ovh.net>
References: <20140117073009.6824D101588@stock.ovh.net>
Message-ID: <CAB0FRsvANYL-n=F5DDJMaiNhE1nqG4Fggmj-1fPo0ih2=zUj8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/17 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Build statistics for 2014-01-16
> ===============================
>
>         success : 51
>        failures : 68
>        timeouts : 2
>           TOTAL : 121
>
> Classification of failures by reason
> ====================================
>
>             luasocket-3.0rc1-1 | 21

currently, luasocket-3.0rc1 requires a toolchain with IPv6 support.
I work on a patch which removes this constraint.

Fran?ois

>                tcpreplay-4.0.0 | 8
>             gst-ffmpeg-0.10.13 | 5
>                  sysprof-1.1.8 | 4
>             live555-2014.01.11 | 3
>                  pixman-0.30.0 | 3
>                   libv4l-0.8.9 | 2
>                      vlc-2.1.2 | 2
>                  cairo-1.12.10 | 2
>                        unknown | 2
>              iputils-s20121011 | 2
>                       icu-51.2 | 1
>                w_scan-20130331 | 1
>                     systemd-44 | 1
>                   zeromq-3.2.4 | 1
>                wvstreams-4.6.1 | 1
> sconeserver-d58f2de88c68193... | 1
>         ltp-testsuite-20130904 | 1
>                  fio-fio-2.1.4 | 1
>                  libnspr-4.9.6 | 1
>                 minidlna-1.1.1 | 1
>                   nettle-2.7.1 | 1
> tvheadend-c7d0335eb10d02b78... | 1
>                  mplayer-1.1.1 | 1
>                     mpd-0.18.7 | 1
>          host-elf2flt-20130904 | 1
>     trace-cmd-trace-cmd-v2.2.1 | 1
>
> Detail of failures
> ===================
>
>        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/8686cc889bd82b2c503fcd3c5c851d8dc2f56d8f/
>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/613d698efde2be70b4d0bc81ca05511146e720c5/
>      nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/03cb7f59c68f4a649d0f579bea222865d965eb9b/
>    powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/3ca95472863f6465f5348630499b81ecbdd23c7c/
>    powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/b6614be55085d39686a2791100a0ac93063baa2e/
>    powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/6e921021128b9defec07461a5b5c252b632e0614/
>    powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/b168bc334e16378277b3b0486ab1d3eba53eaecf/
>   mips64el |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/ad2da57987c7e8f03bc3de4db166599eecb5bd2e/
>        arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/43eeccf5828943246fdb826cf195120693c3dfaa/
>       bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/da15a0e7a7960586b9aaadb42877d4b89d64393a/
>      avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/417f97bd04703ae98d32e3b31d45a4a1a60779ad/
>      avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/5d668901288a84970bb4e07f8c1cc106e88b0134/
> microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/38199542c1ba1100c48d10de218d4470b300bef8/
>    aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/d9e037f22164446b0efd2ba4fd4be20a5ac976d9/
>    aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/95a6fb09ec018f6dc2e5715a71e2ebc356c56df4/
>        arm |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/dbd1c72f07e9990db4f30cfe491524a659aa8025/
>     x86_64 |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/0ce772653d287caa728b2cdaab2238f537c1f732/
>      avr32 |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/855b8362755b9291f25032f01b4a5f0ec4f889b4/
>   mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/35e35d6d6912c50ea72dd282ab834367ad2ef113/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/081e539c4735098e5e57cbf9e64391795e53c685/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/6989e71bf50946d62b696dbe07e8f00679b6aad9/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/23bbe115a2c1d5177dc1fe70f89db9ce7eee442c/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/d22f0618305270f5cb4c3cdfaa320a083c1cdf79/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/b8a518671c417372caa3c34c0ee3e4ba804d2623/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/a7db5c2abf0ab2b8e7f3aecc80e889e45c89095f/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/3b5ca83571ae3c8cc07268658f8088e14801f957/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/66cdfc629a9cb616813b752a5af1f146a6237bc6/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/a24402503afd087b33e84f752e076c934b8a001f/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/467af8287e90da2f52875f3c6b7207587de52f66/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/3271323af9dc22a0629e7aaaaba05a09dd013627/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/324635d4fbbd02ba4788e595aab2563e2cfbe2f4/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/a50f5518d5b5103ad4242d4aa2fde138b256cb63/
>        arm |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/14fe35180625abfe783726fc689f948b7c0077cc/
>     x86_64 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/1d1dc870fc4179a8a61ef34f690980e7689177a3/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/c419e3542b506c020ff2f9b445e7c2f2062f9f4f/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/19bd89dc06f15353fc22d7b5166e1592fc03cd69/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/17af5449ad6ffa1f1e2c57da3ee93b7e9b795b86/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/edd4f1dcd3f718e4bb5d19ebb58f11441173cb05/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/932117f2885002d9ea6014ae07e383954f03dffc/
>       i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/b65b791b8c670be67e64cc9fada42bf531fb38f5/
>       i686 |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/5fcbee428cdd913d3ca812a49b0e69d9e2e47037/
>    powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/1bdfa1f192b51f5c84f4b4b62b20c276e36cbbf3/
>     xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/fdea9b0e481e2ec3072fe7fb2b55833b7801f08e/
>       i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/eff1a991bda33974b4d7d2f6e74227addcbf4a03/
> microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/5bc17ea2167a6fc42da1d89ba9dcf77765bd6136/
> microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/388cf9f53b0e1ec34de092c61ac8be553f7166c4/
> microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/7f3b79ee870b7520a37c7c54d8c06db1362c8630/
>     xtensa | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/fb8d071411b571780806792b7436d20f62a9a0f7/
>     x86_64 |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/118774e26fa9636bdbef29eeb2cc033d4c952382/
>    powerpc |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/643910022fefd119ee16f245e45cd62a36de063c/
>    powerpc |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/a5da3a948aea6cc5526760dfd8c2a4ee561a9d50/
>     x86_64 |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/2fc73899050fff1ae347687b54823f34e022ef67/
>     mipsel |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/e45b9c7a9de025f20564c2f5682af2b297a20711/
>       i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/46244312117efeeffe1b6a98c480913021bf2c8b/
>        arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/5822024a4eb78814926e07590c68a5d3804ddcdb/
>        arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/b69b0ef7e5ae76622ee4990ee3db080f2c8272de/
>    powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/00af3cb1bd43512097ff6058e719f8cbabf407e6/
>     x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/6d8b3a01465288d62adb6859ff87b612ff930081/
>        arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/9353882f76194894cdc19a178bff9ffe65749b23/
>       mips |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4091d8db7d90c2ddbd6139006a319dc14d25b3f1/
>     mipsel |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/f8acee119cac2edb14cf83c9a6c30e2f943f308a/
>      avr32 |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4a71ec6067c2ea8d50c92bbd7b0ec128f7cc44b2/
>     xtensa | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/0ae5c5158215a48d4d4849f52837bbe4b36db381/
>     x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/5e16080586f40483dbf24d590e26fbcf0021f16b/
>   mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/1957cfcfb91d0659f7b31e5364864d4a691fe13e/
>       sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/2f2443a176b0aac5f5921c1354c8efdc915d590a/
>        arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/0b345322f8a592575865c7c15ecbdcbbd007ef9d/
>     xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/eb50da8c2c6440700c9873855b6796a113b53c3b/
>    powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/c84eead4e5caf876cb66e27d1beeb99bb1a53d81/
>       bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/d6c05db0822a562f2e311e3a27b2c63d166e008e/
>
>
> --
> http://autobuild.buildroot.net
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
