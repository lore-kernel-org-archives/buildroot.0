From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:30:15 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-aiosignal: new package
In-Reply-To: <20191211061834.95150-2-james.hilliard1@gmail.com>
References: <20191211061834.95150-1-james.hilliard1@gmail.com>
 <20191211061834.95150-2-james.hilliard1@gmail.com>
Message-ID: <20191214223015.300d3056@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 23:18:34 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> aiosignal: a list of registered asynchronous callbacks.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/python-aiosignal/Config.in             |  8 ++++++++
>  package/python-aiosignal/python-aiosignal.hash |  5 +++++
>  package/python-aiosignal/python-aiosignal.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-aiosignal/Config.in
>  create mode 100644 package/python-aiosignal/python-aiosignal.hash
>  create mode 100644 package/python-aiosignal/python-aiosignal.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
