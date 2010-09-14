From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Tue, 14 Sep 2010 19:29:10 +0200
Subject: [Buildroot] Build error: No rule to make target
	`ubootboard_config'
In-Reply-To: <KAW101-W29624180977A0A1CC4A5979B770@phx.gbl>
References: <KAW101-W9A50593711791769ABB3C9B740@phx.gbl>,
	<20100911105201.176d1396@surf>,
	<KAW101-W3400321E421A55939E3C979B750@phx.gbl>,
	<KAW101-W663381351DE5AA588F11B19B770@phx.gbl>,
	<20100913203030.527a8293@surf>
	<KAW101-W29624180977A0A1CC4A5979B770@phx.gbl>
Message-ID: <4C8FB0E6.9010200@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Am 13.09.2010 22:16, schrieb S W:
> Hi Thomas
>
> Thank you so much for your nice explanation!
> Yes I have misunderstood about ARM.
> Like you said, it is a general architecture.
>
> I will figure out the hardware board name from my headquater company.
>
> But I have a doubt about the boads that U-Boot can deal with.
> You told me that there thousands of different boards. But how
> can U-Boot know these board names? And how can U-Boot know
> there are new boards that come out?
Hi Terry,

U-Boot has it's own project side. They include new boards in a similar
way like buildroot: Someone likes to have support for a certain board
and starts work. E.g. using a tutorial like this:
http://book.opensourceproject.org.cn/embedded/embeddedprime/opensource/0136130550/ch07lev1sec4.html

A good start is to use an existing similar board as template and start
modifying it for the new one.
I don't think that buildroot introduces new boards to u-boot itself, but
you can use br to make your own patches for a new one and perhaps send
them to the u-boot developers:
http://www.denx.de/wiki/U-Boot
Check the boards known to u-boot here:
http://git.denx.de/cgi-bin/gitweb.cgi?p=u-boot.git;a=tree;f=board;hb=HEAD

Regards,
Marcus

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100914/087344a3/attachment.html>
