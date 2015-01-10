From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 10 Jan 2015 15:33:24 +0200
Subject: [Buildroot] [PATCH] dillo: avoid poisoned paths in configure
In-Reply-To: <20150110123613.6fecd66c@free-electrons.com>
References: <20150109123645.GA23533@vostro>
 <20150110123613.6fecd66c@free-electrons.com>
Message-ID: <20150110133324.GA21751@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sat, Jan 10, 2015 at 12:36:13PM +0100, Thomas Petazzoni wrote:

> Thanks. But can you make a patch that only changes configure.ac, and
> not configure? This package is already autoreconf'ed. Also, please
> adjust the comment above DILLO_AUTORECONF = YES in the .mk file to
> mention that we also autoreconf for this new patch?
Sure, sending v2.

> And additionally, please submit this patch to the upstream Dillo
> developers!
Patch sent upsteam, waiting for reply.
