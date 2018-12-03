From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 23:06:01 +0100
Subject: [Buildroot] [PATCH 1/1] python-wtforms: new package
In-Reply-To: <20181107155953.25020-1-grzegorz@blach.pl>
References: <20181107155953.25020-1-grzegorz@blach.pl>
Message-ID: <20181203230601.54f97842@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Nov 2018 16:59:53 +0100, Grzegorz Blach wrote:
> A flexible forms validation and rendering library for
> Python web development.
> 
> https://wtforms.readthedocs.io/
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/python-wtforms/Config.in           |  7 +++++++
>  package/python-wtforms/python-wtforms.hash |  5 +++++
>  package/python-wtforms/python-wtforms.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-wtforms/Config.in
>  create mode 100644 package/python-wtforms/python-wtforms.hash
>  create mode 100644 package/python-wtforms/python-wtforms.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
