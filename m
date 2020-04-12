From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 21:37:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-canopen: new package
In-Reply-To: <20200213134040.701-1-attila.wagner@onyxinsight.com>
References: <20200213134040.701-1-attila.wagner@onyxinsight.com>
Message-ID: <20200412213710.5c52c142@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Feb 2020 13:40:40 +0000
Attila Wagner <attila.wagner@onyxinsight.com> wrote:

> A Python implementation of the CANopen standard.
> 
> Signed-off-by: Attila Wagner <attila.wagner@onyxinsight.com>
> ---
>  DEVELOPERS                                 |  3 +++
>  package/Config.in                          |  1 +
>  package/python-canopen/Config.in           |  9 +++++++++
>  package/python-canopen/python-canopen.hash |  4 ++++
>  package/python-canopen/python-canopen.mk   | 14 ++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/python-canopen/Config.in
>  create mode 100644 package/python-canopen/python-canopen.hash
>  create mode 100644 package/python-canopen/python-canopen.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
