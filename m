From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 27 Jan 2013 21:45:15 +0200
Subject: [Buildroot] Buildroot Developers Meeting after FOSDEM 2013
In-Reply-To: <510582D1.9040306@petroprogram.com>
References: <20121228212925.3c5074c6@skate>
 <201301271709.49546.yann.morin.1998@free.fr>
 <510582D1.9040306@petroprogram.com>
Message-ID: <510583CB.6090002@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

27.1.2013 21:41, Stefan Fr?berg kirjoitti:
> I think the current state of generating initramfs could be added to that
> topic list too.
>
> I did some quick testing of buildroot (2012.08)  kernel with embedded
> initramfs size vs. also buildroot kernel but with hand made initramfs
> inside it (both from the same sources of course)
> and the results were 57 MB vs. 37 MB (xz-compressed kernel with no
> compression for built-in initramfs).

And both tested kernel's included 50 MB worth of firmware stuff, 60 MB
worth of modules and
about 10 MB worth of actual userspace stuff (busybox, uClibc and some
other stuff)
for total size of about 120 MB uncompressed

Regards
Stefan
