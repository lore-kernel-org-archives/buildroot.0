From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Apr 2018 23:25:14 +0200
Subject: [Buildroot] [PATCH 1/2] python-daemonize: new package
In-Reply-To: <20180411163713.13183-1-lionel@svkt.org>
References: <20180411163713.13183-1-lionel@svkt.org>
Message-ID: <20180427232514.544e05ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Apr 2018 18:37:12 +0200, Lionel Flandrin wrote:
> Library to enable your code run as a daemon process on Unix-like
> systems.
> 
> Signed-off-by: Lionel Flandrin <lionel@svkt.org>
> ---
>  package/Config.in                              |  1 +
>  package/python-daemonize/Config.in             |  8 ++++++++
>  package/python-daemonize/python-daemonize.hash |  3 +++
>  package/python-daemonize/python-daemonize.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-daemonize/Config.in
>  create mode 100644 package/python-daemonize/python-daemonize.hash
>  create mode 100644 package/python-daemonize/python-daemonize.mk

I've squashed your PATCH 2/2 into PATCH 1/2, because the change to the
DEVELOPERS file should be done in the commit as the commit adding the
package. I've done no other change, it looked OK to me.

I'm adding Yegor in Cc, in case he wants to have a look a this Python
package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
