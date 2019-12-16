From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:46:16 +0100
Subject: [Buildroot] [PATCH 1/2] package/apitrace: needs host-python3
In-Reply-To: <20191214113817.1017079-1-fontaine.fabrice@gmail.com>
References: <20191214113817.1017079-1-fontaine.fabrice@gmail.com>
Message-ID: <20191216224616.56683df4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Dec 2019 12:38:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> apitrace needs host-python3 since version 9.0 and
> https://github.com/apitrace/apitrace/commit/78078e9025efa898f6e5402e306abdd205c7b2c0

This commit is just updating their CI to force using Python 3.x, it's
not the commit that makes apitrace require Python 3.x. The actual commit is:

  https://github.com/apitrace/apitrace/commit/0b8b019952f2668a5e8786cc2d331062b958f02e

I've updated the commit log accordingly, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
