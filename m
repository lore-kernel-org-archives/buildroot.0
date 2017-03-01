From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 23:12:32 +0100
Subject: [Buildroot] [PATCH 2/2 next] toolchain/wrapper: fake __DATE_
 and __TIME__ for older gcc
In-Reply-To: <3c4084fc0c3cf518c6fe170bebd83124730eba00.1487709136.git.yann.morin.1998@free.fr>
References: <cover.1487709136.git.yann.morin.1998@free.fr>
 <3c4084fc0c3cf518c6fe170bebd83124730eba00.1487709136.git.yann.morin.1998@free.fr>
Message-ID: <20170301231232.2bb432dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 21:32:36 +0100, Yann E. MORIN wrote:
> +/* Returns false if SOURCE_DATE_EPOCH was not defined in the environment.
> + *
> + * Returns true if SOURCE_DATE_EPOCH is in the environment and represent
> + * a valid timestamp, in which case the timestamp is formatted into the
> + * global variables _source_ and _date_.

Shouldn't this be:

	"global variables _date_ and _time_"

instead ?

If you confirm, then I can fixup this when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
