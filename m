From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 21:20:36 +0200
Subject: [Buildroot] [PATCH] configs/freescale_p1025twr: needs
 host-openssl for the Linux kernel build
In-Reply-To: <CANQCQpZz5R1MkBEe2fxr9EsrTzsrzS55WPwbiTDq8W-wJS9snw@mail.gmail.com>
References: <20180324142602.10995-1-thomas.petazzoni@bootlin.com>
 <CANQCQpZz5R1MkBEe2fxr9EsrTzsrzS55WPwbiTDq8W-wJS9snw@mail.gmail.com>
Message-ID: <20180325212036.06226774@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Mar 2018 20:15:33 -0500, Matthew Weber wrote:

> > Fixes:
> >
> >   https://gitlab.com/buildroot.org/buildroot/-/jobs/59015355
> 
> Sorry, I didn't realize this failed.  Is there an automated email on
> this sort of failure?

No, there isn't. Unfortunately, the Gitlab CI infra is not very
reliable, and a number of failures are not related to real problems in
Buildroot, but to Gitlab CI infrastructure problems.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
