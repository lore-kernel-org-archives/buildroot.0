From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 26 Mar 2008 22:15:04 +0100
Subject: [Buildroot] build problems
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA8184@mtsexchange.dc.multitech.prv><034f01c88ece$ef015bf0$040514ac@atmel.com>
	<87ve39buzq.fsf@macbook.be.48ers.dk>
Message-ID: <032601c88f86$e52e3720$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I see that the directory only has a busybox config for 1.6.1 and
> 1.9.1, so it's broken anyway if the user selects anything else than
> that.

Yes, and then the user is responsible for creating a configuration for that.
The current tree will modify the configuration of an existing .config
file without warning the user, which is even more broken.

> 
> To me it doesn't make sense to keep earlier versions than the latest
> stable release of a given major version (E.G. 1.9.2 instead of 1.9.1)

What you are saying here is that you do not want to allow people
to decide for themselves when they should upgrade the busybox version.
I think a lot of project managers would have an issue with this.

> - Otherwise it'll get too hard to handle. I think it's also soon time
> to retire some of the really ancient versions like 1.2.x - 1.6.x.
> 

Best Regards
Ulf Samuelsson
