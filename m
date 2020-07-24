From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 24 Jul 2020 07:33:52 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/ima-evm-utils: fix build for
 old compilers
In-Reply-To: <20200723223650.135f2bb5@windsurf.home>
References: <20200723200457.3996-1-petr.vorel@gmail.com>
 <20200723200457.3996-3-petr.vorel@gmail.com>
 <20200723223650.135f2bb5@windsurf.home>
Message-ID: <20200724053352.GA4183@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Thu, 23 Jul 2020 22:04:57 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > Fixes:
> >                      sourcery-arm-armv4t [38/44]: FAILED
> >                             sourcery-arm [39/44]: FAILED
> >                      sourcery-arm-thumb2 [40/44]: FAILED

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > 1.3 specific fix.

> So it should within the 1.3 version bump patch, otherwise bisectability
> is broken. I'll squash it into it, no need to resend.
Thanks!

Kind regards,
Petr
