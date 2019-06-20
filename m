From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 22:23:00 +0200
Subject: [Buildroot] [PATCH 5/6] package/python-txdbus: new package
In-Reply-To: <20190531171654.17906-5-matthew.weber@rockwellcollins.com>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
 <20190531171654.17906-5-matthew.weber@rockwellcollins.com>
Message-ID: <20190620222300.256634df@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 May 2019 12:16:53 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Implements a native Python implementation of DBus for Twisted.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-txdbus/Config.in          |  9 +++++++++
>  package/python-txdbus/python-txdbus.hash |  3 +++
>  package/python-txdbus/python-txdbus.mk   | 13 +++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-txdbus/Config.in
>  create mode 100644 package/python-txdbus/python-txdbus.hash
>  create mode 100644 package/python-txdbus/python-txdbus.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
