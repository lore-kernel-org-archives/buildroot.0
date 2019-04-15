From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 08:58:19 +0200
Subject: [Buildroot] [RFC 1/1] infra/pkg-generic: Add rootfs post gen
 hook
In-Reply-To: <20190415002635.3656-1-vadim4j@gmail.com>
References: <20190415002635.3656-1-vadim4j@gmail.com>
Message-ID: <20190415085819.1d5c4152@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Mon, 15 Apr 2019 03:26:35 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> Add ability to generate image by custom package, and one of the
> way to do it - is to add new $(PKG)_ROOTFS_POST_GEN_HOOK which will be
> called after rootfs image is ready. This allows to have easier
> alternative to post-image script in form of package, which might be
> just selected by the user (or this package might be automatically
> selected already already).

Hum, this description is a bit vague/fuzzy to me. Do you have a
specific example that requires this rootfs post gen hook ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
