From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 15:43:46 +0200
Subject: [Buildroot] [PATCH 1/1] chrony: Update to 3.4 v2
In-Reply-To: <20180921121023.7490-1-ferdinand@ombud.nl>
References: <20180921121023.7490-1-ferdinand@ombud.nl>
Message-ID: <20180921154346.0d938f63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ferdinand,

Thanks for your contribution. Since it's among your first contribution,
I'll try to give some guidance on our best practices.

On Fri, 21 Sep 2018 14:10:23 +0200, Ferdinand van Aartsen wrote:
> Patch 0002-util-fall-back-to-reading-dev-urandom-when-getrandom.patch was applied upstream in this version, so it can be deleted.

The commit log should be wrapped to ~72 characters.

> 
> Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>

The "v2" should not be in the commit title (otherwise it becomes part
of the commit title in the Git history), but of the patch prefix, i.e
[PATCH v2]. To achieve this, you can do:

$ git format-patch -v2

or

$ git format-patch --subject-prefix="PATCH v2"

> ---

Also, here there should be a changelog of what changed between each
patch iteration.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
