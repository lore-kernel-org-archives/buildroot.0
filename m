From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Feb 2018 09:11:08 +0100
Subject: [Buildroot] [PATCH] m68k: add the real gcc bugfix from upstream
In-Reply-To: <20180218182151.GA5995@waldemar-brodkorb.de>
References: <20180218182151.GA5995@waldemar-brodkorb.de>
Message-ID: <20180219091108.45d6579d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Feb 2018 19:21:52 +0100, Waldemar Brodkorb wrote:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks for following up on this! Do you consider this a change for
"master" or for "next" ?

It's a gcc change, so I would tend to be careful and take this only for
the next branch. However, it's touching only m68k, so it's not like an
issue is really going to affect a huge number of users.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
