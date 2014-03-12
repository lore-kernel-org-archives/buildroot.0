From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 12 Mar 2014 07:00:21 +0100
Subject: [Buildroot] [PATCH v5 1/6] libdrm: Remove xorg dependency for
	intel driver
References: <BLU0-SMTP20422ECD84A18D82671FAE4D9770@phx.gbl>
 <531F851F.40002@savoirfairelinux.com>
 <3p65vaxf8m.ln2@ID-313208.user.individual.net>
Message-ID: <lo95vax104.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <berndkuhls@hotmail.com> wrote in
news:3p65vaxf8m.ln2 at ID-313208.user.individual.net: 

> xlib_pciaccess itself does not depend on xorg stuff, I was able to
> compile the libdrm intel driver with patch v5 without activating xorg7.

PS: Should we also move libpciaccess out of the xorg section?

Regards, Bernd
