From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Oct 2019 08:56:37 +0200
Subject: [Buildroot] [PATCH 0/2] Add support for the D programming
 language
In-Reply-To: <20191001060322.GB31145@ned>
References: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
 <20190930230356.477cf089@windsurf.home>
 <20191001060322.GB31145@ned>
Message-ID: <20191001085637.154c278c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 1 Oct 2019 08:03:22 +0200
Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

> Given that traditional external toolchain providers do not ship
> D-capable toolchains yet, I'll try using a toolchain generated with
> crosstool-ng.

Well, you can also generate a toolchain with Buildroot, and then import
it as an external toolchain in Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
