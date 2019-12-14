From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:30:10 +0100
Subject: [Buildroot] [PATCH 1/2] package/python-frozenlist: new package
In-Reply-To: <20191211061834.95150-1-james.hilliard1@gmail.com>
References: <20191211061834.95150-1-james.hilliard1@gmail.com>
Message-ID: <20191214223010.293b3126@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 23:18:33 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> A list-like structure which implements
> collections.abc.MutableSequence.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                       |  1 +
>  package/Config.in                                |  1 +
>  package/python-frozenlist/Config.in              |  8 ++++++++
>  package/python-frozenlist/python-frozenlist.hash |  5 +++++
>  package/python-frozenlist/python-frozenlist.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-frozenlist/Config.in
>  create mode 100644 package/python-frozenlist/python-frozenlist.hash
>  create mode 100644 package/python-frozenlist/python-frozenlist.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
