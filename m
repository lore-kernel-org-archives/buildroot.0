From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jun 2013 19:18:06 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <20130616170305.GI3495@free.fr>
References: <20130616180054.58f52914@skate>
	<20130616170305.GI3495@free.fr>
Message-ID: <20130616191806.7b4a899a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 16 Jun 2013 19:03:05 +0200, Yann E. MORIN wrote:

> It would be nice if it were also possible to somehow "subscribe" to a
> list of packages and get a mail when any of these packages fails to
> build.

Indeed. Are we also talking about a daily e-mail?

> For example, I'd like to catch errors in the packages I've submitted.
> 
> I see two options for this:
>   - add a global MAINTAINERS file that list maintainers for each
>     actively maintained packages (a bit like the Linux kernel does);
>   - add a FOO_MAINTAINER variable to foo.mk (for each maintained 'foo'
>     package).
> 
> Would that be possible?

Yes that would be possible. For now, I don't have a particularly strong
opinion between the two solutions you proposed. Maybe the second one is
more Buildroot-ish?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
