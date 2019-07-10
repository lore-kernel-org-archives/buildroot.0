From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jul 2019 18:12:43 +0200
Subject: [Buildroot] [PATCH 1/3] package/pkg-generic: allow to use
 <pkg>_DL_VERSION in packages .mk files
In-Reply-To: <20190709074551.22747-2-victor.huesca@bootlin.com>
References: <20190709074551.22747-1-victor.huesca@bootlin.com>
 <20190709074551.22747-2-victor.huesca@bootlin.com>
Message-ID: <20190710181243.091b99c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Victor,

Thanks for the work on cleaning up those version variables!

On Tue,  9 Jul 2019 09:45:49 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> This patch continue the work done here http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-4-Sanetize-packages-version-tp225554.html
> By making this DL_VERSION public we should be able to handle the missing corner-cases
> with package version sanitizeing.
> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>

I just want to point out that this patch makes <pkg>_DL_VERSION a
"public" variable, so it needs to be documented in the Buildroot
manual. It should be done in a patch in the same patch series.

Also, nitpick: make sure to wrap your commit messages (and generally
e-mails) at 72 characters.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
