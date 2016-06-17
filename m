From: Ben Boeckel <mathstuf@gmail.com>
Date: Fri, 17 Jun 2016 00:24:18 -0400
Subject: [Buildroot] [PATCH 1/1] taskd: support linking against static
 gnutls and uuid
In-Reply-To: <20160617032230.GR2749@tarshish>
References: <20160617020836.9765-1-mathstuf@gmail.com>
 <20160617032230.GR2749@tarshish>
Message-ID: <20160617042418.GA26117@bronto-burt.dev.benboeckel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 17, 2016 at 06:22:30 +0300, Baruch Siach wrote:
> But you do need to sign-off if you want Buildroot to apply this patch.

Is the signoff on the buildroot-level patch not sufficient? The patch in
question here does not modify buildroot code, but taskwarrior code.

I'm not saying "no"; I just find it a bit odd.

--Ben
