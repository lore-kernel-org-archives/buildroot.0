From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 25 Jan 2007 00:23:49 +0100
Subject: [Buildroot] [PATCH] Set CFLAGS = $(TARGET_CFLAGS) for many
	packages
In-Reply-To: <1169596433.5361.23.camel@elrond.sweden.atmel.com>
References: <1169596433.5361.23.camel@elrond.sweden.atmel.com>
Message-ID: <20070124232349.GF28221@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 24, 2007 at 12:53:53AM +0100, Ulf Samuelsson wrote:
>If you make Buildroot from scratch, CFLAGS gets set during the build,
>but if you add packages later, then CFLAGS should be set in the
>makefile fragment of the new package.

I don't understand what you mean here. Please elaborate
>
>I believe that TARGET_CFLAGS needs to include the Linux Include
>Directory or you will get compolie time errors.

I don't have the linux include in my TARGET_CFLAGS AFAIK and do not get
compile errors. What kernel-headers are you using? What errors are you
seeing with what package?
