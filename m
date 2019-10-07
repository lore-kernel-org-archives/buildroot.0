From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:48:55 +0200
Subject: [Buildroot] [PATCH v2] package/python-tornado: only available
 for Python 3
In-Reply-To: <20191007203731.29166-1-arnout@mind.be>
References: <20191007203731.29166-1-arnout@mind.be>
Message-ID: <20191007224855.3e8bbc39@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Oct 2019 22:37:31 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> Since the bump to 6.0.1, python-tornado has dropped support for Python 2
> and now needs Python >= 3.5 (cfr. setup.cfg).
> 
> Apparently this is not checked by setuptools, and apparently
> byte-compile is not done in the autobuilders, so there's not autobuild
> failure.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Asaf Kahlon <asafka7@gmail.com>
> Cc: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> --
> v2: also update reverse dependencies (Thomas)
> ---
>  package/circus/Config.in         |  6 +++---
>  package/python-tomako/Config.in  |  1 +
>  package/python-tornado/Config.in | 10 +++-------
>  3 files changed, 7 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
