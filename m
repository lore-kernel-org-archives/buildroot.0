From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 23 Mar 2014 23:19:16 +0100
Subject: [Buildroot] [PATCH v10] xbmc: new package
In-Reply-To: <1395611820-3061-1-git-send-email-yann.morin.1998@free.fr>
References: <1395611820-3061-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAGduivwLE=HRVqqgZLGmtbSy+Yrts2xLmzuODs6KSkhdfJo7DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all

[...]
On Sun, Mar 23, 2014 at 10:57 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>
> XBMC is an award-winning free and open source (GPL) software media player and
> entertainment hub for digital media.
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: gimli <ebsi4711@gmail.com>
> Cc: Martin Bark <martin@barkynet.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
> Chamges v9 -> v10:  (Yann)
>   - further cleanup in dependencies
>   - don't check for pre-existing startup script or systemd unit
>     before installing therm
>   - provide our own br-xbmc wrapper script
>   - move XBMC's runtime config to a saner place

I looked at your patch before you merged them and I "ack" these
changes (seems silly to ack a changeset on a patch so I won't ack them fomally).
