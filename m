From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 15:10:16 +0100
Subject: [Buildroot] [pull request] Pull request for branch
 yem-instrument-build
In-Reply-To: <cover.1358379198.git.yann.morin.1998@free.fr>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
Message-ID: <20130120151016.32c95e00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 17 Jan 2013 00:41:34 +0100, Yann E. MORIN wrote:

> So, take this series as a kind of RFC, rather than a final series.
> 
> The following changes since commit 10e058b0ee7fd8135fef35bcf24ae985707078c2:
> 
>   proxychains-ng: copy proxychains.conf to target dir (2013-01-16 13:24:54 +0100)
> 
> are available in the git repository at:
>   git://gitorious.org/buildroot/buildroot.git yem-instrument-build
> 
> Yann E. MORIN (6):
>       pkg-infra: log current message
>       toolchain/external: sprinkle with some calls to MESSAGE
>       toolchain/crosstool-ng: sprinkle with some calls to MESSAGE
>       toolchain/gcc: sprinkle with some calls to MESSAGE
>       toolchain/kernel-headers: sprinkle with some calls to MESSAGE
>       toolchain/uClibc: sprinkle with some calls to MESSAGE

I think the "pkg-infra: log current message" needs a bit more
discussion (I'm generally OK with it, just needs more time to think
about it). However, the 5 followup patches that add appropriate MESSAGE
calls in various locations of the code look good to me, and they can be
committed now in order to reduce the burden of maintaining those
patches from Yann's side.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
