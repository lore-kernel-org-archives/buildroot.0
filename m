From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 14 Nov 2017 17:17:50 -0500
Subject: [Buildroot] [PATCH] genimage: change upstream URL
In-Reply-To: <1f1f2eba-dfd9-c253-34c1-1902c7d934ce@mind.be>
References: <20171114174651.12184-1-vivien.didelot@savoirfairelinux.com>
 <1f1f2eba-dfd9-c253-34c1-1902c7d934ce@mind.be>
Message-ID: <87zi7oo67l.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle <arnout@mind.be> writes:

>  Since the archive still exists on Pengutronix, and there it's an .xz instead of
> a .gz, and that archive doesn't need to be AUTORECONF'ed, I think it's better to
> stick with the original archive.

The http://public.pengutronix.de/software/genimage/ URL says:

"Please note: The content on public.pengutronix.de is mostly temporary,
so it might vanish into thin air any time. Have fun :-)"

So I think it is preferable to use the Github URL instead.


Thanks,

        Vivien
