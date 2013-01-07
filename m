From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 23:39:24 +0100
Subject: [Buildroot] [pull request] Pull request for branch perf-elfutils
In-Reply-To: <87ip78bp47.fsf@dell.be.48ers.dk>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
 <87ip78bp47.fsf@dell.be.48ers.dk>
Message-ID: <20130107233924.35c4d87f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 07 Jan 2013 23:32:56 +0100, Peter Korsgaard wrote:

> Thanks everyone, committed series.

Thanks for merging them. Hopefully, it won't make the autobuilders
explode too much.

> Thomas, please don't forget to (try to) send these patches upstream so
> we don't have to maintain them ourselves in the future.

Which ones exactly? The big fat patches we are downloading from
fedorahosted.org? Our patches?

All our patches are really specific to uClibc support, and seeing the
number of glibc-isms in elfutils, I am not sure the maintainers will be
interested in making it uClibc friendly. But it's maybe worth trying.

One nice thing that could be done is migrate the linux-kernel-module.c
thing to use nftw(), so we could drop the fts() mess.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
