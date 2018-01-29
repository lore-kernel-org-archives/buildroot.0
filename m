From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 17:48:17 +0100
Subject: [Buildroot] [git commit] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <CANQCQpZY6fS8rojojQx4D3cYWV6ZYWifJoRGZnxiTF3LyWzquw@mail.gmail.com>
References: <20180128145128.360AE834A1@busybox.osuosl.org>
 <CANQCQpZY6fS8rojojQx4D3cYWV6ZYWifJoRGZnxiTF3LyWzquw@mail.gmail.com>
Message-ID: <20180129174817.3b964d09@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Jan 2018 09:54:16 -0600, Matthew Weber wrote:

> I've internally started to look at build failures across all packages
> with the following config set in an off-line autobuilder.
> BR2_OPTIMIZE_1=y
> BR2_RELRO_FULL=y
> BR2_FORTIFY_SOURCE_1=y
> BR2_SSP_STRONG=y
> 
> So far things are pretty broken but we'll see after I get past the tip
> of the iceburg how much work it might take to turn on a basic set of
> these options for regression.

OK, good. At some point, I think we will want to improve our random
config generator to generate once in a while configurations that
include those options.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
