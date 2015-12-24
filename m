From: Alex Suykov <alex.suykov@gmail.com>
Date: Thu, 24 Dec 2015 21:26:02 +0200
Subject: [Buildroot] [PATCH 1/2 v4] vboot-utils: new package
In-Reply-To: <20151224185516.GO25803@vapier.lan>
References: <20151224184333.GA7510@vostro> <20151224185516.GO25803@vapier.lan>
Message-ID: <20151224192602.GA14377@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thu, Dec 24, 2015 at 01:55:16PM -0500, Mike Frysinger wrote:

> this seems to have the same errors i pointed out in the ealier versions

(this message I think:
http://lists.busybox.net/pipermail/buildroot/2015-December/146493.html )

"ChromiumOS" instead of "Chromium OS" in Config.host.in, overlooked that.
This is going into v5 patch then.

As for the tarball issue, I don't think there are any better options.
It's either that, or a git checkout.
Do you mean it would be better to use git instead?
