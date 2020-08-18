From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:43:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/musl: bump to version 1.2.1
In-Reply-To: <20200818163642.20407-1-petr.vorel@gmail.com>
References: <20200818163642.20407-1-petr.vorel@gmail.com>
Message-ID: <20200818234319.6925f6fb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Aug 2020 18:36:42 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi Thomas,

You had forgotten to update the hash of the license file, so taken
as-is your commit was break "legal-info" for the musl package. I fixed
that up, explained the changes that happened to the license file in the
commit log, and applied to next.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
