From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:01:29 +0200
Subject: [Buildroot] [PATCH] busybox: Add NTP startup script
In-Reply-To: <1436731935-25223-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436731935-25223-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150713170129.3732523a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 12 Jul 2015 22:12:15 +0200, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/busybox/S49ntp        | 25 +++++++++++++++++++++++++
>  package/busybox/busybox.mk    | 10 ++++++++++
>  package/busybox/ntpd.etc.conf |  4 ++++
>  3 files changed, 39 insertions(+)
>  create mode 100644 package/busybox/S49ntp
>  create mode 100644 package/busybox/ntpd.etc.conf

I wanted to apply this, but unfortunately, ntpd doesn't work here
because it really wants my kernel to have IPv6 support.

But other than that, I had done some other changes to your patch, see
the attached patch for the latest version I had.

Can you look into this IPv6 related issue and see if it can be solved,
or at least a bug report filed with the Busybox people.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-busybox-Add-NTP-startup-script.patch
Type: text/x-patch
Size: 2797 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150713/3280081d/attachment.bin>
