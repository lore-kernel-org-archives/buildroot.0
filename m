From: Joachim Wiberg <troglobit@gmail.com>
Date: Sat, 23 Jan 2021 23:02:09 +0100
Subject: [Buildroot] [PATCH 6/6] package/mrouted: menuconfig support for
 enabling rsrr support
In-Reply-To: <20210123205117.GC926565@scaer>
References: <20210123103155.2599311-1-troglobit@gmail.com>
 <20210123103155.2599311-7-troglobit@gmail.com>
 <20210123205117.GC926565@scaer>
Message-ID: <8735yrwbvi.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Yann!

On Sat, Jan 23, 2021 at 21:51, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> On 2021-01-23 11:31 +0100, Joachim Wiberg spake thusly:
> I've fixed some minor coding style issue:
>     package/mrouted/Config.in:20: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/mrouted/Config.in:23: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     [...]

Oups, thank you!  I'll make sure to train my Emacs better :)

>> +MROUTED_CONF_OPTS += $(if $(BR2_PACKAGE_MROUTED_RSRR),--enable-rsrr,--disable-rsrr)
> I've switched to using the more traditional ifeq-else-endif block.

Thanks!  (Copied from another package .mk, felt wrong while doing it)

> Applied to master, thanks.

Awesome :)


Best regards
 /Joachim
