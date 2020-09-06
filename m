From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 21:00:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-aiofiles : new package
In-Reply-To: <20200904143301.6657-2-jugurtha.belkalem@smile.fr>
References: <20200904143301.6657-1-jugurtha.belkalem@smile.fr>
 <20200904143301.6657-2-jugurtha.belkalem@smile.fr>
Message-ID: <20200906210022.4f59c096@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  4 Sep 2020 16:33:00 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> Ordinary local file IO is blocking, and cannot easily and
> portably made asynchronous.
> This means doing file IO may interfere with asyncio applications,
> which shouldn?t block the executing thread. aiofiles helps
> with this y introducing asynchronous versions of files
> that support delegating operations to a separate thread pool.
> 
> More information is available at :
> https://pypi.org/project/aiofiles.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
> Package has been tested with check-package:
> $ ./utils/check-package package/python-aiofiles/*
> 27 lines processed
> 0 warnings generated

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
