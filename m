From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Jan 2019 09:16:47 +0100
Subject: [Buildroot] [PATCH v2 0/4] Support Linux 4.20
In-Reply-To: <87sgycox9n.fsf@dell.be.48ers.dk>
References: <20181231175234.14572-1-thomas.petazzoni@bootlin.com>
 <87sgycox9n.fsf@dell.be.48ers.dk>
Message-ID: <20190102091647.319e2c96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 01 Jan 2019 22:58:44 +0100, Peter Korsgaard wrote:

> With 2019.02 becoming our next LTS and 4.20 NOT a LTS release, I wonder
> if it would make sense to still default to 4.19.x instead of 4.20.x?

Yes, that probably make sense. But in this case, we would need to get
in touch with the kernel folks to get the net_tstamp.h fix in -stable.
It has the Fixes: tag, but it still hasn't been backported to
4.19-stable.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
