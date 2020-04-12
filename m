From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 21:53:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-snappy: new package
In-Reply-To: <20200213065824.46504-1-james.hilliard1@gmail.com>
References: <20200213065824.46504-1-james.hilliard1@gmail.com>
Message-ID: <20200412215300.4ef56a10@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Feb 2020 23:58:24 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Python library for the snappy compression library from Google.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-snappy/Config.in          | 12 ++++++++++++
>  package/python-snappy/python-snappy.hash |  5 +++++
>  package/python-snappy/python-snappy.mk   | 14 ++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/python-snappy/Config.in
>  create mode 100644 package/python-snappy/python-snappy.hash
>  create mode 100644 package/python-snappy/python-snappy.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
