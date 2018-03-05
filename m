From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Mar 2018 15:59:54 +0100
Subject: [Buildroot] Board defconfigs lacking maintainers
In-Reply-To: <a838cf4c-612f-2af4-c5c3-25dc9d51d859@lucaceresoli.net>
References: <20180304231547.7ed3f5af@windsurf.home>
 <a838cf4c-612f-2af4-c5c3-25dc9d51d859@lucaceresoli.net>
Message-ID: <20180305155954.1655ce43@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Mar 2018 15:35:27 +0100, Luca Ceresoli wrote:

> > If you are interested in one of the below defconfigs, could you please
> > send an update to the DEVELOPERS file to add yourself? Defconfigs not
> > associated to any developer are likely to be dropped at some point in
> > the future, since they will most likely fail to build due to toolchain
> > updates, and nobody will be there to fix those issues.  
> 
> What is required exactly to be considered a board maintainer? Ensure
> that it builds, or that it boots?

We don't have super strict rules. But defconfigs are meant to provide a
ready-to-use initial configuration. So if the configuration is not
ready-to-use because it doesn't boot, it isn't very useful.

So, IMO, we should only have defconfigs that are boot tested by someone.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
