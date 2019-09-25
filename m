From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:53:04 +0200
Subject: [Buildroot] [PATCH] package/exiv2: bump version to 0.27.2
In-Reply-To: <20190826120935.90923-1-nicolas.serafini@sensefly.com>
References: <20190826120935.90923-1-nicolas.serafini@sensefly.com>
Message-ID: <20190925225304.7299045c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Aug 2019 12:11:42 +0000
Nicolas Serafini <nicolas.serafini@sensefly.com> wrote:

> -EXIV2_VERSION = 0.27.1
> +EXIV2_VERSION = v0.27.2

The 'v' should have been encoded in EXIV2_SITE and not EXIV2_VERSION.
Indeed, we want EXIV2_VERSION to match the version value found by
release-monitoring.org, which strips version prefixes such as 'v'.

I fixed that up and applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
