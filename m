From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 May 2013 12:11:59 +0200
Subject: [Buildroot] [PATCH v2 1/3] barebox: add custom version option
In-Reply-To: <CAHkwnC-ZiO0Fyd2=QaE8RPuWFfzsf4o_6VUpzVo5tOFLPxMLkA@mail.gmail.com>
References: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
 <1366184503-16875-2-git-send-email-fabio.porcedda@gmail.com>
 <20130501231009.787484f5@skate>
 <CAHkwnC9xHJAHNauNewEGRof4u6YUsLyCsjm5PQgPhCKPwM53rg@mail.gmail.com>
 <20130503105531.1b38a88e@skate>
 <CAHkwnC-ZiO0Fyd2=QaE8RPuWFfzsf4o_6VUpzVo5tOFLPxMLkA@mail.gmail.com>
Message-ID: <20130503121159.41c63ece@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 3 May 2013 11:17:32 +0200, Fabio Porcedda wrote:

> In the patch set v3 barebox is consistent with the kernel.
> 
> If you are speaking just about consistency, I can send a patch for
> U-Boot too. IMHO the kernel way is more flexible, so if we must
> choose only one method, the kernel way is better.
> 
> A problem with having only the latest three version available
> is that barebox and u-boot release frequency are very different.
> Barebox have 12 release per year, U-Boot only 4.
> The latest three release of U-Boot cover nine months but the latest
> three release of barebox cover only three months.
> So if a defconfig use a specific barebox version, that defconfig can
> be used only for three months.
> I think that three months is not enough.

I think what you say makes sense.

> It's better if i send patch for U-Boot too?

Yes. I would however maybe wait for the opinion of others like Arnout,
Peter or Gustavo. Maybe they disagree with my opinion, and I don't want
you to do extra work that may not be accepted in the end.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
