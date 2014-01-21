From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Tue, 21 Jan 2014 13:53:57 +1100
Subject: [Buildroot] Patchwork oldest patches cleanup #6 (deadline
	February 2)
In-Reply-To: <CAAXf6LX2yqbapp6GBuN5qoT1R93CGD3NCLguY8fQhFoApJz2uw@mail.gmail.com>
References: <CAAXf6LX2yqbapp6GBuN5qoT1R93CGD3NCLguY8fQhFoApJz2uw@mail.gmail.com>
Message-ID: <000601cf1654$07ca5c00$175f1400$@calyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 21 Jan 2014 at 08:06:25, Thomas De Schampheleire wrote:

> In particular, I'm interested in knowing if the original contributor is
> still interested by the patch, or if someone else is interested in
> adopting the patch and sending an updated version, or if the patch no
> longer makes sense due to other changes made in Buildroot.

...

> [1/1] python: fix to ensure libpython is stripped Przemyslaw Wrzos
> <przemyslaw.wrzos@calyptech.com>
http://patchwork.ozlabs.org/patch/220024

I'd still like to see this one included in some form. For embedded systems
that count their image sizes in the tens of megabytes, this patch can make
a not insignificant difference.

The patch still applies as is to the latest source tree. Let me know if
anything else need to be done from my end.

Cheers,
Przemyslaw Wrzos
